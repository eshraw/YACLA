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

  late Future<void> _dataLoadingFuture;

  @override
  void initState() {
    super.initState();
    _dataLoadingFuture = _loadData();
  }

  Future<void> _loadData() async {
    if (_shoes.isEmpty || _harnesses.isEmpty) {
      await _loadEquipment();
    }
    if (widget.routeToEdit != null && _routeName.isEmpty) {
      await _loadExistingRouteData();
    }
  }

  Future<void> _loadExistingRouteData() async {
    if (widget.routeToEdit == null || widget.routeToEdit!['climbed_routes_id'] == null) {
      print('Error: No route ID found for editing');
      return;
    }

    final routeId = widget.routeToEdit!['climbed_routes_id'];
    // Use the routeId directly if it's already an int, or parse it if it's a string
    final parsedRouteId = routeId is int ? routeId : int.tryParse(routeId.toString());
    
    if (parsedRouteId == null) {
      print('Error: Invalid route ID');
      return;
    }

    final routeData = await DatabaseHelper.instance.getClimbedRouteById(parsedRouteId);
    if (routeData != null) {
      setState(() {
        _routeName = routeData['route_name'] ?? '';
        _routeType = routeData['route_type'] ?? '';
        _routeGrade = routeData['route_grade'] ?? '';
        _tryNumber = routeData['try_number'] ?? 1;
        _isDone = routeData['is_done'] == 1;
        _doneType = routeData['done_type'] ?? '';
        _selectedShoeId = routeData['shoe_id'] != null ? int.tryParse(routeData['shoe_id'].toString()) : null;
        _selectedHarnessId = routeData['harness_id'] != null ? int.tryParse(routeData['harness_id'].toString()) : null;
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
        title: Text(widget.routeToEdit != null ? 'Edit Climbed Route' : 'Add Climbed Route'),
      ),
      body: FutureBuilder(
        future: _dataLoadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Route Name'),
                    initialValue: _routeName,
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
                    value: _routeType.isNotEmpty ? _routeType : null,
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
                    initialValue: _routeGrade,
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
                    initialValue: _tryNumber.toString(),
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
                      value: _doneType.isNotEmpty ? _doneType : null,
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
                    value: _selectedShoeId,
                    items: _shoes.map((shoe) {
                      return DropdownMenuItem<int>(
                        value: shoe['shoes_id'],
                        child: Text('${shoe['shoes_brand']} ${shoe['shoes_model']}'),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedShoeId = value),
                  ),
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(labelText: 'Harness (Optional)'),
                    value: _selectedHarnessId,
                    items: _harnesses.map((harness) {
                      return DropdownMenuItem<int>(
                        value: harness['harness_id'],
                        child: Text('${harness['harness_brand']} ${harness['harness_model']}'),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedHarnessId = value),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(widget.routeToEdit != null ? 'Update Climbed Route' : 'Add Climbed Route'),
                  ),
                ],
              ),
            );
          }
        },
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
        widget.routeToEdit!['climbed_routes_id'],
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
