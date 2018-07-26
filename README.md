# 掌上健康系统（health_system）
### 目录 
<ul>
  <li><a href="#introduce">系统介绍</a></li>
  <li><a href="#system">环境要求</a></li>
  <li><a href="#use">相关配置</a></li>
  <li><a href="#theory">相关讲解</a></li>
  <li><a href="#example">使用注意事项</a></li>
  <li><a href="#other">其他</a></li>
</ul>

#
### <div id="introduce"/>1. 系统介绍</div>
> 该系统是基于ThinkPHP和MUI开发的web app项目，实现了找医生，找医院，实时在线问诊，开处方，建立用户健康档案等功能。主要特色在于患者与医生能够一对一快速咨询问诊，患者建立自身的健康档案。 该系统涉及的内容有推荐算法的实现，短信验证码，地图，实时聊天和APP推送等功能，支持跨平台多终端使用，均为web app，包括安卓患者版app，安卓医生版app，IOS居民版app，IOS医生版app，web后台管理系统。<br/>

#
### <div id="system"/>2. 环境要求</div>
> • apache2 <br/>
> • MySQL 5.6 <br/>
> • ThinkPHP 3.2.0 <br/>
> • MUI 前端框架 <br/>
> • HBuilder 集成开发环境 <br/>

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
### <div id="theory"/>4. 相关讲解</div>
> 1） 系统结构：功能结构见图4-1，文件结构见图4-2 <br/>
<p align="center">
      <img src="https://github.com/knighthhh/outil/blob/master/images/health_system/gongneng.png"/><p align="center">4-1 功能结构</p>
</p>
<p align="center">
      <img src="https://github.com/knighthhh/outil/blob/master/images/health_system/jiegou.png"/><p align="center">4-2 文件结构</p>
</p>

> 2） 推荐算法：使用的是基于用户的协同过滤推荐算法，对不同的患者进行个性化的推荐医生，为患者提供更符合他需求的医生（参考https://blog.csdn.net/moakun/article/details/80704562 ）<br/>

> 3） 相关SDK的调用： 短信验证码使用秒嘀科技，地图为百度地图，实时聊天使用融云，APP推送为个推

> 4） 患者版APP首页如图4-3：<br/>
<p align="center">
      <img src="https://github.com/knighthhh/outil/blob/master/images/health_system/shouye.jpg"/><p align="center">4-3 首页</p>
</p>
      
> 5） 后台管理系统如图4-4：<br/>
<p align="center">
  <img src="https://github.com/knighthhh/outil/blob/master/images/health_system/houtai.png"/><p align="center">4-4 后台管理系统</p>
</p>

#
### <div id="example"/>5. 使用注意事项</div>
> 1）目前打包发行只支持安卓版，IOS需要相关开发者证书，可以体验我打包好的患者版APP（user20180723.apk），医生版APP（doc20180723.apk）<br/>

> 2）后台访问 http://你的IP地址/health_system/management/Application/index.php 输入账号密码即可(manager表)



#
### <div id="other"/>6. 其他</div>
> 该系统为大三时参加大学生软件外包大赛的项目，特别感谢与姚同学，王同学，张同学的合作。 <br/>

> 如果该文对您有所帮助，可以给个星或者打赏一下~ <br/>
<div>
  <div>
     <img width="200px" height="200px" src="http://hhhgo.cn/img/wechatimg.jpg"/>
     <img width="200px" height="200px" src="http://hhhgo.cn/img/alipayimg.jpg"/> 
  </div>
  <div>
     　　　　　微信　　　　　　　　　　支付宝
  </div>
</div>
