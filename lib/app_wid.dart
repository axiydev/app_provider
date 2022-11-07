import 'package:flutter/material.dart';

class Myself extends StatelessWidget {
  final int age;
  final String name;
  const Myself(this.name, this.age, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        name,
        key: const Key('hello'),
      ),
      Text("$age"),
    ]);
  }
}
