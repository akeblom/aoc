import '2023/01/one.dart';
import 'get_input.dart';

void main(List<String> arguments) {
  final input = getFileInput('01');
  print(day_1(input));
  print(day_1(input, part2: true));
}
