import 'package:flutter/material.dart';

class GeneralBottomSheetWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? imagePath;
  final String? title;
  final String? subtitle;
  final String? buttonTitle;

  const GeneralBottomSheetWidget(
      {Key? key,
      this.onPressed,
      this.imagePath,
      this.title,
      this.subtitle,
      this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Image.asset(imagePath!, width: 150, height: 150),
              SizedBox(
                height: 10,
              ),
              Text(title!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(subtitle!, style: TextStyle(fontSize: 12)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(buttonTitle!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
