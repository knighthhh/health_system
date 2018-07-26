# 掌上健康系统（health_system）
### 目录 
<ul>
  <li><a href="#introduce">系统介绍</a></li>
  <li><a href="#system">环境要求</a></li>
  <li><a href="#use">相关配置</a></li>
  <li><a href="#theory">实现原理</a></li>
  <li><a href="#example">使用注意事项</a></li>
  <li><a href="#other">其他</a></li>
</ul>

#
### <div id="introduce"/>1. 系统介绍</div>
> • python3 <br/>

#
### <div id="system"/>2. 环境要求</div>
> • python3 <br/>


#
### <div id="use"/>3. 相关配置</div>
> 1.数据库配置：新建healthsystem数据库，并导入healthsystem.sql文件<br/>

> 2.系统后台配置：<br/>
>> management/Application/index.php => SITE_URL 设置为你的ip地址<br/>
>> management/Application/Common/Conf/config.php =>  设置数据库的信息<br/>
>> management/Application/Connector/Controller/UserController => 设置患者版融云聊天token<br/>
>> management/Application/Connector/Controller/DocController =>  设置医生版融云聊天token<br/>
>> management/Application/Connector/Controller/Sms/Include/config.php => 设置短信验证码的token<br/>
>> management/Application/Connector/Controller/Sms/forgetpwd.php =>  找回密码短信验证码的数据库连接信息<br/>
>> management/Application/Connector/Controller/Sms/industrySMS.php =>  设置数据库连接信息<br/>
>> management/Application/Connector/Controller/push/push_user_chufang.php =>  个推APPKEY,数据库连接信息<br/>
>> management/Application/Connector/Controller/push/push_user.php =>   患者版个推APPKEY,数据库连接信息<br/>
>> management/Application/Connector/Controller/push/push_doc.php =>   医生版个推APPKEY,数据库连接信息<br/>

> 3.患者版APP配置：<br/>
>> helthSystem/js/common.js 设置为你的ip地址<br/>

> 4.医生版APP配置：<br/>
>> doctorsystem/js/common.js 设置为你的ip地址<br/>

#
### <div id="theory"/>4. 实现原理</div>
> 1） 全用户爬取原理：根据微博用户的粉丝数和关注数，来一直递归循环获取所有的用户（起始用户的粉丝又有本身自己的粉丝，所以可以一直获取，0关注的用户则爬取不到）

> 2） 架构原理图如图2-1：<br/>
<p align="center">
      <img src="https://github.com/knighthhh/outil/blob/master/images/weibo_user_info/theory.png"/><p align="center">2-1 架构图</p>
</p>
      
> 3） 分析原理：对应的微博分析图如下：
<p align="center">
  <img src="https://github.com/knighthhh/outil/blob/master/images/weibo_user_info/profile.jpg"/><p align="center">3-1 用户主页</p><br/>
</p>

#
### <div id="example"/>5. 使用注意事项</div>
> 1）目前打包发行只支持安卓版，安装患者版APP（user20180723.apk），医生版APP（doc20180723.apk）



#
### <div id="other"/>6. 其他</div>
> 如果该文对您有所帮助，可以给个星或者打赏一下~
 <img width="200px" height="200px" src="http://hhhgo.cn/img/wechatimg.jpg"/>

