import 'dart:math';

import 'package:chalo_milte_hai/resources/jitsi_meet_methods.dart';
import 'package:chalo_milte_hai/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  // get roomName => null;
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMetting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                text: 'New Meeting',
                icon: Icons.videocam),
            HomeMeetingButton(
                onPressed: () {},
                text: 'Join Meeting',
                icon: Icons.add_box_rounded),
            HomeMeetingButton(
                onPressed: () {}, text: 'Schedule', icon: Icons.calendar_today),
            HomeMeetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded),
          ],
        ),
        const Expanded(
          child: Center(
              child: Center(
            child: Text(
              'Create/Join meetings with just a click',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )),
        )
      ],
    );
  }
}
