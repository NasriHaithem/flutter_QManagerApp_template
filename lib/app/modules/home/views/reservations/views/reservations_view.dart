import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                  ),
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Service: ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text("The service 1",style: TextStyle(fontSize: 18,color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Site : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                          SizedBox(width: 16,),

                          SizedBox(width: 16,),
                          Text("Site 1 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          SizedBox(width:100,child: Text("State, City, Street",textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: Colors.grey),)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("#Ticket : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('23', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( CupertinoIcons.ticket_fill, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("In-Line : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('12', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.group, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("Etat : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Waiting', style: TextStyle(fontSize: 18,color: Colors.amber,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.access_time, size: 24.0, color: Colors.amber,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LayoutBuilder(builder: (context,constraints){
                            return Flex(
                              children: List.generate((constraints.constrainWidth()/10).floor(), (index) =>
                                  SizedBox(height: 1,width: 5,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade400),),)
                              ),
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            );
                          },),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:16,right:16,bottom: 12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Cancel", style: TextStyle(color: Colors.red),),
                            SizedBox(width: 5.0,),
                            Icon(Icons.cancel, color:Colors.red),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Details", style: TextStyle(color: Colors.blue),),
                            SizedBox(width: 5.0,),
                            Icon(CupertinoIcons.eye, color:Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                  ),
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Service: ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text("The service 1",style: TextStyle(fontSize: 18,color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Site : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                          SizedBox(width: 16,),

                          SizedBox(width: 16,),
                          Text("Site 1 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          SizedBox(width:100,child: Text("State, City, Street",textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: Colors.grey),)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("#Ticket : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('23', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( CupertinoIcons.ticket_fill, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("In-Line : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('12', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.group, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("Etat : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Served', style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.check, size: 24.0, color: Colors.green,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LayoutBuilder(builder: (context,constraints){
                            return Flex(
                              children: List.generate((constraints.constrainWidth()/10).floor(), (index) =>
                                  SizedBox(height: 1,width: 5,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade400),),)
                              ),
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            );
                          },),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:16,right:16,bottom: 12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Cancel", style: TextStyle(color: Colors.red),),
                            SizedBox(width: 5.0,),
                            Icon(Icons.cancel, color:Colors.red),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Details", style: TextStyle(color: Colors.blue),),
                            SizedBox(width: 5.0,),
                            Icon(CupertinoIcons.eye, color:Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                  ),
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Service: ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text("The service 1",style: TextStyle(fontSize: 18,color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Site : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                          SizedBox(width: 16,),

                          SizedBox(width: 16,),
                          Text("Site 1 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          SizedBox(width:100,child: Text("State, City, Street",textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: Colors.grey),)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("#Ticket : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('23', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( CupertinoIcons.ticket_fill, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("In-Line : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('12', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.group, size: 24.0, ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text("Etat : ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Cancelled', style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( Icons.cancel_outlined, size: 24.0, color: Colors.red,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LayoutBuilder(builder: (context,constraints){
                            return Flex(
                              children: List.generate((constraints.constrainWidth()/10).floor(), (index) =>
                                  SizedBox(height: 1,width: 5,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade400),),)
                              ),
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            );
                          },),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              color: Colors.grey.shade200
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:16,right:16,bottom: 12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Cancel", style: TextStyle(color: Colors.red),),
                            SizedBox(width: 5.0,),
                            Icon(Icons.cancel, color:Colors.red),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: const [
                            Text("Details", style: TextStyle(color: Colors.blue),),
                            SizedBox(width: 5.0,),
                            Icon(CupertinoIcons.eye, color:Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );  }
}
