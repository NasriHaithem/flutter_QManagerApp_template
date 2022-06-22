import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,//disable back arrow when there is no parent category
        title: const Text('Choose a category', style: TextStyle(color: Colors.black, fontSize: 18),),
        leading: Obx(
            () => controller.displayBackArrow()
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(color: Colors.deepPurpleAccent),
              onChanged: (value) => controller.filterCategories(value),
              decoration: const InputDecoration(

                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                  () => ListView.builder(
                    itemCount: controller.foundCategories.value.length,

                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () {
                          controller.updateCategoriesList(controller.foundCategories.value[index]);
                        },
                        title: Text(
                          controller.foundCategories.value[index].name,
                          style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                        ),
                        trailing: const Icon(Icons.chevron_right),

                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}