bc.namespace("bswf.carRetired");
bswf.carRetired.OperationsCenterVehicleManagerCheckForm = {
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
		$form = $(this);
		var isComplete=$form.find(":input[name='isComplete']:checked").val();
		$form.find(":input[name='ocvmc_isComplete']").val(isComplete);
		
		
		var length=$form.find(":input[name='isTouchMedia']:checked").length;
		$form.find(":input[name='ocvmc_isTouchMedia']").val(length>0?'true':'false');
		
		length=$form.find(":input[name='isCityTV']:checked").length;
		$form.find(":input[name='ocvmc_isCityTV']").val(length>0?'true':'false'); 
		
		length=$form.find(":input[name='isYCT213']:checked").length;
		$form.find(":input[name='ocvmc_isYCT213']").val(length>0?'true':'false');
		
		length=$form.find(":input[name='isYCT216']:checked").length;
		$form.find(":input[name='ocvmc_isYCT216']").val(length>0?'true':'false');

	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		$form = $(this);
			
		if($form.find(":input[name='isComplete']:checked").size() == 0){
			bc.msg.alert("请确定分公司是否已上交人车对应关系变更的相关信息！");
			return false;
		}	
		bswf.carRetired.OperationsCenterVehicleManagerCheckForm.buildFormData.call(this);
		return true;
	}
};