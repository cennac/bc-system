bc.namespace("bswf.carManEntry");
bswf.carManEntry.unitManagerEntryTalkForm = {
	init : function(option,readonly){
		var $form = $(this);
		
	},
	
	buildFormData : function(){
		$page = $(this);
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.unitManagerEntryTalkForm.buildFormData.call(this);
		
		return true;
	}
};