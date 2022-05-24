import 'package:flutter/material.dart';
import 'package:flutter_component/components/infinity_components.dart';

import '../../models/picture.dart';

class PictureScreen extends StatelessWidget {
  const PictureScreen({Key? key}) : super(key: key);

  Widget _renderItem(dynamic data) {
    var item = data as Picture;
    return ListTile(title: Text(item.title));
  }

  @override
  Widget build(context) {
    return InfiniteScroll(reader: PictureManager.find, builder: _renderItem);
  }
}
