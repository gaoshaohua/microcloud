/**
 * 扩展form表单获取表单数据方法
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

/**
 * 扩展datagrid
 */
$.extend($.fn.datagrid.defaults, {
	loadFilter:function(res){
		console.log("loadFilter",res);
		var options=$(this).datagrid("options");
		if(options.hasOwnProperty("webpager")&&!options.webpager){
			return res.resData?res.resData:res;
		}
		var data={
				total : 0,
				rows : [],
				footer:[]	
		};
		if (res.hasOwnProperty("resCode")) {//请求后台返回
			if(res.resCode != 200){//请求失败
				return res;
			}
			var resData = res.resData;
			
			data.total=resData.total,
			data.rows=resData.rows,
			data.footer=resData.footer?resData.footer:[]
		}else{
			if(!res.hasOwnProperty("total")){
				data.total=res.length;
				data.rows=res;
				data.footer=[];
			}else{
				data=res;
			}
		}
		
		if($(this).datagrid('options').pagination){
			data=pageFilter($(this),data);
		}
		
		return data;
		
	},
	onBeforeLoad : function() {
		if($(this).datagrid('options').pagination){
			if($(this).datagrid('options').paginationType==="normal"){
				setPaginationNormal($(this));
			}else{
				setPagination($(this));
			}
		}
		return true;
	},
	onLoadSuccess:function(res){
		if (res.hasOwnProperty("state")&&res.state==="error") {
			top.$.messager.alert('温馨提示', "数据加载失败,错误码："
					+ res.error.errMsg, 'error');
		}
	},onLoadError:function() {
		top.$.messager.alert('温馨提示', '系统繁忙，请重试!', 'error');
	}
});


function pageFilter(dgobj,data){
	var opts = dgobj.datagrid('options');
	var pager = dgobj.datagrid('getPager');
	pager.pagination({
		total : data.total,
		onSelectPage : function(pageNum, pageSize) {
			opts.pageNumber = pageNum;
			opts.pageSize = pageSize;
			pager.pagination('refresh', {
				pageNumber : pageNum,
				pageSize : pageSize,
				pageList: opts.pageList
			});
			dgobj.datagrid('loadData', data);
		},
		onRefresh : function(pageNum, pageSize) {
			dgobj.datagrid('reload');
		}
	});
	if (!data.originalRows) {
		data.originalRows = (data.rows);
	}
	var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	data.rows = data.originalRows.slice(start, end);
	return data;
}

function setPagination(dgobj) {
	// 设置分页控件,必须在设置data后设置
	var opts = dgobj.datagrid('options');
	var p = dgobj.datagrid('getPager');
	p.pagination({
		pageSize:opts.pageSize,
		pageList: opts.pageList,
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
}

function setPaginationNormal(dgobj) {
	// 设置分页控件,必须在设置data后设置
	var opts = dgobj.datagrid('options');
	var p = dgobj.datagrid('getPager');
	p.pagination({
		pageSize:opts.pageSize,
		pageList: opts.pageList,
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		layout:['prev','manual','next']
	});
}
