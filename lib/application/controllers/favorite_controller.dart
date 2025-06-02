import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/data/models/product_model.dart';

class FavoriteNotifier extends StateNotifier<List<ShoeModel>> {
  FavoriteNotifier() : super([]);

  void toggleFavorite(ShoeModel shoe) {
    if (state.contains(shoe)) {
      state = state.where((item) => item != shoe).toList();
    } else {
      state = [...state, shoe];
    }
  }

  void removeCart(ShoeModel shoe) {
    state = state.where((item) => item.imageUrl != shoe.imageUrl).toList();
  }

  bool isFavorite(ShoeModel shoe) {
    return state.contains(shoe);
  }
}
