bc.namespace("bswf.generalOrder");
bswf.generalOrder.GarageCooperationForm = {
	init : function(option,readonly){
		var $form = $(this);
		
	},
	buildFormData : function(){
		$form = $(this);
		var $applyMattersTRs = $form.find("#applyMatters tr:gt(0)");
		var applyMatters = [];
		$applyMattersTRs.each(function(){
			$tr = $(this);
			var $divs = $tr.find("div");
			var $tds=$tr.find("td");
			var applyMatter = {
				id: $($tds[0]).text(),
				matter: $($divs[0]).html(),
				view: $($divs[1]).html()
			};
			applyMatters.push(applyMatter);
		});
		
		$form.find(":input[name='list_gc_applyMatters']").val($.toJSON(applyMatters));
		$form.find(":input[name='list_gc_applyMatters2local']").val($.toJSON(applyMatters));
	
	},
	
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		bswf.generalOrder.GarageCooperationForm.buildFormData.call(this);
		
		return true;
	}
};