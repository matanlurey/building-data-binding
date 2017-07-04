library list;

import 'dart:html';

import 'package:mvc_data_binding/framework.dart';

// Would be generated in a typical framework.
part 'list.g.dart';

class ListController extends Controller {
  final List<String> items;

  ListController(this.items);

  void onClick(String item) {
    items.remove(item);
    markDirty();
  }

  @override
  final view = new _ViewListController();
}
