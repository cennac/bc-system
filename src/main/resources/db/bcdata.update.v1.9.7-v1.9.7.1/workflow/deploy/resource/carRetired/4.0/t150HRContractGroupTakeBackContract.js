bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.HRContractGroupTakeBackContractForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		var $form = $(this);
		$form.find(":input[name='hrcgtbc_isTakeBack']").val($form.find(":input[name='isTakeBack']:checked").val());
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		var $form = $(this);
		
		if($form.find(":input[name='isTakeBack']:checked").size() == 0){
			bc.msg.alert("请确定车辆合同情况！");
			return false;
		}
		
		bswf.carRetired.version4.HRContractGroupTakeBackContractForm.buildFormData.call(this);
			
		return true;
	}
};