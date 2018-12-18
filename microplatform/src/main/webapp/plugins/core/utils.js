var BootUtils = {};
/**
 * 定义配置属性
 */
BootUtils.KConfig = {
	getRootPath : function() {// 获取项目地址
		// 获取当前网址，如： http://localhost:8083/share/index.jsp
		var curWwwPath = window.document.location.href;
		// 获取主机地址之后的目录，如： /share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// 获取主机地址，如： http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		// 获取带"/"的项目名，如：/share
		var projectName = pathName.substring(0,
				pathName.substr(1).indexOf('/') + 1);
		return (localhostPaht + projectName);
	}
};

/*
 * 项目名称
 */
BootUtils.baseUrl = BootUtils.KConfig.getRootPath();

BootUtils.Http = {
	send : function(url, option) {
		url=BootUtils.baseUrl+url;
		var defaultOption = {
			method : "POST",
			credentials : 'include',
			headers : {
				"Content-Type" : "application/json"
			},
			body : option.params ? JSON.stringify(option.params) : "{}"
		};

		option = $.extend(true, defaultOption, option);
		if(option.method==='GET'){//get请求需要移除body属性
			delete option["body"]; 
		}
		console.log("option",option);
		fetch(url, option).then(function(response) {
			return response.json();
		}).then(function(res) {
			console.log("http-send-finished",res);
			//请求成功
			if(res.resCode===200){
				if(option.onSuccess){
					option.onSuccess(res);
				}
			}else{//请求失败
				if(option.onError){
					option.onError(res.resCode,res.resMsg);
				}else{
					top.$.messager.alert('请求失败-错误代码：'+res.resCode, "错误信息："+res.resMsg);
				}
			}
			
		},function(e) {//请求异常
			console.log("http-send-exception",e);
			if(option.onException){
				option.onException(e);
			}else{
				top.$.messager.alert('温馨提示', '请求异常!', 'error');
			}
		});
	}
}

BootUtils.formatter = {
	json2tree:function(rows,opts){
		function exists(rows, pid) {
			for (var i = 0; i < rows.length; i++) {
				if (rows[i].id == pid){
					return true;
				}
					
			}
			return false;
		}

		var nodes = [];
		// get the top level nodes
		for (var i = 0; i < rows.length; i++) {
			var row = rows[i];
			if (!exists(rows, row[opts.pid])) {
				nodes.push({
					id : row[opts.id],
					text : row[opts.text],
					children:[],
					attributes:row,
				});
			}
		}

		var toDo = [];
		for (var i = 0; i < nodes.length; i++) {
			toDo.push(nodes[i]);
		}

		while (toDo.length) {
			var node = toDo.shift(); // the parent node
			// get the children nodes
			for (var i = 0; i < rows.length; i++) {
				var row = rows[i];
				if (row[opts.pid] == node.id) {
					var child = {
							id : row[opts.id],
							text : row[opts.text],
							children:[],
							attributes:row
					};
					if (node.children) {
						node.children.push(child);
					} else {
						node.children = [ child ];
					}
					toDo.push(child);
				}
			}
		}

		return nodes;
	}	
}
