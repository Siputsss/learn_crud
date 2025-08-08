part of '_index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: RegisterAppbar()),
      floatingActionButton: RegisterFab(),
      body: Center(
        child: SizedBox(
          width: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterEmail(),
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
              TextButton(onPressed: () => nav.toReplacement(Routes.login), child: Text("Do you have account? Sign In")),
            ],
          ),
        ),
      ),
    );
  }
}
