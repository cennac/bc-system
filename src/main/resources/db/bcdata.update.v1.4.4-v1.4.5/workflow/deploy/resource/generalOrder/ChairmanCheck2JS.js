bc.namespace("bswf.generalOrder");
bswf.generalOrder.ChairmanCheckForm = {
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
		
		bswf.generalOrder.ChairmanCheckForm.buildFormData.call(this);
		
		return true;
	}
};