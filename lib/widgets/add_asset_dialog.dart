import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_crypto/controllers/add_asset_dialog_controller.dart';
import 'package:getx_crypto/controllers/asset_controller.dart';

class AddAssetDialog extends StatelessWidget {
  AddAssetDialog({super.key});
  final controller = Get.put(AddAssetDiaglogController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Material(
          child: Container(
            height: 300.w,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: _buildUi(context),
          ),
        ),
      ),
    );
  }

  Widget _buildUi(BuildContext context) {
    if (controller.loading.isTrue) {
      return Center(
        child: SizedBox(
          height: 30.w,
          width: 30.w,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 5,
            strokeAlign: 3,
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            focusColor: Colors.blueAccent,
            elevation: 5,
            dropdownColor: Colors.lightBlue.shade100,
            borderRadius: BorderRadius.circular(5),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 15.sp),
            value: controller.selectedAsset.value,
            enableFeedback: true,
            items: controller.assets.map(
              (asset) {
                return DropdownMenuItem(value: asset, child: Text(asset));
              },
            ).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.selectedAsset.value = value;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(5.r), // Apply border radius here
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              controller.assetValue.value = double.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          MaterialButton(
            onPressed: () {
              AssetController assetController = Get.find();
              assetController.addTrackedAsset(
                  controller.selectedAsset.value, controller.assetValue.value);
              Get.back(closeOverlays: true);
            },
            elevation: 4,
            shape: StadiumBorder(side: BorderSide.none),
            hoverElevation: 4,
            color: Colors.blueAccent.shade400,
            child: Text(
              "Add asset ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
