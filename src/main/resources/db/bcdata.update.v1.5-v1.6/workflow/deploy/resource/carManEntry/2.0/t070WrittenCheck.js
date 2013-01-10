bc.namespace("bswf.carManEntry");
bswf.carManEntry.writtenCheckForm = {
	init : function(option,readonly){
		
		
	},
	
	buildFormData : function(){

		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.writtenCheckForm.buildFormData.call(this);
		
		return true;
	}
};