import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Filteration extends GetxController {
  RxBool show = true.obs;

  Stream<QuerySnapshot> Detabase =
      FirebaseFirestore.instance.collection('Detabase').snapshots();
  Stream<QuerySnapshot> filterDatabase(int minPrice, int maxPrice) {
    return FirebaseFirestore.instance
        .collection('Detabase')
        .where('expectedrent', isGreaterThanOrEqualTo: minPrice)
        .where('expectedrent', isLessThanOrEqualTo: maxPrice)
        .snapshots();
    // ignore: dead_code
    Stream<QuerySnapshot>? increment() {
      if (show == false) {
        return FirebaseFirestore.instance.collection('Detabase').snapshots();
      } else {
        return Detabase;
      }
    }

    LowtoHigh() {
      Detabase = filterDatabase(1000, 100);
    }

    HightoLow() {
      Detabase = filterDatabase(100, 1000);
    }

    handerdtofour() {
      Detabase = filterDatabase(100, 100);
    }
  }
}
