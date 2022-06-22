import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/services/organisationService.dart';


class CustomCard extends StatelessWidget {

  final String data;
  final Uint8List image;
  final Function() function;

  const CustomCard({
    required this.data,
    required this.image,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
          onTap: function,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Hero(
                  //we joined the code units of the data to get a unique id out of the data.
                  tag: double.parse(data.codeUnits.join()),
                  child: Container(
                    decoration: BoxDecoration(
                       borderRadius:  const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                          image: MemoryImage(image),
                          fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
