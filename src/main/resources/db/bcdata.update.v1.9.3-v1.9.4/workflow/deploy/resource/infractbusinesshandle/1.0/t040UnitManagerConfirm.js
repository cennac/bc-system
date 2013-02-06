bc.namespace("bswf.infractBusinessInfo");
bswf.infractBusinessInfo.unitManagerConfirmForm = {
	init : function(option,readonly){
		var $form = $(this);
			
	},
	buildFormData : function(){
		var $form = $(this);
		var check=$form.find(":input[name='risReturn']:checked").val();
		$form.find(":input[name='isReturn']").val(check);
		$form.find(":input[name='isReturn_lc']").val(check);		
		$form.find(":input[name='completeTaskCodition']").val("t020MotorcadeLeaderCheck_s");
	},
	/** 表单验证方法 */
	validateForm: function($form,namespace,procinstId,taskId,callback){
		//先必填验证
		if(bc.validator.validate($form)){
			//选项验证
			if($form.find(":input[name='risReturn']:checked").size()>0){
				var task_code=$form.find(":input[name='task_code']").val();
				bc.flow.findGlobalValus({
					id:procinstId,
					globalKeys:"completeTaskCodition",
					onReturn:function(json){
						//具备完成此任务的条件
						if(json.completeTaskCodition==task_code){
							bswf.infractBusinessInfo.unitManagerConfirmForm.buildFormData.call($form);
							callback.call($form,true);
						}else{
							bc.msg.alert("服务督办员还没审核任务，不能完成此任务！");
						}
					}
				});
			}else{
				bc.msg.alert("请确认下一步相关操作！");
			}
		
		}
	}
	
};