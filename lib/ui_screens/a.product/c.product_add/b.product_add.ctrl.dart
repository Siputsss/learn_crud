part of '_index.dart';

class ProductAddCtrl {
  init() => logxx.i(ProductAddCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> createDoc() async {
    final id = UniqueKey().toString();
    final product = Product(
      id: id,
      name: _dt.rxName.value,
      price: int.parse(_dt.rxPrice.value),
      qty: int.parse(_dt.rxQty.value),
      createdAt: DateTime.now().toString(),
    );
    uploadImage();
    await _sv.createDoc(product);
    nav.back();
  }

  Future<XFile?> pickImage() async {
    _dt.rxPickedImage.st = await ImagePicker().pickImage(source: ImageSource.gallery);

    debugPrint(_dt.rxPickedImage.st?.mimeType);
    debugPrint(_dt.rxPickedImage.st?.name);
    debugPrint(_dt.rxPickedImage.st?.path);

    return _dt.rxPickedImage.st;
  }

  uploadImage() async {
    final data = await _dt.rxPickedImage.st!.readAsBytes();
    final contentType = _dt.rxPickedImage.st?.mimeType;
    FirebaseStorage.instance.ref('1').putData(data, SettableMetadata(contentType: contentType));
    debugPrint('image has been uploaded');
  }

  submit() async => _dt.rxForm.submit();
}
