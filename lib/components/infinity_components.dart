import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/infinity_controller.dart';

class InfinityComponents extends StatelessWidget {
  InfinityComponents({Key? key, required this.url, required this.tag})
      : super(key: key) {
    _controller = Get.put(InfinityController(url), tag: tag, permanent: true);
  }

  String url = '';
  String tag = '';

  late InfinityController _controller;
  // Get.put(InfinityController(url));

  @override
  Widget build(BuildContext context) {
    // Get.put(InfinityController());
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          _controller.refresh();
        },
        child: ListView.builder(
          controller: _controller.scrollController.value,
          padding: const EdgeInsets.all(100),
          itemCount: _controller.items.length + 1,
          itemBuilder: (context, index) {
            if (index < _controller.items.length) {
              final item = _controller.items[index];

              return ListTile(title: Text(item));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: _controller.hasMore.value
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
