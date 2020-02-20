import 'package:redux/redux.dart';

class TestState {
  int count = 0;

  TestState({this.count});

  static initialState() {
    return TestState(count: 1);
  }
}
Function testReducer = combineReducers<TestState>([
  ///将Action，处理Action动作的方法，State绑定
  TypedReducer<TestState, IncrementAction>(IncrementAction.handler),
]);


// 每次action都包含与之对应的handler，并返回一个新的State
class IncrementAction {
  final int payload;

  IncrementAction({this.payload});

  static TestState handler(TestState data, IncrementAction action) {
    return TestState(count: data.count + action.payload);
  }
}


