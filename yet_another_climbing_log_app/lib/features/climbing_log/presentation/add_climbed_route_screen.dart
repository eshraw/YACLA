import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/climbed_route_model.dart';
import 'climbing_log_controller.dart';
import '/common/app_constants.dart';

class AddClimbedRouteScreen extends ConsumerWidget {
  const AddClimbedRouteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final gradeController = TextEditingController();
    final typeController = TextEditingController();
    final tryNumberController = TextEditingController();
    bool isDone = false;
    String doneType = 'Flash';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Climbed Route'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Route Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a route name' : null,
            ),
            DropdownButtonFormField<String>(
              value: AppConstants.climbingGrades.first,
              decoration: const InputDecoration(labelText: 'Grade'),
              items: AppConstants.climbingGrades
                  .map((grade) => DropdownMenuItem(
                        value: grade,
                        child: Text(grade),
                      ))
                  .toList(),
              onChanged: (value) => gradeController.text = value ?? '',
            ),
            DropdownButtonFormField<String>(
              value: 'Sport',
              decoration: const InputDecoration(labelText: 'Type'),
              items: ['Sport', 'Boulder', 'Trad']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) => typeController.text = value ?? '',
            ),
            TextFormField(
              controller: tryNumberController,
              decoration: const InputDecoration(labelText: 'Try Number'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter try number' : null,
            ),
            StatefulBuilder(
              builder: (context, setState) => CheckboxListTile(
                title: const Text('Route Completed'),
                value: isDone,
                onChanged: (value) => setState(() => isDone = value ?? false),
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) => DropdownButtonFormField<String>(
                value: doneType,
                decoration: const InputDecoration(labelText: 'Completion Type'),
                items: ['Flash', 'Onsight', 'Redpoint']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => doneType = value ?? 'Flash'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final route = ClimbedRoute(
                    id: 0,
                    routeName: nameController.text,
                    routeGrade: gradeController.text,
                    routeType: typeController.text,
                    tryNumber: int.parse(tryNumberController.text),
                    isDone: isDone,
                    doneType: doneType,
                  );
                  
                  ref.read(climbingLogControllerProvider.notifier)
                     .addClimbedRoute(route);
                  
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Route'),
            ),
          ],
        ),
      ),
    );
  }
} 