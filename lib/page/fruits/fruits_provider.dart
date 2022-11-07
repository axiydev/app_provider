import 'package:app/model/fruit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FruitRepository {
  void change(int index);
  void deleteFruit(int index);
  void showBottomSheetInfo(BuildContext context);
  void showAppDialog(BuildContext context);
  void createFruit(BuildContext context);
}

class FruitProvider with ChangeNotifier implements FruitRepository {
  late final List<Fruit?>? _fruitList;

  FruitProvider(this._fruitList);
  final TextEditingController fruitNameController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void change(int index) {
    _fruitList![index]!.isFavourite = !_fruitList![index]!.isFavourite!;
    notifyListeners();
  }

  List<Fruit?>? get fruitList => _fruitList;

  @override
  void deleteFruit(int index) {
    _fruitList!.removeAt(index);
    notifyListeners();
  }

  @override
  void showBottomSheetInfo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SizedBox(
              height: 250,
              child: Card(
                color: Colors.red,
              ),
            ));
    notifyListeners();
  }

  @override
  void showAppDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('fruit'),
              content: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoTextField(
                      placeholder: 'name',
                      focusNode: focusNode,
                      controller: fruitNameController,
                    )
                  ],
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    createFruit(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('create'),
                )
              ],
            ));
  }

  @override
  void createFruit(BuildContext context) {
    focusNode.requestFocus();
    if (fruitNameController.text.isEmpty) return;
    _fruitList!.add(Fruit(
        name: fruitNameController.text,
        isFavourite: false,
        type: FruitType.hol,
        imageUrl:
            'https://static.libertyprim.com/files/familles/peche-large.jpg?1574630286'));
    notifyListeners();
  }
}
