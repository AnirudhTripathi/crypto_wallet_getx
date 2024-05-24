import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_crypto/models/api_response.dart';
import 'package:getx_crypto/models/coin_data.dart';
import 'package:getx_crypto/models/tracked_asset.dart';
import 'package:getx_crypto/services/http_service.dart';

class AssetController extends GetxController {
  RxList<CoinData> coinData = <CoinData>[].obs;
  RxBool loading = false.obs;
  RxList<TrackedAsset> trackedAsset = <TrackedAsset>[].obs;

  @override
  void onInit() {
    super.onInit();
    print(trackedAsset);
  }

  void addTrackedAsset(String name, double amount) {
    trackedAsset.add(
      TrackedAsset(
        name: name,
        amount: amount,
      ),
    );
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HTTPService httpService = Get.find();
    var responseData = await httpService.get("currencies");
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);

    coinData.value = currenciesListAPIResponse.data ?? [];
    loading.value = false;
  }

  double getPortfolioValue() {
    if (coinData.isEmpty) {
      return 0;
    }
    if (trackedAsset.isEmpty) {
      return 0;
    }
    double value = 0;
    for (TrackedAsset asset in trackedAsset) {
      value += getAssetPrice(asset.name!) * asset.amount!;
    }
    return value;
  }

  double getAssetPrice(String name) {
    CoinData? data = getCoinData(name);
    return data?.values?.uSD?.price?.toDouble() ?? 0;
  }

  CoinData? getCoinData(String name) {
    return coinData.firstWhereOrNull((e) => e.name == name);
  }
}
