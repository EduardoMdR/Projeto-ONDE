$(document).on('turbolinks:load', async function () { 
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['22/11', '23/11', '24/11', '25/11', '26/11', '27/11', '28/11', '29/11', '30/11', '01/12' ],
          datasets: [{
              label: 'Total de visualizações',
              data: [12, 19, 3, 5, 2, 3, 16, 13, 14, 5],
              backgroundColor: [
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)'
              ],
              borderColor: [
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          }
      }
  });
});

$(document).on('turbolinks:load', async function () { 
  var ctx = document.getElementById('myChart2').getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: ['Cupons utilizados', 'Cupons não utilizados'],
        datasets: [{
            label: 'Total de visualizações',
            data: [15, 19],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
          }]
      },

  });
});

$(document).on('turbolinks:load', async function () { 
  var ctx = document.getElementById('myChart3').getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'horizontalBar',
      data: {
          labels: ['maça', 'perâ', 'pneu', 'michellin'],
          datasets: [{
              label: 'Prazo das ofertas',
              data: [9, 8, 7.5, 6],
              backgroundColor: [
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(54, 162, 235, 0.2)'
              ],
              borderColor: [
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(54, 162, 235, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                    maxTicksLimit: 10,
                    suggestedMax: 10
                  }
              }]
          }
      }
  });
});