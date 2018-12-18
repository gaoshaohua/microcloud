$(function() {
	var login = {
		init : function() {
			this.bindEvent();
		},
		bindEvent : function() {
			var that = this;
			$("#btn_login").unbind().bind("click", function(event) {
				that.login();
			});
			$('#form_login').unbind().bind('keypress', function(event) {
			　　if (event.keyCode == "13") {
			　　　　that.login();
			　　}
			});
		},
		login : function() {
			var valid = $("#form_login").form("enableValidation").form(
					"validate");
			if (!valid)
				return;
			var params = $("#form_login").serializeObject();
			BootUtils.Http.send("/sys/login", {
				method:'POST',
				params : params,
				onSuccess : function(res) {
					window.location.href = "/boot/index";
				},
				onError : function(errorCode,errorMsg) {
					$.messager.alert("登录失败-错误代码:" + errorCode,"错误信息："+errorMsg, 'error');
				}

			});
		}
	};
	login.init();
});