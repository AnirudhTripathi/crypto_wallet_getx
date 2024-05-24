import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto/models/api_response.dart';
import 'package:getx_crypto/services/http_service.dart';

class AddAssetDiaglogController extends GetxController {
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;
  RxString selectedAsset = "".obs;
  RxDouble assetValue = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HTTPService httpService = Get.find<HTTPService>();
    var responseData = await httpService.get("currencies");
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);

    currenciesListAPIResponse.data?.forEach((coin) {
      assets.add(coin.name!);
    });
    selectedAsset.value = assets.first;
    loading.value = false;
  }
}
