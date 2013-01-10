bc.namespace("bswf.carManEntry");
bswf.carManEntry.retestHeadCheckForm = {
	init : function(option,readonly){
		var $form = $(this);
		
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
			bc.msg.alert("请确定复试审批结果！");
			return false;
		}
		
		bswf.carManEntry.retestHeadCheckForm.buildFormData.call(this);
		
		return true;
	}
};