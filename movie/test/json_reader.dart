import 'dart:io';

String readJson(String name) {
  // var dir = Directory.current.path;
  var dir = Directory.current.parent.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/movie/test/$name').readAsStringSync();
}
