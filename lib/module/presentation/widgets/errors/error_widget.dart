import 'package:flutter/material.dart';

class PasposErrorWidget extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final String? message;

  const PasposErrorWidget(
      {Key? key, this.imagePath, this.width, this.height, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath!,
            width: width!,
            height: height!,
          ),
          const SizedBox(height: 10),
          Text(
            message!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
