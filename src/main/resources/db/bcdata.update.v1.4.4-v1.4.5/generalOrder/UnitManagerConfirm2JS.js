bc.namespace("bswf.generalOrder");
bswf.generalOrder.UnitManagerConfirmForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		//绑定下一步的处理方式事件
		$form.find(":input[name='umc_handing']").change(function(){
			switch($(this).val()){
				case "部门内部处理" :
					handing_hide($form.find("#departmentCooperation"));
					handing_hide($form.find("#operationSecurityCheck"));
					handing_hide($form.find("#inCharDeputyGeneralManagerCheck"));
					 break;
				case "送相关部门协办":
					handing_show($form.find("#departmentCooperation"));
					handing_hide($form.find("#operationSecurityCheck"));
					handing_hide($form.find("#inCharDeputyGeneralManagerCheck"));
					 break;
				case "送营安部审批":
					handing_hide($form.find("#departmentCooperation"));
					handing_show($form.find("#operationSecurityCheck"));
					handing_hide($form.find("#inCharDeputyGeneralManagerCheck"));
					 break;
				case "送分管副总审批":
					handing_hide($form.find("#departmentCooperation"));
					handing_hide($form.find("#operationSecurityCheck"));
					handing_show($form.find("#inCharDeputyGeneralManagerCheck"));
					 break;
				default: alert("other");
			}
		});
		
		//下一步处理方式自定义显示函数
		function handing_show($div){
			$div.show();
			//css:bswf-go-umc-ignore
			$ignore=$div.find(".bswf-go-umc-ignore");
			$ignore.each(function(){
				if($(this).hasClass("ignore")){
					$(this).removeClass("ignore");
				}
			});
			
			//css:bswf-go-umc-v-required
			$required=$div.find(".bswf-go-umc-v-required");
			$required.each(function(){
				if(!$(this).attr("data-validate")){
					$(this).attr("data-validate","required");
				}
			});
			
			//css:bswf-go-umc-flow
			$flow=$div.find(".bswf-go-umc-flow");
			$flow.each(function(){
					$(this).val(true);
			});
			
			//css:bswf-go-umc-ignore-boolean
			$boolean=$div.find(".bswf-go-umc-ignore-boolean");
			$boolean.each(function(){
				if($(this).hasClass("ignore")){
					$(this).removeClass("ignore");
				}
			});
		}
		//下一步处理方式自定义隐藏函数
		function handing_hide($div){
			$div.hide();
			
			//css:bswf-go-umc-ignore
			$ignore=$div.find(".bswf-go-umc-ignore");
			$ignore.each(function(){
				if(!$(this).hasClass("ignore")){
					$(this).addClass("ignore");
				}
				$(this).val('');
			});
			
			//css:bswf-go-umc-v-required
			$required=$div.find(".bswf-go-umc-v-required");
			$required.each(function(){
				if($(this).attr("data-validate")){
					$(this).removeAttr("data-validate");
				}
			});
			
			//css:bswf-go-umc-flow
			$flow=$div.find(".bswf-go-umc-flow");
			$flow.each(function(){
					$(this).val(false);
			});
			
			//css:bswf-go-umc-del-val
			$val=$div.find(".bswf-go-umc-del-val");
			$val.each(function(){
					$(this).val('');
			});
			
			//css:bswf-go-umc-global-boolean
			$boolean=$div.find(".bswf-go-umc-global-boolean");
			$boolean.each(function(){
				$(this).val(false);
			});
		}
		
		//委托送相关部门添加办理人事件
		$form.find("#departments").delegate(".bswf-go-umc-add","click",function(){
			$tr=$(this).closest("tr");
			bc.identity.selectUser({
				data:{status:0,history:true},
				onOk : function(user) {
					if(!$tr.hasClass("bswf-go-umc-dc-list"))
						$tr.addClass("bswf-go-umc-dc-list");
						
					$inputs=$tr.find(":input");
					$($inputs[0]).val(true);
					$($inputs[1]).val(user.account);
					$($inputs[2]).val(user.id);
					$($inputs[4]).val(user.name);
				}
			});
		});
		
		//委托送相关部门删除办理人事件
		$form.find("#departments").delegate(".bswf-go-umc-delete","click",function(){
			$tr=$(this).closest("tr");
			if($tr.hasClass("bswf-go-umc-dc-list"))
				$tr.removeClass("bswf-go-umc-dc-list");
				
			$inputs=$tr.find(":input");
			$($inputs[0]).val(false);
			$($inputs[1]).val('');
			$($inputs[2]).val('');
			$($inputs[4]).val('');
		});
		
		//绑定添加营安部办理人事件
		$form.find("#selectOperationSecurityOfficer").click(function(){
			bc.identity.selectUser({
				data:{status:0,history:true},
				onOk : function(user) {
					$form.find(":input[name='operationSecurityOfficerName']").val(user.name);
					$form.find(":input[name='operationSecurityOfficerName2local']").val(user.name);
					$form.find(":input[name='operationSecurityOfficerId']").val(user.id);
					$form.find(":input[name='operationSecurityOfficer']").val(user.account);
				}
			});
		});
		
		//绑定添加分管副总事件	
		$form.find("#selectInChargeDeputyGeneralManager").click(function(){
			bc.identity.selectUser({
				data:{status:0,history:true},
				onOk : function(user) {
					$form.find(":input[name='inChargeDeputyGeneralManagerName']").val(user.name);
					$form.find(":input[name='inChargeDeputyGeneralManagerName2local']").val(user.name);
					$form.find(":input[name='inChargeDeputyGeneralManagerId']").val(user.id);
					$form.find(":input[name='inChargeDeputyGeneralManager']").val(user.account);
				}
			});
		});
	},
	buildFormData : function(){
		$form = $(this);
		var $applyMattersTRs = $form.find("#applyMatters tr:gt(0)");
		var applyMatters = [];
		$applyMattersTRs.each(function(){
			$tr = $(this);
			var $divs = $tr.find("div");
			var $tds=$tr.find("td");
			var applyMatter = {
				id: $($tds[0]).text(),
				matter: $($divs[0]).html(),
				confirm: $($divs[1]).html()
			};
			applyMatters.push(applyMatter);
		});
		
		$form.find(":input[name='list_umc_applyMatters']").val($.toJSON(applyMatters));
		$form.find(":input[name='list_umc_applyMatters2local']").val($.toJSON(applyMatters));
	
		
		var umc_handing=$form.find(":input[name='umc_handing']:checked").val();
		$form.find(":input[name='umcHanding']").val(umc_handing);
		$form.find(":input[name='umcHanding2local']").val(umc_handing);
	
		if(umc_handing == "送相关部门协办"){
			var $departmentsTRs = $form.find("#departments tr:gt(0)");
			var departments = [];
			$departmentsTRs.each(function(){
				$tr = $(this);
				if($tr.hasClass("bswf-go-umc-dc-list")){
					var $inputs = $tr.find(":input");
					var $tds=$tr.find("td");
					var department = {
						department: $inputs[3].value,
						receiver: $inputs[1].value,
						receiverId: $inputs[2].value,
						receiverName: $inputs[4].value
					};
					departments.push(department);
				}
			});
			
			$form.find(":input[name='list_umc_departments']").val($.toJSON(departments));
			$form.find(":input[name='list_umc_departments2local']").val($.toJSON(departments));
			
		}
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		
		bswf.generalOrder.UnitManagerConfirmForm.buildFormData.call(this);
		
		var umc_handing=$form.find(":input[name='umc_handing']:checked").val();
		if(umc_handing == "送相关部门协办"){
			var departments='';
			$form.find(":input[name='list_umc_departments']").each(function(){
				departments=$(this).val();
			});
			if(departments.length < 3){
				bc.msg.alert("至少需要添加一个协办部门的协办人来处理！");
				return false;
			}
		}

		return true;
	}
};