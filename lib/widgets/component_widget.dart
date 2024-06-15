import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/form_data.dart';

class ComponentWidget extends StatelessWidget {
  final C_Data component;

  ComponentWidget({required this.component});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<C_Data>.value(
      value: component,
      child: Consumer<C_Data>(
        builder: (context, component, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.green, width: 2.0), // Green border
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: Card(
                semanticContainer: true,
                // surfaceTintColor: Colors.yellow,
                // shadowColor: Colors.yellow,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //     "Component ${component.labelController.text.length.toString()}"),
                      TextField(
                        controller: component.labelController,
                        decoration: InputDecoration(
                          labelText: 'Label',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green, //t border color here
                              width: 2.0, // Set border width here
                            ), // Adjust the value as needed
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: component.infoController,
                        decoration: InputDecoration(
                          labelText: 'Info-Text',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green, // Set border color here
                              width: 2.0, // Set border width here
                            ), // Adjust the value as needed
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 14, // Adjust the font size as needed
                          fontWeight: FontWeight
                              .bold, // Adjust the font weight as needed
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text("Required"),
                              value: component.isRequired,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  component.selectRequired();
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text("Readonly"),
                              value: component.isReadonly,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  component.selectReadonly();
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text("Hidden"),
                              value: component.isHidden,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  component.selectHidden();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            final formData = context.read<FormData>();
                            formData.removeComponent(component);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue, // Text color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Button border radius
                            ),
                          ),
                          child: const Text('Remove'), // Button text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
