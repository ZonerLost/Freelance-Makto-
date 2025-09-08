import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../config/constant/colors.dart';
import '../../../config/routes/routes_names.dart';
import '../../custom/common_image_widget/common_image_widget.dart';
import '../../custom/custom_app_bar/custom_app_bar.dart';

class ChatUiScreen extends StatefulWidget {
  ChatUiScreen({super.key});

  @override
  State<ChatUiScreen> createState() => _ChatUiuser_moduletate();
}

class _ChatUiuser_moduletate extends State<ChatUiScreen> {
  bool isSelectedMessage = false;
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          "text": messageController.text,
          "isMe": true, // Simulate sender message
        });
      });
      messageController.clear();

      // Simulate a bot reply (optional)
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          messages.add({
            "text": "Hello! This is a Testing Reply!!",
            "isMe": false, // Simulate receiver message
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: CustomAppBar(
        actions: [
          15.horizontalSpace,
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child: CommonImageView(imagePath: Assets.imagesArrowBack, height: 35)),
          8.horizontalSpace,
          CommonImageView(
            imagePath: Assets.imagesProfile,
            height: 40,
            radius: 50,
          ),
          8.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FreelanceMarketText(
                "Martinez",
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              5.verticalSpace,
              FreelanceMarketText(
                "Online",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kTextSecondary2Color,
              ),
            ],
          ),
          Spacer(),
          PopupMenuButton<String>(

            onSelected: (value) {
              if (value == 'edit') {
                Get.toNamed(RouteName.scheduleMeetingScreen);
                // Handle edit
              } else if (value == 'delete') {
                // Handle delete
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 30,
                value: 'edit',
                child:FreelanceMarketText(
                  "Schedule Interview",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              PopupMenuItem(
                height: 30,
                value: 'delete',
                child: FreelanceMarketText(
                  "Block",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            child: CommonImageView(
              imagePath: Assets.imagesMore,
              height: 25,
            ),
          ),

          15.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: false, // Keeps chat scrolling naturally
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    setState(() {
                      isSelectedMessage = true;
                    });
                  },
                  child: ChatBubble(
                    message: messages[index]["text"],
                    isMe: messages[index]["isMe"],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: ShapeDecoration(
                color: kWhiteColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: kBackgroundColor),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Enter your message.......",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kBackgroundColor,
                            width: 1,
                          ), // Normal state
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          ), // Focused state
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CommonImageView(
                            svgPath: Assets.svgAttachCircle,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CommonImageView(
                            svgPath: Assets.svgMicrophone2,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: sendMessage,
                    child: CommonImageView(
                      imagePath: Assets.imagesSendButtonbase,
                      height: 44,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: isMe
              ? [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FreelanceMarketText(
                        "11:08 PM",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 3),
                      Icon(Icons.done_all, size: 15),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Flexible(child: _buildBubble()),
                ]
              : [
                  Row(
                    children: [
                      FreelanceMarketText(
                        "11:08 PM",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 3),
                      Icon(Icons.done_all, size: 15),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Flexible(child: _buildBubble()),
                ],
        ),
      ),
    );
  }

  Widget _buildBubble() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        color: isMe ? kPrimaryColor : kWhiteColor,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
        border: isMe
            ? null
            : Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 14,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          FreelanceMarketText(
            message,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isMe ? kWhiteColor : kBlackColor,
          ),
        ],
      ),
    );
  }
}
