import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: replace "Developer" with the name of the user
    const String userName = 'Developer';
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            appBar: AppBar(
              title: const Text('Congratulations'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Congratulations $userName You did it!',
                      style: Style.mainFont.headlineSmall?.copyWith(
                        color: Style.primary,
                      )),
                  const SizedBox(height: 16),
                  Text(
                      'You passed the exam with flying colors. Your hard work and dedication have paid off. Keep up the great work!',
                      style: Style.mainFont.bodyLarge?.copyWith(
                        color: Style.darkText,
                      )),
                ],
              ),
            )),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller,
            blastDirection: pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            maxBlastForce: 10,
            minBlastForce: 1,
            emissionFrequency: 0.04,
            numberOfParticles: 20,
            gravity: 0.2,
            shouldLoop: true,
            colors: const [
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.orange,
              Colors.blue
            ],
            createParticlePath: (size) {
              final path = Path();
              path.addOval(Rect.fromCircle(
                  center: Offset(0, size.height / 2), radius: 5));
              return path;
            },
          ),
        ),
      ],
    );
  }
}
