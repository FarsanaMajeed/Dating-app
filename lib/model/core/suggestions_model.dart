class SuggestionsModel {
  String? name;
  String? age;
  String? bio;
  String? location;
  String? status;
  String? image;

  SuggestionsModel(
      {this.name, this.age, this.bio, this.location, this.status, this.image});

  SuggestionsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    bio = json['bio'];
    location = json['location'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}
