class SoldeInsuffisantException implements Exception {
  final String message;
  SoldeInsuffisantException(this.message);

  @override
  String toString() => 'SoldeInsuffisantException: $message';
}

class CompteBancaire {
  double solde;

  CompteBancaire(this.solde);

  void retirer(double montant) {
    if (montant > solde) {
      throw SoldeInsuffisantException('Solde ($solde) insuffisant pour retirer $montant.');
    }
    solde -= montant;
  }
}

void main() {
  // Division entiere par zero : leve une exception attrapee par catch.
  int a = 1, b = 0;
  try {
    int result = a ~/ b;
    print(result);
  } catch (e) {
    print('Erreur : impossible de diviser par 0 ($e)');
  } finally {
    print('Bloc finally execute');
  }

  // Exception personnalisee sur une regle metier.
  var compte = CompteBancaire(100);
  try {
    compte.retirer(150);
  } on SoldeInsuffisantException catch (e) {
    print(e);
  }
  print('Solde final : ${compte.solde}');
}
