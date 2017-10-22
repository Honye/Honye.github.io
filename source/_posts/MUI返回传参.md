---
title: MUI返回传参
tags:
  - MUI
abbrlink: 8a8d53c0
date: 2017-02-05 10:40:09
---

从a页面跳转到b页面，从b页面返回到a页面时向a页面传递一个参数，a页面接收到参数后做出响应
**a.html**
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <script src="js/mui.min.js"></script>
    <link href="css/mui.min.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
      	(function($) {
	      	function plusReady() {
	      		mui('body').on('tap', '.jump', function() {
	      			mui.openWindow({
	      				url: 'b.html',
	      				id: 'b'
	      			});
	      		});
	      	}
	      	
//	      	if(window.plus) {
//	      		alert("准备好了");
//	      		plusReady();
//	      	} else {
//	      		alert("未准备");
	      		document.addEventListener('plusready', plusReady, false);
//	      	}
	      	
	      	// 返回回来要执行的方法
	      	function backRes(e) {
	      		var val = e.detail.inputVal;
	      		$('.a1 font')[0].innerHTML = val;
	      	}
	      	
	      	// 自定义窗体事件 doit要和b页面定义的事件一致
	      	window.addEventListener('doit', backRes);
	      	
		})(mui);
    </script>
</head>
<body style="padding: 15px;line-height: 1.7rem;">
	<a class="jump">跳转到B页面</a>
	<div class="a1">返回传参为----<font style="font-size: 20px;color: #2AC845;"></font></div>
	<div style="font-size: 50px;text-align: center;display: block;margin: 50px 0 0 0;">a.html页面</div>
</body>
</html>
```

<!-- more -->

**b.html**
```html
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="css/mui.min.css" rel="stylesheet" />
	</head>

	<body style="padding: 15px;line-height: 1.7rem;">
		<input type="text" id="text" />
		<a href="javascript:void(0)" class="jump">返回</a>
		<div style="font-size: 50px;text-align: center;display: block;margin: 50px 0 0 0;">b.html页面</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
			(function($) {
				if(window.plus) {
					plusReady();
				} else {
					document.addEventListener('plusready', plusReady, false);
				}
				function plusReady() {
					mui('body').on('tap', '.jump', function() {
						var view = plus.webview.getWebviewById('HBuilder');
						// 注意HBuilder是上个页面的ID你自己要替换掉
						mui.fire(view, 'doit', {
							inputVal: $('#text')[0].value
						});
						mui.back();
					});
				}
			})(mui);
		</script>
	</body>
</html>
```