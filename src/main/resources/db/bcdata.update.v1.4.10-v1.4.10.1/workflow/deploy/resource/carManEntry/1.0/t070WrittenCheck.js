bc.namespace("bswf.carManEntry");
bswf.carManEntry.writtenCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		
	},
	
	buildFormData : function(){
		$form= $(this);
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.writtenCheckForm.buildFormData.call(this);
		
		return true;
	}
};