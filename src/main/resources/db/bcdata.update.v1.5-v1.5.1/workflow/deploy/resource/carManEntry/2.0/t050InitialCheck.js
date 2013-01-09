bc.namespace("bswf.carManEntry");
bswf.carManEntry.initialCheckForm = {
	init : function(option,readonly){

		
	},
	
	buildFormData : function(){
		var $form = $(this);
		var risPass=$form.find(":input[name='risPass']:checked").val();
		$form.find(":input[name='isPass']").val(risPass);
		$form.find(":input[name='isPass_lc']").val(risPass);
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		var $form = $(this);
		
		var $risPsses=$form.find(":input[name='risPass']");
		var checked=false;
		$risPsses.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请确定司机入职结果！");
			return false;
		}
		
		bswf.carManEntry.initialCheckForm.buildFormData.call(this);
		
		return true;
	}
};