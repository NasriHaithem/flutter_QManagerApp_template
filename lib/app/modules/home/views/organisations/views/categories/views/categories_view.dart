import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/categories/bindings/categories_binding.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => controller.navigateBack(),
        ),
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
                          controller.getCategoryName(controller.foundCategories.value[index]),
                          style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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