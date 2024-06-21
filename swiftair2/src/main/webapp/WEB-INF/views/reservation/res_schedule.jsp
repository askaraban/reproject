<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	#tbodyAjax {
		width: 100%;
	}
	.modal-content {
		padding: 20px;
	}
	.quantity-input {
		width: 80px;
		text-align: center;
	}
	.quantity-btn {
		width: 40px;
	}
	.input-group {
		justify-content: center;
	}
	#gradePre {
		display:none;
	}
	
	#gradeEco {
		display:none;
	}
</style>

<body id="body" class="up-scroll">

<section class="bg-light py-8">
  <div class="container">
    <nav class="bg-transparent breadcrumb breadcrumb-2 px-0 mb-5" aria-label="breadcrumb" style="--bs-breadcrumb-divider: '>';">
      <h2 class="fw-normal mb-4 mb-md-0" style="font-size: 40px;">항공권 예매</h2>
      <ul class="list-unstyled d-flex p-0 m-0">
        <li class="breadcrumb-item"><a href="">Home</a></li>
        <li class="breadcrumb-item">일정</li>
      </ul>
    </nav>
  </div>
</section>

<c:if test="${not empty alertMessage}">
    <script>
        alert("${alertMessage}");
    </script>
</c:if>

<!-- ====================================
———	BANNER SECTION (TRAVEL)
===================================== -->
<section class="py-7 py-md-10" style="height: 624px;">
  <div class="container">
    <div class="row">
      <div class="col-12">

        <!-- 항공권예매 검색박스 -->
        <div class="search-box-2">
         <div class="row g-2 justify-content-center" id="resScheduleSellection">
			
            <div class="form-group col-md-3 col-lg-2 mb-0">
              <div class="select-default">
         		 <select class="select-location" name="resDeparture" id="departure">
		            <option>출발지</option>
		            <option value="인천">서울/인천(ICN)</option>
		            <option value="로스앤젤레스">로스앤젤레스(LAX)</option>
		            <option value="방콕">방콕(BKK)</option>
		            <option value="나리타">도쿄/나리타(NRT)</option>
		          </select>
        		</div>
            </div>
            
             <div class="form-group col-md-3 col-lg-2 mb-0">
              <div class="select-default">
		          <select class="select-location" name="resDestination" id="destination">
		            <option>도착지</option>
		            <option value="인천">서울/인천(ICN)</option>
		            <option value="로스앤젤레스">로스앤젤레스(LAX)</option>
		            <option value="방콕">방콕(BKK)</option>
		            <option value="나리타">도쿄/나리타(NRT)</option>
		          </select>
		        </div>
            </div>

			<div class="form-group col-md-3 col-lg-4 mb-0">
				<input type="text" class="form-control double-date" id="resDuration" required>
				<!-- 
				<input type="hidden" name="resDepartDate" id="resDepartDate">
				<input type="hidden" name="resReturnDate" id="resReturnDate">
				 -->
			</div>
            <div class="form-group col-md-3 col-lg-2 mb-0">
				<input type="text" class="form-control" id="resNumofPassengers" placeholder="탑승인원 : " data-bs-toggle="modal" data-bs-target="#exampleModal" required>
				<input type="hidden" name="resPassengerCnt" id="resPassengerCnt">
			</div>
            <div class="form-group col-md-3 col-lg-2 mb-0">
              <button type="button" class="btn btn-primary w-100" id="searchBtn">항공권 검색
                <i class="fas fa-search" aria-hidden="true"></i>
              </button>
        </div>
      </div>
		<form action="<c:url value="/reservation/arrivalSchedule" />" method="get" id="scheForm">
	  		<div class='schedule--list--div' id='scheduleList2'></div>
		</form>
	  <div id='gradeEco'>
	  	<img style='width:100%;' src='<c:url value='img/seat-option/economy35.png'/>' id='grade1'>
	  </div>
	  <div id='gradePre'>
	  	<img style='width:100%;' src='<c:url value='img/seat-option/premia42.png'/>' id='grade2'>
	  </div>
    </div>
  </div>
