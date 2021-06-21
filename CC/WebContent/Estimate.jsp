<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트견적문의</title>
<script src="./jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});
</script>
<style>
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{
	font-family: 'InfinitySans-RegularA1';
	}
	body {
		width:70%;
	    margin: 0;
	    height: 100%;
	    background: #f5f6f7;
	    font-family: Dotum,'돋움',Helvetica,sans-serif;
	}	
	#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
	}
	h3 {
	    margin: 19px 0 8px;
	    font-size: 14px;
	    font-weight: 700;
	}
	.box {
	    display: block;
	    width: 100%;
	    height: 51px;
	    border: solid 1px #dadada;
	    padding: 10px 14px 10px 14px;
	    box-sizing: border-box;
	    background: #fff;
	    position: relative;
	}
	
	.int {
	    display: block;
	    position: relative;
	    width: 100%;
	    height: 29px;
	    border: none;
	    background: #fff;
	    font-size: 15px;
	}
	.box.int_name {
    padding-right: 110px;
	}.box.int_phone {
    padding-right: 110px;
	}
	.agree .all_agree input[type="checkbox"] {
		display: none;
	}
	.agree .all_agree input[type="checkbox"] {
		display: none;
	}

	.agree .all_agree input[type="checkbox"] + label {
		display: inline-block;
	 	width:17px; 
	 	height: 17px; 
	 	background: #fa3062;
		cursor: pointer; 
		border-radius: 3px;
		float: right;
	}
	.agree .all_agree:after {
		display:block; 
		clear:both; 
		content:"";
	}
	.agree {
		position:relative;
	}
	.agree .all_agree input[type="checkbox"] + label span {
		position: absolute; 
		top: 0; 
		left:0px; 
		display: block; 
		font-weight: bold;
	}
	.agree ul {
		margin-top: 10px;
	}
	.agree ul li {
		margin-bottom: 15px;
	}
	.agree ul li:after {
		display:block; 
		clear:both; 
		content:"";
	}
	.agree ul li input[type="checkbox"] {
		display: none;
	}
	.agree ul li input[type="checkbox"] + label {
	 	width:17px; 
	 	height: 17px; 
	 	background: #fa3062; 
	 	cursor: pointer; 
	 	border-radius: 3px;
	 	float: right;
	 }
	.agree ul li input[type="checkbox"]:checked + label {
		background:url(../images/check.png) #fa3062 no-repeat center/10px 10px; 
		float: right
	}
	.agree ul li input[type="checkbox"] + label span {
		position: absolute; 
		left:0px; 
		display: block; 
	}

</style>
</head>
<body>
	<div id="content">
	<!-- NAME -->
	<div>
		<h3>
			<label for="name">이름</label>
		</h3>
		<span class="box int_name">
			<input type="text" id="name" class="int" maxlength="20">
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- phone -->
	<div>
		<h3>
			<label for="phone">연락처</label>
		</h3>
		<span class="box int_phone">
			<input type="text" id="phone" class="int" maxlength="20">
		</span>
		<span class="error_next_box"></span>
	</div>
	<!-- area -->
	<div>
		<h3>
			<label for="area">지역</label>
		</h3>
		<span class="box int_area">
			<select class="int">
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
			<input type="text" id="car" class="int" maxlength="20">
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
				<input type="radio" name="select" id="division" value="individual" checked="checked">
			개인/개인사업자
			</lable>
			<lable>
				<input type="radio"  name="select" id="division2" value="Corporation">
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
		<button type="button">확인</button>
	</div>
</div>
</body>
</html>