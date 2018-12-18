// package com.micro.cloud;
//
// import org.apache.shiro.SecurityUtils;
// import org.apache.shiro.authc.UsernamePasswordToken;
// import org.apache.shiro.crypto.hash.Md5Hash;
// import org.apache.shiro.mgt.DefaultSecurityManager;
// import org.apache.shiro.mgt.SecurityManager;
// import org.apache.shiro.subject.Subject;
// import org.junit.Test;
// import org.junit.runner.RunWith;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.test.context.junit4.SpringRunner;
//
// import com.micro.cloud.commons.security.shiro.ShiroDbRealm;
// import com.micro.cloud.sys.vo.ActiveUser;
//
// @RunWith(SpringRunner.class)
// @SpringBootTest
// public class BootApplicationTests {
//
// @Test
// public void contextLoads() {
//
// }
//
// @Test
// public void shiroJdbc() {
// ShiroDbRealm realm = new ShiroDbRealm();
//
// SecurityManager securityManager = new DefaultSecurityManager(realm);
// SecurityUtils.setSecurityManager(securityManager);
// Subject subject = SecurityUtils.getSubject();
// UsernamePasswordToken token = new UsernamePasswordToken("admin",
// new Md5Hash("123456", "", 2).toString());
// System.out.println("是否登录：" + subject.isAuthenticated());
// subject.login(token);
// System.out.println("是否登录：" + subject.isAuthenticated());
// ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
// System.out.println("当前登录用户：" + activeUser.toString());
// System.out.println(activeUser.getRoles());
// // subject.checkRoles("admin", "test");
// // subject.checkPermissions("sys:user:view");
// // subject.logout();
// // System.out.println("是否登录：" + subject.isAuthenticated());
// }
// }
