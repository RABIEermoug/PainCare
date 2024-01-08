$(function () { 
    var myChart = Highcharts.chart('container', {
        chart: {
          type: 'areaspline',
          zoomType: 'x',
           resetZoomButton: {
              position: {
                  x: -70,
                  y: 10
              },
              relativeTo: 'chart',
              theme: {
                  fill: 'white',
                  style: {
                      color: '#719e19',
                      text: {
                          y: '15'
                      },

                  },
                  stroke: 'silver',
                  r: 1,
                  states: {
                      hover: {
                          fill: '#F5F7DC'
                      }
                  }
              }
          },
        },
        title: {
          text: 'Level of pain'
        },
        xAxis: {
           categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
          title: {
              text: 'Currency'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
          area: {
            marker: {
                radius: 2
            },
            lineWidth: 1,
            states: {
                hover: {
                    lineWidth: 1
                }
            },
            threshold: null
          }
        },
        series: [{
          type: 'area',
          name: 'usd to uah',
          data: [29.9, 30.0, 29.75, 29.5, 28.5, 28.0, 27.85, 27.75, 27.5, 27.75, 27.85, 27.5]
        },{
          type: 'area',
          name: 'eur to uah',
          data: [33.9, 30.5, 30.4, 29.2, 29.0, 28.70, 28.75, 28.70, 28.5, 28.65, 28.7, 28.88]    
        }],
        navigation: {
          buttonOptions: {
            enabled: false
          }
        }
      });
    });