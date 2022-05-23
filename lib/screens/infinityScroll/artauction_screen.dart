import 'package:flutter/material.dart';
import 'package:flutter_component/components/infinity_components.dart';

import '../../models/user.dart';

class ArtauctionScreen extends StatelessWidget {
  const ArtauctionScreen({Key? key}) : super(key: key);

  Widget _renderItem(dynamic data) {
    var item = data as User;
    return ListTile(title: Text(item.email));
  }

  @override
  Widget build(context) {
    return InfiniteScroll(reader: UserManager.find, builder: _renderItem);
  }
}
