package com.xl.ccms.advice;

import com.xl.ccms.dao.LogDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Log;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by xl on 2018/11/18 0018.
 */
@Aspect
public class LogAdvice {

    @Autowired
    private LogDao logDao;

    @Pointcut("execution(* com.xl.ccms.service.impl.*Impl.add*(..)) || execution(* com.xl.ccms.service.impl.*Impl.remove*(..)) || execution(* com.xl.ccms.service.impl.*Impl.modify*(..))")
    public void logPc(){}

    @Around("logPc()")
    public Object LogAround(ProceedingJoinPoint pjp) throws Throwable {
        System.out.println("----创建日志开始----");

        Log log = new Log();

        Object[] args = pjp.getArgs();

        //用户名
        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session =request.getSession();


        Account account = (Account) session.getAttribute("account");
        if(account!=null){
            log.setUserName(account.getUsername());
        }


        //事务源
        String resource=args[0].getClass().toString();
        log.setLogResource(resource.substring(resource.lastIndexOf(".")+1));

        //事务名
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        log.setLogAction(methodSignature.getMethod().getName());

        //事务详细信息
        String message="";
        for (Object arg : args) {
            message=message.concat(arg.toString());
        }
        log.setLogMessage(message);

        //事务结果
        Object obj=null;
        String result="";
        try {
            obj = pjp.proceed();
            result="success";
        } catch (Throwable throwable) {
            result="fail";
            throwable.printStackTrace();
        }
        log.setLogResult(result);

        logDao.insertLog(log);

        System.out.println("----创建日志结束----");

        return obj;

    }
}
