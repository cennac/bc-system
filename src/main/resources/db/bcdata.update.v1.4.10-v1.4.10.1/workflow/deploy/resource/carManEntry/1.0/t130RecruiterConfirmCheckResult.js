bc.namespace("bswf.carManEntry");
bswf.carManEntry.recruiterConfirmCheckResultForm = {
	init : function(option,readonly){
		var $form = $(this);
		//绑定呈特批事件
		$form.find(":input[name='risCheck']:").change(function(){
			switch($(this).val()){
				case "false":
					$form.find(".bswf-carManEntry-recruiterConfirmCheckResult-pass").show();
					$form.find(":input[name='isPass_lc']").removeClass("ignore");
					$form.find(":input[name='isPass']").removeClass("ignore");
					
					$form.find("#viewLabel").show();
					$form.find("#viewLabelRequired").hide();
					$form.find(":input[name='view']").removeAttr("data-validate");
					break;
				case "true":
					$form.find(".bswf-carManEntry-recruiterConfirmCheckResult-pass").hide();
					$form.find(":input[name='isPass_lc']").addClass("ignore");
					$form.find(":input[name='isPass']").addClass("ignore");
					$form.find(":input[name='risPass']:checked").removeAttr("checked");
					
					$form.find(".bswf-carManEntry-recruiterConfirmCheckResult-fire").hide();
					$form.find(":input[name='executionType']").addClass("ignore");
					$form.find(":input[name='executionType']").val("");
					$form.find(":input[name='executionType']").removeAttr("data-validate");
					
					$form.find("#viewLabelRequired").show();
					$form.find("#viewLabel").hide();
					$form.find(":input[name='view']").attr("data-validate","required");
					
					break;
				default: alert("other");
			}
		});
		
		//绑定司机入职事件
		$form.find(":input[name='risPass']:").change(function(){
			switch($(this).val()){
				case "true":
					$form.find(".bswf-carManEntry-recruiterConfirmCheckResult-fire").show();
					$form.find(":input[name='executionType']").removeClass("ignore");
					$form.find(":input[name='executionType']").attr("data-validate","required");
					break;
				case "false":
					$form.find(".bswf-carManEntry-recruiterConfirmCheckResult-fire").hide();
					$form.find(":input[name='executionType']").addClass("ignore");
					$form.find(":input[name='executionType']").removeAttr("data-validate");
					$form.find(":input[name='executionType']").val("");
					break;
				default: alert("other");
			}
		});
		
	},
	buildFormData : function(){
		$form = $(this);
		var risCheck=$form.find(":input[name='risCheck']:checked").val();
		$form.find(":input[name='isCheck']").val(risCheck);
		$form.find(":input[name='isCheck_lc']").val(risCheck);
		
		if(risCheck=="false"){
			var risPass=$form.find(":input[name='risPass']:checked").val();
			$form.find(":input[name='isPass']").val(risPass);
			$form.find(":input[name='isPass_lc']").val(risPass);
		}
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		$form = $(this);
		$risChecks=$form.find(":input[name='risCheck']");
		var checked=false;
		$risChecks.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择是否送分管副总审批！");
			return false;
		}
		
		var risCheck=$form.find(":input[name='risCheck']:checked").val();
		if(risCheck=="false"){
			$risPsses=$form.find(":input[name='risPass']");
			checked=false;
			$risPsses.each(function(){
				if($(this)[0].checked){
					checked=true;
				}
			});

			if(!checked){
				bc.msg.alert("请选择是否通过司机入职！");
				return false;
			}
		}
		
		
		bswf.carManEntry.recruiterConfirmCheckResultForm.buildFormData.call(this);
		
		return true;
	}
};