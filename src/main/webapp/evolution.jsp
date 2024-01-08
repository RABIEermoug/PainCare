<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Evolution of pain</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	
	<link rel="stylesheet" href="css/evolution.css">
	<link rel="stylesheet" href="css/boutton_dans_evolution.css">
    
</head>
<body>

<%
    // Display Level of Pain
    out.println("<p>Level of Pain: " + request.getAttribute("levelOfPain") + "</p>");
     
%>

<h3>Average of pain : </h3>

		<div id="container" style="width:70%; height:400px; margin-left:200px;"></div>

<br><br><br><br><br><br><br><br>


		<div id="live-poll-area">
		  <div class="graph-container">
		    <div class="graph"></div>
		  </div>
		  <div class="answer-list"></div>
		</div>
		
<br><br><br><br><br><br><br><br>

		<div class="cards">
		    <div class="card red">
			    <p class="tip">Symptoms</p>
			    <p class="second-text" style="color:black;">
				        <% 
				           String[] symptoms = (String[]) request.getAttribute("prefer");
				           if (symptoms != null) {
				               for (String sym : symptoms) {
				                   out.println(sym);
				                   out.println(" - " );
				               }
				           }
				        %>
                </p>
       </div>
		    
		    
		    
		    <div class="card blue">
		        <p class="tip">What makes the pain worse?</p>
		        <p class="second-text" style="color:black;">
				        <% 
				           String[] factorsWorseningPain = (String[]) request.getAttribute("work");
				           if (symptoms != null) {
				               for (String wo : factorsWorseningPain) {
				                   out.println(wo);
				                   out.println(" - " );
				               }
				           }
				        %>
                </p>
		    </div>
		    <div class="card green">
		        <p class="tip">Feelings</p>
		        <p class="second-text" style="color:black;">
				        <% 
				           String[] feelings = (String[]) request.getAttribute("size");
				           if (feelings != null) {
				               for (String feeling : feelings) {
				                   out.println(feeling);
				                   out.println(" - " );
				               }
				           }
				        %>
                </p>
		    </div>
		</div>

<script src="js/cercle.js"></script>

<script src="js/chart.js"></script>
</body>
</html>