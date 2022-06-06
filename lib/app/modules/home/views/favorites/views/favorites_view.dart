import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
        child: ListView(
          children: [
            InkWell(
              onTap: (){
                  controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),

            InkWell(
              onTap: (){
                controller.navigateToNextPage();
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 90,
                child: Row(
                  children: [
                    ClipRRect( // Clip it cleanly.
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Copie conforme", style: TextStyle(fontSize: 18),),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Details", style: TextStyle(color: Colors.blue),),
                                        SizedBox(width: 5.0,),
                                        Icon(CupertinoIcons.eye, color:Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("Delete", style: TextStyle(color: Colors.red),),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.cancel, color:Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      )
    );
  }
}
/*

Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: ClipRRect( // Clip it cleanly.
                    child: Hero(
                      tag: '1',
                      child: Image.asset(
                        'assets/fake_logo.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    )
                ),
                title: Text('One-line with leading widget'),
                subtitle: Text(''),
                isThreeLine: true,

              ),
            ),
          ],
        ),
      )
 */