import 'package:flutter/material.dart';
import 'package:timeapp/views/time.dart';

class CountryCard extends StatelessWidget {
  final String country;
  final String flag;
  final int index;
  const CountryCard({
    super.key,
    required this.country,
    required this.flag,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    void updateData(index) async {
      TimeData instance = times[index];
      await instance.getTime();
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home', arguments: {
        'location': instance.location,
        'time': instance.time,
        'isDayorNight': instance.isDayorNight,
        'flag': instance.flag
      });
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: ListTile(
          onTap: () => updateData(index),
          title: Text('              $country',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/$flag'),
            ),
          
        ));
  }
}
