import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakx/core/constants/color.dart';
import 'package:sneakx/core/constants/font.dart';
import 'package:sneakx/core/constants/svg.dart';
import 'package:sneakx/core/utils/screen_size.dart';
import 'package:sneakx/data/models/product_model.dart';
import 'package:sneakx/presentation/view/product/product_detail.dart';
import 'package:sneakx/presentation/widget/clipper_cart.dart';
import 'package:sneakx/presentation/widget/custom_clipper.dart';

class ProductCard extends StatelessWidget {
  final ShoeModel shoes;
  final int index;

  const ProductCard({super.key, required this.index, required this.shoes});

  @override
  Widget build(BuildContext context) {
    //

    //
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    final isEven = index.isEven;

    final padding =
        isEven
            ? const EdgeInsets.only(top: 5, right: 20)
            : const EdgeInsets.only(top: 25, left: 20);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper:
              isEven
                  ? CustomContainerClipper()
                  : UpsideDownCustomContainerClipper(),
          child: InkWell(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(shoe: shoes),
                  ),
                ),
            child: Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: ColorConst.offwhite),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      shoes.category,
                      style: const TextStyle(
                        fontFamily: FontFam.verbatim,
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      shoes.name,
                      style: const TextStyle(
                        fontFamily: FontFam.verbatim,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '₹${shoes.price}',
                      style: const TextStyle(
                        fontFamily: FontFam.verbatim,
                        color: Colors.black,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Cart Shape Positioned
        Positioned(
          top: isEven ? null : 180,
          bottom: isEven ? 180 : null,
          left: isEven ? null : 80,
          right: isEven ? 80 : null,
          child: ClipPath(
            clipper:
                isEven
                    ? CustomShapeClipperUpside()
                    : MirroredCustomShapeClipperUpsideDown(),
            child: Container(
              height: h * 0.07,
              width: w * 0.18,

              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Padding(
                padding: padding,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SvgImg.cart,
                      width: w * 0.06,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Shoe Image
        Positioned(
          top: isEven ? 150 : null,
          bottom: isEven ? null : 175,
          left: 15,
          child: Image.network(shoes.imageRbg, height: 150),
        ),

        // Favorite Icons
        Positioned(
          top: isEven ? 25 : null,
          bottom: isEven ? null : 25,
          right: isEven ? 5 : null,
          left: isEven ? null : 5,
          child: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
