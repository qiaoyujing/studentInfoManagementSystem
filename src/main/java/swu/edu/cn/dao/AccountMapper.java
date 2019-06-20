package swu.edu.cn.dao;

import swu.edu.cn.entity.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);
    int deleteAccountByCode(String code);
    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    
    Account selectByCode(String code);
    
    int lockOne(Integer id);
    
    int unlockOne(Integer id);
}