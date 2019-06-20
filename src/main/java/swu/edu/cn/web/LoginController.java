package swu.edu.cn.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import swu.edu.cn.entity.Account;
import swu.edu.cn.entity.Menu;
import swu.edu.cn.entity.StudentBaseInfo;
import swu.edu.cn.service.Common;
import swu.edu.cn.service.StudentBaseInfoService;

@Controller
@SessionAttributes({"user","menuList","roleIdOnline"})
public class LoginController {
	  //用户业务层实例化
    @Autowired(required = false)   
    private Common commonService;

    private static Logger log=Logger.getLogger(StudentBaseInfoController.class);
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public void LoginCheck(@ModelAttribute("form") Account account, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String prarm = request.getParameter("prarm");
        System.out.println("param="+prarm);
        if("logout".equals(prarm)){
        	Account user2 = (Account) request.getSession().getAttribute("user");
        	int unlock=commonService.unlockOne(user2.getId());
        	System.out.print("成功释放"+unlock+"用户");
        	request.getSession().invalidate();
			Object user = request.getSession().getAttribute("user");
			if(user==null){
				response.getWriter().write("null");
			}else{
				response.getWriter().write("!null");
			}
			response.getWriter().flush();
			response.getWriter().close();
        }
        model.addAttribute("user", account);
        String result = null;
        if (commonService.doCheck(account)) {
            result = "true";
            
        } else {
            result = "false";
        }
        System.out.println(result);
        response.getWriter().print(result);
    }

    @RequestMapping("/pages/index")
    public String ReturnIndex(@ModelAttribute("user") Account account,Model model, HttpServletRequest request, HttpServletResponse response) {
    	int onlyOne=commonService.lockOne(account.getId());
    	if(onlyOne>0){
    		System.out.print("成功锁定账户");
    	}
    	int role_id=-1;
    	role_id=account.getRoleId();
    	System.out.println("studentBaseInfo.getRoleId()="+role_id);
    	model.addAttribute("roleIdOnline", role_id);
    	List<Menu> menuList=commonService.findByRoleId(role_id);
    	if(menuList!=null){
    		model.addAttribute("menuList", menuList);
    	}
        return "/index";
    }
}