</section>
<nav class="navbar-expand-sm rounded shadow bg-light fixed-bottom">
	<div class="row">
		<div class="col-sm-6 col-lg-6"></div>
		<div class="col-sm-2 col-lg-2 align-self-center text-center" style="font-size: large; color: black; font-weight: bold;">
			총 결제금액(세금포함) : 
		</div>
		<div class="col-sm-2 col-lg-2 align-self-center" id="price" style="font-size: large; color: black;">
		</div>
		<!-- <div class="col-sm-1 col-lg-1">
			<button type="submit" class="btn btn-outline-primary w-100">이전</button>
		</div> -->
		<div class="col-sm-1 col-lg-1">
			<button type="submit" class="btn btn-primary w-100" onclick="submitForm()">다음</button>
		</div>
	</div>
</nav>

<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">탑승 인원</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="input-group">
        	<div class="input-group-prepend">
        		<button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
            </div>
            	<input type="text" class="form-control" id="quantity" value="1">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="applyPpl">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달 실행이 안되서 jQuery 스크립트 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
// 항공편 조회 시 스케쥴 출력하는 ajax

var routeDeparture; 
var routeDestination;
var scheduleDepartureDate;
var scheduleArrivalDate;
var d1;
var d2;
var checkValue;
var passengerCntValue;

$(document).ready(function(){
	$("#departure").change(function(){
		routeDeparture = $('#departure option:selected').val();
	});
});
$(document).ready(function(){
	$("#destination").change(function(){
		routeDestination = $('#destination option:selected').val();
	});
});
$(document).ready(function(){
	$("#resDepartDate").change(function(){
		scheduleDepartureDate = $('#resDepartDate option:selected').val();
	});
});
$(document).ready(function(){
	$("#resReturnDate").change(function(){
		scheduleArrivalDate = $('#resReturnDate option:selected').val();
	}); 
});

// 검색 버튼 눌렀을 때, 해당 여정 검색되도록함.
$('#searchBtn').click(function() {
    var resDurationValue = $('#resDuration').val();
	var v = resDurationValue.split(" - ")
	var v1 = v[0];
	var v2 = v[1];
	var sVal = v1.split("/")
	var sVal1 = sVal[0];
	var sVal2 = sVal[1];
	var sVal3 = sVal[2];
	var eVal = v2.split("/")
	var eVal1 = eVal[0];
	var eVal2 = eVal[1];
	var eVal3 = eVal[2];
	d1 = sVal3+"/"+sVal1+"/"+sVal2;
	d2 = eVal3+"/"+eVal1+"/"+eVal2;
	
		$.ajax({
			type: "get",
			url: "<c:url value="/reservation/sList"/>",
			contentType:"application/json",
			data: {
				"routeDeparture":routeDeparture,
				"routeDestination":routeDestination,
				"scheduleDepartureDate":sVal3+"/"+sVal1+"/"+sVal2,
				"scheduleArrivalDate": eVal3+"/"+eVal1+"/"+eVal2
				},
			dataType: "json",
	        /* processData: false, */
			success: function (result) {
				var html = ""
				var price = ""
				if(result.sList.length==0){
						html="<table>";
						html+="<tr>";
						html+="<th width='800' align='center'>검색된 항공편이 없습니다.</th>";
						html+="</tr>";
						html+="</table>"
						$("#scheduleList2").html(html);
						return;
					}	
				
					html+= "<br>";
					html+= "<hr style='width: 100%;'>";
					html+= "<br>";
					html+= "<h6 class='d-flex align-items-center' style='margin-bottom: 15px; color: #314f79;'>";
					html+= "<span class='material-symbols-outlined' style='font-size: 20px;'>가는 편</span>&nbsp;"
						<!-- 왕복 : 두 번째 여정 -->
					html+= "<span style='font-size: 18px;'></span>"
					html+= "</h6>"
					html+= "<h3 class='d-flex align-items-center' style='margin-bottom: 60px;'>"
						<!-- 출발지 -->
					html+= "<span style='width: 50%; text-align: right;'>"+routeDeparture+"</span>"
					html+= "<span><img style='width:20px;' src='<c:url value='img/triangle.png'/>'/></span>"
						<!-- 도착지 -->
					html+= "<span style='width: 300px; text-align: left;'>"+routeDestination+"</span>"
					html+= "</h3>"
					html+= "<table border='1' style='width:100%; text-align:center;'>"
						html+= "<thead>"
							html+= "<tr style = 'font-size : large; border:1px solid black';>"
								html+= "<th>운행시간</th>"
								html+= "<th>항공편명</th>"
								html+= "<th>이코노미35</th>"
								html+= "<th>프레미아42</th>"
							html+= "</tr>"
						html+= "</thead>"
					var ckck;
					$(result.sList).each(function () {
						html+= "<tbody id='tbodyAjax'>"
							html+="<tr >";
							html+="<td align='center'>"+this.routeTime+"</td>";
							html+="<td align='center'>"+this.scheduleFlight+"</td>";
							html+="<td align='center'><input type='radio' name='radio1' value='이코노미35' id='r1'>"+(this.routePrice+100000).toLocaleString()+" 원&nbsp;&nbsp;"+"(잔여 좌석 : "+(108 - result.ecoSeat)+")"+"</td>";
							html+="<td align='center'><input type='radio' name='radio1' value='프레미아42' id='r2'>"+(this.routePrice+200000).toLocaleString()+" 원&nbsp;&nbsp;"+"(잔여 좌석 : "+(18 - result.preSeat)+")"+"</td>";
							html+="</tr>";
						html+= "</tbody>"
						/* price = "<h5 id='tPrice'>"+this.routePrice+" 원</h5>" */
						price = this.routePrice * passengerCntValue;
					});
					html+= "</table>"
					html+= "</div>"
				  $(document).ready(function() {
					$('input[name="radio1"]').on('change', function () {
						if ($(this).attr('id')==='r1') {
							$('#gradeEco').show();
							$('#gradePre').hide();
							checkValue = $(this).attr('value');
							$('#price').text((((price + (100000*passengerCntValue)).toLocaleString())+"원"));
							$('#price').val(price+(100000*passengerCntValue));
						} else if ($(this).attr('id')==='r2') {
							$('#gradeEco').hide();
							$('#gradePre').show();
							checkValue = $(this).attr('value');
							$('#price').text((((price + (200000*passengerCntValue)).toLocaleString())+"원"));
							$('#price').val(price+(200000*passengerCntValue));
						}
					})
					
			      });
				
				$("#scheduleList2").html(html);
				$("#price").html(price+"원");
			},
			error: function(xhr) {
				alert("에러코드(게시글 목록 검색) = "+xhr.status);
				console.log(xhr.status.error);
			}
		});
	});

