import 'package:flutter/material.dart';

class PatientRecord extends StatelessWidget {
  const PatientRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDropdown(
                title: 'Patient History',
                items: [
                  DropdownItem('Blood report'),
                  DropdownItem('CT Scan report'),
                ],
              ),
              SizedBox(height: 16),
              CustomDropdown(
                title: 'Prescription',
                items: [
                  DropdownItem('26 March 2022'),
                  DropdownItem('13 April 2022'),
                  DropdownItem('Add new', icon: Icons.add),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<DropdownItem> items;

  CustomDropdown({required this.title, required this.items});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Column(
            children: widget.items.map((item) {
              return ListTile(
                title: Text(item.title),
                trailing: item.icon != null
                    ? Icon(item.icon)
                    : Icon(Icons.visibility),
                onTap: () {
                  // Handle tap
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}

class DropdownItem {
  final String title;
  final IconData? icon;

  DropdownItem(this.title, {this.icon});
}
