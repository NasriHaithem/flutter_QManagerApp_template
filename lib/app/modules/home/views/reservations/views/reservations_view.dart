import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
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
