import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
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
      flag: 'Turkey.png',
      site: "http://worldtimeapi.org/api/timezone/Europe/Istanbul",
      location: 'Turkey',
      time: '',
      isDN: false),
        TimeData(
      flag: 'Morroco.png',
      site: "http://worldtimeapi.org/api/timezone/Africa/Casablanca",
      location: 'Morroco',
      time: '',
      isDN: false),
     
      TimeData(
      flag: 'China.jpg',
      site: "http://worldtimeapi.org/api/timezone/Asia/Tokyo",
      location: 'China',
      time: '',
      isDN: false),
        TimeData(
      flag: 'Kenya.jpg',
      site: "http://worldtimeapi.org/api/timezone/Africa/Nairobi",
      location: 'Kenya',
      time: '',
      isDN: false),
        TimeData(
      flag: 'Mexico.png',
      site: "http://worldtimeapi.org/api/timezone/America/Mexico_City",
      location: 'Mexico',
      time: '',
      isDN: false),
         TimeData(
      flag: 'Allemagne.png',
      site: "http://worldtimeapi.org/api/timezone/Europe/Berlin",
      location: 'Germany',
      time: '',
      isDN: false),
         TimeData(
      flag: 'Qatar.png',
      site: "http://worldtimeapi.org/api/timezone/Asia/Qatar",
      location: 'Qatar',
      time: '',
      isDN: false),
         TimeData(
      flag: 'Emirates.png',
      site: "http://worldtimeapi.org/api/timezone/Asia/Dubai",
      location: 'Dubai',
      time: '',
      isDN: false),
         TimeData(
      flag: 'Beirut.jpg',
      site: "http://worldtimeapi.org/api/timezone/Asia/Beirut",
      location: 'Lebanon',
      time: '',
      isDN: false),
         TimeData(
      flag: 'Oman.png',
      site: "http://worldtimeapi.org/api/timezone/Asia/Amman",
      location: 'Oman',
      time: '',
      isDN: false),
       TimeData(
      flag: 'Canada.jpg',
      site: "http://worldtimeapi.org/api/timezone/America/Toronto",
      location: 'Canada',
      time: '',
      isDN: false),
       TimeData(
      flag: 'Hongrie.png',
      site: "http://worldtimeapi.org/api/timezone/Europe/Budapest",
      location: 'Hongrie',
      time: '',
      isDN: false),
       TimeData(
      flag: 'Finland.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Helsinki",
      location: 'Finland',
      time: '',
      isDN: false),
       TimeData(
      flag: 'Italy.png',
      site: "http://worldtimeapi.org/api/timezone/Europe/Rome",
      location: 'Italy',
      time: '',
      isDN: false),
       TimeData(
      flag: 'Belgium.png',
      site: "http://worldtimeapi.org/api/timezone/Europe/Brussels",
      location: 'Belgium',
      time: '',
      isDN: false),
      
      TimeData(
      flag: 'Colombia.png',
      site: "http://worldtimeapi.org/api/timezone/America/Bogota",
      location: 'Columbia',
      time: '',
      isDN: false),
      TimeData(
      flag: 'Spain.jpg',
      site: "http://worldtimeapi.org/api/timezone/Europe/Madrid",
      location: 'Spain',
      time: '',
      isDN: false),
];
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
    final String offset = data['utc_offset'].substring(0, 3);
    final DateTime now = DateTime.parse(date).add(Duration(hours: int.parse(offset)));
    isDN = (now.hour > 6 && now.hour < 20) ? false : true;
    time = DateFormat.jm().format(now);
  }
}


