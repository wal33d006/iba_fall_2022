import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 1;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final db = FirebaseFirestore.instance;

  int get count => _count;

  void increment() async {
    _isLoading = true;
    notifyListeners();
    var id = '';
    var count = 0;
    await db.collection("config").get().then((event) {
      id = event.docs.first.id;
      count = event.docs.first.data()['count'];
    });

    var newCount = count + 1;

    await db.collection("config").doc(id).set({
      "count": newCount,
    });

    _count = newCount;

    _isLoading = false;
    notifyListeners();
  }

  void fetchCount() async {
    _isLoading = true;
    notifyListeners();
    await db.collection("config").get().then((event) {
      _count = event.docs.first.data()['count'];
      _isLoading = false;
      notifyListeners();
    });
  }
}
