import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/InboxModule/Model/inbox_model.dart';
import 'package:high_five/InboxModule/Services/inbox_service.dart';
import 'package:high_five/utill/get_storage_handler.dart';
import 'package:path_provider/path_provider.dart';

class InboxVM extends GetxController {
  final InboxServices inboxServices = InboxServices();
  final GoogleSignInServices googleSignInServices = GoogleSignInServices();
  final GetStorageHandler getStorageHandler = GetStorageHandler();
  // late Rx<UserModel> userModel;
  Rx<UserModel> userModel =
      UserModel(userId: "", name: "", email: "", profileImage: "").obs;
  final TextEditingController emailCtrl = TextEditingController();
  RxList<InboxModel> inboxList = <InboxModel>[].obs;

  // @override
  // void onReady() async {
  //   super.onReady();
  //   await fetchMyInbox();
  // }

  fetchMyInbox() async {
    inboxList.value =
        await inboxServices.fetchInboxService(myUserID: userModel.value.userId);
  }

  signOutGoogle() async {
    await googleSignInServices.signOut();
    await getStorageHandler.deleteUserId();
    _deleteAppDir();
    _deleteCacheDir();
  }

  addNewChatOnTap() async {
    await inboxServices.newChatService(
      email: emailCtrl.value.text,
      usermodel: userModel.value,
    );
    emailCtrl.clear();
    // await fetchMyInbox();
    Get.back();
  }

  /// this will delete cache
  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  /// this will delete app's storage
  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }
}
