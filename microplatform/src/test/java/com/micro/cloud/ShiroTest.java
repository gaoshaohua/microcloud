// package com.micro.cloud;
//
// import org.apache.shiro.SecurityUtils;
// import org.apache.shiro.authc.UsernamePasswordToken;
// import org.apache.shiro.mgt.DefaultSecurityManager;
// import org.apache.shiro.mgt.SecurityManager;
// import org.apache.shiro.realm.Realm;
// import org.apache.shiro.realm.SimpleAccountRealm;
// import org.apache.shiro.realm.jdbc.JdbcRealm;
// import org.apache.shiro.realm.text.IniRealm;
// import org.apache.shiro.subject.Subject;
// import org.junit.Test;
// import org.springframework.util.ResourceUtils;
//
// import com.alibaba.druid.pool.DruidDataSource;
//
/// **
// * shiro测试
// *
// * @Description
// * @author gsh
// * @date 2018年5月31日 下午1:34:51
// */
// public class ShiroTest {
//
// /**
// * 设置数据源
// */
// DruidDataSource dataSource = new DruidDataSource();
//
// {
// dataSource.setUrl("jdbc:mysql://192.168.0.102:3306/boot");
// dataSource.setUsername("root");
// dataSource.setPassword("root");
// dataSource.setDriverClassName("com.mysql.jdbc.Driver");
// }
//
// /**
// * 通过SimpleAccountRealm实现 不支持授权
// *
// * @Description
// * @author gsh
// */
// @Test
// public void shiroSimpleAccount() {
// SimpleAccountRealm realm = new SimpleAccountRealm();
// realm.addAccount("zhangsan", "123456", "role1", "role2");
//
// SecurityManager securityManager = new DefaultSecurityManager(realm);
// SecurityUtils.setSecurityManager(securityManager);
// Subject subject = SecurityUtils.getSubject();
//
// UsernamePasswordToken token = new UsernamePasswordToken("zhangsan",
// "123456");
// System.out.println("是否登录：" + subject.isAuthenticated());
// subject.login(token);
// System.out.println("是否登录：" + subject.isAuthenticated());
// System.out.println("角色：" + subject.hasRole("role3"));
// subject.logout();
// System.out.println("是否登录：" + subject.isAuthenticated());
// }
//
// /**
// * 通过iniRealm实现
// *
// * @Description
// * @author gsh
// */
// @Test
// public void shiroIni() {
// Realm realm = new IniRealm(
// ResourceUtils.CLASSPATH_URL_PREFIX + "conf/shiro-realm.ini");
// SecurityManager securityManager = new DefaultSecurityManager(realm);
// SecurityUtils.setSecurityManager(securityManager);
// Subject subject = SecurityUtils.getSubject();
// UsernamePasswordToken token = new UsernamePasswordToken("zhangsan",
// "123456");
// System.out.println("是否登录：" + subject.isAuthenticated());
// subject.login(token);
// System.out.println("是否登录：" + subject.isAuthenticated());
// System.out.println("用户角色：" + subject.hasRole("role1"));
// subject.checkPermissions("user:delete");
// subject.logout();
// System.out.println("是否登录：" + subject.isAuthenticated());
// }
//
// /**
// * 通过jdbcRealm实现
// *
// * @Description
// * @author gsh
// */
// @Test
// public void shiroJdbc() {
// JdbcRealm realm = new JdbcRealm();
// realm.setDataSource(dataSource);
// realm.setPermissionsLookupEnabled(true);
// realm.setAuthenticationQuery(
// "select pwd from t_sys_user where account = ?");
// realm.setUserRolesQuery(
// "SELECT r.`name` FROM t_sys_user_role ur LEFT JOIN t_sys_user u ON
// u.id=ur.userid LEFT JOIN t_sys_role r ON r.id=ur.roleid WHERE u.account =
// ?");
//
// realm.setPermissionsQuery(
// "SELECT res.permcode FROM t_sys_role_resources rr LEFT JOIN t_sys_resources
// res ON res.id=rr.resourcesid LEFT JOIN t_sys_role r ON r.id=rr.roleid WHERE
// r.`name` = ?");
// SecurityManager securityManager = new DefaultSecurityManager(realm);
// SecurityUtils.setSecurityManager(securityManager);
// Subject subject = SecurityUtils.getSubject();
// UsernamePasswordToken token = new UsernamePasswordToken("zhangsan",
// "123456");
// System.out.println("是否登录：" + subject.isAuthenticated());
// subject.login(token);
// System.out.println("是否登录：" + subject.isAuthenticated());
// System.out.println("用户角色：" + subject.hasRole("role1"));
// subject.checkPermissions("sys:user:view", "123");
// subject.logout();
// System.out.println("是否登录：" + subject.isAuthenticated());
// }
// }
