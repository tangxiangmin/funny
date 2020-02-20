import 'package:redux/redux.dart';

import 'package:flutter_app/app/model/joke_list.dart' as JokeListModel;
import 'package:flutter_app/app/api/joke.dart';

class JokeState {
  List<JokeListModel.Data> jokes;

  JokeState({this.jokes});

  static initialState() {
    return JokeState(jokes: []);
  }
}

Function jokeReducer = combineReducers<JokeState>([
  TypedReducer<JokeState, FetchListSuccessAction>(
      FetchListSuccessAction.handler),
]);

class FetchListSuccessAction {
  final List<JokeListModel.Data> payload;

  FetchListSuccessAction({this.payload});

  static JokeState handler(JokeState data, FetchListSuccessAction action) {
//    data.isLogin = true;
    data.jokes = action.payload;
    return data;
  }
}

// 登录接口
void fetchList(Store store) async {
  var response = await fetchJokeList();
  List<JokeListModel.Data> data =
      JokeListModel.joke_list.fromJson(response.data).data;

  store.dispatch(FetchListSuccessAction(payload: data));
}
