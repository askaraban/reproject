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
      </div>
	  	<div class='schedule--list--div' id='scheduleList2'>
	  	
	  		<br>
				<hr style='width: 100%;'>
				<br>
				<h6 class='d-flex align-items-center' style='margin-bottom: 15px; color: #314f79;'>
					<span class='material-symbols-outlined' style='font-size: 20px;'>돌아오는 편</span>&nbsp;
					<!-- 왕복 : 두 번째 여정 -->
					<span style='font-size: 18px;'></span>
				</h6>
					<h3 class='d-flex align-items-center' style='margin-bottom: 60px;'>
					<!-- 출발지 -->
					<span style='width: 50%; text-align: right;'>${resInfo.routeDestination }</span>
					<span><img style='width:20px;' src='<c:url value='/img/triangle.png'/>'/></span>
					<!-- 도착지 -->
					<span style='width: 300px; text-align: left;'>${resInfo.routeDeparture }</span>
					</h3>
					<table border='1' style='width:100%; text-align:center;'>
					<thead>
						<tr style = 'font-size : large; border:1px solid black;'>
							<th>운행시간</th>
							<th>항공편명</th>
							<th>이코노미35</th>
							<th>프레미아42</th>
						</tr>
					</thead>
						<tbody id='tbodyAjax'>
							<tr>
								<td align='center'>${resInfo.endSchedule.routeTime }</td>
								<td align='center'>${resInfo.endSchedule.routeFlight }</td>
								<td align='center'><input type='radio' name='radio1' value='이코노미35' id='r1'>&nbsp;&nbsp;${resInfo.ecoPrice } 원&nbsp;&nbsp;</td>
								<td align='center'><input type='radio' name='radio1' value='프레미아42' id='r2'>&nbsp;&nbsp;${resInfo.prePrice } 원&nbsp;&nbsp;</td>
							</tr>
						</tbody>
					</table>
					</div>
	  	
	  	</div>
	  <form action="<c:url value="/reservation/passengersinfo" />" method="get" id="scheForm">
	  <div id='gradeEco'>
	  	<img style='width:100%;' src='<c:url value='/img/seat-option/economy35.png'/>' id='grade1'>
	  </div>
	  <div id='gradePre'>
	  	<img style='width:100%;' src='<c:url value='/img/seat-option/premia42.png'/>' id='grade2'>
	  </div>
	  </form>
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




<!-- 모달 실행이 안되서 jQuery 스크립트 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

var d1;
var d2;
var checkValue;

// 좌석 클릭 시 좌석별 혜택 보여주기
$(document).ready(function () {
	$('input[name="radio1"]').on('change', function () {
		if ($(this).attr('id')==='r1') {
			$('#gradeEco').show();
			$('#gradePre').hide();
			checkValue = $(this).attr('value');
			$('#price').text((((${resInfo.totalPrice} + ${resInfo.endSchedule.routePrice} + (100000*${resInfo.resPassengerCnt})).toLocaleString())+"원"));
			$('#price').val(${resInfo.totalPrice} + ${resInfo.endSchedule.routePrice} + (100000*${resInfo.resPassengerCnt}));
		} else if ($(this).attr('id')==='r2') {
			$('#gradeEco').hide();
			$('#gradePre').show();
			checkValue = $(this).attr('value');
			$('#price').text((((${resInfo.totalPrice} + ${resInfo.endSchedule.routePrice} + (200000*${resInfo.resPassengerCnt})).toLocaleString())+"원"));
			$('#price').val(${resInfo.totalPrice} + ${resInfo.endSchedule.routePrice} + (200000*${resInfo.resPassengerCnt}));
		}
	})
})

// get 방식으로 전달하기 위한 함수
function submitForm() {
	let form = document.getElementById('scheForm');
	/*
	let departure = ${resInfo.routeDeparture};
	let destination = ${resInfo.routeDestination};
	let departureDate = encodeURIComponent(${resInfo.scheduleDepartureDate});
	let arrivalDate = encodeURIComponent(${resInfo.scheduleArrivalDate});
	let cnt = ${resInfo.resPassengerCnt};
	*/
	let totalPrice = $('#price').val();
	const action = form.action + '?grade2='+checkValue+'&price='+totalPrice;
	window.location.href=action;
}

$(document).ready(function () {
	var currentValue = parseInt($('#r1').text(), 10); 
	var newValue = currentValue + 100000;
	$('#r1').text(newValue);
})

// 전달되어야할 값들
// 날짜, 인원수, 총 금액, 출발지, 도착지, 가는편 등급, 오는편 등급
//
</script>

</body>
