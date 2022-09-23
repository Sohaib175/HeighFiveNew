// enum MessageStatus {
//   notSent,
//   notRecieverd,
//   notSceen,
//   sceen,
// }

import 'package:high_five/AuthModule/Model/user_model.dart';

class InboxModel {
  String chatID;
  UserModel userModel;
  // MessageStatus messageStatus;
  InboxModel({
    required this.chatID,
    required this.userModel,
    // required this.messageStatus,
  });

  factory InboxModel.fromFirebase(dynamic data, String id, String myUID) {
    return InboxModel(
      chatID: id,
      userModel: UserModel.fromJson(data["members"]
          .values
          .toList()
          .where((e) => e["id"] != myUID)
          .toList()
          .first),
    );
  }
}
