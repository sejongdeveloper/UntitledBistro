<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 <form action="Update.html" method="post">
 	<input type="hidden" name="jungsan_input_date2" value="${jungsan_input_date}">
 	<table style="width: 1200px; margin: auto; margin-top: 300px;" border="1">
		
			<tr>
				<td>현금</td>
				<td><input type="number" name="jungsan_input_cash"/></td>
				
				<td>카드</td>
				<td><input type="number" name="jungsan_input_card"/></td>
				<td>포인트사용</td>
				<td><input type="number" name="jungsan_input_point"/></td>
			</tr>
			<tr>
				<td>지출</td>
				<td><input type="number" name="jungsan_input_expenditure"/></td>
				<td>근무시간</td>
				<td><input type="number" name="jungsan_input_worktime"/></td>
				<td>직급</td>
				<td><input type="text" name="jungsan_input_grade"/></td>
			</tr>
			<tr>
				<td>환불 유무</td>
				<td>환불 유<input type="radio">환불 무<input type="radio"></td>				
				<td>환불 금액</td>
				<td><input type="number" name="jungsan_input_refund"/></td>
				<td>환불내용</td>
				<td><textarea name="jungsan_input_reason"></textarea></td>
				</tr>
			</table>
			<div align="center">
				<input type="reset" value="취소"/>
				<input type="submit" value="저장"/>
			</div>
 </form>
</body>
</html>