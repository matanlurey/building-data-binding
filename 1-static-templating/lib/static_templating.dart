abstract class Visitor<T> {
  T visitNode(Node node);
  T visitTag(Tag node);
  T visitText(Text node);
}

class HtmlEmitter implements Visitor<String> {
  @override
  String visitNode(Node node) => node.accept(this);

  @override
  String visitTag(Tag node) {
    final buffer = new StringBuffer('<${node.name}>');
    buffer
      ..writeAll(node.children.map(visitNode))
      ..write('</${node.name}>');
    return buffer.toString();
  }

  @override
  String visitText(Text node) => node.text;
}

abstract class Node {
  R accept<R>(Visitor<R> visitor);
}

class Tag implements Node {
  final String name;
  final List<Node> children;

  const Tag(this.name, {this.children: const []});

  @override
  R accept<R>(Visitor<R> visitor) => visitor.visitTag(this);
}

class Text implements Node {
  final String text;

  const Text(this.text);

  @override
  R accept<R>(Visitor<R> visitor) => visitor.visitText(this);
}

void main() {
  var sundays = [
    'sleep in',
    'eat brunch',
    'wash car',
  ];
  var output = new Tag(
    'ul',
    children: sundays
        .map(
          (i) => new Tag('li', children: [new Text(i)]),
        )
        .toList(),
  );
  print(new HtmlEmitter().visitNode(output));
}
