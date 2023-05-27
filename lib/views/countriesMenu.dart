// import 'package:flutter/material.dart';
// import 'package:timeapp/widgets/countrywidget.dart';
// import 'time.dart';

// class Menu extends StatefulWidget {
//   const Menu({super.key});

//   @override
//   State<Menu> createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   double screenHeight = 0;
//   double screenWidth = 0;
//   bool startAnimation = false;

//     @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       setState(() {
//         startAnimation = true;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: Colors.indigoAccent,
//         appBar: AppBar(
//           backgroundColor: Colors.indigoAccent,
//           title: const Text('COUNTRIES'),
//           centerTitle: true,
//         ),
//         body: ListView.builder(
//             itemCount: times.length,
//             itemBuilder: (context, index) => CountryCard(
//                   country: times[index].location,
//                   flag: times[index].flag,
//                   index: index,
//                 )));
//   }
// }
