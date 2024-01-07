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
      <form action="SuiviServlet" method="post">
      <input type="hidden" id="selectedPainLevel" name="levelOfPain" />
    	 
			<label><h3>Level of pain</h3></label> <br><br><br>
			
			  <ul class="pain-scale">
			    <li class="pain-scale__level pain-scale__level--1" data-level="1">
			      <span class="pain-scale__number">1</span>
			      <span class="pain-scale__emoji"> 😎 </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--2" data-level="2">
			      <span class="pain-scale__number">2</span>
			      <span class="pain-scale__emoji"> 😉 </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--3" data-level="3">
			      <span class="pain-scale__number">3</span>
			      <span class="pain-scale__emoji"> 😃 </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--4" data-level="4">
			      <span class="pain-scale__number">4</span>
			      <span class="pain-scale__emoji"> 😊  </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--5" data-level="5">
			      <span class="pain-scale__number">5</span>
			      <span class="pain-scale__emoji"> 😱 </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--6" data-level="6">
			      <span class="pain-scale__number">6</span>
			      <span class="pain-scale__emoji"> 😐 </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--7" data-level="7">
			      <span class="pain-scale__number">7</span>
			      <span class="pain-scale__emoji"> ☹️ </span>
			    </li>
			    <li class="pain-scale__level pain-scale__level--8" data-level="8">
			      <span class="pain-scale__number">8</span>
			      <span class="pain-scale__emoji"> 😞 </span>
			      
			    </li>
			    <li class="pain-scale__level pain-scale__level--9" data-level="9">
			      <span class="pain-scale__number">9</span>
			      <span class="pain-scale__emoji"> 😖 </span>
			      
			    </li>
			    <li class="pain-scale__level pain-scale__level--10" data-level="10">
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
              <input type="checkbox" value="none" id="checkbox_02" name="strongest"/>
              <label for="checkbox_02" class="checkbox"><span>Back</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_03" name="strongest"/>
              <label for="checkbox_03" class="checkbox"><span>Chest</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_04" name="strongest"/>
              <label for="checkbox_04" class="checkbox"><span>Head</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_05" name="strongest"/>
              <label for="checkbox_05" class="checkbox"><span>Neck</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_06" name="strongest"/>
              <label for="checkbox_06" class="checkbox"><span>Hips</span></label>
            </div>
          </div>
        </div>
        <div class="question">
          <label><h3>Symptoms:</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" value="none" id="checkbox_07" name="prefer"/>
              <label for="checkbox_07" class="checkbox"><span>Cramps</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_08" name="prefer"/>
              <label for="checkbox_08" class="checkbox"><span>Tender breast</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_09" name="prefer"/>
              <label for="checkbox_09" class="checkbox"><span>Headache</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_10" name="prefer"/>
              <label for="checkbox_10" class="checkbox"><span>Acne</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_11" name="prefer"/>
              <label for="checkbox_11" class="checkbox"><span>Fatigue</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_12" name="prefer"/>
              <label for="checkbox_12" class="checkbox"><span>Bloating</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_13" name="prefer"/>
              <label for="checkbox_13" class="checkbox"><span>Desire to eat</span></label>
            </div>
          </div>
        </div>
        
        <div class="question">
          <label><h3>What makes the pain worse?</h3></label> 
          <div class="question-answer">
            <div>
              <input type="checkbox" value="none" id="checkbox_14" name="work"/>
              <label for="checkbox_14" class="checkbox"><span>Lack of sleep</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_15" name="work"/>
              <label for="checkbox_15" class="checkbox"><span>Sitting</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_016" name="work"/>
              <label for="checkbox_16" class="checkbox"><span>Standing</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_17" name="work"/>
              <label for="checkbox_17" class="checkbox"><span>Stress</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_18" name="work"/>
              <label for="checkbox_18" class="checkbox"><span>Walking</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_19" name="work"/>
              <label for="checkbox_19" class="checkbox"><span>Exercise</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_20" name="work"/>
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
              <input type="checkbox" value="none" id="checkbox_22" name="size"/>
              <label for="checkbox_22" class="checkbox"><span>Depressed</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_23" name="size"/>
              <label for="checkbox_23" class="checkbox"><span>Dizzy</span></label>
            </div>
            <div>
              <input type="checkbox" value="none" id="checkbox_24" name="size"/>
              <label for="checkbox_24" class="checkbox"><span>Vomiting</span></label>
            </div>
             <div>
              <input type="checkbox" value="none" id="checkbox_25" name="size"/>
              <label for="checkbox_25" class="checkbox"><span>Diarrhea</span></label>
            </div>
          </div>
        </div>
       
       
        <div class="btn-block">
          <button type="submit" >Send</button>
        </div>
      </form>
    </div>
    
    <script type="text/javascript">
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
				    .removeClass("pain-scale__level--selected pain-scale__level--active-emoji");
				  $(this)
				    .addClass(
				      "pain-scale__level--selected pain-scale__level--active-emoji pain-scale__level--blink"
				    )
				    .one(
				      "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",
				      function () {
				        $(this).removeClass("pain-scale__level--blink");
				      }
				    );
				  $(this)
				    .prevAll()
				    .addClass("pain-scale__level--selected pain-scale__level--blink")
				    .one(
				      "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",
				      function () {
				        $(this).removeClass("pain-scale__level--blink");
				      }
				    );
				});

       </script>
    
  </body>
</html>