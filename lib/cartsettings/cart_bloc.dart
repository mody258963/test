/// The [dart:async] is neccessary for using streams
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {
        "detals":
            FirebaseFirestore.instance.collection('Detabase').doc('detals'),
        "State": FirebaseFirestore.instance.collection('Detabase').doc('State'),
        "City": FirebaseFirestore.instance.collection('Detabase').doc('City'),
        "expectedrent": FirebaseFirestore.instance
            .collection('Detabase')
            .doc('expectedrent'),
        "image": FirebaseFirestore.instance.collection('Detabase').doc('image'),
        "location":
            FirebaseFirestore.instance.collection('Detabase').doc('location')
      }
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();
