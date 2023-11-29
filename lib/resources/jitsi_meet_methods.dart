import 'package:chalo_milte_hai/resources/auth_method.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  Future<void> createMetting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted}) async {
    var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: _authMethods.user.displayName,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioOnly: isAudioMuted,
        isVideoMuted: isVideoMuted);
    // await JitsiMeetWrapper.joinMeeting(
    //     options: JitsiMeetingOptions(roomNameOrUrl: roomName));
    await JitsiMeetWrapper.joinMeeting(options: options);
  }
}
