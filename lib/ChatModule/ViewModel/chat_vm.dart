import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/Model/chat_model.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';

class ChatVM extends GetxController {
  final InboxVM inboxVM = Get.find();
  var isEmojiVisible = false.obs;
  RxBool isSendVisible = false.obs;
  FocusNode inpuFieldFocusNode = FocusNode();
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  RxList<MessageModel> messagesData = <MessageModel>[].obs;

  // onInit() {
  //   super.onInit();
  //   onFetchChat(chatID: chatID);
  // }

  onFetchChat({required String chatID}) async {
    List<MessageModel> messages = <MessageModel>[];
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = FirebaseFirestore
        .instance
        .collection("chat")
        .doc(chatID)
        .collection("messages")
        .orderBy("createdOn", descending: true)
        .snapshots();

    snapshot.listen((event) {
      messages.clear();
      for (int index = 0; index < event.docs.length; index++) {
        messages.add(MessageModel.fromJson(event.docs[index]));
      }
      messagesData.value = messages;
    });
  }

  onSendTextMessage({required String myUID, required String chatID}) async {
    await FirebaseFirestore.instance
        .collection("chat")
        .doc(chatID)
        .collection("messages")
        .doc()
        .set({
      "text": textEditingController.value.value.text,
      "userId": myUID,
      "createdOn": DateTime.now().millisecondsSinceEpoch,
    });
    textEditingController.value.clear();
    onFetchChat(chatID: chatID);
    isSendVisible.value = false;
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    textEditingController.value.dispose();
  }
}
