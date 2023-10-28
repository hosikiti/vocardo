String whenIsIt(DateTime date) {
  final now = DateTime.now();
  final diff = date.difference(now);
  if (diff.inDays > 0) {
    return "${diff.inDays} days";
  } else if (diff.inHours > 0) {
    return "${diff.inHours} hrs.";
  } else if (diff.inMinutes > 0) {
    return "${diff.inMinutes} min.";
  } else if (diff.inSeconds > 0) {
    return "${diff.inSeconds} sec.";
  } else {
    return "Now";
  }
}
