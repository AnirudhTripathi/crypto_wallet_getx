import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_crypto/controllers/asset_controller.dart';
import 'package:getx_crypto/widgets/add_asset_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  AssetController assetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
      ),
      body: _buildUI(
        context,
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      title: const CircleAvatar(
        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=62"),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.dialog(
                AddAssetDialog(),
              );
            },
            icon: Icon(Icons.add_circle))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Column(
          children: [
            _portfolioValue(
              context,
            ),
            _trackedAssetsLists(
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _portfolioValue(BuildContext context) {
    return Container(
      width: 400.w,
      color: Colors.amberAccent,
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: "\$",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text:
                    "${assetController.getPortfolioValue().toStringAsFixed(2)}\n",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "Portfilio Value",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trackedAssetsLists(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
              child: Text(
                "Portfolio",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }
}


// 1:13:04 