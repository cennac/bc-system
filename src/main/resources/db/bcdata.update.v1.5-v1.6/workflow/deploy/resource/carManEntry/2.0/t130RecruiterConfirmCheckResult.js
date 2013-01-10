bc.namespace("bswf.carManEntry");
bswf.carManEntry.recruiterConfirmCheckResultForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		//绑定下一步的处理方式事件
		$form.find(":input[name='rhanding']").change(function(){
			switch($(this).val()){
				case "check":
					$form.find(":input[name='isCheck']").val(true);
					$form.find(":input[name='view']").attr("data-validate","required");
					handing_hide($form.find("#confirmResult"));
					 break;
				case "confirmResult":
					$form.find(":input[name='isCheck']").val(false);
					$form.find(":input[name='view']").removeAttr("data-validate");
					handing_show($form.find("#confirmResult"));
					 break;
				default: alert("other");
			}
		});
		
		//下一步处理方式自定义显示函数
		function handing_show($div){
			$div.show();
			//css:bswf-carManEntry-ignore
			var $ignore=$div.find(".bswf-carManEntry-ignore");
			$ignore.each(function(){
				if($(this).hasClass("ignore")){
					$(this).removeClass("ignore");
				}
			});
			
		}
		//下一步处理方式自定义隐藏函数
		function handing_hide($div){
			$div.hide();
			//css:bswf-carManEntry-ignore
			var $ignore=$div.find(".bswf-carManEntry-ignore");
			$ignore.each(function(){
				if(!$(this).hasClass("ignore")){
					$(this).addClass("ignore");
				}
			});
			
			//清除选中
			$div.find("input").removeAttr("checked");
		}
		
		//绑定司机入职事件
		$form.find(":input[name='risPass']:").change(function(){
			switch($(this).val()){
				case "true":
					handing_show($form.find("#fireProcess"));
					$form.find(":input[name='executionType']").attr("data-validate","required");
					break;
				case "false":
					handing_hide($form.find("#fireProcess"));
					$form.find(":input[name='executionType']").removeAttr("data-validate");
					break;
				default: alert("other");
			}
		});
	},
	buildFormData : function(){
		var $form = $(this);
		
		var isCheckFlag=$form.find(":input[name='isCheckFlag']").val();
			if(isCheckFlag=='false'){//未送分管副总时
			var rhanding=$form.find(":input[name='rhanding']:checked").val();
			$form.find(":input[name='handing']").val(rhanding);
	
			if(rhanding=="confirmResult"){
				var risPass=$form.find(":input[name='risPass']:checked").val();
				$form.find(":input[name='isPass']").val(risPass);
				$form.find(":input[name='isPass_lc']").val(risPass);
			}
		}
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
			
		var $form = $(this);
		var isCheckFlag=$form.find(":input[name='isCheckFlag']").val();
		
		if(isCheckFlag=='false'){//未送分管副总时
			var $rhandings=$form.find(":input[name='rhanding']");
			var checked=false;
			
			$rhandings.each(function(){
				if($(this)[0].checked){
					checked=true;
				}
			});

			if(!checked){
				bc.msg.alert("请选择下一步处理方式！");
				return false;
			}
			
			var rhanding=$form.find(":input[name='rhanding']:checked").val();
			
			if(rhanding=="confirmResult"){
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
			}
		}
		
		bswf.carManEntry.recruiterConfirmCheckResultForm.buildFormData.call(this);
		
		return true;
	}
};