# health_system
Web APP for palm health

需要修改的配置信息：<br/>
1.index.php 的 SITE_URL 设置为你的ip地址<br/>
2.Common/Conf/config.php 设置数据库的信息
3.helthSystem/js/common.js 设置IP信息
4.doctorsystem/js/common.js 设置IP信息
5.Connector/Controller/UserController 设置融云token
6.Connector/Controller/DocController 设置融云token
7.Connector/Sms/Include/config.phh 设置短信验证码的token
8.Connector/Sms/forgetpwd.php 设置数据库连接信息
9.Connector/Sms/industrySMS.php 设置数据库连接信息
10.Connector/push/push_user_chufang.php 设置个推APPKEY,数据库连接信息
11.Connector/push/push_user.php 设置个推APPKEY,数据库连接信息
12.Connector/push/push_doc.php 设置个推APPKEY,数据库连接信息
