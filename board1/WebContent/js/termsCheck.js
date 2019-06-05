/**
 * 		날짜 : 2019/05/15
 * 		
 * 		내용 : 약관 동의 체크 여부
 */


$(document).ready(function(){									//window 브라우저 객체     일반적으론 document를 많이 씀
				
				
				
				
				$('.btnNext').click(function(){									//click 이벤트  function() 핸들러	()는 함수
					//alert('다음 클릭!!!');										//function()은 변수에 담아서 사용하는 함수 
					
					var chk1 = $('input[name=chk1]').is(':checked');
					var chk2 = $('input[name=chk2]').is(':checked');
																			
					/*
					//동의체크가 체크 되었을때
					if(chk1 && chk2) {
						
						return true;
						
					} else {
						
						alert('약관에 동의 체크를 해주세요.');
						//a태그의 링크이동 취소
						return false;
					}
					*/
					
					if(!chk1) {
						alert('이용약관에 동의 체크를 해주세요.');
						
						//a태그의 링크이동 취소
						return false;
					}else if(!chk2){
						alert('개인정보 취급방침 동의 체크를 해주세요.');
						
						//a태그의 링크이동 취소
						return false;
					}else {
						//a태그의 링크이동
						return true;
					}
						
				
				
				
				
				
					//a 태그의 링크이동 취소
					return false;				
				});								
				
				
				
				
				
			});			