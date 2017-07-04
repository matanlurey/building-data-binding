part of list;

class _ViewListController extends View<ListController> {
  UListElement _ul;
  List<String> _itemsLastCheck = const [];

  @override
  Element build() {
    return _ul = new UListElement();
  }

  @override
  void detectChanges(ListController controller) {
    // Not an exhaustive check. In a real framework you'd need to verify that
    // the contents of the list are the same, not just the lists are of
    // different lengths.
    if (_itemsLastCheck.length != controller.items.length) {
      _updateItems(controller);
    }
  }

  void _updateItems(ListController controller) {
    // Intentionally not efficient. In a real framework you'd want to track
    // every <li> individually to avoid blowing away big parts of the DOM and
    // rebuilding.
    _ul.children
      ..clear()
      ..addAll(controller.items.map((i) => _createLi(controller, i)));
    _itemsLastCheck = controller.items.toList();
  }

  Element _createLi(ListController controller, String item) {
    final li = new LIElement()..appendText(item);
    li.append(new ButtonElement()
      ..text = 'Done'
      ..onClick.listen((_) => controller.onClick(item)));
    return li;
  }
}
