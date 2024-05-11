class StudentsModel {
  int? id;
  String? name;
  String? email;
  int? age;
  String? dob;

  StudentsModel({this.id, this.name, this.email, this.age, this.dob});

  StudentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['dob'] = dob;
    return data;
  }
}
