import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ItemRender = Widget Function(dynamic);
typedef ItemReader = Future<List<dynamic>> Function(
    {int page, int pagesize, String? params});

class InfiniteController extends GetxController {
  var cache = [].obs;
  var loading = false.obs;
  var end = false.obs;
  var pagesize = 20;
  var page = 1.obs;
  var search = ''.obs;

  final ItemReader reader;
  final String? params;

  InfiniteController(this.reader, this.params);

  @override
  void onInit() {
    read();
    debounce(search, (_) {
      read();
    }, time: const Duration(milliseconds: 300));

    super.onInit();
  }

  reload() {
    cache.value = [];
    page.value = 1;
    loading.value = false;
    end.value = false;
    return fetch();
  }

  read() {
    Future.microtask(() => fetch());
  }

  readItem() async {
    return reader(page: page.value, pagesize: pagesize, params: params);
  }

  fetch() async {
    if (loading.value == true) {
      return;
    }

    if (end.value == true) {
      return;
    }

    loading.value = true;

    final items = await readItem();

    if (items.isEmpty || items.length < pagesize) {
      end.value = true;
    }

    cache.value = [
      ...cache,
      ...items,
    ];

    page++;

    loading.value = false;
  }
}

class InfiniteScroll extends StatelessWidget {
  final ItemRender builder;
  final ItemReader reader;
  final String params = '';

  const InfiniteScroll(
      {Key? key, required this.builder, required this.reader, String? params})
      : super(key: key);

  @override
  Widget build(context) {
    final InfiniteController controller =
        Get.put(InfiniteController(reader, params), tag: (reader).toString());

    return RefreshIndicator(
        onRefresh: () => controller.reload(), child: Obx(() => _render()));
  }

  Widget _render() {
    final InfiniteController controller =
        Get.put(InfiniteController(reader, params), tag: (reader).toString());

    final cache = controller.cache;
    final loading = controller.loading.value;
    final end = controller.end.value;

    if (cache.isEmpty) {
      if (loading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(child: Text('아이템이 없습니다'));
      }
    }

    return ListView.builder(
        itemCount: cache.length + 1,
        itemBuilder: (context, index) {
          if (index < cache.length) {
            return builder(cache[index]);
          }

          if (end) {
            return Container();
          }

          if (!loading) {
            log('in listview fetchitem');
            controller.read();
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
