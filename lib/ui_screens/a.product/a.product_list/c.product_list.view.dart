part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: ProductListAppbar()),
      floatingActionButton: ProductListFab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final read = await FirebaseFirestore.instance.collection('product').get();
                debugPrint(read.toString());
                debugPrint(read.docs[0].id);
                debugPrint(read.docs[0]['name']);
              },
              child: Text("Read"),
            ),
          ],
        ),
      ),
    );
  }
}
