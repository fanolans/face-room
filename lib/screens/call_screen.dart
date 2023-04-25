import 'package:face_room/settings.dart';
import 'package:face_room/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({
    Key? key,
    required this.callID,
    required this.userID,
    required this.userName,
  }) : super(key: key);

  final String callID;
  final String userID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: zegocloudAppId,
      appSign: zegocloudAppSign,
      userID: userID,
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..layout = ZegoLayout.pictureInPicture(
          isSmallViewDraggable: true,
          switchLargeOrSmallViewByClick: true,
        )
        ..avatarBuilder = ((context, size, user, extraInfo) =>
            Avatar(size: size, username: user != null ? user.name : ''))
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
