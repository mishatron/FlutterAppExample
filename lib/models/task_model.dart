
class ListTask {
  String task;

  ListTask({
    required this.task
  });

  factory ListTask.fromJSON(Map<String, dynamic> json){
    return ListTask(
      task: json["data"],
    );
  }

}