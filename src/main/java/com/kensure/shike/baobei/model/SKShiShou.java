package com.kensure.shike.baobei.model;

import java.util.ArrayList;
import java.util.List;

import co.kensure.frame.BaseInfo;
import co.kensure.mem.ArithmeticUtils;

/**
 * 支付信息
 * 任务没完成，只收20%的服务费
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKShiShou extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 费用描述 */
	private String desc;

	/** 押金 */
	private SKPayInfo yajin;

	/** 手续费 */
	private SKPayInfo shouxufei;

	/** 服务费 */
	private SKPayInfo fuwufei;

	/** 打赏红包 */
	private SKPayInfo dashang;

	/** 计算天秤系统推荐费 */
	private SKPayInfo tuijian;

	/** 累计 */
	private SKPayInfo leiji;
	
	/** 货比三家增值费 */
	private SKPayInfo hbsj;

	/** 明细 */
	private List<SKPayInfo> list = new ArrayList<SKPayInfo>();

	public SKShiShou() {
	}

	/**
	 * 计算押金
	 * 
	 * @param sk
	 */
	private void suanYaJin(SKBaobei sk) {
		Long num = sk.getZjnum();
		Double price = sk.getSalePrice();
		String miaoshu = num + "*" + price;
		double xiaoji = ArithmeticUtils.mul(num, price, 1);
		this.yajin = new SKPayInfo("货品押金", miaoshu, xiaoji);
	}

	/**
	 * 计算转账手续费
	 * 
	 * @param sk
	 */
	private void suanShouXuFei(SKBaobei sk) {
		//转账手续费*0.02
		Long num = sk.getZjnum();
		Double price = sk.getSalePrice();	
		double shouxufei = ArithmeticUtils.mul(num, price, 1);
		double xiaoji = ArithmeticUtils.mul(shouxufei, 0.02, 1);		
		String miaoshu = num + "*" + price + "*0.02" ;
		this.shouxufei = new SKPayInfo("转账手续费", miaoshu, xiaoji);	
	}

	/**
	 * 计算平台服务费
	 * 
	 * @param sk
	 */
	private void suanFuWuFei(SKBaobei sk) {
		//转账手续费*0.2
		Long num = sk.getZjnum();
		String d3 = num + "*2";
		double xiaoji = ArithmeticUtils.mul(num, 2, 1);	
		this.fuwufei = new SKPayInfo("平台服务费", d3, xiaoji);
	}

	/**
	 * 计算打赏红包
	 * 
	 * @param sk
	 */
	private void suanDaShang(SKBaobei sk) {
		Long num = sk.getZjnum();
		String d13 = num + "*" + sk.getJiangli();
		double xiaoji13 = ArithmeticUtils.mul(num, sk.getJiangli(), 1);
		this.dashang = new SKPayInfo("打赏红包", d13, xiaoji13);
	}

	/**
	 * 计算天秤系统推荐费
	 * 
	 * @param sk
	 */
	private void suanTuijian(SKBaobei sk) {
		String d4 = "10元/次";
		double xiaoji4 = 10.00D;
		this.tuijian = new SKPayInfo("天秤系统推荐费", d4, xiaoji4);
	}
	
	/**
	 * 货比三家
	 * 
	 * @param sk
	 */
	private void suanHbsj(SKBaobei sk) {
		String d4 = "20元/次";
		double xiaoji4 = 20.00D;
		this.hbsj = new SKPayInfo("货比三家增值费", d4, xiaoji4);
	}

	/**
	 * 设置宝贝应收
	 * 
	 * @param sk
	 */
	public SKShiShou(SKBaobei sk) {
		// 1、货品押金 2、转账手续费 3、平台服务费 4、打赏红包 5、天秤系统推荐费
		suanYaJin(sk);
		suanShouXuFei(sk);
		suanFuWuFei(sk);
		suanDaShang(sk);
		suanTuijian(sk);
		if(sk.getZengzhi() == 1){
			if(sk.getHbsj() != null){
				suanHbsj(sk);
			}	
		}
		this.list.add(this.yajin);
		this.list.add(this.shouxufei);
		this.list.add(this.fuwufei);
		this.list.add(this.dashang);
		this.list.add(this.tuijian);
		if(sk.getZengzhi() == 1){
			if(sk.getHbsj() != null){
				this.list.add(this.hbsj);
			}	
		}
		double leiji = 0D;
		for (SKPayInfo pi : this.list) {
			leiji = ArithmeticUtils.add(pi.getXiaoji(), leiji);
		}

		this.leiji = new SKPayInfo("合计", "", leiji);
		this.list.add(this.leiji);
		this.desc = "";
		for(SKPayInfo pi:this.list){
			this.desc += pi.getName()+":"+pi.getDetail()+"="+pi.getXiaoji();
		}
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public SKPayInfo getYajin() {
		return yajin;
	}

	public void setYajin(SKPayInfo yajin) {
		this.yajin = yajin;
	}

	public SKPayInfo getShouxufei() {
		return shouxufei;
	}

	public void setShouxufei(SKPayInfo shouxufei) {
		this.shouxufei = shouxufei;
	}

	public SKPayInfo getFuwufei() {
		return fuwufei;
	}

	public void setFuwufei(SKPayInfo fuwufei) {
		this.fuwufei = fuwufei;
	}

	public SKPayInfo getDashang() {
		return dashang;
	}

	public void setDashang(SKPayInfo dashang) {
		this.dashang = dashang;
	}

	public SKPayInfo getTuijian() {
		return tuijian;
	}

	public void setTuijian(SKPayInfo tuijian) {
		this.tuijian = tuijian;
	}

	public SKPayInfo getLeiji() {
		return leiji;
	}

	public void setLeiji(SKPayInfo leiji) {
		this.leiji = leiji;
	}

	public List<SKPayInfo> getList() {
		return list;
	}

	public void setList(List<SKPayInfo> list) {
		this.list = list;
	}

}
