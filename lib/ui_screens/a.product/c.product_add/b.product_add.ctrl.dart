part of '_index.dart';

class ProductAddCtrl {
  init() => logxx.i(ProductAddCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> createDoc() async {
    final product = Product(
      id: UniqueKey().toString(),
      name: generateWordPairs().take(2).join(' '),
      price: Random().nextInt(9999),
      qty: Random().nextInt(9999),
      createdAt: DateTime.now().toString(),
    );
    _sv.createDoc(product);
  }

  submit() async => _dt.rxForm.submit();
}
