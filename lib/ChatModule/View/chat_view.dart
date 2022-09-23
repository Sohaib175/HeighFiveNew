import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/ChatModule/View/Components/mesages_widget.dart';
import 'package:high_five/ChatModule/ViewModel/chat_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class IndividualChatView extends StatefulWidget {
  final UserModel userModel;
  final String chatID;
  final String myUID;

  const IndividualChatView({
    Key? key,
    required this.userModel,
    required this.myUID,
    required this.chatID,
  }) : super(key: key);

  @override
  State<IndividualChatView> createState() => _IndividualChatViewState();
}

class _IndividualChatViewState extends State<IndividualChatView> {
  final ChatVM chatVM = Get.put(ChatVM());

  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    chatVM.onFetchChat(chatID: widget.chatID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      appBar: _buildAppBar(),
      // bottomNavigationBar: _buildBottomNavigationBar(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: chatVM.messagesData.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      return MessageWidget(
                        isMe: chatVM.messagesData[index].userId == widget.myUID,
                        message: chatVM.messagesData[index],
                      );
                    },
                  )),
            ),
            const SizedBox(height: 10),
            _buildInputField()
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leadingWidth: 100,
      backgroundColor: ConstColors.primaryColor,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          left: 8.0,
        ),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back,
                size: 20,
                color: ConstColors.onPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
              ),
            ],
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.userModel.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ConstColors.onPrimaryColor,
            ),
          ),
          Text(
            widget.userModel.email,
            style: TextStyle(
              fontSize: 14,
              color: ConstColors.onPrimaryColor,
            ),
          ),
        ],
      ),
      actions: [
        _buildPopMenuAppBar(),
      ],
    );

    // PreferredSize(
    //   preferredSize: Size(Get.width, 80),
    //   child: Container(
    //     color: ConstColors.primaryColor,
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(
    //             vertical: 8.0,
    //             horizontal: 20,
    //           ),
    //           child: InkWell(
    //             onTap: () {
    //               Get.back();
    //             },
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: const [
    //                 Icon(
    //                   Icons.arrow_back,
    //                   size: 20,
    //                 ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 CircleAvatar(
    //                   radius: 30,
    //                   backgroundImage: NetworkImage(
    //                       'https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Text(
    //               'name',
    //               style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w600,
    //                 color: ConstColors.onPrimaryColor,
    //               ),
    //             ),
    //             Text(
    //               'example@gmail.com',
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 color: ConstColors.onPrimaryColor,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const Spacer(),
    //         _buildPopMenuAppBar(),
    //       ],
    //     ),
    //   ),
    // );
  }

  _buildPopMenuAppBar() {
    return PopupMenuButton<String>(
      color: ConstColors.primaryColor,
      icon: Icon(
        Icons.more_vert,
        color: ConstColors.onPrimaryColor,
      ),
      iconSize: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      position: PopupMenuPosition.under,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "View Contact",
            child: Text(
              "View Contact",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Media, links, and docs",
            child: Text(
              "Media, links, and docs",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Search",
            child: Text(
              "Search",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Mute Notification",
            child: Text(
              "Mute Notification",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          PopupMenuItem(
            value: "Wallpaper",
            child: Text(
              "Wallpaper",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ];
      },
    );
  }

  _buildPopMenuAttachement() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.attach_file,
        color: ConstColors.onPrimaryColor,
      ),
      iconSize: 20,
      color: ConstColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      offset: const Offset(-30, -300),
      position: PopupMenuPosition.over,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "document",
            child: Row(
              children: [
                Icon(
                  Icons.file_copy_outlined,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Document",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "camera",
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Camera",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "gallery",
            child: Row(
              children: [
                Icon(
                  Icons.photo,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Gallery",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "audio",
            child: Row(
              children: [
                Icon(
                  Icons.headphones,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Audio",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "contact",
            child: Row(
              children: [
                Icon(
                  Icons.contact_phone,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Contact",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "location",
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: ConstColors.onPrimaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Location",
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }

  _buildInputField() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ConstColors.primaryColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width - 80,
                child: TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  controller: chatVM.textEditingController.value,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConstColors.onPrimaryColor,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    hintText: 'Message',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: IconButton(
                      iconSize: 20,
                      color: ConstColors.onPrimaryColor,
                      onPressed: () {
                        // indChatVM.isEmojiVisible.value =
                        //     !indChatVM.isEmojiVisible.value;
                        // indChatVM.inpuFieldFocusNode.unfocus();
                        // indChatVM.inpuFieldFocusNode.canRequestFocus =
                        //     true;
                        // _buildPickEmoji();
                      },
                      icon: const Icon(Icons.emoji_emotions),
                    ),
                    suffixIcon: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildPopMenuAttachement(),
                          chatVM.isSendVisible.value
                              ? const SizedBox.shrink()
                              : IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  splashColor: Colors.black,
                                  splashRadius: 8,
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: ConstColors.onPrimaryColor,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      chatVM.isSendVisible.value = true;
                    } else {
                      chatVM.isSendVisible.value = false;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ConstColors.primaryColor,
          child: Obx(
            () => IconButton(
              onPressed: () async {
                if (chatVM.isSendVisible.value) {
                  if (chatVM
                      .textEditingController.value.value.text.isNotEmpty) {
                    await chatVM.onSendTextMessage(
                        myUID: widget.myUID, chatID: widget.chatID);
                  }
                } else {
                  print('Audio');
                }
              },
              iconSize: 20,
              splashColor: ConstColors.onPrimaryColor.withOpacity(0.5),
              splashRadius: 22,
              icon: chatVM.isSendVisible.value
                  ? Icon(
                      Icons.send,
                      color: ConstColors.onPrimaryColor,
                    )
                  : Icon(
                      Icons.mic,
                      color: ConstColors.onPrimaryColor,
                    ),
            ),
          ),
        ),
        // ),
      ],
    );
  }
}
