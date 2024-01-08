<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Evolution of pain</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

	<script src="js/cercle.js"></script>

	<link rel="stylesheet" href="css/evolution.css">
	<link rel="stylesheet" href="css/cercle.css">
	<link rel="stylesheet" href="css/boutton_dans_evolution.css">
   <!-- Inclure la bibliothèque Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>const percentageArray = [30.63, 26.25, 14.38, 28.75];
    const answerArray = ['Public transport', 'Car', 'Bicycle', 'Walking'];

    $.fn.createBarchart = function (optionvariables) {
      var chartContainer = $(this);
      var defaults = {
        'maxWidth': 244
      };
      var options = $.extend({}, defaults, optionvariables);
      var self = $(this),
          graphContainer = self.parent().find('.graph-container .graph'),
          barChart = $('<ul/>', { class: 'bar-chart' });
        
      barChart.appendTo(chartContainer);
        
      $.each(answerArray, function(index, value) {
        var chartAnswer = $('<li/>', { class: 'answer-' + index }),
            answerLabel = $('<span/>', { class: 'label', text: value }),
            percentageValue = percentageArray[index].toString(),
            answerPercentage = $('<span/>', { class: 'percentage', text: percentageValue.replace('.', ',') + '%' }),
            barTrack = $('<span/>', { class: 'bar-track' }),
            bar = $('<span />', { class: 'bar', style: 'width: ' + percentageValue + '%;' });
        
        chartAnswer.appendTo(barChart);
        answerLabel.appendTo(chartAnswer);
        answerPercentage.appendTo(chartAnswer);
        barTrack.appendTo(chartAnswer);
        bar.appendTo(barTrack);
      });
      
      barChart.chart(
    		{
    			graphContainer: graphContainer
    		}
    	);
    };

    $.fn.chart = function (optionvariables) {
      var chart = $(this);
      var defaults = {
        'canvasSize': 220,
        'graphContainer': $('.graph-container .graph')
      };
      var options = $.extend({}, defaults, optionvariables);
      
      return chart.each(function () {
        var listItem = chart.find('li'),
            listItems = listItem.length,
            canvas = document.createElement('canvas'),
            canvasWidth = options.canvasSize,
            canvasHeight = options.canvasSize,
            graphContainer = options.graphContainer,
            total = 0,
            totalPercentage = 0,
            data = [],
            newData = [],
            i = 0,
            startingAngle,
            arcSize,
            endingAngle;

        $.each(percentageArray, function(index, value) {
          newData.push(3.6 * value);
        });
        
        function sumTo(a, i) {
          var sum = 0;
          for (var j = 0; j < i; j++) {
            sum += a[j];
          }
          return sum - 90;
        }
        
        function degreesToRadians(degrees) {
          return ((degrees * Math.PI)/180);
        }
        
        canvas.setAttribute('width', canvasWidth);
        canvas.setAttribute('height', canvasHeight);
        canvas.setAttribute('id', 'chartCanvas');
        graphContainer.append(canvas);
        
        var cvs = document.getElementById('chartCanvas'),
            ctx = cvs.getContext('2d'),
            centerX = canvasWidth / 2,
            centerY = canvasHeight / 2,
            radius = canvasWidth / 2;
        
        ctx.clearRect(0, 0, canvasWidth, canvasHeight);
        
        listItem.each(function(e) {
          startingAngle = degreesToRadians(sumTo(newData, i));
          arcSize = degreesToRadians(newData[i]);
          endingAngle = startingAngle + arcSize;
          ctx.beginPath();
          ctx.moveTo(centerX, centerY);
          ctx.arc(centerX, centerY, radius, startingAngle, endingAngle, false);
          ctx.closePath();
          ctx.fillStyle = $(this).find('.bar').css('backgroundColor');
          ctx.fill();
          ctx.restore();
          i++;
        });
        
        ctx.beginPath();
        ctx.moveTo(centerX, centerY);
        ctx.arc(centerX, centerY, radius * .45, 0, 2 * Math.PI, false);
        ctx.closePath();
        ctx.fillStyle = $('body').css('backgroundColor');
        ctx.fill();
      });
    };

    $('#live-poll-area .answer-list').createBarchart();</script>
  
    
