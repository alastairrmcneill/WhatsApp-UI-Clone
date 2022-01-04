import 'package:whatsapp_clone/models/user_model.dart';

class Call {
  final User caller;
  final String time;
  final bool isInbound; // Would usually be type DateTime or Firebase Timestamp in production apps
  final bool isVideo;

  Call({
    required this.caller,
    required this.time,
    required this.isInbound,
    required this.isVideo,
  });
}

// YOU - current user
final User currentUser = User(id: 0, name: 'Current User', imageUrl: 'assets/images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
final User james = User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
final User john = User(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');
final User olivia = User(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
final User sam = User(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
final User sophia = User(id: 6, name: 'Sophia', imageUrl: 'assets/images/sophia.jpg');
final User steven = User(id: 7, name: 'Steven', imageUrl: 'assets/images/steven.jpg');

// EXAMPLE CALLS ON CALLS SCREEN
List<Call> calls = [
  Call(
    caller: james,
    time: '1 January, 5:30PM',
    isInbound: false,
    isVideo: true,
  ),
  Call(
    caller: john,
    time: '1 January, 4:31PM',
    isInbound: true,
    isVideo: true,
  ),
  Call(
    caller: olivia,
    time: '1 January, 11:09AM',
    isInbound: false,
    isVideo: false,
  ),
  Call(
    caller: sam,
    time: '1 January, 10:47AM',
    isInbound: false,
    isVideo: true,
  ),
  Call(
    caller: sophia,
    time: '1 January, 9:30AM',
    isInbound: true,
    isVideo: false,
  ),
];
