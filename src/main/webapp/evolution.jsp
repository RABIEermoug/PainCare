<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pain track</title>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link rel="stylesheet" href="css/evolution.css">
  <link rel="stylesheet" href="css/cercle.css">
  <link rel="stylesheet" href="css/boutton_dans_evolution.css">
  
 <style>
    body {
      
      font-family: "DM Sans", sans-serif;
      margin: 0;
	 line-height: 1.5;
	 background-color:#f1f3fb;
	 padding: 0 2rem;
 }
    

    h1 {
      text-align: center;
      color: #fb6fb7;
    }

    #quizContainer {
      max-width: 800px;
      margin: 0 auto;
      background-color: #fbcae7;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 40px; /* Ajoute un espace de 20px à l'intérieur du formulaire */
      }

    /* Style du bouton Submit */
.button {
  padding: 10px 20px; /* Espacement interne */
  border: none; /* Supprime la bordure par défaut */
  border-radius: 4px; /* Coins arrondis */
  background-color: #FD6C9E; /* Couleur de fond */
  color: white; /* Couleur du texte */
  font-size: 16px; /* Taille de la police */
  cursor: pointer; /* Curseur pointer */
  transition: background-color 0.3s ease; /* Transition en douceur */
  margin-top: 20px;
}

/* Conteneur du bouton Submit */
.submitBtnContainer {
  text-align: center; /* Centre le contenu horizontalement */
  margin-top: 20px; /* Espacement en haut du bouton */
}

/* Changement de couleur au survol */
.button:hover {
  background-color: #FF88BB; /* Nouvelle couleur de fond au survol */
}



    p {
      margin-bottom: 10px;
    }

    /* Affichage initial de la première question */
    #question1 {
      display: block;
    }
input[type=range] {
  -webkit-appearance: none; /* Masque l'apparence native */
  width: 300px; /* Largeur de la barre de défilement */
  height: 10px; /* Hauteur de la barre de défilement */
  border-radius: 5px; /* Coins arrondis */
  background:#a5d0de; /* Couleur de fond de la barre de défilement */
  outline: none; /* Supprime le contour */
   }
input[type=range]::-webkit-slider-thumb {
  -webkit-appearance: none; /* Masque l'apparence native */
  width: 20px; /* Largeur du curseur */
  height: 20px; /* Hauteur du curseur */
  border-radius: 50%; /* Forme du curseur en cercle */
  background: #5ac3ff; /* Couleur du curseur */
  cursor: pointer; /* Curseur personnalisé */
   }

/* Style des cases à cocher */
input[type="checkbox"] {
  /* Masque les cases à cocher par défaut */
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  /* Utilise une taille personnalisée pour la case à cocher */
  width: 20px;
  height: 20px;
  /* Style de base de la case à cocher */
  border: 2px solid #ccc; /* Bordure */
  border-radius: 4px; /* Coins arrondis */
  outline: none; /* Supprime le contour */
  cursor: pointer; /* Curseur pointer */
  /* Ajoute de l'espace entre la case à cocher et le label */
  margin-right: 8px;
  vertical-align: middle;
}

/* Style des cases cochées */
input[type="checkbox"]:checked {
  background-color: #96c6f9; /* Couleur de fond lorsque cochée */
  border-color: #96c6f9; /* Couleur de la bordure lorsque cochée */
}

/* Style du curseur de la case cochée */
input[type="checkbox"]:checked::before {
  content: "\2714"; /* Symbole de coche Unicode */
  font-size: 14px;
  color: white; /* Couleur de la coche */
  text-align: center;
  line-height: 18px;
}

    /* Couleurs pour les niveaux de douleur */
.level-text.blue-text {
  color: black;
}

.level-text.yellow-text {
  color: rgb(255, 248, 0);
}

.level-text.orange-text {
  color: rgb(255, 128, 0);
}

.level-text.red-text {
  color: red;
}

.level-text.dark-red-text {
  color: rgb(232, 0, 0);
}

.center-elements {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}
    
</style>

</head>


<body>

