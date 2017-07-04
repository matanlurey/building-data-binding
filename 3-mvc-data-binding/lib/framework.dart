import 'dart:html';

abstract class Controller {
  View get view;

  /// Invoke when something in the DOM should be changed.
  ///
  /// In a "real framework" this would collate and be more intelligent.
  void markDirty() => view.detectChanges(this);
}

abstract class View<C extends Controller> {
  /// Create the initial representation of the DOM.
  Element build();

  /// Applies data-binding for a given [controller].
  void detectChanges(C controller);
}
