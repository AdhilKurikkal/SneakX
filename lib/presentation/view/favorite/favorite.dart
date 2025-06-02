import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/domain/providers/favorite_provider.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Your Favorites")),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final shoe = favorites[index];
          return ListTile(
            leading: CachedNetworkImage(imageUrl: shoe.imageUrl[0]),
            title: Text(shoe.name),
            subtitle: Text("₹${shoe.price}"),
            trailing: GestureDetector(
              onTap: () {
                ref.read(favoriteProvider.notifier).removeCart(shoe);
              },
              child: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
