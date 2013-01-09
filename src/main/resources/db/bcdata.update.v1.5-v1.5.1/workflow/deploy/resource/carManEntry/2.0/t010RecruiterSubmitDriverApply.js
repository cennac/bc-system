bc.namespace("bswf.carManEntry");
bswf.carManEntry.recruiterSubmitDriverApplyForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		//绑定反转内容信息区事件
		$form.delegate(".bcwf-carManEntry-reverse","click",function(){	
			$form.find(".bcwf-carManEntry-Groups").toggle("fast");
			$form.find(".bcwf-carManEntry-showGroups").toggle();
			$form.find(".bcwf-carManEntry-hiddenGroups").toggle();
		});
		
		//绑定展开事件
		$form.delegate(".bcwf-carManEntry-showGroups","click",function(){
			$(this).hide();
			$(this).closest(".bcwf-carManEntry-containers").find(".bcwf-carManEntry-Groups").show();
			$(this).closest( ".bcwf-carManEntry-containers").find(".bcwf-carManEntry-hiddenGroups").show();
		});
		
		//绑定隐藏事件
		$form.delegate(".bcwf-carManEntry-hiddenGroups","click",function(){
			$(this).hide();
			$(this).closest(".bcwf-carManEntry-containers").find(".bcwf-carManEntry-Groups").hide();
			$(this).closest(".bcwf-carManEntry-containers").find(".bcwf-carManEntry-showGroups").show();
		});
		
		//绑定车辆需求事件
		$form.find(":input[name='risNeed2Car']").change(function(){
			switch($(this).val()){
				case "true":
					$form.find(":input[name='need2CarPlate']").attr("data-validate","required");
					$form.find(".need2Car").show();
					 break;
				case "false":
					$form.find(".need2Car").hide();
					$form.find(":input[name='need2CarPlate']").val('');
					$form.find(":input[name='need2CarPlate']").removeAttr("data-validate");
					$form.find(":input[name='need2CarId']").val('');
					$form.find(":input[name='need2CarUnitCompanyId']").val('');
					 break;
				default: alert("other");
			}
		});
		
		//绑定车辆选择按钮
		$form.find("#selectCar").click(function(){
			bs.selectCar({
				status: '0',
				data:{multiple: false,loadLevel:'1'},
				onOk:function(car){
					$form.find(":input[name='need2CarPlate']").val(car.plate);
					$form.find(":input[name='need2CarId']").val(car.id);
					$form.find(":input[name='need2CarUnitCompanyId']").val(car.unitCompanyId);
				}
			});
		});
		
		//绑定成对报名事件
		$form.find(":input[name='risPairDriver']").change(function(){
			switch($(this).val()){
				case "true":
					$form.find(":input[name='pairDriverName']").attr("data-validate","required");
					$form.find(".pairDriver").show();
					 break;
				case "false":
					$form.find(".pairDriver").hide();
					$form.find(":input[name='pairDriverName']").val('');
					$form.find(":input[name='pairDriverName']").removeAttr("data-validate");
					$form.find(":input[name='pairDriverNameId']").val('');
					 break;
				default: alert("other");
			}
		});
		
		//绑定选择对班司机
		$form.find("#selectTempDriver").click(function(){
			bs.selectTempDriver({
				data:{multiple: false},
				onOk:function(json){
					$form.find(":input[name='pairDriverName']").val(json.name);
					$form.find(":input[name='pairDriverNameId']").val(json.id);
				}
			});
		});
		
	},
	
	buildFormData : function(){
		var $form = $(this);
		
		var rapplyAttr=$form.find(":input[name='rapplyAttr']:checked").val();
		$form.find(":input[name='applyAttr']").val(rapplyAttr);
		var name=$form.find(":input[name='name']").val();
		//根据申请属性修改主题
		if(rapplyAttr=="KeepOn"){
			$form.find(":input[name='subject']").val("司机留用审批（"+name+"）");
		}else{
			$form.find(":input[name='subject']").val("司机新入职审批（"+name+"）");
		}
		
		var risNeed2Car=$form.find(":input[name='risNeed2Car']:checked").val();
		$form.find(":input[name='isNeed2Car']").val(risNeed2Car);
		
		var risPairDriver=$form.find(":input[name='risPairDriver']:checked").val();
		$form.find(":input[name='isPairDriver']").val(risPairDriver);
		
		var risAddStayCheck=$form.find(":input[name='risAddStayCheck']:checked").val();
		$form.find(":input[name='isAddStayCheck']").val(risAddStayCheck);
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		var $form = $(this);

		$rapplyAttrs=$form.find(":input[name='rapplyAttr']");
		var checked=false;
		$rapplyAttrs.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});
		
		if(!checked){
			bc.msg.alert("请选择申请属性！");
			return false;
		}
		
		var $risNeed2Cars=$form.find(":input[name='risNeed2Car']");
		var checked=false;
		$risNeed2Cars.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择是否指定车辆！");
			return false;
		}
		
		var $risPairDrivers=$form.find(":input[name='risPairDriver']");
		var checked=false;
		$risPairDrivers.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择是否成对报名！");
			return false;
		}
		
		var $risAddStayChecks=$form.find(":input[name='risAddStayCheck']");
		var checked=false;
		$risAddStayChecks.each(function(){
			if($(this)[0].checked){
				checked=true;
			}
		});

		if(!checked){
			bc.msg.alert("请选择有无待查情况！");
			return false;
		}
		
		bswf.carManEntry.recruiterSubmitDriverApplyForm.buildFormData.call(this);
		
		return true;
	}
};