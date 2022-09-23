import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/InboxModule/View/Components/add_new_chat.dart';
import 'package:high_five/InboxModule/View/Components/inbox_tiles_widget.dart';
import 'package:high_five/InboxModule/ViewModel/inbox_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class InboxView extends StatelessWidget {
  InboxView({Key? key}) : super(key: key);

//   @override
//   State<InboxView> createState() => _InboxViewState();
// }

// class _InboxViewState extends State<InboxView> {
  // final InboxVM inboxVM = Get.find();
  //TODO:With Get.put
  final inboxVM = Get.find<InboxVM>(tag: 'inboxVM');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // @override
  // void initState() {
  //   super.initState();
  //   inboxVM.fetchMyInbox();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColors.primaryColor,
        foregroundColor: ConstColors.onPrimaryColor,
        onPressed: () {
          Get.to(() => AddNewChatView());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: ConstColors.onPrimaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: InboxTilesWidget(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: ConstColors.primaryColor,
      leadingWidth: 60,
      leading: InkWell(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
            left: 8.0,
            // horizontal: 20,
            // horizontal: 4.0,
          ),
          child: CircleAvatar(
            // radius: 30,
            backgroundImage: NetworkImage(
              inboxVM.userModel.value.profileImage.isNotEmpty
                  ? inboxVM.userModel.value.profileImage
                  : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inboxVM.userModel.value.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ConstColors.onPrimaryColor,
            ),
          ),
          Text(
            inboxVM.userModel.value.email,
            style: TextStyle(
              fontSize: 14,
              color: ConstColors.onPrimaryColor,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            inboxVM.fetchMyInbox();
          },
          icon: Icon(
            Icons.refresh,
            color: ConstColors.onPrimaryColor,
          ),
        ),
      ],
    );

    // PreferredSize(
    //   preferredSize: Size(Get.width, 80),
    //   child: Container(
    //     color: ConstColors.primaryColor,
    //     child: Row(
    //       children: [
    //         InkWell(
    //           onTap: () {
    //             _scaffoldKey.currentState!.openDrawer();
    //           },
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(
    //               vertical: 8.0,
    //               horizontal: 20,
    //             ),
    //             child: CircleAvatar(
    //               radius: 30,
    //               backgroundImage: NetworkImage(
    //                 inboxVM.userModel.value.profileImage.isNotEmpty
    //                     ? inboxVM.userModel.value.profileImage
    //                     : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    //               ),
    //             ),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Text(
    //               inboxVM.userModel.value.name,
    //               style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w600,
    //                 color: ConstColors.onPrimaryColor,
    //               ),
    //             ),
    //             Text(
    //               inboxVM.userModel.value.email,
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 color: ConstColors.onPrimaryColor,
    //               ),
    //             ),
    //           ],
    //         ),
    //         IconButton(
    //             onPressed: () {
    //               inboxVM.fetchMyInbox();
    //             },
    //             icon: const Icon(Icons.access_alarms_outlined))
    //       ],
    //     ),
    //   ),
    // );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      width: Get.width * 0.7,
      child: SafeArea(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                color: ConstColors.primaryColor,
              ),
              accountName: Text(
                inboxVM.userModel.value.name,
                style: TextStyle(
                  // fontSize: 20,
                  // fontWeight: FontWeight.w600,
                  color: ConstColors.onPrimaryColor,
                ),
              ),
              accountEmail: Text(
                inboxVM.userModel.value.email,
                style: TextStyle(color: ConstColors.onPrimaryColor),
              ),
              currentAccountPicture: CircleAvatar(
                radius: Get.width * 0.10,
                backgroundImage: NetworkImage(
                  inboxVM.userModel.value.profileImage.isNotEmpty
                      ? inboxVM.userModel.value.profileImage
                      : 'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                ),
              ),
            ),
            const AboutListTile(
              // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'High Five',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2019 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'),
            ),
            ListTile(
              title: const Text(
                'LogOut',
              ),
              leading: const Icon(Icons.logout),
              onTap: () async {
                await inboxVM.signOutGoogle();
                Get.offAll(() => LoginView());
              },
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40,
                    width: Get.width * 0.7,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ConstColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ConstColors.onPrimaryColor,
                        ),
                      ),
                      onPressed: () async {
                        await inboxVM.signOutGoogle();
                        Get.offAll(() => LoginView());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
