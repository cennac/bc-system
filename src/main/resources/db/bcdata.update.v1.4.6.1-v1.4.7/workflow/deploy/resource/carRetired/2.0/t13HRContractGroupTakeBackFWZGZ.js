bc.namespace("bswf.carRetired");
bswf.carRetired.HRContractGroupTakeBackFWZGZForm = {
	init : function(option,readonly){
		var $form = $(this);
		var driverName=$form.find(":input[name='driverName']").val();
		var driverFWZG=$form.find(":input[name='driverFWZG']").val();
		var driverAndFWZG='';
				
		if(typeof(driverName)!="undefined" && typeof(driverFWZG)!="undefined" && driverName != '' && driverFWZG != ''){
			var dnArr=driverName.split(",");
			var dnFWZG=driverFWZG.split(",");
			if(dnArr.length==dnFWZG.length){
				for(var i=0;i<dnArr.length;i++){
					driverAndFWZG+=dnArr[i]+','+dnFWZG[i]+';';
				}
			}
		}
		
		if(driverAndFWZG!='')
			$form.find(":input[name='hrcgtbf_driverAndFZGZ']").val(driverAndFWZG);
	},
	buildFormData : function(){

	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		bswf.carRetired.HRContractGroupTakeBackFWZGZForm.buildFormData.call(this);
		return true;
	}
};