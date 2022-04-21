import 'package:get/get.dart';
import 'package:meaw/Model/category_model.dart';
import 'package:meaw/Model/products_model.dart';
import 'package:meaw/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <CategoryModel>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;
  var categoryList = <ProductsModel>[].obs;
  List<String> imageCategory = [
    "https://pyxis.nymag.com/v1/imgs/261/ff5/a12aeb3de6b5c7582d88ffc47eb748f1b8-10-dog-food.2x.rsocial.w600.jpg",
    "https://www.iams.com/sites/g/files/fnmzdf386/files/2021-08/cat-product-hub-desktop.png",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getCategories();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategories(String nameCategory) async {
    isAllCategoryLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);
    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryName = await getAllCategories(categoryNameList[index].name);
    if (categoryName != null) {
      categoryList.value = categoryName;
    }
  }
}
