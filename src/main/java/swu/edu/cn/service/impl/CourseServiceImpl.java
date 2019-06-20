package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.CourseMapper;
import swu.edu.cn.entity.Course;
import swu.edu.cn.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService{
	@Resource
	private CourseMapper dao;
	
    public int deleteByPrimaryKey(Integer id){
    	return dao.deleteByPrimaryKey(id);
    }

    public int insert(Course record){
    	return dao.insert(record);
    }

    public int insertSelective(Course record){
    	return dao.insertSelective(record);
    }

    public Course selectByPrimaryKey(Integer id){
    	return dao.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Course record){
    	return dao.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Course record){
    	return dao.updateByPrimaryKey(record);
    }
    
    public List<Course> selectAll(){
    	return dao.selectAll();
    }
    
    public  List<Course> selectAllPage(int startRow,int pageSize){
    	return dao.selectAllPage(startRow,pageSize);
    }

	@Override
	public int selectMaxCode() {
		return dao.selectMaxCode();
	}

}
