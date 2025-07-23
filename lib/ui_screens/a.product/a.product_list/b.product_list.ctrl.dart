part of '_index.dart';

class ProductListCtrl {
  init() => logxx.i(ProductListCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<List<Product>> getColl() async {
    List<Product> product = [];
    final read = await FirebaseFirestore.instance.collection('product').get();
    for (var element in read.docs) {
      product.add(Product.fromMap(element.data()));
    }

    debugPrint(product.toString());
    return product;
  }

  readList() async {
    _dt.rxProductList.stateAsync = getColl();
  }

  Future<void> createDoc() async {
    final product = Product(
      id: UniqueKey().toString(),
      name: generateWordPairs().take(2).join(' '),
      price: Random().nextInt(9999),
      qty: Random().nextInt(9999),
      createdAt: DateTime.now().toString(),
    );
    FirebaseFirestore.instance.collection('product').doc(product.id).set(product.toMap());
    _dt.rxProductList.st = [..._dt.rxProductList.st]..insert(0, product);
    debugPrint(product.toString());
  }

  Future<void> updateDoc(Product product) async {
    final productEdit = Product(
      id: product.id,
      name: 'product edited',
      price: product.price,
      qty: 10,
      createdAt: product.createdAt,
      updatedAt: DateTime.now().toString(),
    );
    FirebaseFirestore.instance.collection('product').doc(productEdit.id).set(productEdit.toMap());
    debugPrint('product has been edited');
  }

  // Future<void> upddateDoc(String id) async {
  //   FirebaseFirestore.instance.collection('product').doc(id).update({
  //     'name': 'edit',
  //     'created_at': DateTime.now().toString(),
  //   });
  //   debugPrint('product has been edited');
  // }

  Future<void> deleteDoc(String id) async {
    FirebaseFirestore.instance.collection('product').doc(id).delete();
    _dt.rxProductList.st = [..._dt.rxProductList.st]..removeWhere((element) => element.id == id);
    debugPrint('product has been deleted');
  }
}