</script>
<script type="text/javascript">

// 모달이 열릴 때마다 실행
$('#exampleModal').on('show.bs.modal', function (e) {
    // 모달 외부 입력값을 가져와서 모달 내 입력값으로 설정
    var resNumofPassengersValue = $('#resNumofPassengers').val();
    $('#quantity').val(resNumofPassengersValue);
});
// 적용 버튼 클릭 시 실행
$('#applyPpl').click(function() {
    // 모달 내 입력값을 가져와서 모달 외부 입력값으로 설정
    passengerCntValue = $('#quantity').val();
    $('#resNumofPassengers').val('탑승인원 : ' + passengerCntValue);
    $('#resPassengerCnt').val(passengerCntValue);
    
    $('#exampleModal').modal('hide');
});

// 인원 수 증감하는 버튼
$(document).ready(function(){
	$('#increase').click(function(){
		let quantity = parseInt($('#quantity').val());
		$('#quantity').val(quantity + 1);
	});

	$('#decrease').click(function(){
		let quantity = parseInt($('#quantity').val());
		if (quantity > 1) {
			$('#quantity').val(quantity - 1);
		}
	});
});

myModal.addEventListener('shown.bs.modal', () => {
	myInput.focus()
});

// get 방식으로 전달하기 위한 함수
function submitForm() {
	console.log("routeDeparture")
	let form = document.getElementById('scheForm');
	let departure = routeDeparture;
	let destination = routeDestination;
	let departureDate = encodeURIComponent(d1);
	let arrivalDate = encodeURIComponent(d2);
	let cnt = document.getElementById('resPassengerCnt').value;
	let totalPrice = $('#price').val();
	const action = form.action + '?routeDeparture='+departure+'&routeDestination='+destination+'&scheduleDepartureDate='+departureDate+'&scheduleArrivalDate='+arrivalDate+'&resPassengerCnt='+cnt+'&grade1='+checkValue+'&price='+totalPrice;
	window.location.href=action;
}

</script>

</body>
