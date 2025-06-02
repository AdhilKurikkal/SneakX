// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sneakx/core/constants/font.dart';
import 'package:sneakx/core/constants/svg.dart';

import 'package:sneakx/data/models/product_model.dart';
import 'package:sneakx/domain/providers/cart_provider.dart';
import 'package:sneakx/domain/providers/favorite_provider.dart';
import 'package:sneakx/domain/providers/product_provider.dart';
import 'package:sneakx/presentation/view/cart/cart.dart';
import 'package:sneakx/presentation/view/favorite/favorite.dart';

class ProductDetail extends ConsumerWidget {
  final ShoeModel shoe;
  const ProductDetail({super.key, required this.shoe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectImageindex = ref.watch(selectimgProvider);
    // final selectImage = ref.read(selectimgProvider.notifier);
    //
    final selectSize = ref.watch(selectsizeProvider);

    //
    final isFav = ref.watch(favoriteProvider).contains(shoe);
    ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: SvgPicture.asset(SvgImg.cart),
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
            child: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: shoe.imageUrl[selectImageindex],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 50,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: shoe.imageUrl.length,
                      itemBuilder: (_, index) {
                        final isSelected = selectImageindex == index;
                        return InkWell(
                          onTap:
                              () =>
                                  ref.read(selectimgProvider.notifier).state =
                                      index,
                          //  selectImage.state = index,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: isSelected ? 2 : 0,
                                color: isSelected ? Colors.black : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  shoe.imageUrl[index],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              Text(
                shoe.category,
                style: TextStyle(
                  fontFamily: FontFam.verbatim,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                shoe.name,
                style: TextStyle(
                  fontFamily: FontFam.verbatim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "MRP : ₹${shoe.price}",
                style: TextStyle(fontFamily: FontFam.verbatim, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                "incl. of all taxes\n(Also includes all applicable duties)",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              const Text(
                'Select Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: shoe.sizes.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final isSelectSize = selectSize == index;
                  return GestureDetector(
                    onTap:
                        () =>
                            ref.read(selectsizeProvider.notifier).state = index,
                    child: Container(
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                        color: isSelectSize ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelectSize ? Colors.black : Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          shoe.sizes[index],
                          style: TextStyle(
                            color: isSelectSize ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap:
                    selectSize == null
                        ? null
                        : () {
                          final size = shoe.sizes[selectSize];
                          ref.read(cartProvider.notifier).addToCart(shoe, size);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to cart')),
                          );
                        },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Add to Bag',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  ref.read(favoriteProvider.notifier).toggleFavorite(shoe);
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isFav ? 'Added to favorites ' : 'Favorite',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                        color: isFav ? Colors.red : Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
