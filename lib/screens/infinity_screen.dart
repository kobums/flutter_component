import 'package:flutter/material.dart';
import 'package:flutter_component/components/infinity_components.dart';

class InfinityScreen extends StatelessWidget {
  const InfinityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity Screen'),
      ),
      body: InfinityComponents(),
    );
  }
}