<h1>Pain Track</h1>
<div id="quizContainer">
    <form id="track">
        
        <div>
            <label for="painLevel"><strong>Pain Severity:</strong></label>
            <div class="center-elements"> 
              <input type="range" min="1" max="10" value="5" class="slider" id="painLevel">
            
                <p>Pain level: <span id="painValue" class="level-text">5</span></p>
                <span id="painSeverity" class="level-text">Moderate</span>
            </div>

          </div>
          
        <div>
          <label for="painLocations"><br><strong>Pain Locations:</strong></label><br>
          <input type="checkbox" id="abdomen" name="painLocations" value="Abdomen">
          <label for="abdomen">Abdomen</label><br>
          <!-- Ajoutez les autres cases à cocher pour les emplacements de douleur ici -->
          <input type="checkbox" id="back" name="painLocations" value="Back">
          <label for="back">Back</label><br>
          <input type="checkbox" id="chest" name="painLocations" value="Chest">
          <label for="chest">Chest</label><br>
          <input type="checkbox" id="head" name="painLocations" value="Head">
          <label for="head">Head</label><br>
          <input type="checkbox" id="neck" name="painLocations" value="Neck">
          <label for="neck">Neck</label><br>
          <input type="checkbox" id="hips" name="painLocations" value="Hips">
          <label for="hips">Hips</label><br>
        </div>
        <div>
          <label for="symptoms"><br><strong>Symptoms:</strong></label><br>
          <!-- Ajoutez des cases à cocher pour les symptômes ici -->
          <input type="checkbox" id="cramps" name="symptoms" value="Cramps">
          <label for="cramps">Cramps</label><br>
          <input type="checkbox" id="tenderBreasts" name="symptoms" value="Tender Breasts">
          <label for="tenderBreasts">Tender Breasts</label><br>
          <!-- Ajoutez les autres cases à cocher pour les symptômes ici -->
          <input type="checkbox" id="headache" name="symptoms" value="Headache">
          <label for="headache">Headache</label><br>
          <input type="checkbox" id="acne" name="symptoms" value="Acne">
          <label for="acne">Acne</label><br>
          <input type="checkbox" id="fatigue" name="symptoms" value="Fatigue">
          <label for="fatigue">Fatigue</label><br>
          <input type="checkbox" id="bloating" name="symptoms" value="Bloating">
          <label for="bloating">Bloating</label><br>
          <input type="checkbox" id="craving" name="symptoms" value="Craving">
          <label for="craving">Craving</label><br>
        </div>
        <div>
          <label for="painWorsen"><br><strong>What Makes Pain Worse?</strong></label><br>
          <!-- Ajoutez des cases à cocher pour ce qui aggrave la douleur ici -->
          <input type="checkbox" id="lackOfSleep" name="painWorsen" value="Lack of Sleep">
          <label for="lackOfSleep">Lack of Sleep</label><br>
          <!-- Ajoutez les autres cases à cocher pour ce qui aggrave la douleur ici -->
          <input type="checkbox" id="sitting" name="painWorsen" value="Sitting">
          <label for="sitting">Sitting</label><br>
          <input type="checkbox" id="standing" name="painWorsen" value="Standing">
          <label for="standing">Standing</label><br>
          <input type="checkbox" id="stress" name="painWorsen" value="Stress">
          <label for="stress">Stress</label><br>
          <input type="checkbox" id="walking" name="painWorsen" value="Walking">
          <label for="walking">Walking</label><br>
          <input type="checkbox" id="exercise" name="painWorsen" value="Exercise">
          <label for="exercise">Exercise</label><br>
          <input type="checkbox" id="urination" name="painWorsen" value="Urination">
          <label for="urination">Urination</label><br>
        </div>
        <div>
          <label for="feelings"><br><strong>Feelings:</strong></label><br>
          <!-- Ajoutez des cases à cocher pour les sentiments ici -->
          <input type="checkbox" id="anxious" name="feelings" value="Anxious">
          <label for="anxious">Anxious</label><br>
          <!-- Ajoutez les autres cases à cocher pour les sentiments ici -->
          <input type="checkbox" id="depressed" name="feelings" value="Depressed">
          <label for="depressed">Depressed</label><br>
          <input type="checkbox" id="dizzy" name="feelings" value="Dizzy">
          <label for="dizzy">Dizzy</label><br>
          <input type="checkbox" id="vomiting" name="feelings" value="Vomiting">
          <label for="vomiting">Vomiting</label><br>
          <input type="checkbox" id="diarrhea" name="feelings" value="Diarrhea">
          <label for="diarrhea">Diarrhea</label><br>
        </div>
        <div class="submitBtnContainer">
         <input type="submit" class="button" value="Submit">
        </div>
    </form>
    
    <!-- Ajout de l'élément canvas pour le graphique -->
    <canvas id="painChart" width="800" height="400"></canvas>
    
    <br><br><br><br><br><br><br><br>
    <div class="cards" style="margin: 0 auto; margin-left: 150px; " >
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
    
    
</div>
<!-- ... Ajoutez ici les autres questions similaires jusqu'à la question 10 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js"></script>
<script src="script.js"></script>
<script>

 // Récupérer l'élément input et l'élément span
