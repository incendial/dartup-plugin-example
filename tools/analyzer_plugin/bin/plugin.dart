import 'dart:isolate';

import 'package:string_finder_plugin/string_finder_plugin.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}
