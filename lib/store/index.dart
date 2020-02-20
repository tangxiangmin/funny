import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';

import './module/test.dart';
import './module/user.dart';
import './module/joke.dart';

class AppState {
  TestState test;
  UserState user;
  JokeState joke;

  AppState({this.test, this.user, this.joke});

  static initialState() {
    AppState state = AppState(
        test: TestState.initialState(),
        user: UserState.initialState(),
        joke: JokeState.initialState());
    return state;
  }
}

AppState _reducer(AppState state, dynamic action) {
  return AppState(
    test: testReducer(state.test, action),
    user: userReducer(state.user, action),
    joke: jokeReducer(state.joke, action),
  );
}

// 暴露全局store
Store store = new Store<AppState>(_reducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);

// connect接口，快速连接Store
typedef MapStateToPropsCallback<S> = void Function(
  Store<AppState> store,
);
typedef BaseViewModelBuilder<ViewModel> = Widget Function(
  BuildContext context,
  ViewModel vm,
  Store<AppState> store,
);

Widget connect(
    MapStateToPropsCallback mapStateToProps, BaseViewModelBuilder builder) {
  return StoreConnector<AppState, dynamic>(
    converter: mapStateToProps,
    builder: (context, props) {
      return builder(context, props, store);
    },
  );
}
