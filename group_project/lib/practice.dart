import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable in Flutter'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTableExample(),
        ),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Team 2 Members",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DataTable(
          columns: [
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Second Name')),
            DataColumn(label: Text('Role')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Joyce')),
              DataCell(Text('Riro')),
              DataCell(Text('Programmer')),
            ]),
            DataRow(cells: [
              DataCell(Text('Ato')),
              DataCell(Text('Muli')),
              DataCell(Text('Back End')),
            ]),
            DataRow(cells: [
              DataCell(Text('Willy')),
              DataCell(Text('Green')),
              DataCell(Text('Consultant')),
            ]),
          ],
        ),
      ],
    );
  }
}
