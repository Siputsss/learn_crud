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
                  onData: (data) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data?.imageUrl == null
                            ? Card(
                                child: SizedBox(height: 100, width: 100, child: Center(child: Text('No Image'))),
                              )
                            : SizedBox(height: 150, width: 200, child: Image.network(data!.imageUrl)),

                        Text('${data?.id}'),
                        Text('${data?.name}'),
                        Text('${data?.price}'),
                        Text('${data?.qty}'),
                        Text('${data?.createdAt}'),
                        Text('${data?.updatedAt}'),
                      ],
                    ),
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
