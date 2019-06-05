/**
 * 		날짜 : 2019/05/14
 * 		
 * 		내용 : 사용자 아이디, 이메일, 닉네임, 휴대폰 중복체크
 */


/*	
			var doc = $(document);				//jquery = $ 
			doc.ready(function(){});			//이벤트 함수
			
			$(document).ready(function(){});
		*/	
		// 이 세개 다 같음 줄여서 쓰는걸 좋아하기 때문에 줄여서 씀
			$(function(){
				
				//아이디 필드에 포커스가 빠져나갈 때 실행되는 이벤트 함수 
				$('input[name=id]').focusout(function(){		//$() css선택자       이벤트 함수
			
					//alert('포커스 아웃');
					var tag = $(this);
					var uid = tag.val();								//$(this)=자기자신('input[name=id]')	
				
					//AJAX통신(부분통신) 시작 
					$.ajax({										//. 참조연산자
						url:'./proc/checkUid.jsp?uid=' + uid,		//서버 주소	
						type:'get',									//get또는 cost ?니까 get   
						dataType:'json',							//제이슨 으로 만들어서 보냄
						success:function(data){						//url 주소에 요청해서 어떻게 받을것이냐 (key value) (결과값)
							
							//alert(data.result);
							
							if(data.result == 1){
								$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
								tag.focus();
							
							}else {
								$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
							}
							
						}		
						
					});								
					
				});	
				
				//닉네임 중복체크
				//아이디 필드에 포커스가 빠져나갈 때 실행되는 이벤트 함수 
				$('input[name=nick]').focusout(function(){		//$() css선택자       이벤트 함수
			
					//alert('포커스 아웃');
					var tag = $(this);
					var nick = tag.val();								//$(this)=자기자신('input[name=id]')	
				
					//AJAX통신(부분통신) 시작 
					$.ajax({										//. 참조연산자
						url:'./proc/checkNick.jsp?nick=' + nick,		//서버 주소	
						type:'get',									//get또는 cost ?니까 get   
						dataType:'json',							//제이슨 으로 만들어서 보냄
						success:function(data){						//url 주소에 요청해서 어떻게 받을것이냐 (key value) (결과값)
							
							//alert(data.result);
							
							if(data.result == 1){
								$('.resultNick').css('color', 'red').text('이미 사용중인 별명 입니다.');
								tag.focus();
							
							}else {
								$('.resultNick').css('color', 'green').text('사용 가능한 별명 입니다.');
							}
								
						}		
						
					});								
					
				});	
				
				//이메일 중복체크
				$('input[name=email]').focusout(function(){

					var tag = $(this);
					var email = tag.val();
				
					//AJAX통신(부분통신) 시작 
					$.ajax({										
						url:'./proc/checkEmail.jsp?email=' + email,		
						type:'get',									  
						dataType:'json',							
						success:function(data){	
							
							if(data.result == 1){
								$('.resultEmail').css('color', 'red').text('이미 사용중인 EMAIL 입니다.');
								tag.focus();
							
							}else {
								$('.resultEmail').css('color', 'green').text('사용 가능한 EMAIL 입니다.');
							}
								
						}		
						
					});								
					
				});
				
				//휴대폰 중복체크
				
				$('input[name=hp]').focusout(function(){

					var tag = $(this);
					var hp = tag.val();
				
					//AJAX통신(부분통신) 시작 
					$.ajax({										
						url:'./proc/checkHp.jsp?hp=' + hp,		
						type:'get',									  
						dataType:'json',							
						success:function(data){	
							
							if(data.result == 1){
								$('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰 입니다.');
								tag.focus();
							
							}else {
								$('.resultHp').css('color', 'green').text('사용 가능한 휴대폰 입니다.');
							}
							
						}		
						
					});								
					
				});
				
			});