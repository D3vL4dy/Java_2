/**
 * 
 */
 $(function(){
	
	$.ajax({
		url: '/cumtrip/MypageIndex.do',
		type: 'post',
		success: function(res){
			str = "";                                                                                                                     
			                                                                                                                              
				str += '<div class="boxContain01_top">';
				str += '	<div class="poto_box">';
				str += '		<img src="'+res.mem_photo+'" alt="">';
				str += '	</div>';
				str += '	<div class="inter_box">';
				str += '		<ul>';
				str += '			<li>';
				str += '				<h5>회원아이디</h5>';
				str += '				<b>'+res.mem_email+'</b>';
				str += '			</li>';
				str += '			<li>';
				str += '				<h5>회원명</h5>';
				str += '				<b>'+res.mem_name+'</b>';
				str += '			</li>';
				str += '			<li>';
				str += '				<h5>위치</h5>';
				str += '				<b>'+res.mem_addr+'</b>';
				str += '			</li>';
				str += '			<li>';
				str += '				<a href="./mypage_index_update.jsp">프로필 수정</a>';
				str += '				<a href="./mypage_index_delete.jsp">회원탈퇴</a>';
				str += '			</li>';
				str += '		</ul>';
				str += '	</div>';
				str += '</div>';
				str += '<div class="boxContain01_bottom">';
				str += '	<div class="bottomText_left">';
				str += res.mem_name+'회원님 반갑습니다.';
				str += '	</div>';
				str += '	<div class="bottomText_right">';
				str += '		<span class="bottomText_span">';
				str += '			<b>좋아요</b>';
				str += '			<img src="" alt="">';
				str += '		</span>';
				str += '		<span class="bottomText_spanImg">';
				str += '			<img src="" alt="">';
				str += '			<img src="" alt="">';
				str += '			<img src="" alt="">';
				str += '			<img src="" alt="">';
				str += '		</span>';
				str += '	</div>';
				str += '</div>';
				
			$('.mypage_boxContain').html(str);
		},
		error: function(xhr){
			if(xhr.status == 500){ 
				alert("로그인 상태가 아닙니다.");
				location.href = "../index.jsp" };
		},
		dataType: 'json'
	})
	
	
	
	
	
	
	
})