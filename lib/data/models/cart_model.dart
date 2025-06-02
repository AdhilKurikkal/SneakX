import 'package:sneakx/data/models/product_model.dart';

class CartItem {
  final ShoeModel shoe; //this contains all
  final String size; //this is for selected size from the product details page
  int quantity;

  CartItem({required this.shoe, required this.size, this.quantity = 1});

  int get totalPrice => shoe.price * quantity;
}
