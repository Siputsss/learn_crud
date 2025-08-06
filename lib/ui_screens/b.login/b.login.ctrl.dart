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

  Future<UserCredential> createEP() async {
    final create = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'siska@gmail.com',
      password: '222222',
    );
    debugPrint(create.user.toString());
    return create;
  }

  Future<UserCredential> signInEP() async {
    final signinEP = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'siska@gmail.com',
      password: '222222',
    );
    debugPrint(signinEP.user.toString());
    return signinEP;
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    debugPrint('you already signed out');
  }

  Future<void> deleteAccount() async {
    FirebaseAuth.instance.currentUser?.delete();
    debugPrint('user has been deleted');
  }
}
