import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CustomStepperExample extends StatefulWidget {
//   @override
//   _CustomStepperExampleState createState() => _CustomStepperExampleState();
// }
//
// class _CustomStepperExampleState extends State<CustomStepperExample> {
//   int currentStep = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Custom Horizontal Stepper"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Custom Stepper
//           Row(
//             children: List.generate(3, (index) {
//               return Expanded(
//                 child: Row(
//                   children: [
//                     // Step Circle
//                     CircleAvatar(
//                       radius: 16,
//                       backgroundColor:
//                       index <= currentStep ? Colors.yellow : Colors.grey[300],
//                       child: CircleAvatar(
//                         radius: 12,
//                         backgroundColor: Colors.white,
//                         child: index <= currentStep
//                             ? Icon(Icons.control_point, size: 16, color: Colors.red)
//                             : Container(),
//                       ),
//                     ),
//                     // Connecting Line
//                     if (index < 2)
//                       Expanded(
//                         child: Container(
//                           height: 4,
//                           color: index < currentStep
//                               ? Colors.red
//                               : Colors.grey[300],
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//           const SizedBox(height: 50),
//           // Content
//           Center(
//             child: Text(
//               "Step ${currentStep + 1}",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Next and Previous Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               if (currentStep > 0)
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       currentStep--;
//                     });
//                   },
//                   child: Text("Back"),
//                 ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (currentStep < 2) {
//                     setState(() {
//                       currentStep++;
//                     });
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Steps Completed!")),
//                     );
//                   }
//                 },
//                 child: Text(currentStep == 2 ? "Finish" : "Next"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class CustomStepperExample extends StatefulWidget {
  @override
  _CustomStepperExampleState createState() => _CustomStepperExampleState();
}

class _CustomStepperExampleState extends State<CustomStepperExample> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Horizontal Stepper"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Custom Stepper
          Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Step Label
                    Text(
                      "Step ${index + 1}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: index <= currentStep ? Colors.red : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Step Circle with Connecting Line
                    Row(
                      children: [
                        // Step Circle
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: index <= currentStep
                              ? Colors.yellow
                              : Colors.grey[300],
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: index <= currentStep
                                ? Icon(Icons.control_point,
                                size: 16, color: Colors.red)
                                : Container(),
                          ),
                        ),
                        // Connecting Line
                        if (index < 2)
                          Expanded(
                            child: Container(
                              height: 4,
                              color: index < currentStep
                                  ? Colors.red
                                  : Colors.grey[300],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 50),
          // // Content
          // Center(
          //   child: Text(
          //     "Step ${currentStep + 1}",
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // ),
          const SizedBox(height: 20),
          // Next and Previous Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentStep > 0)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentStep--;
                    });
                  },
                  child: Text("Back"),
                ),
              ElevatedButton(
                onPressed: () {
                  if (currentStep < 2) {
                    setState(() {
                      currentStep++;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Steps Completed!")),
                    );
                  }
                },
                child: Text(currentStep == 2 ? "Finish" : "Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
