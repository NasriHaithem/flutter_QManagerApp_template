import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMsgWidget extends StatelessWidget {

  final errorMsg;

  const ErrorMsgWidget({required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Container(
          width: 300,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.pink.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(errorMsg, style: const TextStyle(color: Colors.white),),
          )
      ),
    );
  }
}
