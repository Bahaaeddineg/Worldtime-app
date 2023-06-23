import 'package:page_transition/page_transition.dart';
import 'package:timeapp/views/Menu.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void timefunc() async {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(PageTransition(
        child: const Menu(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800)));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => timefunc());
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: Colors.indigo,
              body: Center(
                child: Lottie.network(
                  "https://assets9.lottiefiles.com/packages/lf20_eAqEBOw7m9.json",
                ),
              ),
    );
  }
}
