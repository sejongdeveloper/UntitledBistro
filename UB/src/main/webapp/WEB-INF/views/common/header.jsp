<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
<!--
	.customBtn {
		background-color: white;
		border: 0px;
	}
	.fa {
		color: #777;
	}
	#riskItemCount {
		background-color: red;
		border-radius: .4rem;
		color: white;
	}
	#riskItemCount:hover, #posMain:hover {
		cursor: pointer;
	}
	
	.right-panel .navbar-brand {
		width: 188px;
	}
	#logo {
		height: 25px;
    	padding-bottom: 4px;
	}
	
-->
</style>                     
<header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header"	>
                    <a id="logo" class="navbar-brand" href="${path}/erp?empregister_empnum=<sec:authentication property='principal.username'/>">
                    	<img id="logo" alt="로고 사진" src="${path}/resources/images/common/UBLogo.jpg">UntitedBistro
                    </a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    
                    <div class="user-area dropdown float-right">
                    	${sessionScope.empregister_name}님 환영합니다.
                    </div>
                    
                    <div class="header-left">

                        <div class="dropdown for-notification">
							<button id="realTimeSafeItem" class="customBtn" onclick="riskItem()">
	                            <i class="fa fa-bell"></i>
	                            <span class="badge" id="riskItemCount">${riskItemCount}</span>
							</button>                        
                        </div>
                        
                        <div class="dropdown for-notification">
							<button id="posMain" class="customBtn" onclick="posMain()">
	                            <i class="fa fa-paypal"></i>
							</button>                        
                        </div>

	                    <div class="dropdown for-notification">
							<button id="posMain" class="customBtn" onclick="goLogout()">
		                           <i class="fa fa-power-off"></i>
							</button>                        
	                    </div>
                    </div>
                    

                </div>
            </div>
        </header>
                                                                  
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
      
<!-- Swal -->      
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- WebSocket -->
<script type="text/javascript">
var riskCount = $("#riskItemCount");
$(document).ready(function() {
	setInterval(risk, 30000);
});

function risk() {
	$.ajax({
		url : "${path}/jaego/gridRiskItemCount",
		type : "get"
	})
	.done(function(count) {
		if(riskCount.html() != count) {
			riskCount.html(count);
			swal({
				title: "위험재고 수량알림",
				text: "위험재고에 해당하는 품목이 존재합니다.",
				icon: "info",
				button: "확인"
			});
		}
	});
}

function riskItem() {
	window.location.href="${path}/jaego/risk_item";
}

function posMain() {
	self.location="${path}/jumun/posMain.do";
}

function goLogout() {
	swal({
		  title: "로그아웃하시겠습니까?",
		  icon: "warning",
		  buttons: ["아니요", "네"],
		  dangerMode: true,
		}).then((willDelete) => {
			if (willDelete) {
				self.location="${path}/logout";
			}
		});
}

</script>        