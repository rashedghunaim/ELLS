
import 'package:flutter/foundation.dart';

class MessagedPerson {
  String name;

  String conversation;

  DateTime sentDate;

  String imageUrl;

  String personHeadLine;

  MessagedPerson(
      {@required this.name,
      @required this.conversation,
      this.sentDate,
      @required this.imageUrl,
      @required this.personHeadLine});
}
