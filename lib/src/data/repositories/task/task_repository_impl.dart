import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {

  /// ===== добавление задачи ===
  @override
  Stream<List<Task>> getTaskList(String uid) {
    var firestoreTaskData = FirebaseFirestore.instance.collection('taskData').where("userId", isEqualTo: uid);
    return firestoreTaskData.snapshots().map((event) {
      return event.docs.map((e) {
        print(e.id);
        return Task.fromJSON(e.data(), e.id);
      }).toList();
    });
  }

  /// ===== удаление задачи ===
  @override
  Future<void> deleteTask(Task item) => firestoreTaskData.doc(item.id).delete();

  /// ===== удаление всего списка ==
  @override
  Future<void> deleteListTask() async {
    var batch = FirebaseFirestore.instance.batch();
    var allTasks = await firestoreTaskData.where("userId", isEqualTo: uid).get();
    for(var value in allTasks.docs){
      batch.delete(firestoreTaskData.doc(value.id));
    }
    await batch.commit();
  }
}

