bc.namespace("bswf.generalOrder");
bswf.generalOrder.OperationSecurityCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
	},
	buildFormData : function(){
		$form = $(this);
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.generalOrder.OperationSecurityCheckForm.buildFormData.call(this);
		
		return true;
	}
};