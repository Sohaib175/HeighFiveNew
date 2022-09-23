import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/InboxModule/Model/inbox_model.dart';

class InboxServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  newChatService({required String email, required UserModel usermodel}) async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      QuerySnapshot snapshot = await firebaseFirestore
          .collection("chat")
          .where("userIds.${usermodel.userId}", isEqualTo: true)
          .where("userIds.${documentSnapshot.id}", isEqualTo: true)
          .get();
      if (snapshot.docs.isEmpty) {
        await firebaseFirestore
            .collection("chat")
            .doc(DateTime.now().millisecondsSinceEpoch.toString())
            .set(
          {
            "members": {
              documentSnapshot.id: {
                'id': documentSnapshot.id,
                'email': documentSnapshot.get('email'),
                'name': documentSnapshot.get('name'),
                'profileImage': documentSnapshot.get('profileImage'),
              },
              usermodel.userId: {
                'id': usermodel.userId,
                'email': usermodel.email,
                'name': usermodel.name,
                'profileImage': usermodel.profileImage
              },
            },
            "userIds": {usermodel.userId: true, documentSnapshot.id: true},
          },
        );
      } else {
        print("Already in Inbox");
      }
    } else {
      print("No User FOund");
    }
  }

  fetchInboxService({required String myUserID}) async {
    List<InboxModel> inboxData = [];
    QuerySnapshot snapshot = await firebaseFirestore
        .collection("chat")
        .where("userIds.$myUserID", isEqualTo: true)
        .get();

    // firebaseFirestore
    //     .collection('chat')
    // .where('userIds.$myUserID', isEqualTo: true)
    //     .where('userIds.$myUserID', isEqualTo: true)
    //     .snapshots()
    //     .listen((event) {
    //   print(event);
    //   if (event.docs.isNotEmpty) {
    //     for (int index = 0; index < event.docs.length; index++) {
    //       inboxData.add(InboxModel.fromFirebase(
    //           event.docs[index].data(), event.docs[index].id, myUserID));
    //     }
    //   }
    // });

    if (snapshot.docs.isNotEmpty) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        inboxData.add(InboxModel.fromFirebase(
            snapshot.docs[index].data(), snapshot.docs[index].id, myUserID));
      }
    }
    return inboxData;
  }
}
