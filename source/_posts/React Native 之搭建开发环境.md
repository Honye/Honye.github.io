---
title: React Native 之搭建开发环境
tags:
  - React
abbrlink: 4b0b1b34
date: 2017-05-07 19:13:28
---

> 转自: <http://reactnative.cn/docs/0.44/getting-started.html>

欢迎使用React Native！这篇文档会帮助你搭建基本的React Native开发环境。如果你已经搭好了环境，那么可以尝试一下[编写Hello World][hello]。

根据你所使用的操作系统、针对的目标平台不同，具体步骤有所不同。如果想同时开发iOS和Android也没问题，你只需要先选一个平台开始，另一个平台的环境搭建只是稍有不同。

如果阅读完本文档后还碰到很多环境搭建的问题，我们建议你还可以再看看由本站提供的环境搭建视频教程([macOS iOS][video_mac_IOS]、[macOS Android][video_mac_android]、[windows Android][video_win_android])、[windows环境搭建文字教程][video_win_envir]、以及[常见问题][problemes]。

<!-- more -->

目标平台： iOS Android 开发平台： macOS Linux Windows

## 安装
### 必需的软件
#### Chocolatey

[Chocolatey](https://chocolatey.org/)是一个Windows上的包管理器，类似于linux上的yum和 apt-get。 你可以在其[官方网站](https://chocolatey.org/)上查看具体的使用说明。一般的安装步骤应该是下面这样：

```shell
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin 
```

> 一般来说，使用Chocolatey来安装软件的时候，需要以管理员的身份来运行命令提示符窗口。译注：chocolatey的网站可能在国内访问困难，导致上述安装命令无法正常完成。请使用稳定的翻墙工具。 如果你实在装不上这个工具，也不要紧。下面所需的python2和nodejs你可以分别单独去对应的官方网站下载安装即可。

#### Python 2

打开命令提示符窗口，使用Chocolatey来安装Python 2.

> 注意目前不支持Python 3版本。

```shell
choco install python2 
```

#### Node

打开命令提示符窗口，使用Chocolatey来安装NodeJS。注意，目前已知Node 7.1版本在windows上无法正常工作，请避开这个版本！

```shell
choco install nodejs.install 
```
安装完node后建议设置npm镜像以加速后面的过程（或使用科学上网工具）。注意：不要使用cnpm！cnpm安装的模块路径比较奇怪，packager不能正常识别！

```shell
npm config set registry https://registry.npm.taobao.org --global
npm config set disturl https://npm.taobao.org/dist --global
```

#### Yarn、React Native的命令行工具（react-native-cli）

[Yarn](http://yarnpkg.com/)是Facebook提供的替代npm的工具，可以加速node模块的下载。React Native的命令行工具用于执行创建、初始化、更新项目、运行打包服务（packager）等任务。

```shell
npm install -g yarn react-native-cli 
```
安装完yarn后同理也要设置镜像源：

```shell
yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global
```

> 如果你遇到`EACCES: permission denied`权限错误，可以尝试运行下面的命令（限linux系统）： `sudo npm install -g yarn react-native-cli`.

#### Android Studio

[Android Studio](http://developer.android.com/sdk/index.html) 2.0 or higher.

React Native目前需要[Android Studio](http://developer.android.com/sdk/index.html)2.0或更高版本。

> Android Studio需要Java Development Kit [JDK] 1.8或更高版本。你可以在命令行中输入` javac -version`来查看你当前安装的JDK版本。如果版本不合要求，则可以到 [官网](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)上下载。 或是使用包管理器来安装（比如`choco install jdk8`或是` apt-get install default-jdk`）

Android Studio包含了运行和测试React Native应用所需的Android SDK和模拟器。

> 除非特别注明，请不要改动安装过程中的选项。比如Android Studio默认安装了 `Android Support Repository`，而这也是React Native必须的（否则在react-native run-android时会报appcompat-v7包找不到的错误）。

- 确定所有安装都勾选了，尤其是`Android SDK`和`Android Device Emulator`。
- 在初步安装完成后，选择`Custom`安装项：

![custom installation](http://reactnative.cn/static/docs/0.44/img/react-native-android-studio-custom-install-windows.png)

- 检查已安装的组件，尤其是模拟器和HAXM加速驱动。

![verify installs](http://reactnative.cn/static/docs/0.44/img/react-native-android-studio-verify-installs-windows.png)

- 安装完成后，在Android Studio的欢迎界面中选择`Configure | SDK Manager`。

![configure sdk](http://reactnative.cn/static/docs/0.44/img/react-native-android-studio-configure-sdk-windows.png)

- 在`SDK Platforms`窗口中，选择`Show Package Details`，然后在`Android 6.0 (Marshmallow)`中勾选`Google APIs`、`Android SDK Platform 23`、`Intel x86 Atom System Image`、`Intel x86 Atom\_64 System Image`以及`Google APIs Intel x86 Atom\_64 System Image`。

![platforms](http://reactnative.cn/static/docs/0.44/img/react-native-android-studio-android-sdk-platforms-windows.png)

- 在`SDK Tools中`，选择`Show Package Details`，然后在`Android SDK Build Tools`中勾选`Android SDK Build-Tools 23.0.1`（必须是这个版本）。然后还要勾选最底部的`Android Support Repository`.

![build tools](http://reactnative.cn/static/docs/0.44/img/react-native-android-studio-android-sdk-build-tools-windows.png)

#### ANDROID\_HOME环境变量

确保`ANDROID\_HOME`环境变量正确地指向了你安装的Android SDK的路径。

打开`控制面板` -> `系统和安全` -> `系统` -> `高级系统设置` -> `高级` -> `环境变量` -> `新建`

> 具体的路径可能和下图不一致，请自行确认。
![env variable](http://reactnative.cn/static/docs/0.44/img/react-native-android-sdk-environment-variable-windows.png)

> 你需要关闭现有的命令符提示窗口然后重新打开，这样新的环境变量才能生效。

### 推荐安装的工具
#### Gradle Daemon

开启[Gradle Daemon](https://docs.gradle.org/2.9/userguide/gradle_daemon.html)可以极大地提升java代码的增量编译速度。

```shell
(if not exist "%USERPROFILE%/.gradle" mkdir "%USERPROFILE%/.gradle") && (echo org.gradle.daemon=true >> "%USERPROFILE%/.gradle/gradle.properties") 
```

#### 将Android SDK的Tools目录添加到`PATH`变量中

你可以把Android SDK的tools和platform-tools目录添加到`PATH`变量中，以便在终端中运行一些Android工具，例如`android avd`或是`adb logcat`等。

打开`控制面板` -> `系统和安全` -> 系统 -> `高级系统设置` -> `高级` -> `环境变量` -> 选中`PATH` -> 双击进行编辑

> 注意你的具体路径可能和下图不同

![env variable](http://reactnative.cn/static/docs/0.44/img/react-native-android-tools-environment-variable-windows.png)

### 可选的安装项
#### Git

你可以使用Chocolatey来安装`git`:

```shell
choco install git 
```
另外你也可以直接去下载[Git for Windows](https://git-for-windows.github.io/)。 在安装过程中注意勾选"Run Git from Windows Command Prompt"，这样才会把`git`命令添加到`PATH`环境变量中。

#### Genymotion

比起Android Studio自带的原装模拟器，Genymotion是一个性能更好的选择，但它只对个人用户免费。

1. 下载和安装[Genymotion](https://www.genymotion.com/download)（genymotion需要依赖VirtualBox虚拟机，下载选项中提供了包含VirtualBox和不包含的选项，请按需选择）。
2. 打开Genymotion。如果你还没有安装VirtualBox，则此时会提示你安装。
3. 创建一个新模拟器并启动。
4. 启动React Native应用后，可以按下F1来打开开发者菜单。

#### Visual Studio Emulator for Android

[Visual Studio Emulator for Android](https://www.visualstudio.com/zh-cn/features/msft-android-emulator-vs.aspx#中国 (简体中文))是利用了Hyper-V技术进行硬件加速的免费android模拟器。也是Android Studio自带的原装模拟器之外的一个很好的选择。而且你并不需要安装Visual Studio。 在用于React Native开发前，需要先在注册表中进行一些修改：

1. 打开运行命令（按下Windows+R键）
2. 输入regedit.exe然后回车
3. 在注册表编辑器中找到HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Android SDK Tools条目
4. 右键点击Android SDK Tools，选择新建 > 字符串值
5. 名称设为Path
6. 双击Path，将其值设为你的Android SDK的路径。（例如C:\Program Files\Android\sdk）

## 测试安装

```shell
react-native init AwesomeProject
cd AwesomeProject
react-native run-android
```

> 提示：你可以使用`--version`参数创建指定版本的项目。例如`react-native init MyApp --version 0.39.2`。注意版本号必须精确到两个小数点。

**Windows用户请注意，请不要在命令行默认的System32目录中init项目！会有各种权限限制导致不能运行！**

### 修改项目

现在你已经成功运行了项目，我们可以开始尝试动手改一改了：

- 使用你喜欢的文本编辑器打开`index.android.js`并随便改上几行
- 按两下R键，或是用Menu键（通常是F2，在Genymotion模拟器中是`⌘+M`）打开开发者菜单，然后选择 *Reload JS* 就可以看到你的最新修改。
- 在终端下运行`adb logcat *:S ReactNative:V ReactNativeJS:V`可以看到你的应用的日志。

### 完成了！

恭喜！你已经成功运行并修改了你的第一个React Native应用。

![](http://reactnative.cn/static/docs/0.44/img/react-native-congratulations.png)

## 接下来

- 如果你想要在真机上运行应用，请参阅[在设备上运行](http://reactnative.cn/docs/0.44/running-on-device-android.html#content)。
- 如果你碰到了一些问题，请参阅[常见问题][problemes]

[github]: https://github.com/reactnativecn/react-native.cn/tree/stable/docs/docs/0.44/getting-started.md
[support]: http://reactnative.cn/about.html#%E6%8D%90%E5%8A%A9
[hello]: http://reactnative.cn/docs/0.44/tutorial.html
[video_mac_IOS]: https://ke.qq.com/webcourse/index.html#course_id=197101&term_id=100233637&taid=1220865928921581&vid=a1417i5op7k
[video_mac_android]: https://ke.qq.com/webcourse/index.html#course_id=197101&term_id=100233637&taid=1220870223888877&vid=z1417kmxask
[video_win_android]: https://ke.qq.com/webcourse/index.html#course_id=197101&term_id=100233637&taid=1220874518856173&vid=d1417tgg1ez
[video_win_envir]: http://bbs.reactnative.cn/topic/10
[problemes]: http://bbs.reactnative.cn/topic/130