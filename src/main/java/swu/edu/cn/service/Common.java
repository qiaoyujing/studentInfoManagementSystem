package swu.edu.cn.service;

import java.util.List;

import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.Discipline;
import swu.edu.cn.entity.Faculty;
import swu.edu.cn.entity.Menu;

public interface Common {
	//账户关系开始
		/*验证是否有权限登录*/
	 boolean doCheck(Account user) ;
	/*通过角色ID获取对应的菜单*/
	 List<Menu> findByRoleId(Integer role_id);
	 //锁定账户
	 int lockOne(Integer id);
	 
	 int unlockOne(Integer id);
	 
	    int deleteByPrimaryKey(Integer id);
	    int deleteAccountByCode(String code);
	    int insert(Account record);

	    int insertSelective(Account record);

	    Account selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Account record);

	    int updateByPrimaryKey(Account record);
	 //账户关系结束
	 
	//学院开始
	int deleteByPrimaryKeyFaculty(Integer key);

    int insertFaculty(Faculty record);

    int insertSelectiveFaculty(Faculty record);

    Faculty selectByPrimaryKeyFaculty(Integer key);

    int updateByPrimaryKeySelectiveFaculty(Faculty record);
    
	List<Faculty> selectCodeAndNameFaculty();
	
	//专业开始
    int deleteByPrimaryKeyDiscipline(Integer id);

    int insertDiscipline(Discipline record);

    int insertSelectiveDiscipline(Discipline record);

    Discipline selectByPrimaryKeyDiscipline(Integer id);

    int updateByPrimaryKeySelectiveDiscipline(Discipline record);

    int updateByPrimaryKeyDiscipline(Discipline record);
    
    List<Discipline> selectCodeAndNameDiscipline();
    
    List<Discipline> selectCodeAndNameByParentCode(String parentCode);
	
}
