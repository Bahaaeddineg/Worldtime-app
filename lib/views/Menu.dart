import 'package:flutter/material.dart';
import 'package:timeapp/components/time.dart';
import '../components/components.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late double screenHeight;
  late double screenWidth;

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
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              customText('Countries', true, 30, "Sigmar", Colors.white,
                  FontWeight.normal, 0),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                primary: false,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                shrinkWrap: true,
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return item(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    void updateData(index) async {
      final TimeData instance = times[index];
      await instance.getTime();
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home', arguments: {
        'location': instance.location,
        'time': instance.time,
        'isDayorNight': instance.isDN,
        'flag': instance.flag
      });
    }

    return AnimatedContainer(
        height: 55,
        width: screenWidth,
        curve: Curves.easeInToLinear,
        duration: Duration(milliseconds: 300 + (index * 100)),
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () => updateData(index),
          title: customText(times[index].location, false, 17, "Sigmar",
              Colors.black, FontWeight.normal, 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/${times[index].flag}'),
          ),
        ));
  }
}
