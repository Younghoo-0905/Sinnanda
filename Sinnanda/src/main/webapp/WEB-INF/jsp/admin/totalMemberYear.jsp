<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>

</head>
<body>
  
   
         <select id="yearNo" name="yearNo" class="form-control-sm" style="float: right; margin-bottom: 20px;">
            <option value="">선택</option>            
            <option value="2021">2021년</option>
            <option value="2020">2020년</option>
         </select>
   
      <canvas id="myChart" width="100" height="40"></canvas>
   
   <script type="text/javascript">
   let ctx = document.getElementById('myChart').getContext('2d');
   let myChart = new Chart(ctx, {});
   
   $('#yearNo').change(function(){
      
      let year = $('#yearNo').val();
      
      myChart.destroy();
      ctx = document.getElementById('myChart').getContext('2d');
      
      $.ajax({
         type:'get',
         url:'/admin/getTotalMemberYear?year=' + year,
         success:function(json){
            console.log(json);
            
            
            //[윤경환] 회원가입을 한 회원수 
            let myData = [];
            myData.push(json.map1.january);
            myData.push(json.map1.february);
            myData.push(json.map1.march);
            myData.push(json.map1.april);
            myData.push(json.map1.may);
            myData.push(json.map1.june);
            myData.push(json.map1.july);
            myData.push(json.map1.august);
            myData.push(json.map1.september);
            myData.push(json.map1.october);
            myData.push(json.map1.november);
            myData.push(json.map1.december);
            
            
          //[윤경환] 탈퇴을 한 회원수  
            let myData2 = [];
            myData2.push(json.map2.january);
            myData2.push(json.map2.february);
            myData2.push(json.map2.march);
            myData2.push(json.map2.april);
            myData2.push(json.map2.may);
            myData2.push(json.map2.june);
            myData2.push(json.map2.july);
            myData2.push(json.map2.august);
            myData2.push(json.map2.september);
            myData2.push(json.map2.october);
            myData2.push(json.map2.november);
            myData2.push(json.map2.december);
            
            
          	//가입한 총 회원 
			let result = myData.reduce((accumulator,currentNumber)=> accumulator + currentNumber);
			//탈퇴한 총 회원 수 
          	let result2 = myData2.reduce((accumulator,currentNumber)=> accumulator + currentNumber);
          	
          	
            // chart.js
            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    datasets: [{
                        label: '회원가입 수',
                        data: myData,
                        backgroundColor: [
                        	 'rgba(54, 162, 235, 0.2)'
                            
                        ],
                        borderColor: [
                        	 'rgba(54, 162, 235, 1)'
                          
                        ],
                        borderWidth: 1
                    },{
                    	 label: '탈퇴한 회원 수 ',
                         data: myData2, 
                         backgroundColor: [
                             'rgba(255, 99, 132, 0.2)'
                             
                         ],
                         borderColor: [
                             'rgba(255, 99, 132, 1)'
                           
                         ],
                         borderWidth: 1
                    	
                    }
                    
                    ]
                },
                options: {
                	 plugins: {
                         title: {
                             display: true,
                             text: ['# 회원가입 수 :'+result+'명','' ,'# 탈퇴한 회원 수 :' + result2+'명']
                             
                         }
                		
                     },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    lengend:{
                    	display:true,
                    	fontColor: 'rgba(255, 99, 132, 0.2)',
                    	position:'right'
                    }
                }
            });
            
         }
      });
   });

   
   </script>

</body>
</html>