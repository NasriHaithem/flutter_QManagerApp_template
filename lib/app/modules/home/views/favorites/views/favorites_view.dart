import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(
                () => Text(
              controller.count.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          )
      ),
    );  }
}
