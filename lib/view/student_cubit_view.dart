import 'package:allinone/cubit/student_cubit.dart';
import 'package:allinone/model/student_model.dart';
import 'package:allinone/state/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubitView extends StatelessWidget {
  StudentCubitView({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final age = int.tryParse(_ageController.text.trim()) ?? 0;
      final address = _addressController.text.trim();

      final student = StudentModel(name: name, age: age, address: address);
      context.read<StudentCubit>().addStudent(student);

      _nameController.clear();
      _ageController.clear();
      _addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter name' : null,
                  ),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter age' : null,
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter address' : null,
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<StudentCubit, StudentState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () => _submitStudent(context),
                              child: const Text("Submit"),
                            );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Student List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<StudentCubit, StudentState>(
                builder: (context, state) {
                  if (state.lstStudents.isEmpty) {
                    return const Text("No students added yet.");
                  }

                  return ListView.builder(
                    itemCount: state.lstStudents.length,
                    itemBuilder: (context, index) {
                      final student = state.lstStudents[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(student.name),
                        subtitle:
                            Text("Age: ${student.age}, Address: ${student.address}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<StudentCubit>().deleteStudent(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
