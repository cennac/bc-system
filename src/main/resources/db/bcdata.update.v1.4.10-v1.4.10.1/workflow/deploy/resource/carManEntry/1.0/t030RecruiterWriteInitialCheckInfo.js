bc.namespace("bswf.carManEntry");
bswf.carManEntry.recruiterWriteInitialCheckInfoForm = {
	init : function(option,readonly){
		var $form = $(this);
		$form.find(".pairDriver").hide();
		$form.find(".crimeRecodeDescTr").hide();
		
		//绑定是否成对报名事件
		$form.find(":input[name='isPair']").change(function(){
			var flag=$(this).val();
			if(flag == 'true'){
				$form.find(".pairDriver").show();
				$form.find(":input[name='pairDriverName']").attr("data-validate","required");
			}else{
				$form.find(".pairDriver").hide();
				$form.find(":input[name='pairDriverName']").removeAttr("data-validate");
			}
		});
		
		//绑定犯罪记录情况事件
		$form.find(":input[name='crimeRecode']").change(function(){
			var flag=$(this).val();
			if(flag == '有犯罪记录'){
				$form.find(":input[name='crimeRecodeDesc']").attr("data-validate","required");
				$form.find(".crimeRecodeDescTr").show();
			}else{
				$form.find(".crimeRecodeDescTr").hide();
				$form.find(":input[name='crimeRecodeDesc']").val('');
				$form.find(":input[name='crimeRecodeDesc']").removeAttr("data-validate");
			}
		});

		
	},
	
	buildFormData : function(){
		$page = $(this);
		
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.carManEntry.recruiterWriteInitialCheckInfoForm.buildFormData.call(this);
		
		return true;
	}
};