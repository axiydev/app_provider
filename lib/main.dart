import 'package:app/detail/detail_view.dart';
import 'package:app/page/fruits/fruits_page.dart';
import 'package:app/page/home_provider.dart';
import 'package:app/page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
Created by Axmadjon Isaqov on 09:13:12 07.11.2022
© 2022 @axi_dev 
*/
/*
Theme:::Provider
*/
void main() {
  // enableFlutterDriverExtension();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(),
      child: Builder(builder: (context) {
        final provider = context.watch<HomeProvider>();
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: <String, WidgetBuilder>{
            '/fruit': (_) => const FruitsPage(),
            '/home': (_) => ChangeNotifierProvider<HomeProvider>.value(
                  value: provider,
                  child: const MyHomeView(title: 'home'),
                ),
            '/detail': (_) => ChangeNotifierProvider<HomeProvider>.value(
                  value: provider,
                  child: const DetailView(),
                ),
          },
          initialRoute: '/fruit',
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}
