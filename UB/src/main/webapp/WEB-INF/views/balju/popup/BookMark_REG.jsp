<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ?? jsp ?ì¼?ì?? ?°ì´?°ì?? ì²ë¦¬ë¥? ?ë¤
	1. ì²«ì§¸ë¡? ?ê°?? ?¨ì¼ë¡? ?ë?´ì ?ë ¥ ì²ë¦¬ë¥? ?ë©° 
	  1?¨ì?ë ë°ì£¼?¼ì?? ?ì¤?°ì´?¸ë¡ ì²ë¦¬?ë©° ë³´ì¬ì£¼ê¸°ë§? ? ë¿ ì§ì ?ì¼ë¡? ?ë ¥ê°ì´ ?ë¬?ì??? ?ë??
	  ?´ë¹?? ?¤ì ?ë ë¶ë¶ì´ ?ì¼ë©? ?´ë?? ?ì´?ê°?? ë°í?¼ë¡ ?´ì ?´ë¦?? ì¡°í?´ì ?£ì´?¼í??
	  ê·¸ë¤?? ì°¸ì¡°??? ?ë?? ?´ë?? 2?¨ì ?ì´ë¸ì´ ?ë?? 1?¨ì ?ì´ë¸ì?? ?ë ¥?ë©° ?í©ì¡°í?ì?? 1?¨ì?? ?ì¤?ë¡ ?ë¤
	 
	 [ì£¼ìë°ì£¼?ëª©]?ì?? ?¤ì?? ?°ì´?°ë? ??í¸?´ì ?ì°½?¼ë¡ ?ìì¤?? [balju_save]
	 [?ì?ì?? bom??ª©?? ?ìì£¼ë©°
	 [?ì ?¬ê³ (?¹ì??ì ?¬ê³ )]?ì?? ?ì ?¬ê³ ? ?ì¬ê³ ë? ì¶ë ¥?ì¬ ë¹êµ?´ì???. >>>>>>>>>>?ì ?¬ê³ ? ?ì?? ê¸°ë¥?? ?ì¸?ì<<<<<<<<<<
	 
	 [???ë²í¼? ?°ì´?°ë? ì»¨í¸ë¡¤ë¬ë¡? ?ê²¨ì£¼ë©°
	 [?¤ì?ì±]? ?¸í?°ì´?°ë? ?´ë¦° ?ì¼ì¤??
	 [ê³í?í©]ë²í¼? balju_plan_resultë¡? ?´ë?ë¤.
	 
	 
	 2. 2?¨ì?ë ë°ì£¼??ª©?? ?ì±?ì¬?? ?ë?? ?´ë ?í?? ê°ë§?? ?ì´?ì¼?ë?ë¡? ?ì´ì¿¼ë¦¬?? appendë¥? ?´ì©?ì¬ ?ë ¥ì°½ì ?ë ¤?? ? ê²?´ë¤.
	 	?í ?ë ¥??ª©?? ì·¨í©?ì¬ json ??ì¼ë¡? ??¥í?? ì»¨í¸ë¡¤ë¬ë¡? ë³´ë´?? ?ë©°(?ë§??.. ?´ë»ê²? ?´ì¼?ëì§?? ëª¨ë¦) 
	 	?´ë? ë¦¬ì¤?¸ì ?´ì?? ?ë¹?¤ë¨?¼ë¡ ë³´ë¸??.
	 	?ì ë§¤í¼?ì ?´ë? forEachë¥? ?¬ì©?ì¬ ?¤ì¤ insertë¥? ?ëª©?ì¼ì¤ì¼ ? ê²ê°ë¤.
	 	
	 	2?¨ì ?ëê³? ê³µê¸ê°?? ?ë¨?ë ì´ì?? ë°? ì´? ë°ì£¼?¡ì ?ê¸°?´ì???.
	 -->


<head>
<style>
.btn_space {
	margin-right: 5px;
}
</style>
<!-- ?íë¦? link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- ?íë¦? link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ?? ?´ê²? ?¤ì?¼ë¿ cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?¬ì©?? ?í jqueryë¥? cdn ?°ê²°-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?¬ì©?? ?í ?ì?? ?ì cdn ?°ê²°-->

<!-- jsgrid ?¬ì©?? ?í ?ì?? ?ì cdn ?°ê²°-->
<meta charset="UTF-8">
<title>ë°ì£¼ ê³í ?ì±</title>
<script type="text/javascript">
	var openItemWin;

	function openItemList() {

		//ë¶ëª¨ì°½
		window.name = "BookMark_REG";
		//?ìì°½ì??
		openItemWin = window.open("${path}/balju/popup/Item_list", 'itemInfo',
				"width=500, height=600, toolbars=no");

	}
</script>
</head>
<body>
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> ë°ì£¼ ?ë³´ </h5><br> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<div class="row"></div>
							<div class="col-lg-8">
								<button type="button" class="btn btn-dark btn-sm"
									style="margin-right: 5px;" onclick="openItemList()">?í?ë³´</button>
							</div>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>?ëª©ì½ë</th>
									<th>?ëª©ëª?</th>
									<th>ê·ê²©</th>
									<th>?¨ê?</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="code" readonly></td>
									<td><input type="text" id="name" readonly></td>
									<td><input type="text" id="stndr" readonly></td>
									<td><input type="text" id="price" readonly></td>
									<td><button class="btn btn-dark" id="addData">?±ë¡</button>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							ê´?¬ë¬¼?? ?±ë¡<small><code> ?í?ë³´ë¥? ?ë¬ ?°ì´?°ë? ?ë ¥?ì¸?? </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var Data = [];
							$("#jsGrid").jsGrid({
								width : "100%",
								height : "400px",
								autoload : true,
								filtering : true,
								sorting : true,
								editing : true,
								data : Data,
								deleteConfirm : function(item) {
									return item.BK_NAME + " ?í?? ?? ?ìê² ìµ?ê¹?";
								},

								fields : [ {
									name : "BK_CODE",
									type : "text",
									width : 150,
									title : "?ëª©ì½ë",
									readOnly : true
								}, {
									name : "BK_NAME",
									type : "text",
									width : 150,
									title : "?ëª©ëª?",
									readOnly : true
								}, {
									name : "BK_STNDR",
									type : "text",
									width : 150,
									title : "ê·ê²©",
									readOnly : true
								}, {
									name : "BK_PR_EA",
									type : "text",
									width : 150,
									title : "ê³µê¸ê°??",
									readOnly : true
								},{
									name : "BK_QT",
									type : "text",
									width : 0,
									visible : false
								},{
									name : "BK_WR",
									type : "text",
									width : 0,
									visible : false
								},{
									type : 'control'
								} ]

							});
						</script>
						<div class="card-footer">
							<button class="btn btn-dark btn-sm pull-right"
								onclick="insertBK()">?±ë¡</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
<script>
	$("#addData").click(function() {
		alert("ê´?¬íëª©ì´ ì¶ê??ì?µë??")
		var insertItem = {};
		insertItem.BK_CODE = $("#code").val();
		insertItem.BK_NAME = $("#name").val();
		insertItem.BK_STNDR = $("#stndr").val();
		insertItem.BK_PR_EA = $("#price").val();
		insertItem.BK_QT = 0;
		insertItem.BK_WR = "${sessionScope.empregister_name}";

		console.log(insertItem);
		$("#jsGrid").jsGrid("insertItem", insertItem);

		$("#code").val("");
		$("#name").val("");
		$("#stndr").val("");
		$("#qt").val("");
		$("#price").val("");
	});
</script>
<script>
	function insertBK() {
		var items = $("#jsGrid").jsGrid("option", "data");
		console.log(JSON.stringify(items));
		$.ajax({
			method : "post",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(items),
			url : "${path}/insert_BookMark",
			success : function(result) {
				var jsonResult = JSON.parse(JSON.stringify(result));
				if (jsonResult.result == "success") {
					alert(jsonResult.resultMsg);
					window.close();
				} else if (jsonResult.result == "failure") {
					aleart(jsonResult.resultMsg);
					return false;
				}
				//success end
			}
		//ajax end
		});
	};
</script>
</html>