import 'dart:math';

class RandomNumber {
  List<int> serie = [1, 2, 3, 4, 5, 6];
  int number;

  int newNumber() {
    final rnd = Random();
    return serie[rnd.nextInt(serie.last)];
  }
}
