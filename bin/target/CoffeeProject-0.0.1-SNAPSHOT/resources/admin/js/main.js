//메인 회원정보

//회원가입수 
const cyanColor = '#28dac6';
let borderColor, gridColor, tickColor;

  borderColor = '#f0f0f0';
  gridColor = '#f0f0f0';
  tickColor = 'rgba(0, 0, 0, 0.75)'; // x & y axis tick color

const barChart = document.getElementById('UserMemberChart');
if (barChart) {
  const barChartVar = new Chart(barChart, {
    type: 'bar',
    data: {
      labels: [
        '7/12',
        '8/12',
        '9/12',
        '10/12',
        '11/12',
        '12/12',
        '13/12',
        '14/12',
        '15/12',
        '16/12',
        '17/12',
        '18/12',
        '19/12'
      ],
      datasets: [
        {
          data: [275, 90, 190, 205, 125, 85, 55, 87, 127, 150, 230, 280, 190],
          backgroundColor: cyanColor,
          borderColor: 'transparent',
          maxBarThickness: 15,
          borderRadius: {
            topRight: 15,
            topLeft: 15
          }
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      animation: {
        duration: 500
      },
      plugins: {
        tooltip: {
          backgroundColor: config.colors.white,
          titleColor: config.colors.black,
          bodyColor: config.colors.black,
          borderWidth: 1,
          borderColor: borderColor
        },
        legend: {
          display: false
        }
      },
      scales: {
        x: {
          grid: {
            color: gridColor,
            borderColor: borderColor
          },
          ticks: {
            color: tickColor
          }
        },
        y: {
          min: 0,
          max: 400,
          grid: {
            color: gridColor,
            borderColor: borderColor
          },
          ticks: {
            stepSize: 100,
            tickColor: gridColor,
            color: tickColor
          }
        }
      }
    }
  });
}

//방문자수

const barChart2 = document.getElementById('Chart2');
if (barChart2) {
  const barChartVar2 = new Chart(barChart2, {
    type: 'bar',
    data: {
      labels: [
        '7/12',
        '8/12',
        '9/12',
        '10/12',
        '11/12',
        '12/12',
        '13/12',
        '14/12',
        '15/12',
        '16/12',
        '17/12',
        '18/12',
        '19/12'
      ],
      datasets: [
        {
          data: [275, 90, 190, 205, 125, 85, 55, 87, 127, 150, 230, 280, 190],
          backgroundColor: cyanColor,
          borderColor: 'transparent',
          maxBarThickness: 15,
          borderRadius: {
            topRight: 15,
            topLeft: 15
          }
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      animation: {
        duration: 500
      },
      plugins: {
        tooltip: {
          backgroundColor: config.colors.white,
          titleColor: config.colors.black,
          bodyColor: config.colors.black,
          borderWidth: 1,
          borderColor: borderColor
        },
        legend: {
          display: false
        }
      },
      scales: {
        x: {
          grid: {
            color: gridColor,
            borderColor: borderColor
          },
          ticks: {
            color: tickColor
          }
        },
        y: {
          min: 0,
          max: 400,
          grid: {
            color: gridColor,
            borderColor: borderColor
          },
          ticks: {
            stepSize: 100,
            tickColor: gridColor,
            color: tickColor
          }
        }
      }
    }
  });
}



//남여성비
const ctx2 = document.getElementById('pie-chart').getContext('2d');
	const labels= ['남', '여']

    new Chart(ctx2, {
    	type: 'pie',
        data: {
        	datasets: [{
            	data: [40,60],
                backgroundColor: ['#FB3640', '#EFCA08']
            }],
            labels: labels
            },
            options: {
            responsive: false,
            legend: {position: 'bottom'},
            plugins: {
               datalabels: {
                   color: ['#fff', '#fff', '#fff', '#fff'],
                   borderWidth: 2,
                   borderColor: ['#fff', '#fff', '#fff', '#fff'],
                   borderRadius : 25,
                   anchor: 'center',
                   	formatter: function(value, context) {
                    	return (value > 10) ? value+ "%" : null //data가 10 미만이면 숫자 값은 출력되지 않습니다.
                    }
                },
            }
        }
    });
