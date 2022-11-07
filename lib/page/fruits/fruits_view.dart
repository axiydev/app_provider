import 'dart:developer';

import 'package:app/page/fruits/fruits_provider.dart';
import 'package:app/page/fruits/widgets/fruit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitView extends StatelessWidget {
  const FruitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FruitProvider>(builder: (context, fruitProvider, _) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                log('notification');
                return false;
              }
              return false;
            },
            child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: fruitProvider.fruitList!.length,
                itemBuilder: (context, index) {
                  final fruit = fruitProvider.fruitList![index];
                  return FruitCardWidget(
                    fruit: fruit!,
                    onChange: () => fruitProvider.change(index),
                    onDelete: () => fruitProvider.deleteFruit(index),
                  );
                }),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          Consumer<FruitProvider>(builder: (context, fruitProvider, _) {
        return FloatingActionButton(
          onPressed: () {
            fruitProvider.showAppDialog(context);
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
