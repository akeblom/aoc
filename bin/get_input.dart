import 'dart:io';

String getFileInput(String day) {
  return File('bin/2023/$day/input.txt').readAsStringSync();
  //return File(fileName).readAsStringSync();
}
