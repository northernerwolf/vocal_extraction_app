import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vocal_extraction_app/domain/models/output_model.dart';

class FirestoreDataProvider with ChangeNotifier {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('predictions');
  late List<DataModel> dataList = [];

  // List<DataModel> get dataList => _dataList;

  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();
      dataList = querySnapshot.docs
          .map((doc) => DataModel(
                completedAt: doc['completed_at'],
                createdAt: doc['created_at'],
                error: doc['error'],
                id: doc['id'],
                logs: doc['logs'],
                metrics: doc['metrics'],
                output: doc['output'],
                startedAt: doc['started_at'],
                status: doc['status'],
              ))
          .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
