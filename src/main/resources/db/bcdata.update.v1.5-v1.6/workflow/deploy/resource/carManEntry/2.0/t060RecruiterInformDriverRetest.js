bc.namespace("bswf.carManEntry");
bswf.carManEntry.recruiterInformDriverRetestForm = {
	init : function(option,readonly){
		var $form = $(this);

		//绑定司机参加复试事件
		$form.find(":input[name='risGiveUp']").change(function(){
			switch($(this).val()){
				case "false":
					$form.find("#testConfig").show();
					$form.find("#RetestHeadCheck").show();
					$form.find("#RetestArrange").show();
					$form.find("#giveUp4cause").hide();
					
					//添加必填
					$form.find(":input[name='RetestHead4Name']").attr('data-validate','required');
					$form.find(":input[name='interviewDate']").attr('data-validate','{"type":"date","required":true}');
					//删除必填
					$form.find(":input[name='giveUp4cause']").removeAttr('data-validate');
					
					//清空ignore
					var $testConfig=$form.find("#testConfig");
					var $inputs=$testConfig.find(":input:not(.bswf-carManEntry-ignore)")
					$inputs.each(function(){
						$(this).removeClass("ignore");
					});
					$form.find(":input[name='RetestHead']").removeClass("ignore");
					$form.find(":input[name='RetestHead4Id']").removeClass("ignore");
					$form.find(":input[name='RetestHead4Name']").removeClass("ignore");
					$form.find(":input[name='interviewDate']").removeClass("ignore");
					
					//清空信息
					$form.find(":input[name='giveUp4cause']").val("");
					$form.find(":input[name='giveUp4cause_lc']").val("");
					
					//添加ignore
					$form.find(":input[name='giveUp4cause']").addClass("ignore");
					$form.find(":input[name='giveUp4cause_lc']").addClass("ignore");
					
					break;
				case "true":
					$form.find("#testConfig").hide();
					$form.find("#RetestHeadCheck").hide();
					$form.find("#RetestArrange").hide();
					$form.find("#giveUp4cause").show();
					
					//清空ignore
					$form.find(":input[name='giveUp4cause']").removeClass("ignore");
					$form.find(":input[name='giveUp4cause_lc']").removeClass("ignore");
				
					//清空信息
					$form.find(":input[name='RetestHead']").val("");
					$form.find(":input[name='RetestHead4Id']").val("");
					$form.find(":input[name='RetestHead4Name']").val("");
					//删除必填
					$form.find(":input[name='RetestHead4Name']").removeAttr('data-validate');
					$form.find(":input[name='interviewDate']").removeAttr('data-validate');
					//添加必填
					$form.find(":input[name='giveUp4cause']").attr('data-validate','required');
					
					//添加ignore
					var $testConfig=$form.find("#testConfig");
					var $inputs=$testConfig.find(":input:not(.bswf-carManEntry-ignore)")
					$inputs.each(function(){
						$(this).addClass("ignore");
					});
					$form.find(":input[name='RetestHead']").addClass("ignore");
					$form.find(":input[name='RetestHead4Id']").addClass("ignore");
					$form.find(":input[name='RetestHead4Name']").addClass("ignore");
					$form.find(":input[name='interviewDate']").addClass("ignore");
					break;
				default: alert("other");
			}
		});
		
		
		
		//声明li
		var liTpl = '<li class="horizontal  ui-widget-content ui-corner-all ui-state-highlight" data-id="{0}"'+
		" data-hidden='{1}'"+
		' style="position: relative;margin:0 2px;float: left;padding: 0;border-width: 0;">'+
		'<span class="text">{2}</span>'+
		'<span class="click2remove verticalMiddle ui-icon ui-icon-close" style="margin: -8px -2px;" title={3}></span></li>';
		
		//绑定添加考官事件
		$form.delegate(".selectTransactor","click",function(){
				var $row = $(this).closest(".row");
				var $inputs = $row.find(":input");
				var $ul = $row.find("ul");
				var $lis = $ul.find("li");
				var selecteds="";
				$lis.each(function(i){
					selecteds+=(i > 0 ? "," : "") + ($(this).attr("data-id"));//
				});
				bc.identity.selectUser({
					multiple: true,//可多选
					status:'0',
					selecteds: selecteds,
					group:$inputs[0].value,
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
		
		//绑定选择复试组长事件
		$form.find("#selectRetestHead").click(function(){
			bc.identity.selectUser({
				history: true,
				status:'0',
				group:'CarManEntryRetestHead',
				onOk : function(user) {
					$form.find(":input[name='RetestHead']").val(user.account);
					$form.find(":input[name='RetestHead4Id']").val(user.id);
					$form.find(":input[name='RetestHead4Name']").val(user.name);
				}
			});
		});
		
		//绑定默认配置人员删除事件
		$form.find("span.click2remove").click(function(){
			$(this).parent().remove();
		});
	},
	
	buildFormData : function(){
		var $form = $(this);
		var risGiveUp=$form.find(":input[name='risGiveUp']:checked").val();
		$form.find(":input[name='isGiveUp']").val(risGiveUp);
		$form.find(":input[name='isGiveUp_lc']").val(risGiveUp);

		if(risGiveUp=="true"){
			var cause=$form.find(":input[name='giveUp4cause']").val();
			$form.find(":input[name='giveUp4cause_lc']").val(cause);
		}else{
			var $testConfig=$form.find("#testConfig");
		
			//笔试
			var $lis=$testConfig.find("tr:eq(1) li");
			var list4assignee=[];
			$lis.each(function(){
					var temp=$(this).attr("data-hidden");
					var obj_transactor=eval("("+temp+")");
					$form.find(":input[name='writtenTestFlow']").val(true);
					$form.find(":input[name='writtenTestExaminer']").val(obj_transactor.code);
					//实例变量
					var instance={
						assignee:obj_transactor.code,
						assigneeId:obj_transactor.id,
						assigneeName:obj_transactor.name
					}
					list4assignee.push(instance);
			});
			$form.find(":input[name='list_writtenCheck4assignee']").val($.toJSON(list4assignee));
			
			//面试
			var $lis=$testConfig.find("tr:eq(2) li");
			var list4assignee=[];
			$lis.each(function(index){
					var temp=$(this).attr("data-hidden");
					var obj_transactor=eval("("+temp+")");
					$form.find(":input[name='interviewFlow"+(index+1)+"']").val(true);
					$form.find(":input[name='interviewExaminer"+(index+1)+"']").val(obj_transactor.code);
					//实例变量
					var instance={
						assignee:obj_transactor.code,
						assigneeId:obj_transactor.id,
						assigneeName:obj_transactor.name
					}
					list4assignee.push(instance);
					$form.find(":input[name='list_interviewDriver4assignee']").val($.toJSON(list4assignee));
			});
			$form.find(":input[name='list_interviewDriver4assignee']").val($.toJSON(list4assignee));
			
			//路试
			var $lis=$testConfig.find("tr:eq(3) li");
			var list4assignee=[];
			$lis.each(function(){
					var temp=$(this).attr("data-hidden");
					var obj_transactor=eval("("+temp+")");
					$form.find(":input[name='roadTestFlow']").val(true);
					$form.find(":input[name='roadTestExaminer']").val(obj_transactor.code);
					//实例变量
					var instance={
						assignee:obj_transactor.code,
						assigneeId:obj_transactor.id,
						assigneeName:obj_transactor.name
					}
					list4assignee.push(instance);
			});
			$form.find(":input[name='list_drivingCheck4assignee']").val($.toJSON(list4assignee));
			
			var interviewDate=$form.find(":input[name='interviewDate']").val();
			var applyAttr=$form.find(":input[name='applyAttr']").val();
			var name=$form.find(":input[name='name']").val();
			var subject="";
			if(applyAttr=="KeepOn"){
				subject+="司机留用审批（"+name+interviewDate+")";
			}else{
				subject+="司机新入职审批（"+name+"，复试日期"+interviewDate+")";
			}
			$form.find(":input[name='subject']").val(subject);
		}
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		var $form = $(this);	
		var $risGiveUps=$form.find(":input[name='risGiveUp']");
		var checked=false;
		$risGiveUps.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择司机参加复试！");
			return false;
		}
		
		var risGiveUp=$form.find(":input[name='risGiveUp']:checked").val();
		
		if(risGiveUp=="false"){
			var $testConfig=$form.find("#testConfig");
			//申请属性
			var applyAttr=$form.find(":input[name='applyAttr']").val();
			
			//笔试提示
			var $lis=$testConfig.find("tr:eq(1) li");
			if($lis.size()==0&&applyAttr!="KeepOn"){
				bc.msg.alert("请选择笔试考官！");
				return false;
			}
			if($lis.size()>1){
				bc.msg.alert("笔试考官数量不能超过1个！");
				return false;
			}
			
			//面试提示
			var $lis=$testConfig.find("tr:eq(2) li");
			if($lis.size()==0){
				bc.msg.alert("请选择面试考官！");
				return false;
			}
			
			var $lis=$testConfig.find("tr:eq(2) li");
			if($lis.size()>5){
				bc.msg.alert("面考官数量不能超过5个！");
				return false;
			}
			
			//路试提示
			var $lis=$testConfig.find("tr:eq(3) li");
			if($lis.size()==0&&applyAttr!="KeepOn"){
				bc.msg.alert("请选择路试考官！");
				return false;
			}
			
			if($lis.size()>1){
				bc.msg.alert("路试考官数量不能超过1个！");
				return false;
			}
		}
		
		bswf.carManEntry.recruiterInformDriverRetestForm.buildFormData.call(this);
		
		return true;
	}
};