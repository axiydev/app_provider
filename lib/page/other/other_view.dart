import 'package:app/page/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OtherView extends StatefulWidget {
  const OtherView({super.key});

  @override
  State<OtherView> createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Consumer<HomeProvider>(
            builder: (context, homePro, _) => Text(
                  homePro.count.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
        Consumer<HomeProvider>(builder: (context, homeProvider, _) {
          return CupertinoButton.filled(
              onPressed: homeProvider.incrementCounter, child: const Text('+'));
        })
      ],
    ));
  }
}
