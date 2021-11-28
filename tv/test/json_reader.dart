import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.parent.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/tv/test/$name').readAsStringSync();
}
