import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeData {
  String location;
  String time;
  String site;
  String flag;
  bool isDayorNight;

  TimeData(
      {required this.flag,
      required this.site,
      required this.location,
      required this.time,
      required this.isDayorNight});

  Future<void> getTime() async {
    var url = Uri.parse(site);
    var response = await get(url);
    Map data = jsonDecode(response.body);
    String date = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(date);
    now = now.add(Duration(hours: int.parse(offset)));
    isDayorNight = (now.hour > 6 && now.hour < 20) ? false : true;
    time = DateFormat.jm().format(now);
  }
}

List<TimeData> times = [
  TimeData(
      flag: 'Algeria.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Algiers",
      location: 'Algeria',
      time: 'kfkaf',
      isDayorNight: false),
  TimeData(
      flag: 'London.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/London",
      location: 'England',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'New_york.jpg',
      site: "http://worldtimeapi.org/api/timezone/America/New_York",
      location: 'America',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'Cairo.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Cairo",
      location: 'Egypt',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'Tunisia.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Tunis",
      location: 'Tunisia',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'Canada.jpg',
      site: "http://worldtimeapi.org/api/timezone/America/Toronto",
      location: 'Canada',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'Saudi_Arabia.jpg',
      site: "http://worldtimeapi.org/api/timezone/Asia/Riyadh",
      location: 'Saudi Arabia',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'France.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Paris",
      location: 'France',
      time: 'fzfzf',
      isDayorNight: false),
  TimeData(
      flag: 'Turkey.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Istanbul",
      location: 'Turkey',
      time: 'fzfzf',
      isDayorNight: false),
];
