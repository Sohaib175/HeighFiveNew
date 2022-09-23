import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class AddNewChatView extends StatelessWidget {
  AddNewChatView({Key? key}) : super(key: key);

  final InboxVM inboxVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      appBar: AppBar(
        backgroundColor: ConstColors.primaryColor,
        foregroundColor: ConstColors.onPrimaryColor,
        title: const Text(
          'Add New Chat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            TextFormField(
              controller: inboxVM.emailCtrl,
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
              width: Get.width,
              child: ElevatedButton(
                onPressed: () async {
                  await inboxVM.addNewChatOnTap();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ConstColors.onPrimaryColor),
                ),
                child: Text(
                  'Add New',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ConstColors.primaryColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
