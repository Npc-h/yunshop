# yunshop
 一、开发前的环境准备
 ===
1 使用eclipse+jdk1.8+web3.0+tomcat7+mysql5.5(5.6)
---
2、JAR包的准备
---
3、配置文件的准备(使用c3p0-config.xml配置mysql)
---
二、功能模块
===
用户模块
---
# 1．用户注册功能
发送邮件 激活用户 (接第三方qq来进行发邮件验证) 表单的校验(volidate自定义验证规则进行前台表单验证，同时使用ajax异步校验用户名是否存在)
使用动态gif图验证码验证

# 2．用户的登录功能
QQ或者微博扫码登陆(后来因开发者没审核通过放弃~)
自动登录 (过滤器) 记住密码
接第三方平台使用滑块验证

# 3．用户的注销功能
## 商品模块
 首页热门商品和最新商品功能 
商品分类 商品的列表（分页）
商品详细信息 
## 个人中心模块
浏览记录功能 客服功能 修改个人信息 收藏夹功能
购物车模块 将商品加入购物车 展示购物车功能 
订单模块（多表和事务） 
在线支付(使用支付宝沙箱模拟)

后台的分类的模块
===
分类信息的增加改查后台的商品模块商品的信息的增加改查（文件上传）后台的订单的模块所有的订单的信息展示

# 4．项目预览
  www.yangjunsi.top
