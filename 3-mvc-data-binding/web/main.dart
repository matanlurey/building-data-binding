import 'dart:html';

import 'package:mvc_data_binding/list.dart';

main() {
  final sundays = [
    'sleep in',
    'eat brunch',
    'wash car',
  ];
  final container = document.querySelector('#todo-list');
  final component = new ListController(sundays);
  container.append(component.view.build());

  // Start change detection. This should be automatic in most frameworks.
  component.view.detectChanges(component);
}
