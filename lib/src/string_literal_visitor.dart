import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class StringLiteralVisitor extends RecursiveAstVisitor<void> {
  final List<SimpleStringLiteral> stringLiterals = [];

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    super.visitSimpleStringLiteral(node);

    stringLiterals.add(node);
  }
}
