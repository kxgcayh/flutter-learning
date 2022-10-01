import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString choosenCategory = RxString('');
  final RxMap<dynamic, dynamic> submittedForm = {}.obs;
  final categories = [
    CategoryModel(
      title: 'Select Category',
      type: TypeCategory.text,
      forms: [
        FormModel(hintText: 'Isi dari Form pertama'),
      ],
    ),
    CategoryModel(
      title: 'Category Pertama',
      type: TypeCategory.date,
      forms: [
        FormModel(hintText: 'Isi dari Form 2'),
      ],
    ),
    CategoryModel(
      title: 'Category Kedua',
      type: TypeCategory.text,
      forms: [
        FormModel(hintText: 'Isi dari Form 3'),
      ],
    ),
    CategoryModel(
      title: 'Category Ketiga',
      type: TypeCategory.dropdown,
      forms: [
        FormModel(hintText: 'Isi dari Form pertama'),
      ],
    ),
    CategoryModel(
      title: 'Category Keempat',
      type: TypeCategory.date,
      forms: [
        FormModel(hintText: 'Isi dari Form pertama'),
      ],
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  CategoryModel getCategoryType() {
    return categories.firstWhere((p0) => p0.title == choosenCategory.value);
  }
}

class CategoryModel {
  const CategoryModel({
    required this.title,
    required this.type,
    required this.forms,
  });

  final String title;
  final TypeCategory type;
  final List<FormModel> forms;
}

class FormModel {
  const FormModel({
    this.parameterApi,
    required this.hintText,
  });
  final String hintText;
  final String? parameterApi;
}

enum TypeCategory { date, text, dropdown }