</head>
<body>



<!-- Canvas pour le graphique -->
    <canvas id="painChart"  ></canvas>

<div style="display:flex; width: 100%; justify-content: center;">
		<form id="painForm">
        <div class="question-container">
            <div class="question">
                <p><strong>On a scale from 0 to 10, with 0 being no pain and 10 being the worst pain imaginable, how would you rate your pain on an average day?</strong></p>
                <div style="display:flex; width: 100%; justify-content: center;" class="pain-severity-container">
                    <input type="range" id="painSeverity" min="0" max="10" step="1" name="painSeverity">
                    <output for="painSeverity" id="severityValue">No Pain</output>
                </div>
            </div>
        </div>
        <button type="button" onclick="submitPainForm()" style=" background-color: #ff69b4; 
        color: #fff; 
        padding: 10px 15px; 
        border: none; 
        border-radius: 4px; 
        cursor: pointer; 
        font-size: 16px; 
        display:flex; width: 30%; justify-content: center; margin-left:300px;
        ">Submit</button>
    </form>
</div>
    <!-- Script pour créer le graphique -->
    <script>
        // Données du graphique initial
        var painData = {
            labels: [],
            datasets: [{
                label: 'Pain Level',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                data: []
            }]
        };

        // Configuration du graphique
        var chartOptions = {
            scales: {
                y: {
                    beginAtZero: true,
                    max: 10
                }
            }
        };

        // Créer le graphique
        var ctx = document.getElementById('painChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: painData,
            options: chartOptions
        });

        // Fonction pour soumettre le formulaire de douleur et mettre à jour le graphique
        function submitPainForm() {
            const painSeverity = document.getElementById('painSeverity').value;

            // Ajouter une nouvelle valeur pour le jour suivant
            const nextDay = 'Day ' + (painData.labels.length + 1);
            painData.labels.push(nextDay);
            painData.datasets[0].data.push(parseInt(painSeverity));

            // Mettre à jour le graphique
            myChart.update();

            // Appeler la fonction pour mettre à jour le graphique avec les nouvelles données depuis la servlet
            updateChart();
        }

        // Fonction pour effectuer une requête asynchrone vers la servlet et mettre à jour le graphique
        async function updateChart() {
            try {
                const response = await fetch('/submitPainForm'); // Mettez le chemin correct vers votre servlet
                const newData = await response.json();

                // Mettre à jour le graphique avec les nouvelles données
                if (newData) {
                    painData.labels = newData.labels;
                    painData.datasets[0].data = newData.data;

                    if (window.myChart) {
                        window.myChart.data.labels = painData.labels;
                        window.myChart.data.datasets[0].data = painData.datasets[0].data;
                        window.myChart.update();
                    }
                }
            } catch (error) {
                console.error('Erreur lors de la récupération des données:', error);
            }
        }

        // Appeler la fonction pour mettre à jour le graphique au chargement de la page
        document.addEventListener('DOMContentLoaded', updateChart);
    </script>

        
<br>


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

<script>
    $(document).ready(function () {
        var initialData = [{
            x:new Date('<%= request.getAttribute("date") %>').getTime(),
            y:<%= request.getAttribute("levelOfPain") %>
        }];

        var myChart = Highcharts.chart('container', {
            chart: {
                type: 'line',
                zoomType: 'x',
                // ... (rest of your chart options)
            },
            title: {
                text: 'Level of Pain Over Time'
            },
            xAxis: {
                type: 'datetime',
                title: {
                    text: 'Date and Time'
                },
                labels: {
                    formatter: function () {
                        return Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.value);
                    }
                }
            },
            yAxis: {
                title: {
                    text: 'Pain Level'
                },
                min: 0,
                max: 10
            },
            series: [{
                type: 'area',
                name: 'Pain Level',
                data: initialData
            }],
            navigation: {
                buttonOptions: {
                    enabled: false
                }
            }
        });

        window.myChart = myChart;
    });

    
    
</script>
</body>
</html>
**