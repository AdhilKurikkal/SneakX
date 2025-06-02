import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/domain/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                leading: CachedNetworkImage(imageUrl: item.shoe.imageUrl[0]),
                title: Text(item.shoe.name),
                subtitle: Text('Size: ${item.size}\nPrice:₹${item.totalPrice}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed:
                          () => ref
                              .read(cartProvider.notifier)
                              .decrementQunty(index),
                      icon: Icon(Icons.remove),
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      onPressed:
                          () => ref
                              .read(cartProvider.notifier)
                              .incrementQunty(index),
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              );
            },
          ),
          Spacer(),
          Text('Total:₹${ref.watch(cartProvider.notifier).totalPrice}'),
        ],
      ),
    );
  }
}
