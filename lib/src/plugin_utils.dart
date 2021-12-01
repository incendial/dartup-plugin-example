import 'dart:io';

import 'package:analyzer_plugin/protocol/protocol_common.dart' as plugin;
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:source_span/source_span.dart';

plugin.AnalysisErrorFixes literalToAnalysisErrorFixes(SourceSpan location) {
  final fileWithIssue = _uriToPath(location.sourceUrl) ?? '';

  return plugin.AnalysisErrorFixes(
    plugin.AnalysisError(
      plugin.AnalysisErrorSeverity.INFO,
      plugin.AnalysisErrorType.LINT,
      plugin.Location(
        fileWithIssue,
        location.start.offset,
        location.length,
        location.start.line,
        location.start.column,
        endLine: location.end.line,
        endColumn: location.end.column,
      ),
      'This is a string literal',
      'string_finder_plugin',
    ),
  );
}

String? _uriToPath(Uri? uri) {
  if (uri == null) {
    return null;
  }

  if (uri.scheme == 'file') {
    return uri.toFilePath();
  }

  return File(uri.path).absolute.path;
}
