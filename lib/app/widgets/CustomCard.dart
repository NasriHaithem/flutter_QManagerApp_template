import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/services/organisationService.dart';


class CustomCard extends StatelessWidget {

  final dynamic data;
  final Function() function;

  const CustomCard({
    required this.data,
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
                  tag: data['id'].toString(),
                  child: Container(
                    decoration: const BoxDecoration(
                       borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/fake_logo.png"),
                          fit: BoxFit.cover,
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
                      OrganisationService.getOrganisationName(data),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Unsplash',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
