abstract class DateFormatter {
  static final List<String> shortMonthNames = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Ags',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  static final List<String> longMonthNames = [
    '',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  static final List<String> shortDayNames = [
    '',
    'Min',
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
  ];

  static final List<String> longDayNames = [
    '',
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  static String formatDateToddMMyyyy(DateTime date) {
    return '${date.day} ${_getLongMonthName(date.month)} ${date.year}';
  }

  static String formatDateToddMMyyyyHHmm(DateTime date) {
    return '${date.day} ${_getLongMonthName(date.month)} ${date.year}, ${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}';
  }

  static String formatDateToyyyyMMddHHmmss(DateTime date) {
    return '${date.year}${date.month < 10 ? '0${date.month}' : date.month}${date.day < 10 ? '0${date.day}' : date.day}${date.hour < 10 ? '0${date.hour}' : date.hour}${date.minute < 10 ? '0${date.minute}' : date.minute}${date.second < 10 ? '0${date.second}' : date.second}';
  }

  static String formatDateToDDddMMYYYY(DateTime date) {
    return '${_getLongDayName(date.weekday)} ${date.day} ${_getLongMonthName(date.month)} ${date.year}';
  }

  static String formatDateToHHmm(DateTime date) {
    return '${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}';
  }

  static String formatDateToHHmmss(DateTime date) {
    return '${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}:${date.second < 10 ? '0${date.second}' : date.second}';
  }

  static String _getMonthName(int month) {
    return shortMonthNames[month];
  }

  static String _getLongMonthName(int month) {
    return longMonthNames[month];
  }

  static String _getShortDayName(int day) {
    return shortDayNames[day];
  }

  static String _getLongDayName(int day) {
    return longDayNames[day];
  }
}
