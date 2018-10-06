package com.kensure.shike.user.service;

import co.kensure.frame.JSBaseService;
import com.kensure.shike.user.dao.SkYijianDao;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SkYijian;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;


/**
 * 意见反馈表服务实现类
 */
@Service
public class SkYijianService extends JSBaseService{
	
	@Resource
	private SkYijianDao dao;

	@Resource
	private SKUserService skUserService;
    
    
    public SkYijian selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SkYijian> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SkYijian> selectAll(){
		return dao.selectAll();
	}
	
	public List<SkYijian> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SkYijian obj){
		super.beforeInsert(obj);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SkYijian> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SkYijian obj){
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
    
    public void add(Long typeId, String phone, String content, String pictureUrl) {
        SKUser user = skUserService.getUser();

        SkYijian yijian = new SkYijian();
        yijian.setUserid(user.getId());
        yijian.setTypeid(typeId);
        yijian.setPhone(phone);
        yijian.setContent(content);
        yijian.setPictureUrl(pictureUrl);

    	insert(yijian);
	}
  

}
