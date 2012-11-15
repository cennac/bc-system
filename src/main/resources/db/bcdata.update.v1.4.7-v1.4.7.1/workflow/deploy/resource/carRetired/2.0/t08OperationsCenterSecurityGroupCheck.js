bc.namespace("bswf.carRetired");
bswf.carRetired.OperationsCenterSecurityGroupCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		$form = $(this);
		$form.find(":input[name='ocsgc_isDeal']").val($form.find(":input[name='isDeal']:checked").val());
		$form.find(":input[name='ocsgc_isDone']").val($form.find(":input[name='isDone']:checked").val());
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		$form = $(this);
			
		if($form.find(":input[name='isDeal']:checked").size() == 0){
			bc.msg.alert("请确定该车辆是否存在事故或交通违法未处理！");
			return false;
		}	
		
		if($form.find(":input[name='isDone']:checked").size() == 0){
			bc.msg.alert("请确定有关安全类别的BC黑名单录入情况！");
			return false;
		}	
		bswf.carRetired.OperationsCenterSecurityGroupCheckForm.buildFormData.call(this);
		return true;
	}
};