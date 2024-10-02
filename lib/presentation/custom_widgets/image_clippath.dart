import 'package:flutter/widgets.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:medical_test/presentation/custom_widgets/my_clipper.dart';

class ImageClippath extends StatelessWidget {
  final image;
  const ImageClippath({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: SizedBox(
        height: AppSizeScreen.screenHeight * 0.31,
        child: Image.asset(
          image,
          width: AppSizeScreen.screenWidth * 1,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
