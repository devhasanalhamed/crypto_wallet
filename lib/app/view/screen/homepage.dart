import 'package:crypto_wallet/app/data/models/tracked_asset.dart';
import 'package:crypto_wallet/app/logic/assets_controller.dart';
import 'package:crypto_wallet/app/view/screen/details_screen.dart';
import 'package:crypto_wallet/app/view/widget/add_asset_dialog.dart';
import 'package:crypto_wallet/core/utils/get_crypto_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  AssetsController assetsController = Get.find();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const CircleAvatar(
        foregroundImage: NetworkImage(
          'https://i.pravatar.cc/150?img=3',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.dialog(
              AddAssetDialog(),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  _buildUI(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Column(
          children: [
            _portfolioValue(context),
            _trackedAssetsList(context),
          ],
        ),
      ),
    );
  }

  Widget _portfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              const TextSpan(
                text: "\$",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text:
                    '${assetsController.getPortfolioValue().toStringAsFixed(2)}\n',
                style: const TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: 'Portfolio value',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trackedAssetsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: const Text(
              'Portfolio',
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.65,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              itemCount: assetsController.trackedAssets.length,
              itemBuilder: (context, index) {
                TrackedAsset trackedAsset =
                    assetsController.trackedAssets[index];
                return ListTile(
                  leading: Image.network(
                    getCryptoImage(
                      trackedAsset.name!,
                    ),
                  ),
                  title: Text(
                    '${trackedAsset.name}',
                  ),
                  subtitle: Text(
                    'USD: ${assetsController.getAssetPrice(trackedAsset.name!).toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '${trackedAsset.amount}',
                  ),
                  onTap: () {
                    Get.to(
                      () => DetailsScreen(
                        coin: assetsController.getCoinData(trackedAsset.name!)!,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
