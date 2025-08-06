part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<UserCredential> signInAnonymous() async {
    return _sv.signInAnonymous();
  }

  Future signInbyGoogle() async {
    return _sv.signInbyGoogle();
  }

  Future<UserCredential> createEP() async {
    return _sv.createEP('siska@gmail.com', '222222');
  }

  Future<UserCredential> signInEP() async {
    return _sv.signInEP('siska@gmail.com', '222222');
  }

  Future<void> signOut() async {
    _sv.signOut();
  }

  Future<void> deleteAccount() async {
    _sv.deleteAccount();
  }
}
