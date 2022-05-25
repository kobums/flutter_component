import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ItemRender = Widget Function(dynamic);
typedef ItemReader = Future<List<dynamic>> Function(
    {int page, int pagesize, String? params});

class InfiniteController extends GetxController {
  final _cache = [].obs;
  final _loading = false.obs;
  final _end = false.obs;
  final _pagesize = 20.obs;
  final _page = 1.obs;
  final _search = ''.obs;

  List get cache => _cache.value;
  set cache(value) => _cache.value = value;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;
  bool get end => _end.value;
  set end(value) => _end.value = value;
  int get pagesize => _pagesize.value;
  set pagesize(value) => _pagesize.value = value;
  int get page => _page.value;
  set page(value) => _page.value = value;
  String get search => _search.value;
  set search(value) => _search.value = value;

  final ItemReader reader;
  final String? params;

  InfiniteController(this.reader, this.params);

  @override
  void onInit() {
    read();
    debounce(_search, (_) {
      read();
    }, time: const Duration(milliseconds: 300));

    super.onInit();
  }

  reload() {
    cache = [];
    page = 1;
    loading = false;
    end = false;
    return fetch();
  }

  read() {
    Future.microtask(() => fetch());
  }

  readItem() async {
    return reader(page: page, pagesize: pagesize, params: params);
  }

  fetch() async {
    if (loading == true) {
      return;
    }

    if (end == true) {
      return;
    }

    loading = true;

    final items = await readItem();

    if (items.isEmpty || items.length < pagesize) {
      end = true;
    }

    cache = [
      ...cache,
      ...items,
    ];

    page++;

    loading = false;
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
    final loading = controller.loading;
    final end = controller.end;

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
