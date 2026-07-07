class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  void sePresenter() {
    print("Bonjour, je m'appelle $nom et j'ai $age ans.");
  }
}

class Salarie extends Personne {
  double salaire;

  Salarie(String nom, int age, this.salaire) : super(nom, age);

  @override
  void sePresenter() {
    print("Bonjour, je suis un salarie, je m'appelle $nom, j'ai $age ans et mon salaire est de $salaire.");
  }

  void augmentation(double montant) {
    salaire += montant;
    print('Nouveau salaire pour $nom : $salaire.');
  }
}

abstract class Animal {
  String name;

  Animal(this.name);

  void makeSound();
}

class Chien extends Animal {
  Chien(super.name);

  @override
  void makeSound() => print('$name (chien) aboie');
}

class Chat extends Animal {
  Chat(super.name);

  @override
  void makeSound() => print('$name (chat) miaule');
}

void main() {
  var p1 = Personne('Alice', 30);
  p1.sePresenter();

  var s1 = Salarie('Bob', 35, 5000);
  s1.sePresenter();
  s1.augmentation(300);

  // Polymorphisme : une liste d'Animal contient des sous-types differents.
  List<Animal> animaux = [Chien('Rex'), Chat('Felix')];
  for (final animal in animaux) {
    animal.makeSound();
  }
}