var slider = document.getElementById("painLevel");
var output = document.getElementById("painValue");

// Mettre à jour la valeur affichée lorsque le curseur est déplacé
slider.oninput = function() {
  output.innerHTML = this.value;
  
  // Afficher le niveau de douleur basé sur la valeur sélectionnée
  var painLevel = parseInt(this.value);
  var painSeverity = '';

  switch(painLevel) {
    case 1:
      painSeverity = 'None';
      break;
    case 2:
    case 3:
    case 4:
      painSeverity = 'Mild';
      break;
    case 5:
    case 6:
      painSeverity = 'Moderate';
      break;
    case 7:
    case 8:
    case 9:
      painSeverity = 'Severe';
      break;
    case 10:
      painSeverity = 'Worst pain possible!';
      break;
    default:
      painSeverity = '';
  }

  // Afficher le terme correspondant au niveau de douleur sélectionné
  document.getElementById("painSeverity").innerHTML = painSeverity;

   // Ajoutez des classes pour chaque niveau de douleur
   document.getElementById("painValue").className = "level-text"; // Réinitialiser les classes
    document.getElementById("painSeverity").className = "level-text"; // Réinitialiser les classes

    if (painSeverity === 'None') {
      document.getElementById("painSeverity").classList.add('blue-text');
    } else if (painSeverity === 'Mild') {
      document.getElementById("painSeverity").classList.add('yellow-text');
    } else if (painSeverity === 'Moderate') {
      document.getElementById("painSeverity").classList.add('orange-text');
    } else if (painSeverity === 'Severe') {
      document.getElementById("painSeverity").classList.add('red-text');
    } else if (painSeverity === 'Worst pain possible!') {
      document.getElementById("painSeverity").classList.add('dark-red-text');
    }
}
    // Récupérer l'élément formulaire
var form = document.getElementById('track');

// Récupérer les éléments pour le graphique
var ctx = document.getElementById('painChart').getContext('2d');
var myChart;

// Écouter l'événement submit du formulaire
form.addEventListener('submit', function(event) {
    event.preventDefault(); // Empêcher la soumission du formulaire par défaut

    // Récupérer la valeur de la douleur depuis le formulaire
    var painLevel = document.getElementById('painLevel').value;

    // Récupérer la date actuelle
    var currentDate = new Date().toLocaleDateString(); // Vous pouvez utiliser une autre méthode pour obtenir la date

    // Mettre à jour les données du graphique
    if (myChart) {
        // Ajouter la nouvelle date et le niveau de douleur au graphique existant
        myChart.data.labels.push(currentDate);
        myChart.data.datasets[0].data.push(painLevel);

        // Mettre à jour le graphique
        myChart.update();
    } else {
        // Créer le graphique s'il n'existe pas
        myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [currentDate], // Nouvelle liste pour les dates
                datasets: [{
                    label: 'Pain Evolution',
                    data: [painLevel], // Nouvelle liste pour les niveaux de douleur
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        suggestedMin: 0,
                        suggestedMax: 10
                    }
                }
            }
        });
    }

    
});


</script>

<!-- Canvas pour le graphique -->
<!-- Ajout de l'élément canvas pour le graphique -->

<div style="display:flex; width: 100%; justify-content: center;">
		
</div>
    <!-- Script pour créer le graphique -->
<script>
    
//Récupérer l'élément input et l'élément span
var slider = document.getElementById("painLevel");
var output = document.getElementById("painValue");

    
 // Afficher le niveau de douleur basé sur la valeur sélectionnée
    var painLevel = parseInt(this.value);
    var painSeverity = '';

    switch(painLevel) {
      case 1:
        painSeverity = 'None';
        break;
      case 2:
      case 3:
      case 4:
        painSeverity = 'Mild';
        break;
      case 5:
      case 6:
        painSeverity = 'Moderate';
        break;
      case 7:
      case 8:
      case 9:
        painSeverity = 'Severe';
        break;
      case 10:
        painSeverity = 'Worst pain possible!';
        break;
      default:
        painSeverity = '';
    }
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

<!-- ... Ajoutez ici les divs pour les autres questions (question 2 à question 10) -->

</body>
</html>
