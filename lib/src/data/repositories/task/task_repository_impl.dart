import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {

  @override
  Stream<List<ListTask>> getData() => FirebaseFirestore.instance
      .collection('taskData')
      .snapshots().map((event) =>
      event.docs.map((e) {
        return ListTask.fromJSON(e.data());
      }).toList()
  );
}