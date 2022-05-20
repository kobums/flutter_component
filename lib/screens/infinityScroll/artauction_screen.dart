import 'package:flutter/material.dart';
import 'package:flutter_component/components/infinity_components.dart';

class ArtauctionScreen extends StatelessWidget {
  const ArtauctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtAuction Screen'),
      ),
      body: InfinityComponents(
          url: 'http://artauction.netb.co.kr/api/user', tag: 'artauction'),
    );
  }
}
