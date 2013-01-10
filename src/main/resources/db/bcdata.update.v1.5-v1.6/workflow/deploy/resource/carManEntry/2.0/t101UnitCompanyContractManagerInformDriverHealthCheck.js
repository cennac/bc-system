bc.namespace("bswf.carManEntry");
bswf.carManEntry.unitCompanyContractManagerInformDriverHealthCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		$form.find(":input[name='risGiveUp']").change(function(){
			switch($(this).val()){
				case "false":
					$form.find("#giveUp4cause").hide();
					
					$form.find(":input[name='giveUp4cause']").removeAttr('data-validate');
					
					//清空信息
					$form.find(":input[name='giveUp4cause']").val("");
					$form.find(":input[name='giveUp4cause_lc']").val("");
					
					//添加ignore
					$form.find(":input[name='giveUp4cause']").addClass("ignore");
					$form.find(":input[name='giveUp4cause_lc']").addClass("ignore");
					
					break;
				case "true":
					$form.find("#giveUp4cause").show();
					
					//清空ignore
					$form.find(":input[name='giveUp4cause']").removeClass("ignore");
					$form.find(":input[name='giveUp4cause_lc']").removeClass("ignore");
					
					$form.find(":input[name='giveUp4cause']").attr('data-validate','required');
				
					break;
				default: alert("other");
			}
		});
	},
	
	buildFormData : function(){
		var $form = $(this);
		
		var risGiveUp=$form.find(":input[name='risGiveUp']:checked").val();
		$form.find(":input[name='isGiveUp']").val(risGiveUp);
		$form.find(":input[name='isGiveUp_lc']").val(risGiveUp);
		
		var cause=$form.find(":input[name='giveUp4cause']").val();
		$form.find(":input[name='giveUp4cause_lc']").val(cause);
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
			bc.msg.alert("请选择司机是否同意参加体检！");
			return false;
		}
		
		
		bswf.carManEntry.unitCompanyContractManagerInformDriverHealthCheckForm.buildFormData.call(this);
		
		return true;
	}
};