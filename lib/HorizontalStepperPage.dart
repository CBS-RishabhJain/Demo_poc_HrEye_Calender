

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalStepperPage extends StatefulWidget {
  const HorizontalStepperPage({super.key});

  @override
  _HorizontalStepperPageState createState() => _HorizontalStepperPageState();
}
class _HorizontalStepperPageState extends State<HorizontalStepperPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horizontal Stepper"),
      ),
      body: Stepper(
        type: StepperType.horizontal, // Horizontal stepper
        currentStep: _currentStep,
        steps: _buildSteps(),
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        controlsBuilder: (context, ControlsDetails details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text("Back"),
              ),
              TextButton(
                onPressed: details.onStepContinue,
                child: const Text("Next"),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text("Point 1"),
        content: const Text("This is the content for Point 1."),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text("Point 2"),
        content: const Text("This is the content for Point 2."),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text("Point 3"),
        content: const Text("This is the content for Point 3."),
        isActive: _currentStep >= 2,
      ),
    ];
  }
}