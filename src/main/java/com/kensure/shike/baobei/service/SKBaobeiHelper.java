package com.kensure.shike.baobei.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;

import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKSkqk;

/**
 * 试客宝贝服务帮助类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
@Service
public class SKBaobeiHelper extends JSBaseService {	

	
	
	/**
	 * 宝贝插入前，数据初始化
	 * @param obj
	 */
	public static void insertInit(SKBaobei obj) {
		if (obj.getXinyongka() == null) {
			obj.setXinyongka(0);
		}
		if (obj.getHuabei() == null) {
			obj.setHuabei(0);
		}
		if (obj.getShaitu() == null) {
			obj.setShaitu(0);
		}
		if (obj.getWangwang() == null) {
			obj.setWangwang(0);
		}
		obj.setYsqnum(0L);
		obj.setIsDel(0L);
		obj.setStatus(0L);
		obj.setZjnum(0L);
		obj.setYingshou(0D);
		obj.setShishou(0D);
		obj.setTuikuan(0D);
		obj.setIsXuni(0);
		obj.setIsLimit(1);
		if (obj.getZengzhi() == null) {
			obj.setZengzhi(0L);
		}
		if (obj.getJiangli() == null) {
			obj.setJiangli(0D);
		}
	}
	
	/**
	 * 检验基本数据
	 * 
	 * @param obj
	 */
	public void invalid(SKBaobei obj, SKBaobei oldBaoBei) {
		ParamUtils.isBlankThrewException(obj.getTitle(), "标题不能为空");
		ParamUtils.isBlankThrewException(obj.getDpid(), "店铺不能为空");
		ParamUtils.isBlankThrewException(obj.getUrl(), "链接不能为空");
		ParamUtils.isBlankThrewException(obj.getTypeid(), "类型不能为空");
		ParamUtils.isBlankThrewException(obj.getZturl(), "主图不能为空");
		ParamUtils.isBlankThrewException(obj.getNoQq(), "qq不能为空");
		ParamUtils.isBlankThrewException(obj.getSalePrice(), "价格不能为空");
		if (obj.getSalePrice() < 1) {
			BusinessExceptionUtil.threwException("价格必须大于1");
		}
		ParamUtils.isBlankThrewException(obj.getTitle(), "标题不能为空");
		if (oldBaoBei != null && oldBaoBei.getStatus() != 0 && oldBaoBei.getStatus() != 2) {
			BusinessExceptionUtil.threwException("活动状态不正确，不允许修改");
		}
	}

	/**
	 * 检验金额
	 * 
	 * @param obj
	 */
	public void checkMoney(SKBaobei obj) {
		Long hdtypeid = obj.getHdtypeid();
		Double salePrice = obj.getSalePrice();
		Long bbnum = obj.getBbnum();
		if (hdtypeid == 1 || hdtypeid == 2) {
			// 爆款打造
			// 效果建议投放单期总份数：
			// 小于50元客单（0-50元）≥20份
			// 50-100元客单≥10份
			// 100-300元客单≥5份
			// 高于300元客单≥1份
			if (salePrice < 50) {
				if (bbnum < 20) {
					BusinessExceptionUtil.threwException("小于50元客单（0-50元）≥20份");
				}
			} else if (salePrice < 100) {
				if (bbnum < 10) {
					BusinessExceptionUtil.threwException("50-100元客单≥10份");
				}
			} else if (salePrice < 300) {
				if (bbnum < 5) {
					BusinessExceptionUtil.threwException("100-300元客单≥5份");
				}
			} else {
				if (bbnum < 1) {
					BusinessExceptionUtil.threwException("高于300元客单≥1份");
				}
			}
		} else if (hdtypeid == 3) {
			if (salePrice < 300) {
				BusinessExceptionUtil.threwException("高于300元");
			} else if (bbnum < 1) {
				BusinessExceptionUtil.threwException("高于300元客单≥1份");
			}
		} else if (hdtypeid == 4) {
			double jine = salePrice * bbnum;
			if (jine < 500) {
				BusinessExceptionUtil.threwException("总货值不低于500元");
			}
		}
	}

}
