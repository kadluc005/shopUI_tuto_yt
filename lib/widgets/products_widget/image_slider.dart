import 'package:flutter/cupertino.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentImage;
  final String image;
  const ImageSlider(
      {super.key,
      required this.currentImage,
      required this.image,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: PageView.builder(
          itemCount: 5,
          onPageChanged: onChange,
          itemBuilder: (context, index) {
            return Image.asset(image);
          },
        ));
  }
}
