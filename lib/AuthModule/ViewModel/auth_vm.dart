import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class AuthVM extends GetxController {
  final GoogleSignInServices googleSignInServices = GoogleSignInServices();
  final FirestoreServices firestoreServices = FirestoreServices();
  final GetStorageHandler getStorageHandler = GetStorageHandler();
  final InboxVM inboxVM = Get.put(InboxVM());
  signInWithGoogle() async {
    User user = await googleSignInServices.signInWithGoogle();

    inboxVM.userModel.value = UserModel(
      userId: user.uid,
      name: user.displayName!,
      email: user.email!,
      profileImage: user.photoURL!,
    );
    await getStorageHandler.setUserId(inboxVM.userModel.value.userId);
    await firestoreServices.saveDataFirebase(inboxVM.userModel.value);
  }
}
