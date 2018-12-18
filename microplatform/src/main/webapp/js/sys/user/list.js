$(function() {
	var index = {
		init : function() {
			this.udg=$("#userDataGrid");
			this.initData();
			this.bindEvent();
		},
		initData:function(){
			var that=this;
			that.initUserDataGrid();
		},
		bindEvent : function() {
			var that = this;
			$("#btn_search").unbind().bind("click",function(event){
				that.searchUserData();
			});
			$("#btn_reset").unbind().bind("click",function(event){
				$("#form_search").form("reset");
			});
		},
		initUserDataGrid:function(){
			var that=this;
			that.udg.datagrid({
			    url:BootUtils.baseUrl+'/sys/user/findAllForPage',
			    method:'GET',
			    fitColumns:true,
			    rownumbers:true,
			    pagination:true,
			    pageSize:2,
			    pageList:[2,5,10],
			    webpager:false,
			    toolbar:[{
		            text:'新增',
		            iconCls:'icon-add',
		            handler:function(){alert('add')}
		        },'-',{
		            text:'删除',
		            iconCls:'icon-remove',
		            handler:function(){alert('remove')}
		        },'-',{
		            text:'修改',
		            iconCls:'icon-edit',
		            handler:function(){alert('edit')}
		        }],
			    columns:[[
			    	{field:'ck',title:'check',checkbox:true},
			    	{field:'username',title:'账号',width:100},
			        {field:'name',title:'用户名',width:100},
			        {field:'nickname',title:'昵称',width:100},
			        {field:'phone',title:'手机号码',width:100},
			        {field:'createDate',title:'创建日期',width:100},
			        {field:'status',title:'状态',width:100},
			    ]],
			    onLoadSuccess:function(data){
			    	console.log("onLoadSuccess",data);
			    }
			});
			console.log("options",that.udg.datagrid("options"));
		},
		searchUserData:function(){
			var that=this;
			var validate=$("#form_search").form("enableValidation").form("validate");
			if(validate){
				var queryParams=$("#form_search").serializeObject();
				console.log("queryParams",queryParams);
				that.udg.datagrid("load",queryParams);
			}
		}
	};
	index.init();
});