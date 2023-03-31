

class UserDetails {
  String? docId;
  String? uid;
  String? name;
  String? gender;
  String? age;
  String? bio;
  String? profileImage;
  String? phnNo;

  UserDetails({
    this.uid,
    this.docId,
    this.gender,
    this.age,
    this.bio,
    this.profileImage,
    this.name,
    this.phnNo
  });

  UserDetails.fromJson(Map<String, dynamic> json, String docId){

    docId = docId;
    uid = json['uid'];
    profileImage = json['profileImage'];
    gender = json['gender'];
    name = json['name'];
    bio = json['bio'];
    phnNo = json['phnNo'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['uid']= uid;
    data['profileImage']= profileImage;
    data['gender']= gender;
    data['name']= name;
    data['bio']= bio;
    data['phnNo']= phnNo;
    return data;
  }


  int get length {
    return toJson().length;
  }
}
