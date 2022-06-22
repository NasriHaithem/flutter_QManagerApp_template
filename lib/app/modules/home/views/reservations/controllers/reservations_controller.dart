import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/models/Ticket.dart';
import 'package:mobile_app/app/services/TicketService.dart';
import 'package:mobile_app/app/services/serviceService.dart';

class ReservationsController extends GetxController {

  Rx<List<Ticket>> userTickets = Rx<List<Ticket>>([]);

  @override
  void onInit() async{
    updateTicketsList();
    super.onInit();
  }
  List<Widget> displayStatus(String status) {
    var decodedStatus = utf8.decode(status.codeUnits);
    switch(decodedStatus) {
      case "En attente": return [
        Text(
          decodedStatus,
          style: const TextStyle(fontSize: 18,color: Colors.amber,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon( Icons.access_time, size: 24.0, color: Colors.amber,),
      ];

      case "Servi":return [
        Text(
          decodedStatus,
          style: const TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon( Icons.access_time, size: 24.0, color: Colors.green,),
      ];

      case "Absent": return [
        Text(
          decodedStatus,
          style: const TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon( Icons.access_time, size: 24.0, color: Colors.red,),
      ];

      case "Annulée": return [
        Text(
          decodedStatus,
          style: const TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon( Icons.access_time, size: 24.0, color: Colors.grey,),
      ];

      default: return [
        const Text(
          "-",
          style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon( Icons.access_time, size: 24.0, color: Colors.grey,),
      ];
    }
  }

  Future<List<Ticket>> getTicketsByUser(String userId) async{
    var response = await TicketService.getTicketsByUser(userId);
    final List<dynamic> responseJson = jsonDecode(response.body);

    return responseJson
        .map((c) => Ticket.fromJson(c))
        .toList();
  }

  Future<Service> getServiceByIdAndSiteId(int siteId, int serviceId) async{
    var response = await ServiceService.getServiceByIdAndSiteId(siteId, serviceId);
    final dynamic responseJson = jsonDecode(response.body);
    return Service.fromJson(responseJson);
  }

  void updateTicketsList() async{
    String userPhone = (await StorageHandler.getUserFromStorage())!.telephone;
    userTickets.value = await getTicketsByUser(userPhone);
  }

  Future<void> cancelTicket(String ticketId, int index) async{
    await TicketService.cancelTicket(ticketId);
    updateTicketsList();
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
