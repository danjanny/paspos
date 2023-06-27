import 'package:flutter/material.dart';
import 'package:paspos/module/presentation/widgets/product_page/paspos_search_bar.dart';
import 'package:paspos/module/utils/config.dart';
import 'package:paspos/module/utils/global_util.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String)? callbackQuery;

  const CustomAppBar({Key? key, this.callbackQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: PasposConfig.themeColor,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Paspos',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.add), color: Colors.white)
            ],
          ),
        ),
        PasposSearchBar(
          callbackQuery: (callbackQuery) {
            logSystem((CustomAppBar()).toString(), "callback query",
                callbackQuery.toString());
          },
        )
      ],
    );
  }
}
