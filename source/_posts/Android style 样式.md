---
title: Android style 样式应用学习
tags:
  - Android
abbrlink: 21da5cff
date: 2017-05-09 12:47:11
---

```xml
<!--透明状态栏 19及以上-->
<item name="android:windowTranslucentStatus">true</item>
<!--透明导航栏 19及以上-->
<item name="android:windowTranslucentNavigation">true</item>
<!--标题栏颜色-->
<item name="colorPrimary">@color/colorPrimary</item>
<!--状态栏颜色-->
<item name="colorPrimaryDark">@color/colorPrimary</item>
<!--强调色，一些控件和游标的颜色-->
<item name="colorAccent">@color/colorPrimary</item>
<!--是否半透明-->
<item name="android:windowIsTranslucent">true</item>
```

### 应用一：修改状态栏颜色

当 values 文件夹和 values-v19 文件夹中存在相同命名的 style，最后会采用最接近设备 API 的版本，如我的手机 API 19，会采用 values-v19 中的样式，而不采用 values 中的样式