/**
* 메인 슬라이더 이미지 애니메이션
*/
$(function(){

  var li = $('.slider > ul > li');
  var i  = 0;

  setInterval(function(){

    li.eq(i).animate({'left': '-100%'}, 1000, 'linear');
    i++;
    if(i == 3){
      i = 0;
    }
    li.eq(i).css('left', '100%').animate({'left': '0'}, 1000, 'linear');

  }, 1000*5);

});
