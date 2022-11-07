import 'package:app/page/home_provider.dart';
import 'package:app/page/other/other_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as Dev;

import 'package:provider/provider.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key, required this.title});

  final String title;
  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  late final provider;
  @override
  void initState() {
    Dev.log('INIT STATE');
    provider = context.read<HomeProvider>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Dev.log('did change DEP');
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    Dev.log('Hot Reload');
    super.reassemble();
  }

  @override
  void dispose() {
    Dev.log('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dev.log('BUILD');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(builder: (context) {
              final pro = Provider.of<HomeProvider>(context, listen: true);
              return Text(
                pro.text,
              );
            }),
            Builder(builder: (context) {
              final count = context
                  .select((HomeProvider providerHome) => providerHome.count);
              return Text(
                '$count',
                key: const Key('data'),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            CupertinoButton.filled(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          ChangeNotifierProvider<HomeProvider>.value(
                            value: Provider.of(context),
                            child: const OtherPage(),
                          )));
                },
                child: const Text('other page')),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton.filled(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detail');
                },
                child: const Text('detail page'))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(builder: (context) {
        final secondProvider = context.watch<HomeProvider>();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: secondProvider.decrementCounter,
              key: const Key('decrement'),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: secondProvider.incrementCounter,
              key: const Key('increment'),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
