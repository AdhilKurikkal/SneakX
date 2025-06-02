import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/application/controllers/favorite_controller.dart';
import 'package:sneakx/data/models/product_model.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<ShoeModel>>(
      (ref) => FavoriteNotifier(),
    );
