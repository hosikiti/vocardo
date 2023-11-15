import 'package:vocardo/core/util/text_util.dart';

String whenIsIt(DateTime date) {
  final now = DateTime.now();
  final diff = date.difference(now);
  if (diff.inDays > 0) {
    return "${diff.inDays} ${unitText(diff.inDays, "day", "days")}";
  } else if (diff.inHours > 0) {
    return "${diff.inHours} ${unitText(diff.inHours, "hr", "hrs")}";
  } else if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${unitText(diff.inMinutes, "min", "mins")}";
  } else if (diff.inSeconds > 0) {
    return "Less than a minute";
  } else {
    return "Now";
  }
}
