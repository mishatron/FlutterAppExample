import 'package:flutter_app_example/models/task_model.dart';
import 'package:flutter_app_example/src/core/data/base_repository.dart';

abstract class TaskRepository extends BaseRepository {
  Stream<List<ListTask>> getData();
}