package swu.edu.cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import swu.edu.cn.dao.AccountMapper;
import swu.edu.cn.dao.DisciplineMapper;
import swu.edu.cn.dao.FacultyMapper;
import swu.edu.cn.dao.MenuMapper;
import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.Discipline;
import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.service.Common;
@Service
public class CommonImpl implements Common{
	@Resource
	private FacultyMapper facultyDao;
	@Resource
	private DisciplineMapper disciplineDao;
	@Resource
	private AccountMapper accountDao;
	@Resource
	private MenuMapper menuDao;
	//登录验证
    public boolean doCheck(Account user) {
    	Account tempUser=accountDao.selectByCode(user.getCode());
    	
        if(tempUser!=null) {
            if (tempUser.getPassword().equals(user.getPassword())){
                user.setId(tempUser.getId());
                user.setRoleId(tempUser.getRoleId());
                user.setName(tempUser.getName());
            return true;
            }
        }
        return false;
    }
	    //锁定账户
	    @Override
	 public int lockOne(Integer id){
		 return accountDao.lockOne(id);
	 }
    
	 @Override
	 public int unlockOne(Integer id){
		 return accountDao.unlockOne(id);
	 }
	 
    //获取不同菜单列表
    public List<Menu> findByRoleId(Integer role_id){  	
    	return menuDao.findByRoleId(role_id);
    }
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return accountDao.deleteByPrimaryKey(id);
	}
	@Override
	public int deleteAccountByCode(String code){
		return accountDao.deleteAccountByCode(code);
	}
	@Override
	public int insert(Account record) {
		return accountDao.insert(record);
	}
	@Override
	public int insertSelective(Account record) {
		return accountDao.insertSelective(record);
	}
	@Override
	public Account selectByPrimaryKey(Integer id) {
		return accountDao.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(Account record) {
		return accountDao.updateByPrimaryKeySelective(record);
	}
	@Override
	public int updateByPrimaryKey(Account record) {
		return accountDao.updateByPrimaryKey(record);
	}
    //账户关系结束
	
    //学院相关操作开始
	public int deleteByPrimaryKeyFaculty(Integer key){
		return facultyDao.deleteByPrimaryKey(key);
	}

    public int insertFaculty(Faculty record){
    	return facultyDao.insert(record);
    }

    public int insertSelectiveFaculty(Faculty record){
    	return facultyDao.insertSelective(record);
    }

    public Faculty selectByPrimaryKeyFaculty(Integer key){
    	return facultyDao.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelectiveFaculty(Faculty record){
    	return facultyDao.updateByPrimaryKeySelective(record);
    }
    
	public List<Faculty> selectCodeAndNameFaculty(){
		return facultyDao.selectCodeAndName();
	}
	//学院相关操作结束
	//专业开始
	public int deleteByPrimaryKeyDiscipline(Integer key){
		return disciplineDao.deleteByPrimaryKey(key);
	}

    public int insertDiscipline(Discipline record){
    	return disciplineDao.insert(record);
    }

    public int insertSelectiveDiscipline(Discipline record){
    	return disciplineDao.insertSelective(record);
    }

    public Discipline selectByPrimaryKeyDiscipline(Integer key){
    	return disciplineDao.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelectiveDiscipline(Discipline record){
    	return disciplineDao.updateByPrimaryKeySelective(record);
    }
    
	public List<Discipline> selectCodeAndNameDiscipline(){
		return disciplineDao.selectCodeAndName();
	}

	@Override
	public int updateByPrimaryKeyDiscipline(Discipline record) {	
		return disciplineDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Discipline> selectCodeAndNameByParentCode(String parentCode) {
		// TODO Auto-generated method stub
		return disciplineDao.selectCodeAndNameByParentCode(parentCode);
	}

	
}
