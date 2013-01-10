bc.namespace("bswf.carManEntry");
bswf.carManEntry.chairmanCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
	},
	
	buildFormData : function(){
		$form = $(this);
		var pass=$form.find(":input[name='isPass']").val();
		$form.find(":input[name='isPass_lc']").val(pass);
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.chairmanCheckForm.buildFormData.call(this);
		
		return true;
	}
};