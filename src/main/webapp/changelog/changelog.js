jQuery(function($){
	$("span.cl-operate").click(function(){
		var $this = $(this);
		var $li = $this.closest("li");
		if($li.hasClass("cl-expand")){
			$this.text("∨");
		}else{
			$this.text("∧");
		}
		$li.toggleClass("cl-expand cl-collapse");
	});
});