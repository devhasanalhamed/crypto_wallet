import 'package:crypto_wallet/app/view/widget/add_asset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }
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
