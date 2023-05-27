import 'package:flutter/material.dart';
import 'package:timeapp/views/time.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:  Colors.indigo,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30,),
             const Text(
                  "Countries",
                  style: TextStyle(
                    fontSize: 30,
                    
                    color: Colors.white,
                    fontFamily: "Sigmar"
                  ),
                ),
              
              const SizedBox(height: 30,),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return item(index);
                },
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
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
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 100 + (index * 200)),
      transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  ListTile(
          onTap: () => updateData(index),
          title: Text(times[index].location,
              style:
                  const TextStyle(fontSize: 20,fontFamily: "Sigmar")),
          leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/${times[index].flag}'),
            ),
    ));
  }

}