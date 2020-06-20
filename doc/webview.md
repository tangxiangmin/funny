flutter webview 参考：https://pub.dev/packages/webview_flutter#-example-tab-


ios打开网页加载白屏，需要在`info.plist`中配置
```
<key>io.flutter.embedded_views_preview</key>
<true/>
```

参考
* https://juejin.im/post/5ca1da31e51d4509ea3d0540
* https://juejin.im/post/5e623089f265da570f50390b

## 配置浏览器

### 设置UA
在`WebView`构造参数`userAgent`中传入自定义的ua字符串即可

### 设置Header
需要注意的是这里设置的是请求首次URL时对应的header，并不是设置浏览器每次请求的header，如Cookie等信息，还是需要手动进行设置
```dart
_controller.future.then((controller) {
      _webViewController = controller;

      String tokenName = 'nocturne_app_token';
      String tokenValue =
          "eyJhbGciOiJIUzUxMiIsImlhdCI6MTU5MjQ0NDMwOSwiZXhwIjoxNTkzMDQ5MTA5fQ.eyJ1c2VybmFtZSI6ImFkbWluIiwic3RhdGUiOiJhcHAifQ.u0CrY5-I_qCHExQcsTcmbd-y2aYy46Ad38kgLjbYI_XUdngSwLCIakPQmEIUequiVAocMBw4pou3Mjus73lZeg";

      Map<String, String> header = {'Cookie': '$tokenName=$tokenValue', 'x-test':'123213'};
      _webViewController.loadUrl('http://127.0.0.1:9999/2.html', headers: header);
    });
```


### webview_flutter不支持alert
参考https://github.com/flutter/flutter/issues/30358，可以使用flutter_webview_plugin或者自定义alert

## 交互

### JavaScript调用Native
在初始化`Webview`组件的时候传入`javascriptChannels`构造参数注册提供给浏览器的API
```dart
WebView( 
    javascriptChannels: <JavascriptChannel>[
        _toasterJavascriptChannel(context),
    ].toSet())
``` 
单个API定义类似于
```dart
JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
}
```
会向浏览器注入一个全局变量`Toaster`，然后就在JavaScript中调用了
```js
btn1.onclick = function () {
    Toaster.postMessage('hello native')
};
```

### Native调用JavaScript
通过webviewController 的`evaluateJavascript`方法调用Webview中的方法
```dart
controller.data.evaluateJavascript('console.log("123")')
```
一种常见的需求是注入Cookie
```dart
onPageFinished: (String url) {
    // 页面完成后插入token
    void setToken(controller) {
      String tokenName = 'app_token';
      String tokenValue =
          "eyJhbGciOiJIUzUxMiIsImlhdCI6MTU5MjUzMTQ0NywiZXhwIjoxNTkzMTM2MjQ3fQ.eyJ1c2VybmFtZSI6ImFkbWluIiwic3RhdGUiOiJhcHAifQ.0C5qMw6FMYM8GezhS-CUqQXjUt8WOit1MAaOcCP5vH1eFGu7S_5drB_7PIRE0WfzndQLbsnTPXqlCfFi__bgHA";
      String code = "document.cookie='$tokenName=$tokenValue'";
      controller.evaluateJavascript(code);
    }
    
    _controller.future.then((controller) {
      setToken(controller);
    });
},
```