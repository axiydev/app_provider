import 'package:app/model/fruit_model.dart';
import 'package:app/page/fruits/fruits_provider.dart';
import 'package:app/page/fruits/fruits_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitsPage extends StatelessWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FruitProvider>(
      lazy: false,
      create: (_) => FruitProvider(
          List.from([
            Fruit(
                name: 'Apple',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png'),
            Fruit(
                name: 'Banan',
                type: FruitType.sitrus,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=0dc240aa833474652162f5cf12ffad4ac87bf175-4611905-images-thumbs&n=13'),
            Fruit(
                name: 'Watermelon',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=f1863a481e9742b9cc330c289c3e8f0f-5878999-images-thumbs&n=13'),
            Fruit(
                name: 'Apple',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png'),
            Fruit(
                name: 'Banan',
                type: FruitType.sitrus,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=0dc240aa833474652162f5cf12ffad4ac87bf175-4611905-images-thumbs&n=13'),
            Fruit(
                name: 'Watermelon',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=f1863a481e9742b9cc330c289c3e8f0f-5878999-images-thumbs&n=13'),
            Fruit(
                name: 'Apple',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png'),
            Fruit(
                name: 'Banan',
                type: FruitType.sitrus,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=0dc240aa833474652162f5cf12ffad4ac87bf175-4611905-images-thumbs&n=13'),
            Fruit(
                name: 'Watermelon',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=f1863a481e9742b9cc330c289c3e8f0f-5878999-images-thumbs&n=13'),
            Fruit(
                name: 'Apple',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png'),
            Fruit(
                name: 'Banan',
                type: FruitType.sitrus,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=0dc240aa833474652162f5cf12ffad4ac87bf175-4611905-images-thumbs&n=13'),
            Fruit(
                name: 'Watermelon',
                type: FruitType.hol,
                isFavourite: false,
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=f1863a481e9742b9cc330c289c3e8f0f-5878999-images-thumbs&n=13'),
          ]),
          fruitNameController: TextEditingController()),
      child: const FruitView(),
    );
  }
}
