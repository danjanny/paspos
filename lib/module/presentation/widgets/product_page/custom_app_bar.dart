import 'package:flutter/material.dart';
import 'package:paspos/module/presentation/widgets/product_page/paspos_search_bar.dart';
import 'package:paspos/module/utils/config.dart';
import 'package:paspos/module/utils/global_util.dart';

class CustomAppBar extends StatelessWidget {
  final Color? color;
  final Function(String)? searchQuery;
  final Color? textColor;
  final String? title;
  final IconButton? suffixIconButton;
  final bool? enableSearchBar;

  const CustomAppBar(
      {Key? key,
      this.searchQuery,
      this.color,
      this.textColor,
      this.title,
      this.suffixIconButton,
      this.enableSearchBar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: color ?? PasposConfig.themeColor,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              suffixIconButton ?? Container()
              // IconButton(
              //     onPressed: () {}, icon: Icon(Icons.add), color: Colors.white)
            ],
          ),
        ),
        enableSearchBar!
            ? PasposSearchBar(
                callbackQuery: (callbackQuery) {
                  searchQuery!(callbackQuery);
                },
              )
            : Container()
      ],
    );
  }
}
