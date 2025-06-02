import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/core/utils/screen_size.dart';
import 'package:sneakx/domain/providers/product_provider.dart';

import 'package:sneakx/presentation/view/home/widgets/product_card.dart';
// Make sure this import is correct

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    final productAsync = ref.watch(productProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SneakX Store"),
        backgroundColor: Colors.white,
      ),
      body: productAsync.when(
        data:
            (products) => Padding(
              padding: EdgeInsets.all(w * 0.02),
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: w / (h * 0.75),
                  crossAxisSpacing: w * 0.04,
                  mainAxisSpacing: h * 0.04,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(index: index, shoes: products[index]);
                },
              ),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
