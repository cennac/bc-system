bc.namespace("bswf.requestServiceCertificate.version2");
bswf.requestServiceCertificate.version2.financeCashierRefundNewCarDepositForm = {
	init : function(option,readonly){
		var $form = $(this);

	},
	
	buildFormData : function(){
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.requestServiceCertificate.version2.financeCashierRefundNewCarDepositForm.buildFormData.call(this);
		
		return true;
	}
};