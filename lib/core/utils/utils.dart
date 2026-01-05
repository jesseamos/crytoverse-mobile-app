import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart';

// Future<T?> showDialogPopup<T>(BuildContext context, Widget widget,
//     {bool barrierDismissible = false, Color? barrierColor}) {
//   return showDialog<T>(
//     context: context,
//     barrierColor: barrierColor ?? AppColors.black.withValues(alpha: 0.2),
//     builder: (_) => widget,
//     barrierDismissible: barrierDismissible,
//   );
// }

Future<void> _launchUrl(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print("Could not launch $uri");
  }
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

String getUserInitials(String name) {
  List<String> names = name.trim().split(" ");
  if (names.length > 1) {
    return names[0][0].toUpperCase() + names[1][0].toUpperCase();
  }
  return names[0][0].toUpperCase();
}

String? getTimeFromDate(DateTime? date) {
  try {
    return DateFormat('hh:mm a').format(date!);
  } catch (_) {
    return null;
  }
}

String formatNumber(num? value, {int decimalDigits = 2, bool short = false}) {
  if (value == null) return "--";

  NumberFormat formatter;
  if (short) {
    formatter = NumberFormat.compact();
  } else {
    formatter = NumberFormat.currency(decimalDigits: decimalDigits, symbol: "");
  }
  return formatter.format(value);
}

String formatCurrency(
  num? value, {
  int decimalDigits = 2,
  bool short = false,
  String code = "NGN",
}) {
  if (value == null) {
    return "-";
  }

  if (short) {
    return NumberFormat.compactCurrency(
      symbol: getCurrencySymbol(code),
      decimalDigits: decimalDigits,
    ).format(value);
  } else {
    return NumberFormat.currency(
      decimalDigits: decimalDigits,
      symbol: getCurrencySymbol(code),
    ).format(value);
  }
}

String? formatDateShortWithTime(DateTime? dateTime) {
  try {
    final DateFormat formatter = DateFormat("MMM d, yyyy • hh:mm a");
    return formatter.format(dateTime!);
  } catch (_) {
    return null;
  }
}

String? formatDateShort(DateTime? dateTime) {
  try {
    final DateFormat formatter = DateFormat("dd MMM, yyyy");
    return formatter.format(dateTime!);
  } catch (_) {
    return null;
  }
}

String getCurrencySymbol(String currencyName, {bool useFullName = false}) {
  currencyName = (currencyName.trim().contains("-"))
      ? currencyName.split("-").last.toUpperCase()
      : currencyName.toUpperCase();
  String currencySymbol = '';
  String fullName = '';
  switch (currencyName) {
    case 'NGN':
    case 'NGA':
    case 'NG':
      fullName = "naira";
      currencySymbol = "\u20A6";
      break;
    case 'GBP':
      fullName = "pound";
      currencySymbol = NumberFormat().simpleCurrencySymbol("GBP");
      break;
    case 'EUR':
      fullName = "euro";
      currencySymbol = NumberFormat().simpleCurrencySymbol("EUR");
      break;
    case 'KES':
      fullName = "shilling";
      currencySymbol = NumberFormat().simpleCurrencySymbol("KES");
      break;
    case 'GHS':
      fullName = "cedi";
      currencySymbol = NumberFormat().simpleCurrencySymbol("GHS");
      break;
    case 'ZMW':
      fullName = "kwacha";
      currencySymbol = NumberFormat().simpleCurrencySymbol("ZMW");
      break;
    case 'UGX':
      fullName = "shilling";
      currencySymbol = NumberFormat().simpleCurrencySymbol("UGX");
      break;
    case 'RWF':
      fullName = "franc";
      currencySymbol = NumberFormat().simpleCurrencySymbol("RWF");
      break;
    case 'XOF':
      fullName = "franc";
      currencySymbol = NumberFormat().simpleCurrencySymbol("XOF");
      break;
    case 'TZS':
      fullName = "shilling";
      currencySymbol = NumberFormat().simpleCurrencySymbol("TZS");
      break;
    case 'USD':
    case 'US':
      fullName = 'dollar';
      currencySymbol = NumberFormat().simpleCurrencySymbol("USD");
      break;
    default:
      fullName = currencyName;
      currencySymbol = NumberFormat().simpleCurrencySymbol(currencyName);
      break;
  }

  return useFullName ? fullName : currencySymbol;
}

Future<Color?> getDominantColorFromSvg(String assetPath) async {
  final svgString = await rootBundle.loadString(assetPath);
  final xmlDoc = XmlDocument.parse(svgString);

  // Try to find the first "fill" attribute
  final fillAttribute = xmlDoc
      .findAllElements('*')
      .expand((element) => element.attributes)
      .firstWhere(
        (attr) => attr.name.local == 'fill' && attr.value != 'none',
        orElse: () => XmlAttribute(XmlName('fill'), '#FFFFFF'),
      );

  return _parseColor(fillAttribute.value);
}

