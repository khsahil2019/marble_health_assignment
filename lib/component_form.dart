import 'package:flutter/material.dart';
import 'package:marble_health_assignment/widgets/component_widget.dart';
import 'package:provider/provider.dart';
import 'data/form_data.dart';

class ComponentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormData>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...formData.components
                .map((component) => ComponentWidget(component: component))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: formData.addComponent,
              child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}
