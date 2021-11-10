

class ListOne {
  String firstName, lastName, email, phone;

  ListOne({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
  //constructor

  factory ListOne.fromJSON(Map<String, dynamic> json){
    return ListOne(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
    );
  }

}


class DataUserModel {
  String firstName, lastName, email, phone;
  List<String> task;

  DataUserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.task});


  factory DataUserModel.fromJSON(Map<String, dynamic> json){
    return DataUserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      task: json["task"],
    );
  }

}