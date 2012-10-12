bc.namespace("bswf.generalOrder");
bswf.generalOrder.InChargeDeputyGeneralManagerCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		//绑定下一步的处理方式事件
		$form.find(":input[name='rhanding']").change(function(){
			switch($(this).val()){
				case "送部门经理落实执行" :
					handing_hide($form.find("#chairmanCheck"));
					$form.find(":input[name='is_mi_flow']").val(true);
					 break;
				case "送董事长审批":
					handing_show($form.find("#chairmanCheck"));
					$form.find(":input[name='is_mi_flow']").val(false);
					 break;
				default: alert("other");
			}
		});
		
		//下一步处理方式自定义显示函数
		function handing_show($div){
			$div.show();
			$inputs=$div.find(":input");
			$inputs.each(function(){
				if($(this).hasClass("ignore")){
					$(this).removeClass("ignore");
				}
			});
			
			if(!$($inputs[0]).attr("data-validate")){
				$($inputs[0]).attr("data-validate","required");
			}
		}
		//下一步处理方式自定义隐藏函数
		function handing_hide($div){
			$div.hide();

			$inputs=$div.find(":input");
			$inputs.each(function(){
				if(!$(this).hasClass("ignore")){
					$(this).addClass("ignore");
				}
				$(this).val('');
			});
			
			if($($inputs[0]).attr("data-validate")){
				$($inputs[0]).removeAttr("data-validate");
			}
		}
		
		//绑定添加分管副总事件	
		$form.find("#selectChairman").click(function(){
			bc.identity.selectUser({
				data:{status:0,history:true},
				onOk : function(user) {
					$form.find(":input[name='chairmanName']").val(user.name);
					$form.find(":input[name='chairman']").val(user.account);
					$form.find(":input[name='chairmanId']").val(user.id);
				}
			});
		});
	},
	buildFormData : function(){
		$form = $(this);
		var rhanding=$form.find(":input[name='rhanding']:checked").val();
		$form.find(":input[name='handing']").val(rhanding);
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.generalOrder.InChargeDeputyGeneralManagerCheckForm.buildFormData.call(this);
		
		return true;
	}
};