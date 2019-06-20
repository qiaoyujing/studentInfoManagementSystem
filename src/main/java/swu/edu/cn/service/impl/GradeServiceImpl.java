package swu.edu.cn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.GradeMapper;
import swu.edu.cn.entity.Discipline;
import swu.edu.cn.entity.Grade;
import swu.edu.cn.service.GradeService;
@Service
public class GradeServiceImpl implements GradeService{
	@Resource
	private GradeMapper dao;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	@Override
	public int deleteAllGradeByStudentId(Integer id){
		return dao.deleteAllGradeByStudentId(id);
	}
	@Override
	public int insert(Grade record) {
		return dao.insert(record);
	}

	@Override
	public int insertSelective(Grade record) {
		return dao.insertSelective(record);
	}

	@Override
	public Grade selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Grade record) {
		return dao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Grade record) {
		return dao.updateByPrimaryKey(record);
	}

	@Override
	public List<Grade> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Grade> selectAllPage(int startRow, int pageSize) {
		return dao.selectAllPage(startRow, pageSize);
	}
	@Override
	public List<Grade> selectAllGrade(List<Integer> studentIdColl,int getCourseId,String getacademicyear){
		Map<String, Object> params = new HashMap<String, Object>(3);
		params.put("studentIdColl", studentIdColl);
		params.put("getCourseId", getCourseId);
		params.put("getacademicyear", getacademicyear);
		return dao.selectAllGrade(params);
		//List<Grade> gradeList=new ArrayList<Grade>();
		/*int studentId=0;
		for(int i=0;i<studentIdColl.size();i++){
			studentId=studentIdColl.get(i);
			params.put("studentId", studentId);
			gradeList.add(dao.selectAllGrade(params));
		}*/
		//return gradeList;
	}
	
	@Override
	public List<Grade> selectAllGrade2(List<Integer> studentIdColl,int getCourseId,String getacademicyear,int startRow,int pageSize){
		Map<String, Object> params = new HashMap<String, Object>(5);
		params.put("studentIdColl", studentIdColl);
		params.put("getCourseId", getCourseId);
		params.put("getacademicyear", getacademicyear);
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		return dao.selectAllGrade2(params);
		/*List<Grade> gradeList=new ArrayList<Grade>();
		int studentId=0;
		for(int i=0;i<studentIdColl.size();i++){
			studentId=studentIdColl.get(i);
			params.put("studentId", studentId);
			params.put("studentId", studentId);
			gradeList.add(dao.selectAllGrade2(params));
		}
		return gradeList;*/
	}

}
