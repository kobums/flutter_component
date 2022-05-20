import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InfinityController extends GetxController {
  // InfinityController({Key? key, required this.url});
  var urll;
  InfinityController(this.urll);

  var scrollController = ScrollController().obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var items = <String>[].obs;

  @override
  void onInit() {
    _getData();
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        _getData();
      }
    });
    super.onInit();
  }

  _getData() async {
    if (isLoading.value) return;
    isLoading.value = true;

    const limit = 25;

    final url = Uri.parse('$urll?_limit=$limit&_page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);
      page.value++;
      isLoading.value = false;

      if (newItems.length < limit) {
        hasMore.value = false;
      }
      items.addAll(newItems.map<String>((item) {
        final number = item['id'];
        return 'Item $number';
      }).toList());
    }
  }

  @override
  void refresh() {
    isLoading.value = false;
    hasMore.value = true;
    page.value = 1;
    items.clear();
    // update();
  }
}
