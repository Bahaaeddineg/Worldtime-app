import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;

    String imge = data[
            'isDayorNight'] // pour afficher une image du ciel au jour si le temps <20 sinon // image du ciel au nuit
        ? 'assets/images/night_sky.jpg'
        : 'assets/images/clear_sky.jpg';
    return Scaffold(

      backgroundColor:
          data['isDayorNight'] ? Colors.indigoAccent : Colors.blueAccent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(imge), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(data['location'],style: const TextStyle(letterSpacing: 3,fontSize: 35,fontFamily: "Sigmar",color: Colors.white),)),
                const SizedBox(height: 10,),
                CircleAvatar(

                      radius: 130,
                      backgroundImage: AssetImage("assets/images/${data['flag']}"),
                    ),
                
                
                const SizedBox(height: 10),
                Text(
                  data['time'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    letterSpacing: 3,
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: "Sigmar"),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 70, left: 70, bottom: 10),
                    child: MaterialButton(
                      onPressed: () =>
                          Navigator.of(context).push(PageTransition(child: const Menu(), type: PageTransitionType.bottomToTop,duration: Duration(seconds: 1)),),
                      color: Colors.blueAccent,
                      child: const Text('CHOOSE COUNTRY',style: TextStyle(fontFamily: "Sigmar",fontSize: 18),),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
