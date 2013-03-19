bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.GarageTransactorCheckForm= {
	init : function(option,readonly){
		var $form = $(this);
		$form.find("select[name='gtc_yct_isDebt']").change(function(){
			var YCTisDebt=$form.find("select[name='gtc_yct_isDebt']").val();
			if(YCTisDebt == 'true'){
				$form.find(".gtcDebt").show();
			}else{
				$form.find(":input[name='gtc_yct_debtMoney']").val('');
				$form.find(".gtcDebt").hide();
			}
		});
	},
	buildFormData : function(){
		var $form = $(this);
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		var $form = $(this);		
			
		if($form.find(":input[name='gtc_yct_isDebt']").val() == 'true'
			&& ($form.find(":input[name='gtc_yct_debtMoney']").val() == ''
				|| $form.find(":input[name='gtc_yct_debtMoney']").val() == '0')){
			bc.msg.alert("羊城通欠费金额填写错误！");
			return false;
		}
			
			
		bswf.carRetired.version4.GarageTransactorCheckForm.buildFormData.call(this);
		return true;
	}
};