import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'count_timer.dart';

class FlashLightScreen extends StatefulWidget {
  const FlashLightScreen({super.key});

  @override
  State<FlashLightScreen> createState() => _FlashLightScreenState();
}

class _FlashLightScreenState extends State<FlashLightScreen> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE6F7F6);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            'Flash Light',
            style: TextStyle(color: textColor),
          )),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isActive ? 'assets/torch_on.png' : 'assets/torch_off.png',
                    height: 200,
                    width: 200,
                    color: isActive ? null : textColor.withOpacity(0.26),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isActive = !isActive;
                            setState(() {});
                          },
                          icon: const Icon(Icons.power_settings_new)),
                    ),
                  ),
                ],
              ),
            ),
          )),
          CountDownTimer(startTimer: isActive),
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            'A Great Man is a Torch in the Darkness',
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
