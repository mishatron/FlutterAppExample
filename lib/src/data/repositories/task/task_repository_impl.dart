import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  /// ===== добавление задачи ===
  @override
  Stream<List<Task>> getTaskList() {
    var firestoreTaskData = FirebaseFirestore.instance.collection('taskData');
    return firestoreTaskData.snapshots().map((event) {
      return event.docs.map((e) {
        // for(var i in e.id) {
        //   if(i == firestoreUserData.id) {
        //     sortedTaskIndex.add(i);
        //   }
        // }
        print(e.id);
        return Task.fromJSON(e.data(), e.id);
      }).toList();
    });
  }

  /// ===== удаление задачи ===
  @override
  Future<void> deleteTask(Task item) => firestoreTaskData.doc(item.id).delete();
}

/// ===== y8AzQ3RtEbdf8guammco7y2nub32 - мой
/// ===== pOWAWeYV6AcrFFapBdW5U1Yus7R2 - asta
