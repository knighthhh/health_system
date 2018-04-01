(function($,doc){
	var Weeks=['日','一','二','三','四','五','六'];
    //获取月份总天数
    function getDaysOfMonth(year,month){
    	var days;//当月的天数；
		if(month == 2){//当月份为二月时，根据闰年还是非闰年判断天数
	        days= year % 4 == 0 ? 29 : 28;
	    }
	    else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
	        //月份为：1,3,5,7,8,10,12 时，为大月.则天数为31；
	        days= 31;
	    }else{//其他月份，天数为：30.
	        days= 30;
	    }
	    return days;
    }
    
	//获取指定月份星期
	function getWeekOfDay(year,month,day){
		return new Date(year,month,day).getDay();
	}
	//获取日历内容
	function getCalendarByYearMonth(year,month,day,flag){
		if(!flag){
			day=1;
		}
		var date=new Date(year,month,day);
		var calendarDay={
			year:year,
			month:month,
			today:day
		};
		var days=getDaysOfMonth(year,month);		
		//获取当月1号星期几
		var firstWeekDay=getWeekOfDay(calendarDay.year,calendarDay.month-1,1);
		var weeks=Math.ceil(days+firstWeekDay);
		var html='';
		for(var i=0,j=1;i<(days+firstWeekDay);i++){
			if(i%7==0){
				html+='<div class="mui-row calendar-day">';
			}
			if(i<firstWeekDay){
				html+='<div></div>';
			}else{
				if(flag&&j==day){
					html+='<div id="today" xid="'+j+'">今天</div>';
				}else{
					html+='<div xid="'+j+'">'+j+'</div>';
				}
				j++;
			}
			if(i%7==6){
				html+='</div>'
			}
		}
		return html;
	};
	
	function _pullLeftMonth(_callback){
		if(mui(".mui-icon-arrowright").length==0){
			var pullRight=doc.createElement('div');
			pullRight.className='mui-icon mui-icon-arrowright mui-pull-right';
			pullRight.style.lineHeight='35px';
			document.getElementsByClassName("calender-title")[0].appendChild(pullRight);
		}
		var monthtext=mui("#title")[0].innerText;
  		var yl= monthtext.lastIndexOf('年');
  		var ml=monthtext.lastIndexOf('月');
  		var year=parseInt(monthtext.substring(0,yl));
  		var month=parseInt(monthtext.substring(yl+1,ml));
  		if(month==1){
  			year=year-1;
  			month=12;
  		}else{
  			month=month-1;
  		}
  		mui("#title")[0].innerText=year+"年"+month+'月';
  		mui("#title")[0].setAttribute('xid',year+'-'+month);
  		var dayHtml=getCalendarByYearMonth(year,month,1,false);
		mui(".calendar-day").each(function(){
			this.remove();
		})
  		document.getElementsByClassName("calendar-date")[0].innerHTML+=dayHtml;
  		if(typeof _callback=='function'){
			_callback(year,month);
		}
	};
		
	function _pullRightMonth(_callback){
		var monthtext=mui("#title")[0].innerText;
  		var yl= monthtext.lastIndexOf('年');
  		var ml=monthtext.lastIndexOf('月');
  		var year=parseInt(monthtext.substring(0,yl));
  		var month=parseInt(monthtext.substring(yl+1,ml));
  		if(month==12){
  			year=year+1;
  			month=1;
  		}else{
  			month=month+1;
  		}
  		mui("#title")[0].innerText=year+"年"+month+'月';
  		mui("#title")[0].setAttribute('xid',year+'-'+month);
  		var flag=false;
  		var day=1;
  		if(month==(new Date().getMonth()+1)&&year==(new Date().getFullYear())){
  			mui(".mui-icon-arrowright")[0].remove();
  			flag=true;
  			day=new Date().getDate();
  		}
  		var dayHtml=getCalendarByYearMonth(year,month,day,flag);
  		mui(".calendar-day").each(function(){
			this.remove();
		})
  		document.getElementsByClassName("calendar-date")[0].innerHTML+=dayHtml;
  		if(typeof _callback=='function'){
			_callback(year,month);
		}
	};

	$.fn.calendar=function(options,callback){
		options=$.extend($.fn.calendar.defaults,options);
		//遍历选择的元素
		this.each(function(i, element) {
			var dayHtml=getCalendarByYearMonth(options["year"],options["month"],options["today"],options["curMonth"]);
			var calendarBox='<div class="calendar-box">';
			calendarBox+='<div class="calender-title"><div class="mui-icon mui-icon-arrowleft mui-pull-left" style="line-height: 35px;"></div>';
			calendarBox+='<span id="title" xid="'+options["year"]+'-'+options["month"]+'">'+options["year"]+'年'+options["month"]+'月</span></div>';
			calendarBox+='<div class="calendar-date"><div class="mui-row calendar-week">';
			for(var i=0;i<Weeks.length;i++){
				calendarBox+='<div>'+Weeks[i]+'</div>';
			}
			calendarBox+='</div>'+dayHtml;
			calendarBox+='</div></div>';
			document.getElementById(element.id).innerHTML=calendarBox;
			
			$(".calender-title").on('tap',".mui-pull-left",function(){
				_pullLeftMonth(callback);
			});
			
			$(".calender-title").on('tap',".mui-pull-right",function(){
				_pullRightMonth(callback);
			});
			
			if(typeof callback=='function'){
				callback(options["year"],options["month"]);
			}
		});
	}
	
	var date=new Date();
	$.fn.calendar.defaults={
		year:date.getFullYear(),//当前年
		month:date.getMonth()+1,//当前月
		today:date.getDate(),//当前天
		curMonth:true //当前月
	};
	
	
})(mui,document);
