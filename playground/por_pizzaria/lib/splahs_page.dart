import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

/// Flutter code sample for [RotationTransition].

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> changeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: changeScreen(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: double.infinity,
                color: const Color(0xffE64A19),
                child: Center(
                  child: RotationTransition(
                    turns: _animation,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/png/pizza.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              );
            }

            return Container();
          }),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final bool? obscureText;
  final String hintText;
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.icon,
    this.obscureText = false,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: true,
      obscureText: obscureText ?? false,
      style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
          suffixIcon: icon,
          contentPadding: const EdgeInsets.fromLTRB(16, 10, 10, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xff83A603), style: BorderStyle.solid),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xffE64A19), style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xff83A603), style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xff83A603), style: BorderStyle.solid),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xff83A603), style: BorderStyle.solid),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
                width: 1, color: Color(0xffE64A19), style: BorderStyle.solid),
          )),
    );
  }
}
