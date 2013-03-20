bc.namespace("bswf.carRetired.version4");
bswf.carRetired.version4.AssignCarForm = {
	init : function(option,readonly){
		var $form = $(this);
		
		//声明责任人li
		var liTpl = '<li class="horizontal  ui-widget-content ui-corner-all ui-state-highlight" data-id="{0}" data-name="{1}"'+
		' data-hidden="{2}"'+
		' style="position: relative;margin:0 2px;float: left;padding: 0;border-width: 0;">'+
		'<span class="text"><a href="#">{3}</a></span>'+
		'<span class="click2remove verticalMiddle ui-icon ui-icon-close" style="margin: -8px -2px;" title="点击移除"></span></li>';
		var $ul=$form.find(".chargerUl");
		
		function addCharger(charger){
			if(charger==null||charger=="")return;
			var name=charger.split(",")[0];
			var id=charger.split(",")[1];
			var $formated=$(liTpl.format(id,name,charger,name)).appendTo($ul);
			var $remove=$formated.find("span.click2remove");
			var $a=$formated.find("a");
			$remove.click(function(){
				$(this).parent().remove();
			});
			$a.click(function(){
				bc.page.newWin({
					url:bc.root+"/bc-business/carMan/open",
					data:{id:id},
					name:name,
					title:name,
					mid:"carMan::"+id
				});
			});
			
		}
		
		//加载车辆责任人信息
		if($form.find(":input[name='charger']").val()!=""){
			var strAry = $form.find(":input[name='charger']").val().split(";");
			for(var i=0;i<strAry.length;i++){
				addCharger(strAry[i]);
			}
		}
		
		//绑定选择车辆事件
		$form.find("#addCar").click(function() {
			bs.selectCar({
				status: '0',
				data:{multiple: false,loadLevel:'1'},
				onOk : function(car) {
					$form.find(":input[name='carId']").val(car.id);
					$form.find(":input[name='plate']").val(car.plate);
					$form.find(":input[name='plateNo']").val(car.plateNo);
					$form.find(":input[name='plateType']").val(car.plateType);
					$form.find(":input[name='unitCompany']").val(car.unitCompany);
					$form.find(":input[name='verifyUnitId']").val(car.unitCompanyId);
					$form.find(":input[name='motorcadeId']").val(car.motorcadeId);
					$form.find(":input[name='motorcadeName']").val(car.motorcadeName);
					$form.find(":input[name='factoryType']").val(car.factoryType);
					$form.find(":input[name='ccEndDate']").val(car.ccEndDate.substring(0,10));
					$form.find(":input[name='driverName']").val(car.driverName);
					$form.find(":input[name='driverFWZG']").val(car.driverFWZG);
					
					//删除责任人
					$form.find(".chargerUl>li").remove();
					if(car.charger&&car.charger!=""){
						var strAry = car.charger.split(";");
						for(var i=0;i<strAry.length;i++){
							addCharger(strAry[i]);
						}
					}
					$form.find(":input[name='subject']").val(car.plate+"交车处理"+"（"+car.unitCompany+"）");
				}
			})
		});
		
		$form.find(".selectCharger").click(function(){
			var $lis = $form.find(".chargerUl>li");
			bs.selectCarMan({
				onOk:function(charger){
					if($lis.filter("[data-id='" + charger.id + "']").size() > 0){
						logger.info("duplicate select: id=" + charger.id + ",name=" + charger.name);
					}else{
						addCharger(charger.name+","+charger.id);
					}
				}
			})
		});
	},
	buildFormData : function(){
		var $form = $(this);
		var charger="";
		var chargerName="";
		var $lis = $form.find(".chargerUl>li");
		$lis.each(function(index){
			if(index>0){
				charger+=";";
				chargerName+=",";
			}
			chargerName+=$(this).attr("data-name");
			charger+=$(this).attr("data-hidden");
		});
		$form.find(":input[name='charger']").val(charger);
		$form.find(":input[name='chargerName']").val(chargerName);
	},
	/** 表单验证方法 */
	validateForm: function(){
		if(!bc.validator.validate(this))
			return false;
		
		var $form = $(this);
		var $lis = $form.find(".chargerUl>li");
		if($lis.size()==0){
			bc.msg.alert("请选择责任人");
			return false;
		}
		
		bswf.carRetired.version4.AssignCarForm.buildFormData.call(this);
			
		return true;
	}
};