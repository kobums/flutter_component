import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_component/services/user_services.dart';
import 'package:http/http.dart' as http;

class InfinityController extends GetxController {
  var apiUrl;
  InfinityController(this.apiUrl);

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

    const limit = 7;

    final url = Uri.parse('$apiUrl?pagesize=$limit&page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final newItems = json.decode(response.body);
      page.value++;
      isLoading.value = false;

      User user = User.fromJson(newItems);

      var useritems = user.items;
      if (useritems.length < limit) {
        hasMore.value = false;
      }

      items.addAll(useritems.map<String>((item) {
        final number = item.id;
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
  }
}
