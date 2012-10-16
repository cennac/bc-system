bc.namespace("bswf.generalOrder");
bswf.generalOrder.InChargeDeputyGeneralManagerCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		//绑定下一步的处理方式事件
		$form.find(":input[name='rhanding']").change(function(){
			switch($(this).val()){
				case "送部门经理落实执行" :
					if(!$form.find(":input[name='chairman']").hasClass("ignore")){
						$form.find(":input[name='chairman']").addClass("ignore");
					}
					if(!$form.find(":input[name='is_ICDGMC_to_CC_flow']").hasClass("ignore")){
						$form.find(":input[name='is_ICDGMC_to_CC_flow']").addClass("ignore");
					}
					 break;
				case "送董事长审批":
					if($form.find(":input[name='chairman']").hasClass("ignore")){
					   $form.find(":input[name='chairman']").removeClass("ignore");
					}
					if($form.find(":input[name='is_ICDGMC_to_CC_flow']").hasClass("ignore")){
					   $form.find(":input[name='is_ICDGMC_to_CC_flow']").removeClass("ignore");
					}
					 break;
				default: alert("other");
			}
		});
		
	},
	buildFormData : function(){
		$form = $(this);
		var rhanding=$form.find(":input[name='rhanding']:checked").val();
		$form.find(":input[name='handing']").val(rhanding);
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
		
		bswf.generalOrder.InChargeDeputyGeneralManagerCheckForm.buildFormData.call(this);
		
		return true;
	}
};