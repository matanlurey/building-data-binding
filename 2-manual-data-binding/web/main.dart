import 'dart:html';

main() {
  final sundays = const [
    'sleep in',
    'eat brunch',
    'wash car',
  ];
  document.querySelector('#todo-list')
    ..append(new UListElement()
      ..children.addAll(
        sundays.map(_createListItem),
      ));
}

Element _createListItem(String item) {
  final li = new LIElement();
  final button = new ButtonElement()
    ..text = 'Done'
    ..onClick.listen((_) => li.remove());
  li
    ..appendText(item)
    ..append(button);
  return li;
}
