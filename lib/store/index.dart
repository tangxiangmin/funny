import 'package:redux/redux.dart';

class IncrementAction {
  final payload;

  IncrementAction({this.payload});
}

class AppState {
  int count;

  AppState({
    this.count,
  });

  static AppState initialState() {
    return AppState(
      count: 0,
    );
  }

  AppState copyWith({count}) {
    return AppState(
      count: count ?? this.count,
    );
  }
}

AppState counterReducer(AppState state, dynamic action) {
  switch (action.runtimeType) {
    case IncrementAction:
      return state.copyWith(count: state.count + action.payload);
  }

  return state;
}

// 暴露全局store
Store store =
    new Store<AppState>(counterReducer, initialState: AppState.initialState());

//void example() async {
//  const string = "Java, android, ios, get the same result by DES encryption and decryption.";
//  const key = "u1BvOHzUOcklgNpn1MaWvdn9DT4LyzSX";
//  const iv = "12345678";
//
//  var encrypt = await FlutterDes.encrypt(string, key, iv: iv);
//  var decrypt = await FlutterDes.decrypt(encrypt, key, iv: iv);
//  var encryptHex = await FlutterDes.encryptToHex(string, key, iv: iv);
//  var decryptHex = await FlutterDes.decryptFromHex(encryptHex, key, iv: iv);
//  var encryptBase64 = await FlutterDes.encryptToBase64(string, key, iv: iv);
//  var decryptBase64 = await FlutterDes.decryptFromBase64(encryptBase64, key, iv: iv);
//}
