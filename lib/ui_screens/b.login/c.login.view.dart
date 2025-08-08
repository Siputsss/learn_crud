part of '_index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: LoginAppbar()),
      floatingActionButton: LoginFab(),
      body: Center(
        child: SizedBox(
          width: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnFormBuilder(
                listenTo: _dt.rxForm,
                builder: () => TextField(
                  controller: _dt.rxEmail.controller,
                  decoration: InputDecoration(
                    labelText: 'email',
                    hintText: 'name@gmail.com',
                    errorText: _dt.rxEmail.error,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OnFormBuilder(
                listenTo: _dt.rxForm,
                builder: () => TextField(
                  obscureText: true,
                  controller: _dt.rxPassword.controller,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'password',
                    errorText: _dt.rxPassword.error,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OnFormSubmissionBuilder(
                listenTo: _dt.rxForm,
                onSubmitting: () => CircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () {
                    _ct.submit();
                  },
                  child: Text("submit"),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _ct.signInAnonymous();
                },
                child: Text("Sign In Anonymous"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _ct.signInbyGoogle();
                },
                child: Text("Sign In by Google"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => nav.toReplacement(Routes.register),
                child: Text("Don't have account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
