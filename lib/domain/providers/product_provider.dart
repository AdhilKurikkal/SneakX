import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/data/models/product_model.dart';

//to get products in firestore

final productProvider = FutureProvider<List<ShoeModel>>((ref) async {
  final snap = await FirebaseFirestore.instance.collection('products').get();

  return snap.docs.map((doc) => ShoeModel.fromMap(doc.data())).toList();
});

//select images
final selectimgProvider = StateProvider<int>((ref) => 0);

//select size
final selectsizeProvider = StateProvider<int?>((ref) => null);
