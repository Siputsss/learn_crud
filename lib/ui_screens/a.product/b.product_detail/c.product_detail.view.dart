part of '_index.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: ProductDetailAppbar()),
      floatingActionButton: ProductDetailFab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBuilder.all(
                  listenTo: _dt.rxProductDetail,
                  onError: (error, refreshError) => Text('$error'),
                  onWaiting: () => CircularProgressIndicator(),
                  onData: (data) => Column(
                    children: [
                      Text('${data?.id}'),
                      Text('${data?.name}'),
                      Text('${data?.price}'),
                      Text('${data?.qty}'),
                      Text('${data?.createdAt}'),
                      Text('${data?.updatedAt}'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
