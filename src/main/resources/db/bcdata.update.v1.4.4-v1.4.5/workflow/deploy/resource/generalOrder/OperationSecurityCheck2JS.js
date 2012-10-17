bc.namespace("bswf.generalOrder");
bswf.generalOrder.OperationSecurityCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		//绑定下一步的处理方式事件
		$form.find(":input[name='rhanding']").change(function(){
			switch($(this).val()){
				case "送部门经理落实执行" :
					handing_hide($form.find("#inCharDeputyGeneralManagerCheck"));
					if(!$form.find(":input[name='is_OSC_to_ICDGMC_flow']").hasClass("ignore")){
						$form.find(":input[name='is_OSC_to_ICDGMC_flow']").addClass("ignore");
					}
					 break;
				case "送总经理组审批":
					handing_show($form.find("#inCharDeputyGeneralManagerCheck"));
					if($form.find(":input[name='is_OSC_to_ICDGMC_flow']").hasClass("ignore")){
					   $form.find(":input[name='is_OSC_to_ICDGMC_flow']").removeClass("ignore");
					}
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
		
		//绑定添加办理人事件
		$form.delegate(".selectTransactor","click",function(){
				$row = $(this).closest(".row");
				$ul = $row.find("ul");
				$lis = $ul.find("li");
				var selecteds="";
				$lis.each(function(i){
					selecteds+=(i > 0 ? "," : "") + ($(this).attr("data-id"));//
				});
				bc.identity.selectUser({
					multiple: true,//可多选
					history: true,
					status:0,
					selecteds: selecteds,
					group:'zongjingli',
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
		
		if(rhanding=="送总经理组审批"){
			$div=$form.find("#inCharDeputyGeneralManagerCheck");	
			$lis=$div.find("ul>li");
			$inputs=$div.find(":input");
			//多实例集合变量
			var list_departmentAndAssignee = [];
			$lis.each(function(){
				var temp=$(this).attr("data-hidden");
				obj_transactor=eval("("+temp+")");
				//实例变量
				var instance={
					assignee:obj_transactor.code,
					assigneeName:obj_transactor.name,
					assigneeId:obj_transactor.id
				}
				
				list_departmentAndAssignee.push(instance);
			});
			$form.find(":input[name='list_icdgmc4assignee']").val($.toJSON(list_departmentAndAssignee));
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

		if($form.find(":input[name='rhanding']:checked").val()=="送总经理组审批"){
			$div=$form.find("#inCharDeputyGeneralManagerCheck");	
			$lis=$div.find("ul>li");
			if($lis.size()<1){
				bc.msg.alert("请添加总经理！");
				return false;
			}
		}	
			
		
		bswf.generalOrder.OperationSecurityCheckForm.buildFormData.call(this);
		
		return true;
	}
};