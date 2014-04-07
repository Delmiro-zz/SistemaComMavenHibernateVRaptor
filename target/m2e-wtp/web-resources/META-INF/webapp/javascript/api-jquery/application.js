$(function() {
	$.datepicker.setDefaults( $.datepicker.regional[ "pt-BR" ] );
//	$("input[type=text]").change(function(event){
//		this.value = this.value.toLocaleUpperCase();
//	});
	
	$.validator.setDefaults({
		errorPlacement: function(error, element) {
			var parent = element.parent()
								.parent();
      
			error.appendTo($("<span></span").addClass("help-inline")
											.appendTo($(parent).children()
															   .first()
                                           			 )	
      					  );
		},
		errorElement: "span",
		highlight:function (element, errorClass, validClass){
			$($(element).parent()).parent().addClass(errorClass);
		},
		unhighlight:function (element, errorClass, validClass){
			$($(element).parent()).parent().removeClass(errorClass);
		}
	});
	
	$("form").validate();
});