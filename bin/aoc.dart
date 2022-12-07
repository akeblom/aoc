import 'four/four.dart';

import 'get_input.dart';

void main(List<String> arguments) {
  final input = getFileInput('four');
  print(fourPartTwo(input));
}
