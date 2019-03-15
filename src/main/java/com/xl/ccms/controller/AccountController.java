package com.xl.ccms.controller;

import com.xl.ccms.entity.Account;
import com.xl.ccms.service.AccountService;
import com.xl.ccms.util.CreateValidateCodeUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/9.
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;

    /**
     * 管理员登录
     * @param id
     * @param password
     * @return
     */
    @RequestMapping("/loginAccount")
    public String loginManager(String id, String password,boolean rememberMe,HttpSession session){

        Subject subject = SecurityUtils.getSubject();

        try {
            subject.login(new UsernamePasswordToken(id,password,rememberMe));
            Account account = accountService.queryAccountById(id);
            session.setAttribute("account",account);
            System.out.println(subject.hasRole("root")? "有root":"无root");
            return "jsp/main";
        } catch (UnknownAccountException uae) {
            uae.printStackTrace();
            return "jsp/login";
        }catch (IncorrectCredentialsException ice){
            ice.printStackTrace();
            return "jsp/login";
        }catch (AuthenticationException ae){
            ae.printStackTrace();
            return "jsp/login";
        }

    }

    /**
     *创建验证码
     */
    @RequestMapping("/createVerifyCode")
    public void createVerifyCode(HttpServletResponse response, HttpSession session) throws IOException {
        CreateValidateCodeUtil utils=new CreateValidateCodeUtil(90, 30, 4);
        String code=utils.getCode();
        System.out.println(code);
        session.setAttribute("code",code);
        utils.write(response.getOutputStream());
    }

    /**
     * 验证验证码
     * @param enCode
     * @param session
     * @return
     */
    @RequestMapping("/checkVerifyCode")
    public @ResponseBody boolean checkVerifyCode(String enCode, HttpSession session){

        if (session.getAttribute("code").equals(enCode)){
            return true;
        }
        return false;
    }

    @RequestMapping("/modifyPassword")
    public @ResponseBody Integer modifyPassword(String oldPsw,String newPsw,HttpSession session){

        Account account = (Account) session.getAttribute("account");


        if (account.getPassword().equals(new Md5Hash(oldPsw,account.getSalt(),1024).toString())){
            Account newAccount = new Account();
            newAccount.setId(account.getId());
            newAccount.setPassword(new Md5Hash(newPsw,account.getSalt(),1024).toString());
            if(accountService.modifyAccount(newAccount)>0){
                account.setPassword(new Md5Hash(newPsw,account.getSalt(),1024).toString());
                session.setAttribute("account",account);
                return 1;
            }
        }
        return 0;
    }


    @RequestMapping("/countAccountType")
    public @ResponseBody Map<String,Object> countAccountType(){

        HashMap<String, Object> map = new HashMap<>();

        List<Integer> list = accountService.countByType();

        map.put("value",list);

        return map;
    }

    @RequestMapping("/countAccountSex")
    public @ResponseBody Map<String,Object> countAccountSex(){

        HashMap<String, Object> map = new HashMap<>();

        List<Integer> list = accountService.countBySex();

        map.put("value",list);

        return map;

    }

}
