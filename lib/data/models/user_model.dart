class UserModel {
  final String uid;
  final String email;
  final String phone;
  final String city;
  final String address;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.city,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "phone": phone,
      "city": city,
      "address": address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"],
      email: map["email"],
      phone: map["phone"],
      city: map["city"],
      address: map["address"],
    );
  }
}
