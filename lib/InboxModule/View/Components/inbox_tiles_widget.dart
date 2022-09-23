import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/ChatModule/View/chat_view.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class InboxTilesWidget extends StatelessWidget {
  InboxTilesWidget({
    Key? key,
  }) : super(key: key);

  final InboxVM inboxVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          itemCount: inboxVM.inboxList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Get.to(
                () => IndividualChatView(
                  userModel: inboxVM.inboxList[index].userModel,
                  chatID: inboxVM.inboxList[index].chatID,
                  myUID: inboxVM.userModel.value.userId,
                ),
                transition: Transition.rightToLeft,
                duration: const Duration(
                  milliseconds: 300,
                ),
              );
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage(inboxVM.inboxList[index].userModel.profileImage),
            ),
            title: Text(
              inboxVM.inboxList[index].userModel.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ConstColors.onSecondryColor,
              ),
            ),

            //TODO: Message status Means Message sent or not
            // subtitle: Row(
            //   children: [
            //     // Container(
            //     //   height: 10,
            //     //   width: 10,
            //     //   decoration: BoxDecoration(
            //     //     shape: BoxShape.circle,
            //     //     color: inboxList[index].messageStatus == MessageStatus.notSent
            //     //         ? Colors.red
            //     //         : inboxList[index].messageStatus ==
            //     //                 MessageStatus.notRecieverd
            //     //             ? Colors.red[300]
            //     //             : inboxList[index].messageStatus ==
            //     //                     MessageStatus.notSceen
            //     //                 ? Colors.greenAccent
            //     //                 : Colors.green,
            //     //   ),
            //     // ),
            //     // const SizedBox(width: 10),
            //     Text(
            //       inboxVM.inboxList[index].lastText != null
            //           ? inboxVM.inboxList[index].lastText!
            //           : '',
            //       style: TextStyle(
            //         fontSize: 16,
            //         color: ConstColors.onSecondryColor,
            //       ),
            //     ),
            //   ],
            // ),
            // trailing: Text(
            //   inboxVM.inboxList[index].time != null
            //       ? '${inboxVM.inboxList[index].time!.hour.toString()}:${inboxVM.inboxList[index].time!.minute.toString()}'
            //       : '',
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: ConstColors.onSecondryColor,
            //   ),
            // ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
