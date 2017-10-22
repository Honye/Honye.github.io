---
title: JS 实现倒计时
tags:
  - JavaScript
abbrlink: 2883d964
date: 2017-03-21 13:58:21
---

### 利用 window.setInterval() 实现倒计时

#### *示例：*

```javascript
var id;
var interval = 1000; 

/**
 * @param year 结束日期的年
 * @param month 结束日期的月
 * @param day 结束日期的日
 * @param divname 需做出响应的元素id
 */
function ShowCountDown(year,month,day,divname) { 
	// 设置结束日期
	var endDate = new Date(year, month-1, day); 
	// 获取当前日期
	var now = new Date(); 
	// 计算剩余毫秒数
	var leftTime=endDate.getTime()-now.getTime(); 
	// 计算剩余秒数
	var leftsecond = parseInt(leftTime/1000); 
	// 剩余天数（整数倍）
	var day1=Math.floor(leftsecond/(60*60*24)); 
	// 剩余小时数（除去大单位后整数倍）
	var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
	// 剩余分钟数（除去大单位后整数倍）
	var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
	// 剩余秒数（除去大单位后整数倍）
	var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 

	var cc = document.getElementById(divname); 
	cc.innerHTML = "距离" + year + "年" + month + "月" + day + "日还有：" + day1 + "天" + hour + "小时" + minute + "分" + second + "秒"; 
} 

/**
 * 开始倒计时
 */
function start(){
	id = window.setInterval( function() {

			ShowCountDown(2023,8,7,'divdown1');

		}, interval); 
}

/**
 * 停止倒计时
 */
function stop(){
	if (id) {
		window.clearInterval(id);
	}
}		
```
<!-- more -->
### window.setInterval() 注解

#### 1. `window.setInterval()`

**功能：** 
按照指定的周期（以毫秒计）来调用函数或计算表达式。
**语法：** 
`setInterval(code,millisec)`
**参数：** 
code: 在定时时间到时要执行的JavaScript代码串。
millisec: 设定的定时时间，用毫秒数表示。
**返回值：**
定时器的ID值，可用于clearInterval()方法停止指定的定时器。
**注：**
setInterval()方法会不停地调用函数，直到用clearInterval()终止定时或窗口被关闭。

#### 2. `window.clearInterval()`

**功能：** 
取消由 setInterval() 方法设置的定时器。
**语法：** 
`clearInterval(id_of_setinterval)`
**参数：** 
id_of_setinterval: 由 setInterval() 返回的 id 值。该值标识了一个 setInterval 定时器。
也就是：window.setInterval() 返回的就是 window.clearInterval() 的参数