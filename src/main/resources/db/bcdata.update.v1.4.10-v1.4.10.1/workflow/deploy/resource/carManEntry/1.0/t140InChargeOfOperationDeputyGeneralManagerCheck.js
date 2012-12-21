bc.namespace("bswf.carManEntry");
bswf.carManEntry.inChargeOfOperationDeputyGeneralManagerCheckForm = {
	init : function(option,readonly){
		$form = $(this);
	},
	
	buildFormData : function(){
		$form = $(this);
		var risChairmanCheck=$form.find(":input[name='risChairmanCheck']:checked").val();
		$form.find(":input[name='isChairmanCheck']").val(risChairmanCheck);
		$form.find(":input[name='isChairmanCheck_lc']").val(risChairmanCheck);
		
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		$form = $(this);
		$risChairmanChecks=$form.find(":input[name='risChairmanCheck']");
		var checked=false;
		$risChairmanChecks.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择是否送董事长审批！");
			return false;
		}
		
		bswf.carManEntry.inChargeOfOperationDeputyGeneralManagerCheckForm.buildFormData.call(this);
		
		return true;
	}
};