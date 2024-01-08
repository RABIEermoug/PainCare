<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Process</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/suivi.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="testbox">
      <form action="Suivi" method="post">
      <div class="question">    
          <label><h3>Date : </h3></label>
          <div class="question-answer">
            <div>
              <input type="date" value="" id="checkbox_01" name="date_auj"/>
            </div>
          </div>
        </div>
      <div>
      <script></script>
      	<label for="pain">Pain Level : <span id="pain_label">None (0)</span></label>
		  <input type="range" name="level"  id="pain"  value="5" min="0" max="10" oninput="rangevalue.value=value"/>
		  <output id="rangevalue">5</output>
		  
		</div>
			
		<style>
		input,
output {
  display: inline-block;
  vertical-align: middle;
  font-size: 1em;
  font-family: Arial, sans-serif;
}

output {
  background: #ff4500;
  padding: 5px 16px;
  border-radius: 3px;
  color: #fff;
}

input[type="number"] {
  width: 40px;
  padding: 4px 5px;
  border: 1px solid #bbb;
  border-radius: 3px;
}

/* input[type="range"]:focus,
input[type="number"]:focus {
  box-shadow: 0 0 3px 1px #4b81dd;
  outline: none;
} */

input[type="range"] {
  -webkit-appearance: none;
  margin-right: 15px;
  width: 200px;
  height: 7px;
  background: rgba(255, 255, 255, 0.6);
  border-radius: 5px;
  background-image: linear-gradient(#ff4500, #ff4500);
  background-size: 70% 100%;
  background-repeat: no-repeat;
}

[dir="rtl"] input[type="range"] {
  background: #ff4500;
  background-image: linear-gradient(#fff, #fff);
  background-size: 30% 100%;
  background-repeat: no-repeat;
}

/* Input Thumb */
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background: #ff4500;
  cursor: ew-resize;
  box-shadow: 0 0 2px 0 #555;
  transition: background .3s ease-in-out;
}

input[type="range"]::-moz-range-thumb {
  -webkit-appearance: none;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background: #ff4500;
  cursor: ew-resize;
  box-shadow: 0 0 2px 0 #555;
  transition: background .3s ease-in-out;
}

input[type="range"]::-ms-thumb {
  -webkit-appearance: none;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background: #ff4500;
  cursor: ew-resize;
  box-shadow: 0 0 2px 0 #555;
  transition: background .3s ease-in-out;
}

input[type="range"]::-webkit-slider-thumb:hover {
  background: #ff0200;
}

input[type="range"]::-moz-range-thumb:hover {
  background: #ff0200;
}

input[type="range"]::-ms-thumb:hover {
  background: #ff0200;
}

/* Input Track */
input[type=range]::-webkit-slider-runnable-track  {
  -webkit-appearance: none;
  box-shadow: none;
  border: none;
  background: transparent;
}

input[type=range]::-moz-range-track {
  -webkit-appearance: none;
  box-shadow: none;
  border: none;
  background: transparent;
}

input[type="range"]::-ms-track {
  -webkit-appearance: none;
  box-shadow: none;
  border: none;
  background: transparent;
}
		</style>
		<script>
		const rangeInputs = document.querySelectorAll('input[type="range"]')
		const numberInput = document.querySelector('input[type="number"]')
		let isRTL = document.documentElement.dir === 'rtl'

		function handleInputChange(e) {
		  let target = e.target
		  if (e.target.type !== 'range') {
		    target = document.getElementById('range')
		  } 
		  const min = target.min
		  const max = target.max
		  const val = target.value
		  let percentage = (val - min) * 100 / (max - min)
		  if (isRTL) {
		    percentage = (max - val) 
		  }
		  
		  target.style.backgroundSize = percentage + '% 100%'
		}

		rangeInputs.forEach(input => {
		  input.addEventListener('input', handleInputChange)
		})

		numberInput.addEventListener('input', handleInputChange)

		// Handle element change, check for dir attribute value change
		function callback(mutationList, observer) {  mutationList.forEach(function(mutation) {
		    if (mutation.type === 'attributes' && mutation.attributeName === 'dir') {
		      isRTL = mutation.target.dir === 'rtl'
		    }
		  })
		}

		// Listen for body element change
		const observer = new MutationObserver(callback)
		observer.observe(document.documentElement, {attributes: true})
		</script>
      
      <input type="hidden" id="selectedPainLevel" name="levelOfPain" />
    	 
			<label><h3>Level of pain :</h3></label> <br><br><br>
			
			  <ul class="pain-scale">
			    <li class="pain-scale_level pain-scale_level--1" data-level="1">
			      <span class="pain-scale__number">1</span>
			      <span class="pain-scale__emoji"> 😎 </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--2" data-level="2">
			      <span class="pain-scale__number">2</span>
			      <span class="pain-scale__emoji"> 😉 </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--3" data-level="3">
			      <span class="pain-scale__number">3</span>
			      <span class="pain-scale__emoji"> 😃 </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--4" data-level="4">
			      <span class="pain-scale__number">4</span>
			      <span class="pain-scale__emoji"> 😊  </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--5" data-level="5">
			      <span class="pain-scale__number">5</span>
			      <span class="pain-scale__emoji"> 😱 </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--6" data-level="6">
			      <span class="pain-scale__number">6</span>
			      <span class="pain-scale__emoji"> 😐 </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--7" data-level="7">
			      <span class="pain-scale__number">7</span>
			      <span class="pain-scale__emoji"> ☹ </span>
			    </li>
			    <li class="pain-scale_level pain-scale_level--8" data-level="8">
			      <span class="pain-scale__number">8</span>
			      <span class="pain-scale__emoji"> 😞 </span>
			      
			    </li>
			    <li class="pain-scale_level pain-scale_level--9" data-level="9">
			      <span class="pain-scale__number">9</span>
			      <span class="pain-scale__emoji"> 😖 </span>
			      
			    </li>
			    <li class="pain-scale_level pain-scale_level--10" data-level="10">
			      <span class="pain-scale__number">10</span>
			      <span class="pain-scale__emoji"> 😭 </span>
			      
			    </li>
			  </ul>
			  <ul class="legend">
			    <li class="legend__beginning">Mild</li>
			    <li class="legend__end">Very severe</li>
			  </ul>
			  <br><br><br>
			  
		
        <div class="question">    
          <label><h3>Pain's location: </h3></label>
          
          <div class="question-answer">
          
            <div>
              <input type="checkbox" value="Abdomen" id="checkbox_01" name="strongest"/>
              <label for="checkbox_01" class="checkbox"><span>Abdomen</span></label>
            </div>
            <div>
              <input type="checkbox" value="Back" id="checkbox_02" name="strongest"/>
              <label for="checkbox_02" class="checkbox"><span>Back</span></label>
            </div>
            <div>
              <input type="checkbox" value="Chest" id="checkbox_03" name="strongest"/>
              <label for="checkbox_03" class="checkbox"><span>Chest</span></label>
            </div>
            <div>
              <input type="checkbox" value="Head" id="checkbox_04" name="strongest"/>
              <label for="checkbox_04" class="checkbox"><span>Head</span></label>
            </div>
            <div>
              <input type="checkbox" value="Neck" id="checkbox_05" name="strongest"/>
              <label for="checkbox_05" class="checkbox"><span>Neck</span></label>
            </div>
             <div>
              <input type="checkbox" value="Hips" id="checkbox_06" name="strongest"/>
              <label for="checkbox_06" class="checkbox"><span>Hips</span></label>
            </div>
          </div>
        </div>
        <div class="question">
          <label><h3>Symptoms:</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" value="Cramps" id="checkbox_07" name="prefer"/>
              <label for="checkbox_07" class="checkbox"><span>Cramps</span></label>
            </div>
            <div>
              <input type="checkbox" value="Tender breast" id="checkbox_08" name="prefer"/>
              <label for="checkbox_08" class="checkbox"><span>Tender breast</span></label>
            </div>
            <div>
              <input type="checkbox" value="Headache" id="checkbox_09" name="prefer"/>
              <label for="checkbox_09" class="checkbox"><span>Headache</span></label>
            </div>
             <div>
              <input type="checkbox" value="Acne" id="checkbox_10" name="prefer"/>
              <label for="checkbox_10" class="checkbox"><span>Acne</span></label>
            </div>
             <div>
              <input type="checkbox" value="Fatigue" id="checkbox_11" name="prefer"/>
              <label for="checkbox_11" class="checkbox"><span>Fatigue</span></label>
            </div>
             <div>
              <input type="checkbox" value="Bloating" id="checkbox_12" name="prefer"/>
              <label for="checkbox_12" class="checkbox"><span>Bloating</span></label>
            </div>
             <div>
              <input type="checkbox" value="Desire to eat" id="checkbox_13" name="prefer"/>
              <label for="checkbox_13" class="checkbox"><span>Desire to eat</span></label>
            </div>
          </div>
        </div>
        
        <div class="question">
          <label><h3>What makes the pain worse?</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" value="Lack of sleep" id="checkbox_14" name="work"/>
              <label for="checkbox_14" class="checkbox"><span>Lack of sleep</span></label>
            </div>
            <div>
              <input type="checkbox" value="Sitting" id="checkbox_15" name="work"/>
              <label for="checkbox_15" class="checkbox"><span>Sitting</span></label>
            </div>
            <div>
              <input type="checkbox" value="Standing" id="checkbox_16" name="work"/>
              <label for="checkbox_16" class="checkbox"><span>Standing</span></label>
            </div>
            <div>
              <input type="checkbox" value="Stress" id="checkbox_17" name="work"/>
              <label for="checkbox_17" class="checkbox"><span>Stress</span></label>
            </div>
            <div>
              <input type="checkbox" value="Walking" id="checkbox_18" name="work"/>
              <label for="checkbox_18" class="checkbox"><span>Walking</span></label>
            </div>
            <div>
              <input type="checkbox" value="Exercise" id="checkbox_19" name="work"/>
              <label for="checkbox_19" class="checkbox"><span>Exercise</span></label>
            </div>
            <div>
              <input type="checkbox" value="Urination" id="checkbox_20" name="work"/>
              <label for="checkbox_20" class="checkbox"><span>Urination</span></label>
            </div>
          </div>
        </div>
        <div class="question">
          <label><h3>Feelings :</h3></label>
          <div class="question-answer">
            <div>
              <input type="checkbox" value="Anxious" id="checkbox_21" name="size"/>
              <label for="checkbox_21" class="checkbox"><span>Anxious</span></label>
            </div>
            <div>
              <input type="checkbox" value="Depressed" id="checkbox_22" name="size"/>
              <label for="checkbox_22" class="checkbox"><span>Depressed</span></label>
            </div>
            <div>
              <input type="checkbox" value="Dizzy" id="checkbox_23" name="size"/>
              <label for="checkbox_23" class="checkbox"><span>Dizzy</span></label>
            </div>
            <div>
              <input type="checkbox" value="Vomiting" id="checkbox_24" name="size"/>
              <label for="checkbox_24" class="checkbox"><span>Vomiting</span></label>
            </div>
             <div>
              <input type="checkbox" value="Diarrhea" id="checkbox_25" name="size"/>
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
			    });</script>
    
  </body>
</html>