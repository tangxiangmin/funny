# flutter_app

这是一个Flutter练手项目，主要用来实现一个笑话段子的app，并整理学习和使用flutter中遇见的一些问题。


## 语法
flutter采用[Dart](http://dart.goodev.org/)作为开发语言，这门语言使用起来比较有趣。

## 遇见的问题

### 解析JSON
解析json时报错
> Unhandled exception: type 'List<dynamic>' is not a subtype of type 'List<JokeModel>'
```dart
static List<JokeModel> fromJson(String data) {
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