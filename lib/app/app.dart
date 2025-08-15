part of '_index.dart';

class App extends TopStatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NC Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routeInformationParser: nav.routeInformationParser,
      routerDelegate: nav.routerDelegate,
    );
  }
}
