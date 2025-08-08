part of '../_index.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
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
    );
  }
}
