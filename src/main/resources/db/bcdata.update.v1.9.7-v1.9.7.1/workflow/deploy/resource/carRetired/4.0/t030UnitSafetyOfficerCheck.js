bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.UnitSafetyOfficerCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		var $form = $(this);
		$form.find(":input[name='usoc_isDeal']").val($form.find(":input[name='isDeal']:checked").val());
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		var $form = $(this);		
			
		if($form.find(":input[name='isDeal']:checked").size() == 0){
			bc.msg.alert("请确定交通事故是否处理完毕！");
			return false;
		}	
			
		bswf.carRetired.version4.UnitSafetyOfficerCheckForm.buildFormData.call(this);
		return true;
	}
};