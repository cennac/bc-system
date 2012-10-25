bc.namespace("bswf.generalOrder");
bswf.generalOrder.GeneralManagerGroupCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		//绑定下一步的处理方式事件
		$form.find(":input[name='rhanding']").change(function(){
			switch($(this).val()){
				case "送部门经理确认" :
					if(!$form.find(":input[name='is_GMGC_to_CC_flow']").hasClass("ignore")){
						$form.find(":input[name='is_GMGC_to_CC_flow']").addClass("ignore");
					}
					 break;
				case "送董事长审批":
					if($form.find(":input[name='is_GMGC_to_CC_flow']").hasClass("ignore")){
					   $form.find(":input[name='is_GMGC_to_CC_flow']").removeClass("ignore");
					}
					 break;
				default: alert("other");
			}
		});
		
		//查看审批意见
		$form.find(":input[name='rreading']").change(function(){
			switch($(this).val()){
				case "default" :
					handing_hide($form.find("#ReadUpperInforUsers4Id"));
					 break;
				case "custom":
					handing_show($form.find("#ReadUpperInforUsers4Id"));
					 break;
				default: alert("other");
			}
		});
		
		//下一步处理方式自定义显示函数
		function handing_show($div){
			$div.show();
			//css:bswf-generalOrder-ignore
			$ignore=$div.find(".bswf-generalOrder-ignore");
			$ignore.each(function(){
				if($(this).hasClass("ignore")){
					$(this).removeClass("ignore");
				}
			});
		}
		//下一步处理方式自定义隐藏函数
		function handing_hide($div){
			$div.hide();
			
			//css:bswf-generalOrder-ignore
			$ignore=$div.find(".bswf-generalOrder-ignore");
			$ignore.each(function(){
				if(!$(this).hasClass("ignore")){
					$(this).addClass("ignore");
				}
			});
			
			$lis=$div.find("li");
			$lis.remove();
		}
		
		//声明li
		var liTpl = '<li class="horizontal  ui-widget-content ui-corner-all ui-state-highlight" data-id="{0}"'+
		" data-hidden='{1}'"+
		' style="position: relative;margin:0 2px;float: left;padding: 0;border-width: 0;">'+
		'<span class="text">{2}</span>'+
		'<span class="click2remove verticalMiddle ui-icon ui-icon-close" style="margin: -8px -2px;" title={3}></span></li>';
		
		//绑定添加办理人和指定用户事件
		$form.delegate(".selectTransactor","click",function(){
				$row = $(this).closest(".row");
				$input = $row.find(":input");
				$ul = $row.find("ul");
				$lis = $ul.find("li");
				var selecteds="";
				$lis.each(function(i){
					selecteds+=(i > 0 ? "," : "") + ($(this).attr("data-id"));//
				});
				bc.identity.selectUser({
					multiple: true,//可多选
					status:'0',
					selecteds: selecteds,
					group:$input[1].value,
					onOk: function(users){
						$.each(users,function(i,user){
							if($lis.filter("[data-id='" + user.id + "']").size() > 0){//已存在
								logger.info("duplicate select: id=" + user.id + ",name=" + user.name);
							}else{//新添加的
								var data={
									id:user.id,
									code:user.account,
									name:user.name
								}
								$(liTpl.format(user.id,$.toJSON(data),user.name,'点击移除'))
								.appendTo($ul).find("span.click2remove")
								.click(function(){
									$(this).parent().remove();
								});
							}
						});
					}
				});
		});
	},
	buildFormData : function(){
		$form = $(this);
		var rhanding=$form.find(":input[name='rhanding']:checked").val();
		$form.find(":input[name='handing']").val(rhanding);
		
		var rreading=$form.find(":input[name='rreading']:checked").val();
		$form.find(":input[name='reading']").val(rreading);
		
		if(rreading=="custom"){
			$div=$form.find("#ReadUpperInforUsers4Id");	
			$lis=$div.find("ul>li");
			$inputs=$div.find(":input");
			//多实例集合变量
			var list_collection= [];
			$lis.each(function(){
				var temp=$(this).attr("data-hidden");
				obj_transactor=eval("("+temp+")");
				//实例变量
				var instance={
					code:obj_transactor.code,
					name:obj_transactor.name,
					id:obj_transactor.id
				}
				
				list_collection.push(instance);
			});
			$form.find(":input[name='list_readUpperInforUsers']").val($.toJSON(list_collection));
		}
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		$form = $(this);
		if(!bc.validator.validate(this))
			return false;

		$rhandings=$form.find(":input[name='rhanding']");
		var checked=false;
		$rhandings.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择下一步处理方式！");
			return false;
		}	
		
		if($form.find(":input[name='rreading']:checked").val()=="custom"){
			$div=$form.find("#ReadUpperInforUsers4Id");	
			$lis=$div.find("ul>li");
			if($lis.size()<1){
				bc.msg.alert("请添加指定用户！");
				return false;
			}
		}
		
		bswf.generalOrder.GeneralManagerGroupCheckForm.buildFormData.call(this);
		
		return true;
	}
};