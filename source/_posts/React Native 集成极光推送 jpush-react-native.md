---
title: React Native 集成极光推送 jpush-react-native
tags:
  - React Native
abbrlink: 9437166e
date: 2017-06-22 21:35:43
---

## 概述
[jpush-react-native][jpush-react-native] 是极光推送官方开发的 React Native 版本插件，可以快速集成推送功能。现在最新版本的 JPush SDK 分离了 JPush 及 JCore，让开发者可以分开集成 JMessage 及 JPush（以前 JMessage 包含了 JPush）。

我没有 mac 设备，所以只说 Android 的配置。

<!-- more -->

## 安装
打开终端，进入项目文件夹，执行以下命令：

```bash
$ npm install jpush-react-native --save
# jpush-react-native 1.4.2 版本以后需要同时安装 jcore-react-native
$ npm install jcore-react-native --save 
```

## 配置

### 1. 自动配置部分

官方：

```bash
$ react-native link
```

作者推荐：
```bash
# 针对性的link，避免之前手动配置的其它插件重复配置造成报错
$ react-native link jpush-react-native
$ react-native link jcore-react-native
```

执行完 link 项目后可能会出现报错，这没关系，需要手动配置一下 build.gradle 文件。

### 2. 手动配置部分
在 Android Studio 中打开你的项目，然后找到 app 或者你自己定义的需要集成 jpush-react-native 的模块，打开此模块下的 build.gradle 文件，做以下改动：
> project/android/app/build.gradle

```groovy
android {
    ...
    defaultConfig {
        applicationId "yourApplicationId" // 此处改成你在极光官网上申请应用时填写的包名
        ...
        manifestPlaceholders = [
                JPUSH_APPKEY: "yourAppKey", //在此替换你的 APPKey
                APP_CHANNEL: "developer-default"    //应用渠道号, 默认即可
        ]
    }
}
...
dependencies {
    compile fileTree(dir: "libs", include: ["*.jar"])
    compile project(':jpush-react-native')  // 添加 jpush 依赖
    compile project(':jcore-react-native')  // 添加 jcore 依赖
    compile "com.facebook.react:react-native:+"  // From node_modules
}
```

检查 android 项目下的 settings.gradle 配置有没有包含以下内容：
> project/android/settings.gradle

```groovy
include ':app', ':jpush-react-native', ':jcore-react-native'
project(':jpush-react-native').projectDir = new File(rootProject.projectDir, '../node_modules/jpush-react-native/android')
project(':jcore-react-native').projectDir = new File(rootProject.projectDir, '../node_modules/jcore-react-native/android')
```

检查一下 app 下的 AndroidManifest 配置，有没有增加 \<meta-data\> 部分。
> project/android/app/AndroidManifest.xml

```xml
<application
    ...
    <!-- Required . Enable it you can get statistics data with channel -->
    <meta-data android:name="JPUSH_CHANNEL" android:value="${APP_CHANNEL}"/>
    <meta-data android:name="JPUSH_APPKEY" android:value="${JPUSH_APPKEY}"/>

</application>
```
现在重新 sync 一下项目，应该能看到 jpush-react-native 以及 jcore-react-native 作为 android Library 项目导进来了。

![](http://upload-images.jianshu.io/upload_images/1745101-4eb12666d3d3099f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

接下来加入 JPushPackage

* RN 0.29.0 以下版本

打开 app 下的 MainActivity，在 ReactInstanceManager 的 build 方法中加入 JPushPackage：
> project/android/app/MainActivity.java

![](https://github.com/KenChoi1992/SomeArticles/raw/master/screenshots/plugin3.png)

* RN 0.29.0 以上版本

打开 app 下的 MainApplication.java 文件，然后加入 JPushPackage，[参考 demo](https://github.com/jpush/jpush-react-native/blob/master/example/android/app/src/com/pushdemo/MainApplication.java)：

```java
    // 设置为 true 将不弹出 toast
    private boolean SHUTDOWN_TOAST = false;
    // 设置为 true 将不打印 log
    private boolean SHUTDOWN_LOG = false;

    private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {

        @Override
        protected boolean getUseDeveloperSupport() {
            return BuildConfig.DEBUG;
        }

        @Override
        protected List<ReactPackage> getPackages() {
            return Arrays.<ReactPackage>asList(
                    new MainReactPackage(),
                    new JPushPackage(SHUTDOWN_TOAST, SHUTDOWN_LOG)
            );
        }
    };
```

然后在 MainActivity 中加入一些初始化代码即可：
> project/android/app/src/java/.../MainActivity.java

```java
public class MainActivity extends ReactActivity {
    ...
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        JPushInterface.init(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        JPushInterface.onPause(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        JPushInterface.onResume(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
```

这样就完成了所有的配置。接下来就可以在 JS 中调用插件提供的 API 了。

## 使用

```js
import JPushModule from 'jpush-react-native';

...

componentDidMount() {
     // 新版本必需写回调函数
    // JPushModule.notifyJSDidLoad();
    JPushModule.notifyJSDidLoad((resultCode) => {
      if (resultCode === 0) {}
    });   
    // 接收自定义消息
    JPushModule.addReceiveCustomMsgListener((message) => {
      this.setState({pushMsg: message});
    });
    // 接收推送通知
    JPushModule.addReceiveNotificationListener((message) => {
      console.log("receive notification: " + message);
    });
    // 打开通知
    JPushModule.addReceiveOpenNotificationListener((map) => {
      console.log("Opening notification!");
      console.log("map.extra: " + map.extras);
      // 可执行跳转操作，也可跳转原生页面
      // this.props.navigation.navigate("SecondActivity");
    });
  }

  componentWillUnmount() {
    JPushModule.removeReceiveCustomMsgListener();
    JPushModule.removeReceiveNotificationListener();
  }
```

更多高级应用查看[官方说明][jpush-api]


[jpush-react-native]: https://github.com/jpush/jpush-react-native
[jpush-api]: https://github.com/jpush/jpush-react-native#api