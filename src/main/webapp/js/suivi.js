$(".pain-scale__level").hover(
			  function () {
				    $(this)
				      .addClass("pain-scale__level--active")
				      .prevAll()
				      .addClass("pain-scale__level--active");
				  },
				  function () {
				    $(this)
				      .removeClass("pain-scale__level--active")
				      .prevAll()
				      .removeClass("pain-scale__level--active");
				  }
				);
		
				$(".pain-scale__level").click(function () {
					 var selectedLevel = $(this).data("level");
					 $("#selectedPainLevel").val(selectedLevel);
				  $(this)
				    .siblings()
				    .removeClass("pain-scale_level--selected pain-scale_level--active-emoji");
				  $(this)
				    .addClass(
				      "pain-scale_level--selected pain-scalelevel--active-emoji pain-scale_level--blink"
				    )
				    .one(
				      "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",
				      function () {
				        $(this).removeClass("pain-scale__level--blink");
				      }
				    );
				  $(this)
				    .prevAll()
				    .addClass("pain-scale_level--selected pain-scale_level--blink")
				    .one(
				      "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",
				      function () {
				        $(this).removeClass("pain-scale__level--blink");
				      }
				    );
				});
				
				$('.pain-scale__level').hover(function(){
    	  $(this).addClass( "pain-scale_level--active").prevAll().addClass( "pain-scale_level--active");
    }, function(){
      $(this).removeClass( "pain-scale_level--active").prevAll().removeClass( "pain-scale_level--active");
    });

    $('.pain-scale__level').click(function(){
      $(this).siblings().removeClass("pain-scale_level--selected pain-scale_level--active-emoji");
      $(this).addClass( "pain-scale_level--selected pain-scalelevel--active-emoji pain-scale_level--blink").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function(){
        $(this).removeClass( "pain-scale__level--blink" );
      });
      $(this).prevAll().addClass( "pain-scale_level--selected pain-scale_level--blink").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function(){
        $(this).removeClass( "pain-scale__level--blink" );
      });
    });