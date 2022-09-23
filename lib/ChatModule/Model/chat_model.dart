// enum MessageType {
//   text,
//   sticker,
//   image,
//   media,
// }

// enum MessageStatus {
//   notSent,
//   notRecieverd,
//   notSceen,
//   sceen,
// }

// class ChateModel {
//   String message;
//   bool isSender;
//   MessageStatus messageStatus;
//   MessageType? messageType;

//   ChateModel({
//     required this.message,
//     required this.isSender,
//     required this.messageStatus,
//     required this.messageType,
//   });

//   static List<ChateModel> chatDoc = <ChateModel>[
//     ChateModel(
//       message: 'Hi',
//       isSender: true,
//       messageStatus: MessageStatus.sceen,
//       messageType: MessageType.text,
//     ),
//     ChateModel(
//       message: 'Ki aa',
//       isSender: true,
//       messageStatus: MessageStatus.sceen,
//       messageType: MessageType.text,
//     ),
//     ChateModel(
//       message: 'Dafaa ho',
//       isSender: false,
//       messageStatus: MessageStatus.sceen,
//       messageType: MessageType.text,
//     ),
//     ChateModel(
//       message: 'jhsrnb',
//       isSender: false,
//       messageStatus: MessageStatus.notSceen,
//       messageType: MessageType.text,
//     ),
//     ChateModel(
//       message: 'juehrg',
//       isSender: true,
//       messageStatus: MessageStatus.notSceen,
//       messageType: MessageType.text,
//     ),
//     ChateModel(
//       message:
//           'jdrghdhgfydhfjdsgudsygfifjghuewgfikrbghhgsdsvjhzdgfb sdhfgv duyhfcv edujyhcvc eufhcv euchve fducyhevd cueyhffvnc ',
//       isSender: true,
//       messageStatus: MessageStatus.notSceen,
//       messageType: MessageType.text,
//     ),
//   ];
// }

class MessageModel {
  String text;
  String userId;
  int createdOn;

  MessageModel(
      {required this.text, required this.userId, required this.createdOn});

  factory MessageModel.fromJson(dynamic json) {
    return MessageModel(
        text: json["text"],
        userId: json["userId"],
        createdOn: json["createdOn"]);
  }
}
