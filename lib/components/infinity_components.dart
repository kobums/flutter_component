import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/infinity_controller.dart';

class InfinityComponents extends StatelessWidget {
  InfinityComponents({Key? key}) : super(key: key);

  late var url = '';

  final InfinityController _controllerWithGetx =
      Get.put(InfinityController('https://jsonplaceholder.typicode.com/posts'));

  @override
  Widget build(BuildContext context) {
    // Get.put(InfinityController());
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          _controllerWithGetx.refresh();
        },
        child: ListView.builder(
          controller: _controllerWithGetx.scrollController.value,
          padding: const EdgeInsets.all(8),
          itemCount: _controllerWithGetx.items.length + 1,
          itemBuilder: (context, index) {
            if (index < _controllerWithGetx.items.length) {
              final item = _controllerWithGetx.items[index];

              return ListTile(title: Text(item));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: _controllerWithGetx.hasMore.value
                      ? const CircularProgressIndicator()
                      : const Text('No more data to load'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
