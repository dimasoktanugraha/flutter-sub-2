import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  print("$dir");
  if (dir.endsWith('tv')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/tv/test/$name').readAsStringSync();
}
