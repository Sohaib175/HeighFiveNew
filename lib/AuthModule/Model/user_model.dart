class UserModel {
  String userId;
  String name;
  String email;
  String profileImage;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        userId: json["id"],
        name: json["name"],
        email: json["email"],
        profileImage: json["profileImage"]);
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['name'] = name;
//   return data;
// }
// saveData() async {
//     Map<String, dynamic> data = {
//       "name": "ALI",
//       "age": 11,
//       "isVerified": false,
//       "subjects": [
//         "Eng",
//         "URD",
//         "PHY",
//       ],
//     };

}
