import 'package:flutter_app/model/login.dart' as LoginModel;
import 'package:flutter_app/model/user_info.dart' as UserInfoModel;

import 'package:redux/redux.dart';

import 'package:flutter_app/api/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String loginToken = "login_token";
  static String uid = "user_id";
}

class UserState {
  String uid;
  String token;

  UserInfoModel.Data userInfo;

  UserState({this.uid, this.token, this.userInfo});

  static initialState() {
    return UserState(uid: null, token: null, userInfo: null);
  }
}

Function userReducer = combineReducers<UserState>([
  TypedReducer<UserState, LoginSuccessAction>(LoginSuccessAction.handler),
  TypedReducer<UserState, UserInfoAction>(UserInfoAction.handler),
]);

// 登录成功后的action
class LoginSuccessAction {
  String uid;
  String token;

  LoginSuccessAction({this.uid, this.token});

  static UserState handler(UserState data, LoginSuccessAction action) {
    return (UserState(
        token: action.token, uid: action.uid, userInfo: data.userInfo));
  }
}

// 获取用户信息成功

class UserInfoAction {
  UserInfoModel.Data payload;

  UserInfoAction({this.payload});

  static UserState handler(UserState data, UserInfoAction action) {
    return UserState(
        userInfo: action.payload, uid: data.uid, token: data.token);
  }
}

// 获取本地登录信息
void localLoginAction(Store store) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String uid = prefs.getString(LocalStorage.uid);
  String token = prefs.getString(LocalStorage.loginToken);

  store.dispatch(LoginSuccessAction(uid: uid, token: token));
}

// 登录接口
Function loginAction({String username, String password, Function success}) {
  return (Store store) async {
    var response = await loginByPassword();
    LoginModel.login res = LoginModel.login.fromJson(response.data);
    if (res.code == 0) {
      LoginModel.Data data = res.data;

      store.dispatch(
          LoginSuccessAction(uid: data.uid.toString(), token: data.token));

      // 将数据保存到本地
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(LocalStorage.loginToken, data.token);
      prefs.setString(LocalStorage.uid, data.uid.toString());

      success();
    }
  };
}

// 获取用户信息
Function fetchUserInfoAction() {
  return (Store store) async {
    var response = await fetchUserInfo();
    UserInfoModel.user_info res =
        UserInfoModel.user_info.fromJson(response.data);

    UserInfoModel.Data data = res.data;
    store.dispatch(UserInfoAction(payload: data));
  };
}
