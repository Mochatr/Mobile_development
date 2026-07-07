import 'dart:math' as math;

class Point {
  num x, y;

  Point(this.x, this.y);

  Point.origin()
      : x = 0,
        y = 0;

  void affiche() => print('[$x,$y]');

  num distance(Point p) {
    var dx = x - p.x;
    var dy = y - p.y;
    return math.sqrt(dx * dx + dy * dy);
  }

  Point operator +(Point p) => Point(x + p.x, y + p.y);
}

class Rectangle {
  int longueur;
  int largeur;

  Rectangle(this.longueur, this.largeur);

  int surface() => longueur * largeur;

  int perimetre() => 2 * (longueur + largeur);
}

void main() {
  var p1 = Point(2, 5);
  p1.affiche();
  var p2 = Point.origin();
  p2.affiche();
  print('Distance p1-p2 : ${p1.distance(p2)}');
  print('p1 + p2 : ${(p1 + p2).x},${(p1 + p2).y}');

  var r = Rectangle(10, 5);
  print('Surface du rectangle : ${r.surface()}');
  print('Perimetre du rectangle : ${r.perimetre()}');
}
