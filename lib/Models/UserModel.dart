class UserModel {
  Data? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userName;
  String? fullName;
  String? image;
  String? gender;
  String? mobile;
  String? country;
  String? city;
  String? state;
  String? authToken;
  String? refreshToken;

  Data(
      {this.id,
      this.userName,
      this.fullName,
      this.image,
      this.gender,
      this.country,
      this.city,
      this.state,
      this.authToken,
      this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    image = json['image'];
    gender = json['gender'];
    mobile = json['mobile'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    authToken = json['authToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['authToken'] = this.authToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
