$(function() {
	var index = {
		init : function() {
			this.initData();
			this.bindEvent();
		},
		initData:function(){
			this.loadMenuTree();
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
		loadMenuTree:function(){
			var that=this;
			BootUtils.Http.send("/sys/resources/findAllMenu", {
				method:'GET',
				onSuccess : function(res) {
					var treeData=BootUtils.formatter.json2tree(res.resData.resources,{
						id:"id",
						text:"name",
						pid:"parentId"
					});
					console.log("treeData",treeData);
					$('#treemenu').tree({
						data: treeData,
						onClick: function(node){
							console.log("treemenu onClick",node); 
							var attributes=node.attributes;
							that.addTab(attributes.name,attributes.url);
						}
					});
				},
				onError : function(errorCode,errorMsg) {
					$.messager.alert("登录失败-错误代码:" + errorCode,"错误信息："+errorMsg, 'error');
				}
			});
		},
		addTab:function(name, url){
			if ($('#tabs').tabs('exists', name)) {
				$('#tabs').tabs('select', name);
			} else {
				$('#tabs')
						.tabs(
								'add',
								{
									title : name,
									//注：使用iframe即可防止同一个页面出现js和css冲突的问题 
									content : '<iframe name="'
											+ name
											+ '"id="'
											+ name
											+ '"src="'
											+ BootUtils.baseUrl+url
											+ '" width="100%" height="100%" style="display: block;border: 0px;"></iframe>',
									cache : false,
									closable : true,
									tools : [{
										iconCls:'icon-mini-refresh',
										handler:function(){
											refreshTab(url);
										}
									}]
								});
			}
		}
	};
	index.init();
});