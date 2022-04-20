$(function(){
	
	$.ajax({
		url: '/cumtrip/MypageLike.do',
		type: 'post',
		success: function(res){
			
				str = "";
				if(res.status == "0"){
					str += '<h5>데이터가 없습니다</h5>';
					$('.mypage_boxLike_span').html(str);
				}else{
					$.each(res, function(i, v){
					
						str += '<li class="mypage_boxLike_li">';
						str += '	<div class="m_Like_no">'+v.mem_email+'</div>';
						str += '	<div class="m_Like_poto">'+v.Mre_title+'</div>';
						str += '	<div class="m_Like_name">'+v.Mre_date+'</div>';
						str += '	<div class="m_Like_2">';
						if(v.Mr_like == 1){
							str += '<a href="#" class="mypage_LikeBottom">찜풀기</a><b>'+v.Mre_no+'</b>';	
						}
						
						str += '	</div>';
						str += '</li>';				
					}) 
				}	                                                                      
	
				$('.mypage_boxLike_span').html(str);	
			
		},
		error: function(xhr){
			if(xhr.status == 500){ 
				alert("로그인 상태가 아닙니다.");
				location.href = "../index.jsp" 
				
				}
		},
		dataType: 'json'
	})
	
	
	
	
	
	//찜풀기
	$('.mypage_boxContain').on('click','.mypage_LikeBottom', function(){
			
			number_no = $(this).next().text();
			number_no_sli = number_no.slice(0,1);
			
			
			if(number_no_sli == "M" || number_no_sli == "m"){
				
					$.ajax({
				
						
						url: '/cumtrip/MypageLikejjim.do',
						data: { "number_no" :  number_no },
						type: 'get',
						success: function(res){
							if(res.sou == "1"){
								alert("찜풀기 성공");
								location.href= "mypage_like.jsp";	
							}else{
								alert("찜풀기 실패");
							}
							
							
							
						},
						error: function(xhr){
							if(xhr.status == 500){ 
								alert("로그인 상태가 아닙니다.");
								location.href = "../index.jsp" 
								
								}
						},
						dataType: 'json'
					})
			
							
			}
			if(number_no_sli == "S" || number_no_sli == "s"){
				
					$.ajax({
				
						
						url: '/cumtrip/MypageLikejjim.do',
						data: { "number_no" :  number_no },
						type: 'post',
						success: function(res){
							if(res.sou == "1"){
								alert("찜풀기 성공");
								location.href= "mypage_like.jsp";
							}else{
								alert("찜풀기 실패");
							}
							
								
							
						},
						error: function(xhr){
							if(xhr.status == 500){ 
								alert("로그인 상태가 아닙니다.");
								location.href = "../index.jsp" 
								
								}
						},
						dataType: 'json'
					})
			}

	})
	
	
	
	
	
	
})