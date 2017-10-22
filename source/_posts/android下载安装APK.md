---
title: Android 下载安装APK
tags:
  - Android
abbrlink: a5a9b325
date: 2017-03-29 17:11:28
---

### 下载安装包
未整理完，暂且不写，日后更新
### 安装应用
```java
/**
     * 安装 APK
     * @param activity
     * @param fileUri 安装包地址
     * fileUri = Uri.parse("file://" + filePath); 或
     * fileUri = Uri.fromFile(File file);
     */
    protected void installApk(Activity activity, Uri fileUri) {
        Intent intent = new Intent();
        //执行动作
        intent.setAction(Intent.ACTION_VIEW);
        // 如果不加无法正常显示安装过程和安装成功提示
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        //执行的数据类型
        intent.setDataAndType(fileUri, "application/vnd.android.package-archive");
        activity.startActivity(intent);
        // android.os.Process.killProcess(android.os.Process.myPid());
    }
```

[demo下载>>](http://onkk8h635.bkt.clouddn.com/android/DownInstallApk.rar)