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
import com.kensure.shike.zhang.model.SkUserJinbi;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;


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

        obj.setUserid(user.getId());
        obj.setTypeid(1L);
        obj.setInorout(1L);
        obj.setStatus(1L);

        sKUserYueService.updateYue(user.getId(), null, new Double(obj.getJinbi()));

        insert(obj);
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
}
