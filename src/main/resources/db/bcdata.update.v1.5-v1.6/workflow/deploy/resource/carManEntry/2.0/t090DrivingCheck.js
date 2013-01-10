bc.namespace("bswf.carManEntry");
bswf.carManEntry.drivingCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		$form.delegate(".bswf-carManEntry-check","change",function(){
			$inputs=$form.find("table tr:gt(0) :input");
			switch($(this).val()){
				case "1":
					$inputs.each(function(){
						$(this).val("通过");
					});
					break;
				case "2":
					$inputs.each(function(){
						$(this).val("不通过");
					});
					break;
				case "3":
					$inputs.each(function(){
						$(this).val("未参加");
					});
					break;
				default: "";
			}
			$(this).val("0");
		});
		
	},
	
	buildFormData : function(){
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.drivingCheckForm.buildFormData.call(this);
		
		return true;
	}
};