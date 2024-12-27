import 'package:flutter/material.dart';

class AddPassengger extends StatefulWidget {
  const AddPassengger({super.key});

  @override
  State<AddPassengger> createState() => _AddPassenggerState();
}

class _AddPassenggerState extends State<AddPassengger> {
  final TextEditingController _passengerController = TextEditingController();
  final TextEditingController _pickupLocationController =
      TextEditingController();
  final TextEditingController _whatsappNumberController =
      TextEditingController();

  final List<String> _travelServices = ['Service 1', 'Service 2', 'Service 3'];
  String? _selectedTravelService;

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
                '  Passenger*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _passengerController,
                decoration: const InputDecoration(
                  labelText: 'Name - Age - City',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
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
                '  Travel Services*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: _selectedTravelService,
                hint: const Text('Select Travel Service',
                    style: TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  setState(() {
                    _selectedTravelService = value;
                  });
                },
                items: _travelServices.map((service) {
                  return DropdownMenuItem(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '  Pickup Location*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _pickupLocationController,
                decoration: const InputDecoration(
                  labelText: 'Pickup Location',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
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
                '  Whatsapp Number*',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _whatsappNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixText: '+62 ',
                        hintText: 'WhatsApp Number',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 76, 76),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                ],
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
                      print('Passenger: ${_passengerController.text}');
                      print('Travel Service: $_selectedTravelService');
                      print(
                          'Pickup Location: ${_pickupLocationController.text}');
                      print(
                          'WhatsApp Number: ${_whatsappNumberController.text}');
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
}
