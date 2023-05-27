import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeData {
  final String location;
  String time;
  final String site;
  final String flag;
  bool isDN;

  TimeData(
      {required this.flag,
      required this.site,
      required this.location,
      required this.time,
      required this.isDN});

  Future<void> getTime() async {
    final url = Uri.parse(site);
    final response = await get(url);
    final Map data = jsonDecode(response.body);
    final String date = data['datetime'];
    final String offset = data['utc_offset'].substring(1, 3);
    final DateTime now = DateTime.parse(date).add(Duration(hours: int.parse(offset)));
    isDN = (now.hour > 6 && now.hour < 20) ? false : true;
    time = DateFormat.jm().format(now);
  }
}

final List<TimeData> times =  [
  TimeData(
      flag: 'Algeria.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Algiers",
      location: 'Algeria',
      time: '',
      isDN: false),
  TimeData(
      flag: 'London.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/London",
      location: 'England',
      time: '',
      isDN: false),
  TimeData(
      flag: 'New_york.jpg',
      site: "http://worldtimeapi.org/api/timezone/America/New_York",
      location: 'America',
      time: '',
      isDN: false),
  TimeData(
      flag: 'Cairo.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Cairo",
      location: 'Egypt',
      time: '',
      isDN: false),
  TimeData(
      flag: 'Tunisia.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Tunis",
      location: 'Tunisia',
      time: '',
      isDN: false),
  TimeData(
      flag: 'Canada.jpg',
      site: "http://worldtimeapi.org/api/timezone/America/Toronto",
      location: 'Canada',
      time: '',
      isDN: false),
  TimeData(
      flag: 'Saudi_Arabia.jpg',
      site: "http://worldtimeapi.org/api/timezone/Asia/Riyadh",
      location: 'Saudi Arabia',
      time: '',
      isDN: false),
  TimeData(
      flag: 'France.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Paris",
      location: 'France',
      time: '',
      isDN: false),
  TimeData(
      flag: 'Turkey.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Istanbul",
      location: 'Turkey',
      time: '',
      isDN: false),
];
