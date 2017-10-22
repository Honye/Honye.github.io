---
title: HBuilder 上传图片到七牛云
tags:
  - HBuilder
  - MUI
abbrlink: 99def624
date: 2017-04-06 15:34:39
---

HBuilder 上传支持表单上传，所以上传到七牛云的时候用的也是表单上传

```javascript
/**
 * 上传图片到七牛云
 * @param String imgPath 图片路径
 */
function uploadToQiniu(imgPath){
	// 七牛云空间域名，修改为自己的
	var domain = "http://onpzdyxr0.bkt.clouddn.com/";
	// 生成一个随机名字作为上传到七牛云后的文件名
	var randName = Math.random().toString(36).substr(2) + imgPath.match(/\.?[^.\/]+$/);
	var task = plus.uploader.createUpload(
       // 不同的存储空间上传地址可能不一样，运行后根据返回信息做更改
		"http://upload.qiniu.com/",
		{ 
			method: "POST",
			blocksize:204800,
			priority:100
		},
		function ( t, status ) {
			// 上传完成
			if ( status == 200 ) { 
				console.log( "Upload success: " + t.url );
				// 拼接出上传到去七牛云后的图片链接地址
				var imgUrl = domain + randName; 
			} else {
				console.log( "Upload failed: " + status );
			}
		}
	);
	// 添加上传文件，key 值必须是七牛云所需文件对应的 key 值 "file"
	task.addFile(imgPath,{key: "file",mime: "image/*"});
	// 上传到七牛云后文件的名字
	task.addData("key",randName);
	// 七牛云所需 token
	task.addData("token",token);
	
	task.start();
}
```

参考资料：
[七牛云表单上传官方文档 >>](http://developer.qiniu.com/kodo/manual/1272/form-upload)
[HBuilder 上传官方文档 >>](http://www.html5plus.org/doc/zh_cn/uploader.html)