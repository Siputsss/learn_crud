part of '../_index.dart';

class ProductListAppbar extends StatelessWidget {
  const ProductListAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
      actions: [
        IconButton(
          onPressed: () {
            _ct.signOut();
          },
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () {
            _ct.deleteAccount();
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
