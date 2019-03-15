package com.xl.ccms.config;

import com.xl.ccms.entity.*;
import com.xl.ccms.entity.Account;
import com.xl.ccms.service.AccountService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

/**
 * Created by xl on 2018/11/18 0018.
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private AccountService accountService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("------------授权------------");

        String  id = (String) principalCollection.getPrimaryPrincipal();

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        List<Role> roles = accountService.queryRoleById(id);
        for (Role role : roles) {
            info.addRole(role.getRoleTag());
        }

        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("----------认证----------");

        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;

        String id = usernamePasswordToken.getUsername();

        Account account = accountService.queryAccountById(id);

        if (account.getId()!=null){

            return new SimpleAuthenticationInfo(
                    account.getId(),
                    account.getPassword(),
                    ByteSource.Util.bytes(account.getSalt()),
                    UUID.randomUUID().toString());
        }

        return null;
    }
}
