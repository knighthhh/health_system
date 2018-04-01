//轮播图自动播放
	//mui.init();

	window.onload=function(){
		var gallery = mui('.mui-slider');
		gallery.slider({
		  interval:1500//自动轮播周期，若为0则不自动播放，默认为0；
		});
//		var speed=20
//	    demo2.innerHTML=demo1.innerHTML
//	    //console.log(demo1.innerHTML);
//	    function Marquee(){
//	    if(demo2.offsetTop-demo.scrollTop<=0)
//	    demo.scrollTop-=demo1.offsetHeight
//	    else{
//	    demo.scrollTop++
//	    }
//	    }
//	    var MyMar=setInterval(Marquee,speed)
//	    demo.onmouseover=function() {clearInterval(MyMar)}
//	    demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}


//		var speed2=30
//	   	demo5.innerHTML=demo4.innerHTML
//	   	function Marquee2(){
//	   	if(demo5.offsetTop-demo3.scrollTop<=0)
//	   	demo3.scrollTop-=demo4.offsetHeight
//	   	else{
//	   	demo3.scrollTop++
//	   	}
//	   	}
//	   var MyMar2=setInterval(Marquee2,speed2)
//	   demo3.onmouseover=function() {clearInterval(MyMar2)}
//	   demo3.onmouseout=function() {MyMar2=setInterval(Marquee2,speed2)}
//向上滚动

		
		
		var bodyHeight = document.documentElement.clientHeight || document.body.clientHeight;
			document.getElementById("box-b-a").style.height=bodyHeight*0.3+"px";
			document.getElementById("findhos").style.height=bodyHeight*0.15+"px";
			document.getElementById("finddoctor").style.height=bodyHeight*0.15+"px";
		
	}


	
