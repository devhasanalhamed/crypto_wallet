import 'package:crypto_wallet/app/data/models/coin_data.dart';
import 'package:crypto_wallet/core/utils/get_crypto_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final CoinData coin;
  const DetailsScreen({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        coin.name!,
      ),
    );
  }

  _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
        ),
        child: Column(
          children: [
            _assetPrice(context),
            _assetInfo(context),
          ],
        ),
      ),
    );
  }

  _assetPrice(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.10,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              getCryptoImage(
                coin.name!,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\$ ${coin.values?.uSD?.price?.toStringAsFixed(2)}\n',
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                TextSpan(
                  text:
                      '${coin.values?.uSD?.percentChange24h?.toStringAsFixed(2)} %',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: coin.values!.uSD!.percentChange24h! > 0
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _assetInfo(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        children: [
          _infoCard(
            'Circulating Supply',
            coin.circulatingSupply.toString(),
          ),
          _infoCard(
            'Maximum Supply',
            coin.maxSupply.toString(),
          ),
          _infoCard(
            'Total Supply',
            coin.totalSupply.toString(),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
