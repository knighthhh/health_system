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
> 该系统实现了找医生，找医院，实时在线问诊，开处方，建立用户健康档案等功能。主要特色在于患者与医生能够一对一快速咨询问诊，患者建立自身的健康档案。 该系统涉及的内容有推荐算法的实现，短信验证码，地图，实时聊天和APP推送等功能，支持跨平台多终端使用，均为web app，包括安卓患者版app，安卓医生版app，IOS居民版app，IOS医生版app，web后台管理系统。<br/>

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
