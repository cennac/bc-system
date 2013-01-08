bc.namespace("bswf.carManEntry");
bswf.carManEntry.DepartmentCooperationForm = {
	init : function(option,readonly){
		var $form = $(this);
		
	},
	buildFormData : function(){
		
	
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.DepartmentCooperationForm.buildFormData.call(this);
		
		return true;
	}
};