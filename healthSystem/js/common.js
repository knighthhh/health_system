
//document.write('<script language="javascript" src="./vue.min.js"></script>');

var serverName = '127.0.0.1:80';

//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
