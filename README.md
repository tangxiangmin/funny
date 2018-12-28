# flutter_app

这是一个Flutter练手项目，主要用来实现一个笑话段子的app，并整理学习和使用flutter中遇见的一些问题。


## 语法
flutter采用[Dart](http://dart.goodev.org/)作为开发语言，这门语言使用起来比较有趣。



## 生命周期

flutter是有生命周期的，大致生命周期可以分为
- initState : 初始化widget的时候调用，只会调用一次。
- build : 初始化之后开始绘制界面，当setState触发的时候会再次被调用
- didUpdateWidget : 当触发setState时，会被调用
- dispose : 页面销毁的时候调用

不同的生命钩子函数中可以做对应的逻辑处理，比如`initState`就可以用作数据初始化等操作

## 网络
网络请求可以直接使用http库进行
```dart
import 'package:http/http.dart' as http;

http.get("http://localhost:7654/jokeList/").then((http.Response response) {
    var res = response.body;
}
```

## 遇见的问题
下面是遇见的一些问题，按时间倒序排列
### 手写Model太麻烦了
比较容易出错，可以使用[json_serializable](https://caijinglong.github.io/json2dart/index_ch.html)这个工具。

### ListView滑动感觉比较卡顿
这个是因为安装的debug的缘故，安装release包就可以体验如丝般顺滑的体验。
```
flutter build ios --release
```
然后`open ios/Runner.xcworkspace`将release包安装在手机上即可

### 包引入路径错误导致代码报错
```
import 'package:flutter_app/app/view//detail.dart';
```
上面面路径多写了一个`/`，导致无法调用正确的构造函数
> No top-level method '' declared. Receiver: top-level，Tried calling: (12333)

这里原本调用的是
```dart
new TextDetailPage(12333)
```

但是奇怪的是调整该模块的构造函数，不传递参数，则又调用正常了
### flutter命令被阻塞
在使用`flutter doctor`或者打包iOS真机包的时候遇见提示
> Waiting for another flutter command to release the startup lock

在使用了flutter命令或者程序异常退出后，可能会出现这种提示，这时需要等待其他flutter命令执行完毕，或者手动删除`<YOUR FLUTTER FOLDER>/bin/cache/lockfile`文件

### 本地图片资源加载失败
原来本地图片需要在`pubsepc.yaml`中进行声明

```
flutter:
  assets:
    - assets/img/ic_main_tab_company_pre.png
    - assets/img/ic_main_tab_my_pre.png
```

参考
* [在Flutter中添加资源和图片](https://flutterchina.club/assets-and-images/#from-packages)

### 解析JSON

解析json时报错
> Unhandled exception: type 'List<dynamic>' is not a subtype of type 'List<JokeModel>'
```dart
static List<JokeModel> fromJson(String data) {
    // 这里还需要注意 dart:io包里面的json是小写了，之前找到有示例代码是JSON会提示undefined
    return json.decode(data)['data']
        .map((obj) => JokeModel.fromMap(obj))
        .toList();
}
```
这是因为默认map解析的List类型是List<dynamic>，解决办法是指定map类型

```dart
static List<JokeModel> fromJson(String data) {
    return json.decode(data)['data']
        .map<JokeModel>((obj) => JokeModel.fromMap(obj))
        .toList();
}
```
参考：
* [issue#17008](https://github.com/flutter/flutter/issues/17008)

### 安装到iPhone真机

首先需要配置环境变量啥的，以及XCode。
```
brew update
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
```
然后进行下面流程：

切换到项目目录，
```
open ios/Runner.xcworkspace
```

此时会打开xcode的runner，配置好开发证书，使用数据线连接iPhone真机

然后左上角，选择运行目标为Device->iPhone，点击运行，进行安装

稍等片刻，就能在手机上看见安装的app了~

## 相关参考
* [flutter文档](https://flutter.io/)
* [Flutter TextField详解 | 掘金技术征文](https://juejin.im/post/5b6bdb406fb9a04f89785cb5)
* [Dart中解析JSON](https://juejin.im/post/5b5d782ae51d45191c7e7fb3)