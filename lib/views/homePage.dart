import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../components/components.dart';
import 'Menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;

    final String imge =
        data['isDayorNight'] ? 'assets/night_sky.jpg' : 'assets/clear_sky.jpg';
    return Scaffold(
      backgroundColor:
          data['isDayorNight'] ? Colors.indigoAccent : Colors.blueAccent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(imge), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              customText(data['location'], true,40, "Bebas", Colors.white,
                  FontWeight.bold, 2),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage("assets/${data['flag']}"),
              ),
              const SizedBox(height: 10),
              customText(data['time'], true,40, "Bebas", Colors.white,
                  FontWeight.normal, 2),
              Padding(
                padding: const EdgeInsets.only(
                    right: 70, left: 70, bottom: 10, top: 10),
                child: MaterialButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    PageTransition(
                        child: const Menu(),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 500)),
                  ),
                  color: Colors.blueAccent,
                  child: customText('CHOOSE COUNTRY', true,15, "Sigmar",
                      Colors.black, FontWeight.bold, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
