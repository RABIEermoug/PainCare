<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Process</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/suivi.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="testbox">
      <form action="ProcessPainReport" method="post">
           <div class="question">    
          <label><h3>pain evolution: </h3></label>
              <div class="question-answer" style="padding: 10px;">
          		<div class="PB-range-slider-div">
					<input type="range" min="0" max="10" value="5" name="pain_level" class="PB-range-slider" id="myRange">
					   <span id="rangeValue">5</span>
					   <script>
					// Obtenez l'élément input et l'élément span
					   var rangeInput = document.getElementById("myRange");
					   var rangeValueElement = document.getElementById("rangeValue");

					   // Ajoutez un écouteur d'événements pour détecter les changements de valeur
					   rangeInput.addEventListener("input", function() {
					       // Mettez à jour le texte à côté du curseur avec la nouvelle valeur
					       rangeValueElement.textContent = rangeInput.value;
					   });

					   </script>
				</div>
          </div>
        </div>
				
				<style>
				.PB-range-slider {
  -webkit-appearance: none;
  width: 80%;
  height: 4px;
  border-radius: 5px;
  background: #D5DBE1;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.PB-range-slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: #000000;
  cursor: pointer;
  transition: 0.3s ease-in-out;
}

.PB-range-slider::-webkit-slider-thumb:hover {
  box-shadow: 0px 0px 0px 8px rgba(0, 0, 0, 0.16);
  transition: 0.3s ease-in-out;
}

.PB-range-slider::-moz-range-thumb {
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: #000000;
  cursor: pointer;
}

.PB-range-slider-div {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  padding: 1rem;
  border-radius: 6px;
  border: 1px solid #C6CACE;
  box-shadow: 0px 1px 2px 0px #1F1E241F;
}


				</style>
        <div class="question">    
          <label><h3>Pain's location: </h3></label>
          
          <div class="question-answer">
          
            <div>
              <input type="checkbox" name="pain_location" value="Abdomen" id="checkbox_01" name="strongest"/>
              <label for="checkbox_01" class="checkbox"><span>Abdomen</span></label>
            </div>
            <div>
              <input type="checkbox" name="pain_location"  value="Back" id="checkbox_02" name="strongest"/>
              <label for="checkbox_02" class="checkbox"><span>Back</span></label>
            </div>
            <div>
              <input type="checkbox" name="pain_location" value="Chest" id="checkbox_03" name="strongest"/>
              <label for="checkbox_03" class="checkbox"><span>Chest</span></label>
            </div>
            <div>
              <input type="checkbox" name="pain_location" value="Head" id="checkbox_04" name="strongest"/>
              <label for="checkbox_04" class="checkbox"><span>Head</span></label>
            </div>
            <div>
              <input type="checkbox" name="pain_location" value="Neck" id="checkbox_05" name="strongest"/>
              <label for="checkbox_05" class="checkbox"><span>Neck</span></label>
            </div>
             <div>
              <input type="checkbox" name="pain_location" value="Hips" id="checkbox_06" name="strongest"/>
              <label for="checkbox_06" class="checkbox"><span>Hips</span></label>
            </div>
          </div>
        </div>
        <div class="question">
          <label><h3>Symptoms:</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" name="symptoms" value="Cramps" id="checkbox_07" name="prefer"/>
              <label for="checkbox_07" class="checkbox"><span>Cramps</span></label>
            </div>
            <div>
              <input type="checkbox" name="symptoms" value="Tender breast" id="checkbox_08" name="prefer"/>
              <label for="checkbox_08" class="checkbox"><span>Tender breast</span></label>
            </div>
            <div>
              <input type="checkbox" name="symptoms" value="Headache" id="checkbox_09" name="prefer"/>
              <label for="checkbox_09" class="checkbox"><span>Headache</span></label>
            </div>
             <div>
              <input type="checkbox" name="symptoms" value="Acne" id="checkbox_10" name="prefer"/>
              <label for="checkbox_10" class="checkbox"><span>Acne</span></label>
            </div>
             <div>
              <input type="checkbox" name="symptoms" value="Fatigue" id="checkbox_11" name="prefer"/>
              <label for="checkbox_11" class="checkbox"><span>Fatigue</span></label>
            </div>
             <div>
              <input type="checkbox" name="symptoms" value="Bloating" id="checkbox_12" name="prefer"/>
              <label for="checkbox_12" class="checkbox"><span>Bloating</span></label>
            </div>
             <div>
              <input type="checkbox" name="symptoms" value="Desire to eat" id="checkbox_13" name="prefer"/>
              <label for="checkbox_13" class="checkbox"><span>Desire to eat</span></label>
            </div>
          </div>
        </div>
        
        <div class="question">
          <label><h3>What makes the pain worse?</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" name="worse_pain" value="Lack of sleep" id="checkbox_14" name="work"/>
              <label for="checkbox_14" class="checkbox"><span>Lack of sleep</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Sitting" id="checkbox_15" name="work"/>
              <label for="checkbox_15" class="checkbox"><span>Sitting</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Standing" id="checkbox_16" name="work"/>
              <label for="checkbox_16" class="checkbox"><span>Standing</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Stress" id="checkbox_17" name="work"/>
              <label for="checkbox_17" name="worse_pain" class="checkbox"><span>Stress</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Walking" id="checkbox_18" name="work"/>
              <label for="checkbox_18" class="checkbox"><span>Walking</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Exercise" id="checkbox_19" name="work"/>
              <label for="checkbox_19" class="checkbox"><span>Exercise</span></label>
            </div>
            <div>
              <input type="checkbox" name="worse_pain" value="Urination" id="checkbox_20" name="work"/>
              <label for="checkbox_20" class="checkbox"><span>Urination</span></label>
            </div>
          </div>
        </div>
        <div class="question">
          <label><h3>Feelings :</h3></label>
          <div class="question-answer">
            <div>
              <input type="checkbox" name="feelings" value="Anxious" id="checkbox_21" name="size"/>
              <label for="checkbox_21" class="checkbox"><span>Anxious</span></label>
            </div>
            <div>
              <input type="checkbox" name="feelings" value="Depressed" id="checkbox_22" name="size"/>
              <label for="checkbox_22" class="checkbox"><span>Depressed</span></label>
            </div>
            <div>
              <input type="checkbox" name="feelings" value="Dizzy" id="checkbox_23" name="size"/>
              <label for="checkbox_23" class="checkbox"><span>Dizzy</span></label>
            </div>
            <div>
              <input type="checkbox" name="feelings" value="Vomiting" id="checkbox_24" name="size"/>
              <label for="checkbox_24" class="checkbox"><span>Vomiting</span></label>
            </div>
             <div>
              <input type="checkbox" name="feelings" value="Diarrhea" id="checkbox_25" name="size"/>
              <label for="checkbox_25" class="checkbox"><span>Diarrhea</span></label>
            </div>
          </div>
        </div>
       
       
        <div class="btn-block">
          <button type="submit" >Send</button>
        </div>
      </form>
    </div>
    <script>$('.pain-scale__level').hover(function(){
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
    </script>
    
  </body>
</html>