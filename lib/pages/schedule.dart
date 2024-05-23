import 'package:doctor_app/Common%20Widgets/TextField.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? _selectedDate;
  String? _selectedGender; // تخزين الجنس المختار
  String? _selectedappointment;
  void _bookAppointment(BuildContext context) {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select appointment date.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select gender.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (_selectedappointment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select gender.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Perform booking logic here

    // Show AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Confirmed'),
          content: Text('Your appointment has been successfully booked.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(
                    context, true); // Send back data to previous screen
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Clear the selected date and gender after booking
    setState(() {
      _selectedDate = null;
      _selectedGender = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Appointment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Appointment Date',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFieldWidget(
              Labeltext: "Name",
              ispass: false,
            ),
            TextFieldWidget(
              Labeltext: "Age",
              ispass: false,
            ),
            // حقل اختيار الجنس
            ListTile(
              title: Text('Gender'),
              trailing: DropdownButton<String>(
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title: Text('Appointment'),
              trailing: DropdownButton<String>(
                value: _selectedappointment,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedappointment = newValue;
                  });
                },
                items: <String>['10AM', '11AM', '12AM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Text(_selectedDate == null
                  ? 'Select Date'
                  : 'Selected Date: ${_selectedDate.toString().substring(0, 10)}'),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _bookAppointment(context);
              },
              child: Text("Book Appointment"),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
