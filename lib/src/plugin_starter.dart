import 'dart:isolate';

import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/starter.dart';

import 'string_finder_plugin.dart';

void start(Iterable<String> _, SendPort sendPort) {
  ServerPluginStarter(StringFinderPlugin(PhysicalResourceProvider.INSTANCE))
      .start(sendPort);
}
