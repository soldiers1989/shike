package com.kensure.shike.zhang.service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;
import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.dao.SkUserJinbiDao;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.model.SkUserJinbi;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;


/**
 * 试客金币流水服务实现类
 * @author fankd created on 2018-10-5
 * @since 
 */
@Service
public class SkUserJinbiService extends JSBaseService{
	
	@Resource
	private SkUserJinbiDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKUserYueService sKUserYueService;

	@Resource
	private SKUserZhangService skUserZhangService;

	@Resource
	private SKUserService sKUserService;
    
    
    public SkUserJinbi selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SkUserJinbi> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SkUserJinbi> selectAll(){
		return dao.selectAll();
	}
	
	public List<SkUserJinbi> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SkUserJinbi obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user_jinbi"));
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SkUserJinbi> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SkUserJinbi obj){
		return dao.update(obj);
	}
    
    public boolean updateByMap(Map<String, Object> params){
		return dao.updateByMap(params);
	}
    
    
	public boolean delete(Long id){
		return dao.delete(id);
	}	
	
    public boolean deleteMulti(Collection<Long> ids){
		return dao.deleteMulti(ids);
	}
    
    public boolean deleteByWhere(Map<String, Object> parameters){
		return dao.deleteByWhere(parameters);
	}

	/**
	 * 签到
	 * @param obj
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void qiandao(SkUserJinbi obj) {

        SKUser user = sKUserService.getUser();

        ParamUtils.isBlankThrewException(obj.getJinbi(), "金币数量不能为空");

        List<SkUserJinbi> list = getTodayQiandao();

        if (!list.isEmpty()) {
            BusinessExceptionUtil.threwException("今日已签到，请明日再来!");
        }

        if (obj.getJinbi() > 20) {
            BusinessExceptionUtil.threwException("金币数据有误!");
        }

		addJbls(user.getId(), obj.getJinbi(), 1L, 1L);
    }


	/**
	 * 注册账号 +100（一次性活动）
	 * @param userId
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void addZcjl(Long userId) {
		addJbls(userId, 100L, 21L, 1L);
    }

	/**
	 * 邀请粉丝注册 +300
	 * @param userId
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void addYqjl(Long userId) {
		// 邀请人得到300金币  typeId:  3:邀请奖励
		addJbls(userId, 300L, 3L, 1L);
    }

	/**
	 * 单日申请10次  +200
	 * @param userId
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void addDrsq(Long userId) {
		// typeId:  6:单日申请10次赠送200
		addJbls(userId, 200L, 6L, 1L);
    }

	/**
	 * 添加金币流水
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SkUserJinbi addJbls(Long userId, Long jinbie, Long typeId, Long inOrOut) {
		SKUser user = sKUserService.selectOne(userId);

		SkUserJinbi jinbi = new SkUserJinbi();
		jinbi.setUserid(user.getId());

		jinbi.setJinbi(jinbie);  // 邀请人得到100金币
		jinbi.setTypeid(typeId);   // 3:邀请奖励
		jinbi.setInorout(inOrOut);
		jinbi.setStatus(1L);

		sKUserYueService.updateYue(user.getId(), null, new Double(jinbi.getJinbi()) * inOrOut);

		insert(jinbi);

		return jinbi;
	}

    /**
     * 获取当天签到金币
     */
    public List<SkUserJinbi> getTodayQiandao() {

        SKUser user = sKUserService.getUser();
        Map<String, Object> map = MapUtils.genMap("typeid", "1",
                "userid", user.getId(),
                "bigCreatedTime", DateUtils.formatDateStart(new Date()));
        return selectByWhere(map);
    }

    /**
     * 试客金币列表
     *
     * @return
     */
    public List<SkUserJinbi> selectByUser(SKUser user, Integer inorout, Integer status) {
        Map<String, Object> parameters = MapUtils.genMap("userid", user.getId(), "orderby", "created_time desc");
        if (inorout != null) {
            parameters.put("inorout", inorout);
        }
        if (status != null) {
            parameters.put("status", status);
        }
        return selectByWhere(parameters);
    }

    /**
     * 根据type统计出所有金币额
     * @param typeid
     * @return
     */
    public Long sumByType(Long typeid) {
		SKUser user = sKUserService.getUser();

		Map<String, Object> parameters = MapUtils.genMap("userid", user.getId());
		if (typeid != null) {
			parameters.put("typeid", typeid);
		}
        List<SkUserJinbi> list = selectByWhere(parameters);

        Long sum = 0L;
        for (SkUserJinbi jinbi : list) {
            sum += jinbi.getInorout() * jinbi.getJinbi();
        }

        return sum;
	}

    /**
     * 统计今天剩余抽奖次数 (最多3次)
     * @return
     */
	public Integer countTodayCj() {
        SKUser user = sKUserService.getUser();
        Map<String, Object> parameters = MapUtils.genMap("typeid", "4",
                "userid", user.getId(),
                "bigCreatedTime", DateUtils.formatDateStart(new Date()));
        List<SkUserJinbi> list = selectByWhere(parameters);
        return 3 - list.size();
    }

    /**
     * 金币抽奖
     * @return
     */
	public Map<String, Object> choujiang() {
        SKUserYue skUserYue = sKUserYueService.selectByUser();

        if (skUserYue == null || skUserYue.getJinbi() <= 50) {
            BusinessExceptionUtil.threwException("金币余额不足!");
        }

        Integer countTodayCj = countTodayCj();
        if (countTodayCj <= 0) {
            BusinessExceptionUtil.threwException("今日抽奖次数已用尽!");
        }

        // 剩余金币
        Double yueJinbi = skUserYue.getJinbi() - 50;

        SKUser user = sKUserService.getUser();

        // 金币抽奖 -50
        SkUserJinbi skUserJinbi = addJbls(user.getId(), 50L, 4L, -1L);

        // 获取抽奖的结果
        Integer result = getChoujiangResult();

        // 抽奖结果： 现金
        if (result >= 0 && result <= 5) {

            Double yue = 0.0;
            switch (result) {
                case 0://0.01元现金
                    yue = 0.01;
                    break;
                case 1://0.02元现金
                    yue = 0.02;
                    break;
                case 2://0.05元现金
                    yue = 0.05;
                    break;
                case 3://0.1元现金
                    yue = 0.1;
                    break;
                case 4://2元现金
                    yue = 2.0;
                    break;
                case 5://5元现金
                    yue = 5.0;
                    break;
                default:
            }

            SKUserZhang skUserZhang = new SKUserZhang();
            skUserZhang.setUserid(user.getId());
            skUserZhang.setYue(yue);
            skUserZhang.setBusiid(skUserJinbi.getId());
            skUserZhang.setBusitypeid(7L);
            skUserZhangService.add(skUserZhang);
        }
        // 抽奖结果： 金币
        else if(result == 9 || result == 10) {
            Long jinbi = result == 9 ? 60L : 100L;

            yueJinbi += jinbi;

            // 抽奖得金币
            addJbls(user.getId(), jinbi, 5L, 1L);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("result", result);
        map.put("jinbi", yueJinbi - 50);
        map.put("count", countTodayCj - 1);
        return map;
    }

    /**
     * 0://0.01元现金   概率: 10%      [0,100)
     * 1://0.02元现金   概率: 10%      [100,200)
     * 2://0.05元现金   概率: 10%      [200,300)
     * 3://0.1元现金    概率: 10%      [300,400)
     * 4://2元现金      概率: 0.2%     [400,402)
     * 5://5元现金      概率: 0.1%     [402,403)
     * 6://10元现金     概率: 0%
     * 7://30元现金     概率: 0%
     * 8://50元现金     概率: 0%
     * 9://60金币       概率: 20%      [403,603)
     * 10://100金币     概率: 10%      [603,703)
     * 19://再接再厉    概率: 29.7%    [703,1000)
     * @return
     */
    public Integer getChoujiangResult() {

        Random random = new Random();
        int i = random.nextInt(1000);

        Integer result;
        if (i < 100) {
            result = 0;
        } else if (i < 200) {
            result = 1;
        } else if (i < 300) {
            result = 2;
        } else if (i < 400) {
            result = 3;
        } else if (i < 402) {
            result = 4;
        } else if (i < 403) {
            result = 5;
        } else if (i < 603) {
            result = 9;
        } else if (i < 703) {
            result = 10;
        } else {
            result = 19;
        }

        return result;
    }
}
