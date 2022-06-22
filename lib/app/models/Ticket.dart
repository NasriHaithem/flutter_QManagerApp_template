import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));
String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
  Ticket({
    required id,
    required date,
    required serviceId,
    required serviceTitleFR,
    required serviceTitleAR,
    required serviceTitleEN,
    required numTicket,
    required idSite,
    required nomSiteFR,
    required nomSiteAR,
    required nomSiteEN,
    required queueName,
    required userId,
    required rank,
    required status,
  }):
         _id = id,
         _date = date,
         _serviceId = serviceId,
         _serviceTitleFR = serviceTitleFR,
         _serviceTitleAR = serviceTitleAR,
         _serviceTitleEN = serviceTitleEN,
         _numTicket = numTicket,
         _idSite = idSite,
         _nomSiteFR = nomSiteFR,
         _nomSiteAR = nomSiteAR,
         _nomSiteEN = nomSiteEN,
         _queueName = queueName,
         _userId = userId,
         _rank = rank,
         _status = status;

  String _id;
  String _date;
  int _serviceId;
  String? _serviceTitleFR;
  String? _serviceTitleAR;
  String? _serviceTitleEN;
  int _numTicket;
  int _idSite;
  String? _nomSiteFR;
  String? _nomSiteAR;
  String? _nomSiteEN;
  String _queueName;
  String _userId;
  int _rank;
  String _status;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    date: json["date"],
    serviceId: json["serviceId"],
    serviceTitleFR: json["serviceTitleFR"],
    serviceTitleAR: json["serviceTitleAR"],
    serviceTitleEN: json["serviceTitleEN"],
    numTicket: json["numTicket"],
    idSite: json["idSite"],
    nomSiteFR: json["nomSiteFR"],
    nomSiteAR: json["nomSiteAR"],
    nomSiteEN: json["nomSiteEN"],
    queueName: json["queueName"],
    userId: json["userId"],
    rank: json["rank"],
    status: json["status"],
  );
  Map<String, dynamic> toJson() => {
    "id": _id,
    "date": _date,
    "serviceId": _serviceId,
    "serviceTitleFR": _serviceTitleFR,
    "serviceTitleAR": _serviceTitleAR,
    "serviceTitleEN": _serviceTitleEN,
    "numTicket": _numTicket,
    "idSite": _idSite,
    "nomSiteFR": _nomSiteFR,
    "nomSiteAR": _nomSiteAR,
    "nomSiteEN": _nomSiteEN,
    "queueName": _queueName,
    "userId": _userId,
    "rank": _rank,
    "status": _status,
  };

  String get id => _id;
  String get date => _date;
  int get serviceId => _serviceId;
  String get siteName {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _nomSiteAR != null
          ? utf8.decode(_nomSiteAR!.codeUnits)
          : _nomSiteFR ?? _nomSiteEN!;
      case "fr": return _nomSiteFR ?? _nomSiteEN ?? utf8.decode(_nomSiteAR!.codeUnits);
      default: return _nomSiteEN ?? _nomSiteFR ?? utf8.decode(_nomSiteAR!.codeUnits);
    }
  }
  int get numTicket => _numTicket;
  int get idSite => _idSite;
  String get serviceName {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _serviceTitleAR != null
          ? utf8.decode(_serviceTitleAR!.codeUnits)
          : _serviceTitleFR ?? _serviceTitleEN!;
      case "fr": return _serviceTitleFR ?? _serviceTitleEN ?? utf8.decode(_serviceTitleAR!.codeUnits);
      default: return _serviceTitleEN ?? _serviceTitleFR ?? utf8.decode(_serviceTitleAR!.codeUnits);
    }
  }
  String get queueName => _queueName;
  String get userId => _userId;
  int get rank => _rank;
  String get status => _status;

  set status(String value) {
    _status = value;
  }
}
