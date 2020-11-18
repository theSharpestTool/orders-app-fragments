import 'package:date_format/date_format.dart';

String stringDate(DateTime date) =>
    formatDate(date, [dd, '/', mm, '/', yy, ' - ', HH, ':', nn, ':', ss]);

String stringTimer(DateTime date) {
  if (date.isBefore(DateTime.now())) return null;

  final dmy = formatDate(date, [dd, '/', mm, '/', yy]);
  final durationDiff = date.difference(DateTime.now());
  final durationString = _printDuration(durationDiff);

  return '$dmy - $durationString';
}

String _printDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String percentage(double value){
  value *= 100;
  final valueInt = value.toInt();
  return '$valueInt%';
}
