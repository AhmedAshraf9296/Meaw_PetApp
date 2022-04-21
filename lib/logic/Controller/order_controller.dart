import 'package:get/get.dart';
import 'package:meaw/Model/my_order_detail_model.dart';
import 'package:meaw/Model/my_order_header_model.dart';
import 'package:meaw/logic/Controller/auth_controller.dart';
import 'package:meaw/services/my_order_services.dart';

class OrdersController extends GetxController {
  var ordersHeaderList = <MyOrderHeaderModel>[].obs;
  var ordersDetailList = <MyOrderDetailModel>[].obs;
  var isLoading = true.obs;
  var authController = Get.find<AuthController>();
  var ordersMap = {}.obs;

  // get orderhId => ordersMap.entries.map((e) => e.key.hid).toList();


  @override
  void onInit() {
    super.onInit();
    getMyOrdersHeader();
    // getMyOrdersDetail();
  }

  void getMyOrdersHeader() async {
    isLoading(true);
    try {
      ordersHeaderList.clear();
      var ordersHeader = await MyOrdersServices.getOrderHeader(
          authController.displayUserEmail.value);
      if (ordersHeader.isNotEmpty) {
        ordersHeaderList.addAll(ordersHeader);
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void getMyOrdersDetail(int hid) async {
    try {
      isLoading(true);
      var ordersDetail = await MyOrdersServices.getOrderDetail(hid);
      if (ordersDetail.isNotEmpty) {
        ordersDetailList.clear();
        ordersDetailList.addAll(ordersDetail);
        update();
      }
    } finally {
      isLoading(false);
    }
    }
  }

