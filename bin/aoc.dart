import '2023/04/problem.dart';
import 'get_input.dart';

void main(List<String> arguments) {
  final input = getFileInput('04');
  print(run(input));
}

extension Utils on String {
  bool isSymbol() {
    return !isDigit() && !idDot();
  }

  bool isDigit() {
    return num.tryParse(this) != null;
  }

  bool idDot() {
    return this == '.';
  }

  List<String> splitInputToLine() {
    return split('\n');
  }
}
