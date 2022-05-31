import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_credentials_controller.dart';

class AccountCredentialsView extends GetView<AccountCredentialsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.deepPurpleAccent,
            size: 35,
          ),
        ),
      ),
      body:  Padding(
        padding:  const EdgeInsets.all(20.0),

        child:  Column(

          children:   <Widget>[
            Card(
              child: ListTile(
                  horizontalTitleGap: 50,
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      "First name",
                      style: TextStyle(fontWeight: FontWeight.bold),

                    ),
                  ),
                  title: Text(
                    "Haithem",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                  ),
              ),
            ),
            SizedBox(height: 15),

            Card(
              child: ListTile(
                horizontalTitleGap: 50,
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    "Last name",
                    style: TextStyle(fontWeight: FontWeight.bold),

                  ),
                ),
                title: Text(
                  "Nasri",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                ),
              ),
            ),
            SizedBox(height: 15),

            Card(
              child: ListTile(
                horizontalTitleGap: 75,
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),

                  ),
                ),
                title: Text(
                  "haithem.nasri@yopmail.com",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                ),
              ),
            ),
            SizedBox(height: 15),

            Card(
              child: ListTile(
                horizontalTitleGap: 73,
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    "Phone",
                    style: TextStyle(fontWeight: FontWeight.bold),

                  ),
                ),
                title: Text(
                  "+216 12345678",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
