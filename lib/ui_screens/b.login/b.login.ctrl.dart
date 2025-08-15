part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> signInAnonymous() async {
    _sv.signInAnonymous();
  }

  Future signInbyGoogle() async {
    return _sv.signInbyGoogle();
  }

  Future<UserCredential> signInEP() async {
    final userCredential = await _sv.signInEP(_dt.rxEmail.value, _dt.rxPassword.value);
    _pv.rxUser.setState((s) => userCredential.user);
    return userCredential;
  }

  Future<void> signOut() async {
    _sv.signOut();
  }

  Future<void> deleteAccount() async {
    _sv.deleteAccount();
  }

  submit() async => _dt.rxForm.submit();
}
