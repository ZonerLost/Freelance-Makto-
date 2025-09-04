import 'package:flutter/material.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../config/constant/colors.dart';
import '../../custom/common_image_widget/common_image_widget.dart';
import '../../custom/custom_app_bar/custom_app_bar.dart';

class ChatUiScreen extends StatefulWidget {
  ChatUiScreen({super.key,});

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
      appBar: CustomAppBar(

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
                  onLongPress: (){
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
                color: kCBGColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FreelanceMarketTextField(
                      controller: messageController,
                      hintText: "Enter your message.......",
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: sendMessage,
                    child: CommonImageView(
                      imagePath: Assets.imagesSendButtonbase,
                      height: 44,
                    ),
                  )
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

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // prevents taking full width
        crossAxisAlignment: CrossAxisAlignment.center,
        children: isMe
            ? [
          Flexible(
            child: _buildBubble(),
          ),
          const SizedBox(width: 8),
          CommonImageView(
            imagePath: Assets.imagesProfile,
            height: 24,
          ),
        ]
            : [
          // Profile first (left side)
          CommonImageView(
            imagePath: Assets.imagesProfile,
            height: 24,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: _buildBubble(),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        color: isMe ? kCBGColor : kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
        border: isMe
            ? null
            : Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          FreelanceMarketText(
            message,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isMe ? kRedColor : kPrimaryColor,
          ),
        ],
      ),
    );
  }
}