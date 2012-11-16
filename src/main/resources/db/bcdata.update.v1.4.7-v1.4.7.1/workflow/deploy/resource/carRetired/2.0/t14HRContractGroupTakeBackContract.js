bc.namespace("bswf.carRetired");
bswf.carRetired.HRContractGroupTakeBackContractForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		$form = $(this);
		$form.find(":input[name='hrcgtbc_isTakeBack']").val($form.find(":input[name='isTakeBack']:checked").val());
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		$form = $(this);
		
		if($form.find(":input[name='isTakeBack']:checked").size() == 0){
			bc.msg.alert("请确定车辆合同情况！");
			return false;
		}
		
		bswf.carRetired.HRContractGroupTakeBackContractForm.buildFormData.call(this);
			
		return true;
	}
};