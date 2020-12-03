<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
       <script>
       window.onload = function() {
    	   /* var list = '${total}';
    	   var start = list[0];
    	   let end = list.length-1;
    	   var list2 =[];
    	   for(var i=1;i<end;i++)
    		   {list2 = list;
    		   }
    	   console.log(list2);
    	   console.log(list2[0]);
    	   console.log(list);
    	   //시작
    	   console.log(list[0].split(1,3));
    	   //끝
    	   console.log(list.length-1);

    	    
    		   var list_str = list.split(", ");
    		   
    		   console.log(list_str);
    		   
    		   console.log(list_str[0].substring(1,4));
    		   var startValue = list_str[0].substring(1,);
    		  var endValue = list_str[end]
    		   console.log(list_str[list.length].substring(1,4)); */
       var total1 = '${total1}'
       console.log(total1);
       var ctx = document.getElementById("myAreaChart");
       var myLineChart = new Chart(ctx, {
         type: 'line',
         data: {
           labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12"],
           datasets: [{
             label: "Sessions",
             lineTension: 0.3,
             backgroundColor: "rgba(2,117,216,0.2)",
             borderColor: "rgba(2,117,216,1)",
             pointRadius: 5,
             pointBackgroundColor: "rgba(2,117,216,1)",
             pointBorderColor: "rgba(255,255,255,0.8)",
             pointHoverRadius: 5,
             pointHoverBackgroundColor: "rgba(2,117,216,1)",
             pointHitRadius: 50,
             pointBorderWidth: 2,
             data: [total1, '${total2}', ${total3}, ${total4}, ${total5}, ${total6}, ${total7}, ${total8}, ${total9}, ${total10}, ${total11}, ${total12}],
           }],
         },
         options: {
           scales: {
             xAxes: [{
               time: {
                 unit: 'date'
               },
               gridLines: {
                 display: false
               },
               ticks: {
                 maxTicksLimit: 7
               }
             }],
             yAxes: [{
               ticks: {
                 min: 0,
                 max: 60000,
                 maxTicksLimit: 5
               },
               gridLines: {
                 color: "rgba(0, 0, 0, .125)",
               }
             }],
           },
           legend: {
             display: false
           }
         }
       });
       }
       
       window.addEventListener('load', function() {
       var ctx = document.getElementById("myBarChart");
       var myLineChart = new Chart(ctx, {
         type: 'bar',
         data: {
           labels: ["과자류", "음료류", "아이스크림류", "면류", "음식류"],
           datasets: [{
             label: "Revenue",
             backgroundColor: "rgba(2,117,216,1)",
             borderColor: "rgba(2,117,216,1)",
             data: [${Snack},${Drink},${Icecream},${Noodle},${Food}],
           }],
         },
         options: {
           scales: {
             xAxes: [{
               time: {
                 unit: 'month'
               },
               gridLines: {
                 display: false
               },
               ticks: {
                 maxTicksLimit: 6
               }
             }],
             yAxes: [{
               ticks: {
                 min: 0,
                 max: 50,
                 maxTicksLimit: 10
               },
               gridLines: {
                 display: true
               }
             }],
           },
           legend: {
             display: false
           }
         }
       });
       });
       </script>
<script>
function proudctInsertGo(){
    location.href = "productinsertgo";
}
function productUpdate(pnumber){
   location.href = "productupdate?pnumber="+pnumber;
}
function productDelete(pnumber){
   location.href = "proudctdelete?pnumber="+pnumber;
}
</script>
<style>
   .paging{
      text-align:center;
      font-size: 20px;
   }
   .commainbutton{
      width: 100px;
      height: 30px;
      background-color: #fefefe;
      float:right;
   }
   #tablestyle{
      text-align : center;
   }
section#content ul li { margin:10px auto; padding:10px 0; width:1000px; display:block; border-bottom:1px solid #999; }
section#content ul li img{ width:250px; height:250px; }
section#content ul li::after{content:""; display:block; clear:both; }
section#content div.thumb {float:left; width:250px;}
section#content div.gdsInfo {float:right; width:calc(100%-320px); }
section#content div.gdsInfo {font-size:20px; line-height:2; }
section#content div.gdsInfo span{display:inline-block; width:auto; font-weight:bold; margin-right:10px; }
section#content div.gdsInfo .delete{text-align:right; }
section#content div.gdsInfo .delete button {font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
</style>
    </head>
    <body class="sb-nav-fixed">
    <jsp:include page="ComInclude.jsp" flush="false" />
    
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4"> ${cDTO.company} ${cDTO.comoffice}점</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">분기별 매출</li>
                        </ol>
                         <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">1분기 총액</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">${total1 + total2 + total3}</a>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">2분기 총액</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">${total4 + total5 + total6}</a>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">3분기 총액</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">${total7 + total8 + total9}</a>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">4분기 총액</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">${total10 + total11 + total12}</a>
                                       <!--  <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                         	월별 총매출액
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        	카테고리별 판매 개수
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example <button class="commainbutton" onclick = "proudctInsertGo()">상품등록</button>
                            </div>
                            <div class="card-body">
                                     <section id="content">
                                    <ul>
                                    <c:forEach items="${productlist}" var="list">
                                     <li>
                                      <div class="thumb">
                                       <img class="img" src="${pageContext.request.contextPath}/resources/uploadfile/${list.pimage}"/>
                                      </div>
                                      <div class="gdsInfo">
                                       <p>
                                          <span>상품 분류 : </span>${list.pcategory}<br />
                                        <span>상품 이름 : </span>${list.pname}<br />
                                        <span>상품 가격 : </span>${list.pprice}원<br />
                                        <span>상품 갯수 : </span>${list.pcount}개<br />
                                       </p>
                                       
                                       <div class="delete">
                                        <button onclick = "productUpdate('${list.pnumber}')">수정</button>
                                        <button onclick = "productDelete('${list.pnumber}')">삭제</button>
                                       </div>
                                      </div>   
                                     </li>
                                     </c:forEach>
                                     </ul>
                           </section>
                           
                           <!-- 페이징 처리 -->
                           <br>
                           <div class="paging">
                              <c:if test="${paging.page<=1}">
                              [이전]&nbsp;
                              </c:if>
                              
                              <c:if test="${paging.page>1}">
                                 <a href="noticelistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
                              </c:if>
                              
                              <c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
                                 <c:choose>
                                    <c:when test="${i eq paging.page}">
                                    ${i}
                                    </c:when>
                                    <c:otherwise>
                                       <a href="noticelistpaging?page=${i}">${i}</a>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           
                              <c:if test="${paging.page>=paging.maxpage}">
                                 [다음]
                              </c:if>
                              
                              <c:if test="${paging.page<paging.maxpage}">
                                 <a href="noticelistpaging?page=${paging.page+1}">[다음]</a>
                              </c:if>
                           </div>
                            </div>
                        </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
       
   
    </body>
</html>



