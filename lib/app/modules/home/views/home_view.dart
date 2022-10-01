import 'package:example_project/app/modules/home/views/custom_text_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButton<String>(
                elevation: 5,
                value: controller.categories.first.title,
                style: TextStyle(color: Colors.black),
                items: controller.categories.map((e) {
                  return DropdownMenuItem<String>(
                    value: e.title,
                    child: Text(e.title),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a langauage",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (value) {
                  if (value != null) controller.choosenCategory.value = value;
                },
              ),
            ),
            if (controller.choosenCategory.value != '')
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: controller.categories
                      .where(
                          (p0) => p0.title == controller.choosenCategory.value)
                      .first
                      .forms
                      .map((e) {
                    if (controller.getCategoryType().type ==
                        TypeCategory.dropdown) {
                      return Text('Select Dropdown');
                    }

                    if (controller.getCategoryType().type ==
                        TypeCategory.date) {
                      return Text('Select Date');
                    }
                    return CustomTextForm(
                      hintText: e.hintText,
                      onChanged: (v) {
                        controller.submittedForm.addAll(
                          {e.parameterApi: v},
                        );
                        print('entries: ${controller.submittedForm}');
                      },
                    );
                  }).toList(),
                ),
              )
          ],
        );
      }),
    );
  }
}

class DynamicForm extends GetView<HomeController> {
  const DynamicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: controller.categories
            .firstWhere((p0) => p0.title == controller.choosenCategory.value)
            .forms
            .map((e) {
          return CustomTextForm(
            hintText: e.hintText,
            onChanged: (v) {
              controller.submittedForm.addAll({e.hintText: v});
              print('entries: ${controller.submittedForm}');
            },
          );
        }).toList(),
      ),
    );
  }
}
