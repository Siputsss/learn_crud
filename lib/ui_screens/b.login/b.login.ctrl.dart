part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<UserCredential> signInAnonymous() async {
    final anon = await FirebaseAuth.instance.signInAnonymously();
    debugPrint(anon.user.toString());
    return anon;
  }

  Future signInbyGoogle() async {
    UserCredential google;
    try {
      GoogleAuthProvider provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
      google = await FirebaseAuth.instance.signInWithPopup(provider);
      debugPrint(google.user.toString());
      return google;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
