import 'package:app/model/fruit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FruitCardWidget extends StatelessWidget {
  const FruitCardWidget(
      {super.key,
      required this.fruit,
      required this.onChange,
      required this.onDelete});
  final VoidCallback onChange;
  final VoidCallback onDelete;
  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          child: Text(fruit.name!),
        ),
        CupertinoContextMenuAction(
          isDestructiveAction: true,
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: const Text('delete'),
        ),
      ],
      previewBuilder: (context, animation, child) =>
          FadeTransition(opacity: animation, child: child),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => onChange(),
              child: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.white.withOpacity(0.1),
                        ])),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      fruit.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: Icon(
                  fruit.isFavourite! ? Icons.star : Icons.star_border,
                  size: 30,
                  color: Colors.amber,
                ))
          ],
        ),
      ),
    );
  }
}