Color? _parseColor(String hex) {
  try {
    final cleanedHex = hex.replaceAll('#', '');
    if (cleanedHex.length == 6) {
      return Color(int.parse('0xFF$cleanedHex'));
    } else if (cleanedHex.length == 8) {
      return Color(int.parse('0x$cleanedHex'));
    }
  } catch (_) {}
  return null;
}

String? formatDateSlash(DateTime? dateTime) {
  try {
    final DateFormat formatter = DateFormat("dd/MM/yy");
    return formatter.format(dateTime!);
  } catch (_) {
    return null;
  }
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;
    case 'successful':
      return Colors.green;
    case 'failed':
      return Colors.red;
    case 'in_progress':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}

String extractLocalPhoneNumber(String input) {
  // Keep only digits
  String digits = input.replaceAll(RegExp(r'\D'), '');

  // Remove '234' from the beginning if present and replace with '0'
  if (digits.startsWith('234')) {
    digits = '0' + digits.substring(3);
  }

  return digits;
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

Future<bool> requestStoragePermission() async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isGranted) {
      return true;
    }

    // For Android 11+
    if (await Permission.manageExternalStorage.isGranted) {
      return true;
    }

    var status = await Permission.manageExternalStorage.request();
    return status.isGranted;
  }

  if (Platform.isIOS) {
    return true;
  }

  return false;
}

// Future<void> exportUsersToCSV(
//   List<DMAutomationLeadDownloadEntity> leads,
//   BuildContext ctx,
// ) async {
//   // Request storage permission
//   bool granted = await requestStoragePermission();
//   if (!granted) {
//     throw Exception('Storage permission not granted');
//   }

//   // Convert to CSV
//   List<List<String>> csvData = [
//     ['USERNAME', 'FOLLOWERS', 'FOLLOWING'],
//     ...leads.map(
//       (u) => [u.username ?? '', u.followers ?? '', u.following ?? ''],
//     ),
//   ];

//   String csv = const ListToCsvConverter().convert(csvData);

//   // Get path
//   final directory = Platform.isIOS
//       ? await getApplicationDocumentsDirectory()
//       : await getExternalStorageDirectory();

//   final path = directory?.path;

//   if (path == null) {
//     throw Exception("Couldn't get the storage path");
//   }

//   final file = File('$path/users.csv');
//   await file.writeAsString(csv);
//   LoaderOrError(ctx).showSuccessSnackbar('File saved at: ${file.path}');
// }

String formatNumberPrefix(int number) {
  if (number >= 1000000000) {
    return '${(number / 1000000000).toStringAsFixed(1).replaceAll('.0', '')}B';
  } else if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
  } else if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1).replaceAll('.0', '')}k';
  } else {
    return number.toString();
  }
}

String formatNumberWithCommas(num number) {
  final formatter = NumberFormat('#,##0');
  return formatter.format(number);
}

// Widget statusBuilder(status, {bool isPaused = false}) {
//   if (isPaused) {
//     return StatusBadge(
//       title: 'Paused',
//       titleColor: ColorsConstant.greyText,
//       bgColor: ColorsConstant.opacityGrey,
//     );
//   }
//   if (status == 'runing' ||
//       status == "active" ||
//       status == 'pending' ||
//       status == 'retrying' ||
//       status == 'running') {
//     return StatusBadge(title: 'Active');
//   } else if (status == 'paused' || status == 'failed') {
//     return StatusBadge(
//       title: 'Paused',
//       titleColor: ColorsConstant.greyText,
//       bgColor: ColorsConstant.opacityGrey,
//     );
//   } else {
//     return StatusBadge(
//       title: 'Completed',
//       titleColor: ColorsConstant.blue,
//       bgColor: ColorsConstant.opacityBlue,
//     );
//   }
// }

String getShortenedDays(List<String> days) {
  return days.map((day) => day.substring(0, 3)).join(', ');
}

List<String> getFullDayNames(String shortenedDays, {bool everyday = false}) {
  if (everyday) {
    return [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];
  }
  final Map<String, String> dayMap = {
    'Mon': 'monday',
    'Tue': 'tuesday',
    'Wed': 'wednesday',
    'Thu': 'thursday',
    'Fri': 'friday',
    'Sat': 'saturday',
    'Sun': 'sunday',
  };

  return shortenedDays
      .split(',')
      .map((s) => s.trim())
      .map((abbr) => dayMap[abbr] ?? abbr.toLowerCase())
      .toList();
}

String? validatePercentage(String? value, {required String fieldName}) {
  if (value == null || value.isEmpty) {
    return '$fieldName required';
  }
  final intValue = int.tryParse(value);
  if (intValue == null) {
    return 'Please enter a valid number';
  }
  if (intValue < 0 || intValue > 100) {
    return '$fieldName must be between 0 and 100';
  }
  return null;
}

// A helper validation for min/max relationships
String? validateMinMax({
  required TextEditingController minController,
  required TextEditingController maxController,
  required String fieldName,
}) {
  if (minController.text.isNotEmpty && maxController.text.isNotEmpty) {
    final int min = int.tryParse(minController.text) ?? 0;
    final int max = int.tryParse(maxController.text) ?? 0;
    if (max < min) {
      return 'Maximum $fieldName cannot be less than minimum';
    }
  }
  return null;
}

