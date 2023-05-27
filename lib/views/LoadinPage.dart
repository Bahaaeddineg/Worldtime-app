import 'package:page_transition/page_transition.dart';
import 'package:timeapp/views/Menu.dart';

import 'time.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void timefunc() async {
    //pour afficher la premiere view aprés le loading page
    TimeData instance = times[0];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(PageTransition(
        child: const Menu(),
        type: PageTransitionType.bottomToTop,
        duration: const Duration(seconds: 2)));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () => timefunc());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.network(
            "https://assets9.lottiefiles.com/packages/lf20_k0dvn0vb.json"),
      ]),
    );
  }
}
