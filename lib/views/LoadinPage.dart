import 'package:page_transition/page_transition.dart';
import 'package:timeapp/views/Menu.dart';
import '../components/time.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>{

  void timefunc() async {
    final TimeData instance = times[0];
    await instance.getTime();
    Navigator.of(context).pushReplacement(PageTransition(
        child: const Menu(),
        type: PageTransitionType.bottomToTop,
        duration: const Duration(seconds: 2)));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () => timefunc());
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Lottie.network(
          "https://assets9.lottiefiles.com/packages/lf20_k0dvn0vb.json",
        ),
      ),
    );
  }
}
