import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddClimbedRoute extends StatefulWidget {
  final Map<String, dynamic>? routeToEdit;

  const AddClimbedRoute({super.key, this.routeToEdit});

  @override
  AddClimbedRouteState createState() => AddClimbedRouteState();
}

class AddClimbedRouteState extends State<AddClimbedRoute> {
  final _formKey = GlobalKey<FormState>();
  String _routeName = '';
  String _routeType = '';
  String _routeGrade = '';
  int _tryNumber = 1;
  bool _isDone = false;
  String _doneType = '';
  int? _selectedShoeId;
  int? _selectedHarnessId;

  List<Map<String, dynamic>> _shoes = [];
  List<Map<String, dynamic>> _harnesses = [];

  @override
  void initState() {
    super.initState();
    _loadEquipment();
    if (widget.routeToEdit != null) {
      _loadExistingRouteData();
    }
  }

  Future<void> _loadExistingRouteData() async {
    final routeId = int.parse(widget.routeToEdit!['id'].toString());
    final routeData = await DatabaseHelper.instance.getClimbedRouteById(routeId);
    if (routeData != null) {
      setState(() {
        _routeName = routeData['route_name'] ?? '';
        _routeType = routeData['route_type'] ?? '';
        _routeGrade = routeData['route_grade'] ?? '';
        _tryNumber = routeData['try_number'] ?? 1;
        _isDone = routeData['is_done'] == 1;
        _doneType = routeData['done_type'] ?? '';
        _selectedShoeId = routeData['shoe_id'] != null ? int.parse(routeData['shoe_id'].toString()) : null;
        _selectedHarnessId = routeData['harness_id'] != null ? int.parse(routeData['harness_id'].toString()) : null;
      });
    }
  }

  Future<void> _loadEquipment() async {
    final shoes = await DatabaseHelper.instance.getAllShoes();
    final harnesses = await DatabaseHelper.instance.getAllHarnesses();
    setState(() {
      _shoes = shoes;
      _harnesses = harnesses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Climbed Route'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Route Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a route name';
                }
                return null;
              },
              onSaved: (value) => _routeName = value!,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Route Type'),
              items: ['Sport','Boulder','Trad'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => setState(() => _routeType = value!),
              validator: (value) => value == null ? 'Please select a route type' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Route Grade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a route grade';
                }
                return null;
              },
              onSaved: (value) => _routeGrade = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Try Number'),
              keyboardType: TextInputType.number,
              initialValue: '1',
              validator: (value) {
                if (value == null || int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) => _tryNumber = int.parse(value!),
            ),
            SwitchListTile(
              title: const Text('Is Done'),
              value: _isDone,
              onChanged: (bool value) {
                setState(() {
                  _isDone = value;
                });
              },
            ),
            if (_isDone)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Done Type'),
                items: ['Flash', 'Onsight', 'Redpoint'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _doneType = value!),
                validator: (value) => _isDone && value == null ? 'Please select a done type' : null,
              ),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Shoes (Optional)'),
              items: _shoes.map((shoe) {
                return DropdownMenuItem<int>(
                  value: shoe['shoes_id'],
                  child: Text('${shoe['shoes_brand']} ${shoe['shoes_model']}'),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedShoeId = value),
              validator: (value) => null,  // Remove validation for shoes
            ),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Harness (Optional)'),
              items: _harnesses.map((harness) {
                return DropdownMenuItem<int>(
                  value: harness['harness_id'],
                  child: Text('${harness['harness_brand']} ${harness['harness_model']}'),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedHarnessId = value),
              validator: (value) => null,  // Remove validation for harness
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Add Climbed Route'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.routeToEdit != null) {
        await _updateClimbedRoute();
      } else {
      await _createClimbedRoute();
      }
      // Navigate back to the previous screen
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  Future<void> _createClimbedRoute() async {
    final routeId = await DatabaseHelper.instance.insertRoute({
      'route_name': _routeName,
      'route_type': _routeType,
      'route_grade': _routeGrade,
    });

    // Then, insert the climbed route
    await DatabaseHelper.instance.insertClimbedRoute({
      'route_id': routeId,
      'try_number': _tryNumber,
      'is_done': _isDone ? 1 : 0,
      'done_type': _doneType,
      'shoes_id': _selectedShoeId,
      'harness_id': _selectedHarnessId,
    });
  }

  Future<void> _updateClimbedRoute() async {
    if (widget.routeToEdit != null) {
      // Update existing route
      await DatabaseHelper.instance.updateClimbedRoute(
        widget.routeToEdit!['id'],
        {
          'route_id': widget.routeToEdit!['route_id'],
          'try_number': _tryNumber,
          'is_done': _isDone ? 1 : 0,
          'done_type': _doneType,
          'shoes_id': _selectedShoeId,
          'harness_id': _selectedHarnessId,
        },
      );
    }

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
