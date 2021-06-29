<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트견적문의</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check(){
		
		var fm = document.frm;	

		fm.action ="<%=request.getContextPath()%>/Rent_EstimateAction.do";
		fm.method = "post";
		fm.submit();	

	return;
	}
	
</script>
 <link rel="stylesheet" href="./resource/Estimatecss.css">
 </head>
<body>
	<form name="frm">
	<div id="content">
	<!-- NAME -->
	<div>
		<h3>
			<label for="name">이름</label>
		</h3>
		<span class="box int_name">
			<input type="text" name="r_name" id="name" class="int" maxlength="20">
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- phone -->
	<div>
		<h3>
			<label for="phone">연락처</label>
		</h3>
		<span class="box int_phone">
			<input type="text" name="r_phone"id="phone" class="int" maxlength="20">
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- area -->
	<div>
		<h3>
			<label for="area">지역</label>
		</h3>
		<span class="box int_area">
			<select class="int" name="r_addr">
				<option>지역선택</option>
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">광주</option>
				<option value="4">대구</option>
				<option value="5">대전</option>
				<option value="6">부산</option>
				<option value="7">울산</option>
				<option value="8">전주</option>
				<option value="9">강릉</option>
			</select>
		</span>
	</div>
	<!-- car -->
	<div>
		<h3>
			<label for="car">관심차종</label>
		</h3>
		<span class="box int_car">
			<input type="text" name="r_interest"id="car" class="int" maxlength="20">
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- division -->
	<div>
		<h3>
			<label for="division">구분</label>
		</h3>
		<span class="box int_division">
			<lable>
				<input type="radio" name="r_division" id="division" value="individual" checked="checked">
			개인/개인사업자
			</lable>
			<lable>
				<input type="radio"  name="r_division" id="division2" value="Corporation">
				법인사업자
			</lable>
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- 개인정보수집 -->
	<div class="agree"> 
	
  		<div class="all_agree">
  			<input type="checkbox" id="a1" name="전체동의" />
   	 		<label for="a1"><span>전체약관동의</span></label>
 		 </div><!-- .all_agree -->
	</div><!-- .agree -->
	<ul>
		<li><input type="checkbox" id="a2" name="전체동의" />
			<label for="a2"><span>이용약관동의 (필수)</span></label>
		</li>

		<li><input type="checkbox" id="a3" name="전체동의" />
			<label for="a3"><span>개인정보수집이용 동의 (필수)</span></label>
		</li>

		<li><input type="checkbox" id="a4" name="전체동의" />
    		<label for="a4"><span>만 14세 이상 확인 (필수)</span></label>
		</li>
	</ul>
	<!-- 확인버튼 -->
	<div id="btn">
		<button type="button" class="submit" onclick="check()">확인</button>
	</div>
</div>
</form>
</body>
</html>