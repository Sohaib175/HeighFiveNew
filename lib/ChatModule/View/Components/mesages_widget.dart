import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/Model/chat_model.dart';
import 'package:high_five/utill/Constants/const_color.dart';

// import 'custom_messages.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  final MessageModel message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            const CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.person,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
          _buildTextMessage(message, isMe),
        ],
      ),
    );
  }

//TODO: Message Types such as text, Image, Video

  // Widget _messageContaint(ChateModel message) {
  //   switch (message.messageType) {
  //     case MessageType.text:
  //       return _buildTextMessage(message);
  //     case MessageType.image:
  //       // return  _buildTextMessage(message);
  //       return const SizedBox();
  //     default:
  //       return const SizedBox();
  //   }
  // }

  Container _buildTextMessage(MessageModel message, bool isMe) {
    return Container(
      constraints: BoxConstraints(maxWidth: Get.width - Get.width * 0.25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ConstColors.primaryColor,
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
      child: Text(
        message.text,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 18,
          color: ConstColors.onPrimaryColor,
        ),
        softWrap: true,
      ),
    );
  }
}
