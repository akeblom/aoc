import 'dart:io';

String getFileInput(String day) {
  return File('bin/$day/input.txt').readAsStringSync();
  //return File(fileName).readAsStringSync();
}
