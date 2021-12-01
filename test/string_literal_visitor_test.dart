import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:string_finder_plugin/src/string_literal_visitor.dart';
import 'package:test/test.dart';

void main() {
  group('StringLiteralVisitor', () {
    test('should find all string literals', () async {
      final visitor = StringLiteralVisitor();
      final file = File('test/code_example.dart');
      final parseResult =
          await resolveFile2(path: file.absolute.path) as ResolvedUnitResult;

      parseResult.unit.visitChildren(visitor);

      expect(visitor.stringLiterals.length, 5);
    });
  });
}
