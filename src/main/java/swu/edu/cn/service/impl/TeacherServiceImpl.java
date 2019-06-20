package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.TeacherMapper;
import swu.edu.cn.entity.Teacher;
import swu.edu.cn.service.TeacherService;
@Service
public class TeacherServiceImpl implements TeacherService{
	@Resource
	private TeacherMapper dao;
	@Override
	public int deleteByPrimaryKey(Integer id){
		 return dao.deleteByPrimaryKey(id);
	 }
	@Override
	 public int insert(Teacher record){
	    	return dao.insert(record);
	 }
	@Override
	 public int insertSelective(Teacher record){
	    	return dao.insertSelective(record);
	 }
	@Override
	 public  Teacher selectByPrimaryKey(Integer id){
	    	return dao.selectByPrimaryKey(id);
	 }
	@Override
	 public int updateByPrimaryKeySelective(Teacher record){
	    return dao.updateByPrimaryKeySelective(record);
	 }
	@Override
	 public int updateByPrimaryKey(Teacher record){
	    return dao.updateByPrimaryKey(record);	
	}
	@Override    
    public List<Teacher> selectAll(){
	    return dao.selectAll();	
	}
	@Override
	public List<Teacher> selectAllPage(int startRow, int pageSize) {
		return dao.selectAllPage(startRow, pageSize);
	}
	@Override
	public int selectMaxCode() {
		
		return dao.selectMaxCode();
	}
	
}
