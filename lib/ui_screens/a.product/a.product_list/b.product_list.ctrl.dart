part of '_index.dart';

class ProductListCtrl {
  init() => logxx.i(ProductListCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  setSelectedId(String id) {
    _sv.setSelectedId(id);
    debugPrint(_dt.rxSelectedId.st);
  }

  readList() async {
    _sv.readList();
  }

  readDoc(String id) {
    _sv.readDoc();
  }

  Future<void> deleteDoc(String id) async {
    _sv.deleteDoc(id);
  }

  // Future<void> upddateDoc(String id) async {
  //   FirebaseFirestore.instance.collection('product').doc(id).update({
  //     'name': 'edit',
  //     'created_at': DateTime.now().toString(),
  //   });
  //   debugPrint('product has been edited');
  // }
}
