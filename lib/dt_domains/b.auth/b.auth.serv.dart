part of '_index.dart';

class AuthServ {
  void init() {
    logxx.i(AuthServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(AuthServ, 'rxCounter setState success');
  }

  Future<UserCredential> signInAnonymous() async {
    return _rp.signInAnonymous();
  }

  Future signInbyGoogle() async {
    return _rp.signInbyGoogle();
  }

  Future<UserCredential> createEP(String email, String password) async {
    return _rp.createEP(email, password);
  }

  Future<UserCredential> signInEP(String email, String password) async {
    return _rp.signInEP(email, password);
  }

  Future<void> signOut() async {
    _rp.signOut();
  }

  Future<void> deleteAccount() async {
    _rp.deleteAccount();
  }
}
