//package com.micro.cloud.sys.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.micro.cloud.frame.commons.base.controller.BaseController;
//import com.micro.cloud.sys.service.IUserService;
//
//import io.swagger.annotations.Api;
//
///**
// * @desc 控制器
// * @author gsh
// * @version 1.0
// * @date 2018年05月31日 05:22:29
// */
//@Api(tags="用户管理")
//@RestController
////@RequestMapping("/sys/user")
//public class UserController extends BaseController {
//
//	@Autowired
//	private IUserService userService;
//
////	@ApiOperation(value = "保存用户信息",notes = "保存用户信息notes")
////	@RequestMapping(value = "/save", method = RequestMethod.POST)
////	public BaseResult save(@RequestBody User user) throws Exception {
////		user.setPassword(new Md5Hash(user.getPassword(), "", 2).toString());
////		userService.save(user);
////		BaseResult result = ResultUtils.success();
////		result.getResData().put("user", user);
////		return result;
////	}
////
////	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
////	public BaseResult delete(@PathVariable Long id) throws Exception {
////		if (null == id) {
////			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "id", id);
////		}
////		userService.deleteById(id);
////		BaseResult result = ResultUtils.success();
////		return result;
////	}
////
////	@RequestMapping(value = "/updateById", method = RequestMethod.PUT)
////	public BaseResult updateById(@RequestBody User user) throws Exception {
////		if (null == user.getId()) {
////			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "id",
////					user.getId());
////		}
////		userService.updateById(user);
////		BaseResult result = ResultUtils.success();
////		return result;
////	}
////
////	@RequestMapping(value = "/findOne/{id}", method = RequestMethod.GET)
////	public BaseResult findOne(@PathVariable Long id) throws Exception {
////		User user = new User();
////		user.setId(id);
////		user = userService.findOne(user);
////		BaseResult result = ResultUtils.success();
////		result.getResData().put("user", user);
////		return result;
////	}
////
////	@RequestMapping(value = "/findAllForPage", method = RequestMethod.GET)
////	public BaseResult findAllForPage(User user, HttpServletRequest request)
////			throws Exception {
////		Map<String, Object> reqMap = WebKit.getParams(request);
////		WebKit.setPage(WebKit.toPageIndex(reqMap), WebKit.toPageSize(reqMap));
////		List<User> users = userService.findAll(user);
////		PageInfo<User> pages = new PageInfo<User>(users);
////		BaseResult result = ResultUtils.success();
////		result.setResData(pages.getList(), pages.getTotal());
////		return result;
////	}
//}
