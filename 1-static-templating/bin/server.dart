import 'dart:io';

import 'package:static_templating/static_templating.dart';

main() async {
  final sundays = const [
    'sleep in',
    'eat brunch',
    'wash car',
  ];
  final server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print('Listening to localhost:8080.');
  await for (final request in server) {
    print('Connection received. Writing TODO list...');
    final list = _createTodoList(sundays);
    final output = list.accept(new HtmlEmitter());
    request.response
      ..headers.contentType = ContentType.HTML
      ..write(output)
      ..close();
    print('Done!');
  }
}

Node _createTodoList(Iterable<String> tasks) {
  return new Tag(
    'ul',
    children: tasks.map((i) => new Tag('li', children: [new Text(i)])).toList(),
  );
}
