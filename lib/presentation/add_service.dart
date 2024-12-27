import 'package:flutter/material.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _quotaController = TextEditingController();
  final TextEditingController _departureDateController =
      TextEditingController();
  final TextEditingController _departureTimeController =
      TextEditingController();

  final List<String> _carFleets = ['Fleet 1', 'Fleet 2', 'Fleet 3'];
  String? _selectedCarFleet;

  DateTime? _departureDate;
  TimeOfDay? _departureTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        toolbarHeight: 130,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          color: Color(0xFF1572D3),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Passenger',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '  Service Name*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _serviceNameController,
                decoration: const InputDecoration(
                  labelText: 'Service Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '  Quota*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _quotaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quota',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '  Car Fleet*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: _selectedCarFleet,
                hint: const Text('Select Car Fleet',
                    style: TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  setState(() {
                    _selectedCarFleet = value;
                  });
                },
                items: _carFleets.map((fleet) {
                  return DropdownMenuItem(
                    value: fleet,
                    child: Text(fleet),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '  Departure Date*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _departureDateController,
                readOnly: true,
                onTap: _selectDate,
                decoration: const InputDecoration(
                  labelText: 'Departure Date',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '  Departure Time*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _departureTimeController,
                readOnly: true,
                onTap: _selectTime,
                decoration: const InputDecoration(
                  labelText: 'Departure Time',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey, width: 0.4),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Service Name: ${_serviceNameController.text}');
                      print('Quota: ${_quotaController.text}');
                      print('Car Fleet: $_selectedCarFleet');
                      print('Departure Date: ${_departureDateController.text}');
                      print('Departure Time: ${_departureTimeController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF212143),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 35),
                    ),
                    child: const Text(
                      'Add Passenger',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _departureDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != _departureDate) {
      setState(() {
        _departureDate = selectedDate;
        _departureDateController.text =
            "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  _selectTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _departureTime ?? TimeOfDay.now(),
    );
    if (selectedTime != null && selectedTime != _departureTime) {
      setState(() {
        _departureTime = selectedTime;
        _departureTimeController.text = selectedTime.format(context);
      });
    }
  }
}