DateTime? parseDate(dynamic value) {
  if (value is String) {
    return DateTime.tryParse(value);
  }
  return null;
}

String formatXAxisLabel(String label) {
  final s = label.trim();
  if (s.isEmpty) return '';

  // Normalize two-digit year: 06/02/25 -> 06/02/2025
  final twoDigitDate = RegExp(r'^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})$');
  var normalized = s;
  final m = twoDigitDate.firstMatch(s);
  if (m != null) {
    normalized = '${m.group(1)}/${m.group(2)}/20${m.group(3)}';
  }

  // Try a quick ISO parse first
  DateTime? dt = DateTime.tryParse(normalized);
  if (dt == null) {
    // Try common date patterns
    final patterns = [
      'dd/MM/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd',
      'yyyy/MM/dd',
      'd-M-yyyy',
      'M/d/yyyy',
    ];
    for (final p in patterns) {
      try {
        dt = DateFormat(p).parse(normalized);
        break;
      } catch (_) {}
    }
  }

  if (dt != null) {
    // Choose the short format you prefer; 'd MMM' => '6 Feb'
    return DateFormat('d MMM').format(dt);
  }

  // Detect times like "1pm", "1:30 PM", "13:00"
  final timeRegex = RegExp(
    r'^\s*(\d{1,2})(?::(\d{2}))?\s*([ap]m)?\s*$',
    caseSensitive: false,
  );
  final timeMatch = timeRegex.firstMatch(s);
  if (timeMatch != null) {
    final hour = timeMatch.group(1)!;
    final min = timeMatch.group(2);
    final ampm = timeMatch.group(3);
    if (ampm != null && ampm.isNotEmpty) {
      return min != null
          ? '$hour:$min${ampm.toLowerCase()}'
          : '$hour${ampm.toLowerCase()}';
    }
    if (min != null) return '$hour:$min';
    return hour;
  }

  // Fallback: truncate long labels
  if (s.length > 6) return s.substring(0, 6) + '..';
  return s;
}

// String getSocialMediaIcon({required String text}) {
//   String lowerText = text.toLowerCase();

//   if (lowerText.contains('facebook')) {
//     return facebookIcon;
//   }
//   if (lowerText.contains('youtube')) {
//     return youtubeIcon;
//   }
//   if (lowerText.contains('twitter') || lowerText.contains('x')) {
//     return twitterIcon;
//   }
//   if (lowerText.contains('instagram')) {
//     return instagramIcon;
//   }
//   if (lowerText.contains('linkedin')) {
//     return linkedInIcon;
//   }
//   if (lowerText.contains('slack')) {
//     return slackIcon;
//   }

//   return linkedInIcon; // fallback if no match
// }

Future<void> copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}

/// Takes a list of integers (each representing seconds),
/// sums them, and returns a formatted duration string.
String totalDurationFormatted(List<int> secondsList) {
  if (secondsList.isEmpty) return "0 sec";

  // Sum all seconds
  int totalSeconds = secondsList.fold(0, (sum, item) => sum + item);

  // Convert into Duration
  Duration duration = Duration(seconds: totalSeconds);

  return _formatDuration(duration);
}

/// Helper function to format duration into "X hrs Y mins Z secs"
String _formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  List<String> parts = [];
  if (hours > 0) parts.add("$hours hr${hours > 1 ? 's' : ''}");
  if (minutes > 0) parts.add("$minutes min${minutes > 1 ? 's' : ''}");
  if (seconds > 0 || parts.isEmpty) {
    parts.add("$seconds sec${seconds > 1 ? 's' : ''}");
  }

  return parts.join(" ");
}

Future<String> convertFileToBase64(String filePath) async {
  try {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  } catch (e) {
    print('$e');
    return 'data:text/csv;base64,';
  }
}

String safeToString(dynamic value) {
  if (value == null) return "";

  if (value is num && value == 0) return "";

  if (value is String && value.trim().isEmpty) return "";

  if (value is Iterable && value.isEmpty) return "";

  if (value is Map && value.isEmpty) return "";

  return value.toString();
}

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget subSection(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 4),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}

Widget bullet(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• "),
        Expanded(
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

String formatCompactNumber(dynamic value) {
  if (value == null) return '0';

  double number;

  // Handle String, int, double safely
  if (value is String) {
    number = double.tryParse(value.replaceAll(',', '')) ?? 0;
  } else if (value is int) {
    number = value.toDouble();
  } else if (value is double) {
    number = value;
  } else {
    return '0';
  }

  if (number < 1000) return number.toStringAsFixed(0);

  final units = [
    {'value': 1e12, 'symbol': 'T'},
    {'value': 1e9, 'symbol': 'B'},
    {'value': 1e6, 'symbol': 'M'},
    {'value': 1e3, 'symbol': 'K'},
  ];

  for (final unit in units) {
    if (number >= (unit['value'] as double)) {
      final formatted = number / (unit['value'] as double);
      return '${formatted.toStringAsFixed(formatted < 10 ? 1 : 0)}${unit['symbol']}';
    }
  }

  return number.toStringAsFixed(0);
}
