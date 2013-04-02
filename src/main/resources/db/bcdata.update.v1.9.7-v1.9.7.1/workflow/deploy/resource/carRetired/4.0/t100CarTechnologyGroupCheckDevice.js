bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.CarTechnologyGroupCheckDeviceForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		$form.find(":input[name='isTouchMedia']").click(function(){
			if($form.find(":input[name='isTouchMedia']")[0].checked){
				$form.find(":input[name='isCityTV']")[0].checked=false;
			}
		});
		
		$form.find(":input[name='isCityTV']").click(function(){
			if($form.find(":input[name='isCityTV']")[0].checked){
				$form.find(":input[name='isTouchMedia']")[0].checked=false;
			}
		});
		
		$form.find(":input[name='isYCT213']").click(function(){
			if($form.find(":input[name='isYCT213']")[0].checked){
				$form.find(":input[name='isYCT216']")[0].checked=false;
			}
		});
		
		$form.find(":input[name='isYCT216']").click(function(){
			if($form.find(":input[name='isYCT216']")[0].checked){
				$form.find(":input[name='isYCT213']")[0].checked=false;
			}
		});
		
		
	},
	buildFormData : function(){
		var $form = $(this);

		var length=$form.find(":input[name='isTouchMedia']:checked").length;
		$form.find(":input[name='ctgcd_isTouchMedia']").val(length>0?'true':'false');
		
		length=$form.find(":input[name='isCityTV']:checked").length;
		$form.find(":input[name='ctgcd_isCityTV']").val(length>0?'true':'false'); 
		
		length=$form.find(":input[name='isYCT213']:checked").length;
		$form.find(":input[name='ctgcd_isYCT213']").val(length>0?'true':'false');
		
		length=$form.find(":input[name='isYCT216']:checked").length;
		$form.find(":input[name='ctgcd_isYCT216']").val(length>0?'true':'false');

	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		var $form = $(this);
			
		bswf.carRetired.version4.CarTechnologyGroupCheckDeviceForm.buildFormData.call(this);
		return true;
	}
};