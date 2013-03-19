bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.t090OperationsCenterServiceGroupCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		var $form = $(this);
		var isComplete=$form.find(":input[name='isComplete']:checked").val();
		$form.find(":input[name='ocsergc_isComplete']").val(isComplete);
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		var $form = $(this);
			
		if($form.find(":input[name='isComplete']:checked").size() == 0){
			bc.msg.alert("请确定分公司是否已上交人车对应关系变更的相关信息！");
			return false;
		}	
		bswf.carRetired.version4.t090OperationsCenterServiceGroupCheckForm.buildFormData.call(this);
		return true;
	}
};