import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import './index.dart';

Widget connect(Function mapStateToProps, builder) {
  return StoreConnector<AppState, dynamic>(
    converter: mapStateToProps,
    builder: (context, props) {
      return builder(context, props);
    },
  );
}
