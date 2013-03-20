bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.UnitMotorcadeLeaderCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
	},
	buildFormData : function(){
		var $form = $(this);

		$form.find(":input[name='umlc_isDeal']").val($form.find(":input[name='isDeal']:checked").val());
		$form.find(":input[name='umlc_isZjs']").val($form.find(":input[name='isZjs']:checked").val());
		
		var count=$form.find(":input[name='umlc_invoiceAmount']").val();
		if(count>0){
			$form.find(":input[name='umlc_invoiceHave']").val(true);
		}else{
			$form.find(":input[name='umlc_invoiceHave']").val(false);
		}
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		var $form = $(this);
		
		if($form.find(":input[name='isDeal']:checked").size() == 0){
			bc.msg.alert("请确定服务投诉、营运违章、交通违法是否处理完毕！");
			return false;
		}

		if($form.find(":input[name='isZjs']:checked").size() == 0){
			bc.msg.alert("请确定是否租价审！");
			return false;
		}
		bswf.carRetired.version4.UnitMotorcadeLeaderCheckForm.buildFormData.call(this);
		return true;
	}
};
