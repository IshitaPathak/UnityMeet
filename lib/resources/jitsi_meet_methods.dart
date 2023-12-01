import 'package:chalo_milte_hai/resources/auth_method.dart';
import 'package:chalo_milte_hai/resources/firestore_methods.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FireStoreMethods _fireStoreMethods = FireStoreMethods();
  Future<void> createMetting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    String name;
    if (username.isEmpty) {
      name = _authMethods.user.displayName!;
    } else {
      name = username;
    }
    var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioOnly: isAudioMuted,
        isVideoMuted: isVideoMuted);
    // await JitsiMeetWrapper.joinMeeting(
    //     options: JitsiMeetingOptions(roomNameOrUrl: roomName));
    _fireStoreMethods.addToMeetingHistory((roomName));
    await JitsiMeetWrapper.joinMeeting(options: options);
  }
}
