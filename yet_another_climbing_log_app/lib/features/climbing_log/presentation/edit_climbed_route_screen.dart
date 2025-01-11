import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/climbed_route_model.dart';
import 'climbing_log_controller.dart';
import '/common/app_constants.dart';

class EditClimbedRouteScreen extends ConsumerWidget {
  final ClimbedRoute route;

  const EditClimbedRouteScreen({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: route.routeName);
    final gradeController = TextEditingController(text: route.routeGrade);
    final typeController = TextEditingController(text: route.routeType);
    final tryNumberController = TextEditingController(text: route.tryNumber.toString());
    bool isDone = route.isDone;
    String doneType = route.doneType;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Climbed Route'),
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
              value: route.routeGrade,
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
              value: route.routeType,
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
                  final updatedRoute = route.copyWith(
                    routeName: nameController.text,
                    routeGrade: gradeController.text,
                    routeType: typeController.text,
                    tryNumber: int.parse(tryNumberController.text),
                    isDone: isDone,
                    doneType: doneType,
                  );
                  
                  ref.read(climbingLogControllerProvider.notifier)
                     .updateClimbedRoute(updatedRoute);
                  
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
} 