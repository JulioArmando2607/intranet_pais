import 'package:flutter/material.dart';
import 'package:intranet_pais/view/registro-pias/formato-medicina.dart';

class InterventionListScreen extends StatelessWidget {
  // Example data for the data table.
  final List<Map<String, dynamic>> data = [
    {
      "item": "1",
      "date": "2024-03-21",
      "location": "PIAS TITICACA",
      "town": "AMANTANI",
    },
    // Add more data maps...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BANDEJA DE INTERVENCIONES'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildFilterForm(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildFilterFormButtons(),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('ITEM')),
                DataColumn(label: Text('FECHA')),
                DataColumn(label: Text('PUNTO INTERVENCIÒN')),
                DataColumn(label: Text('CENTRO POBLADO')),
                DataColumn(label: Text('PUNTO ATENCIÓN')),
                DataColumn(label: Text('CAMPAÑA')),
                DataColumn(
                    label: Text('ACCIONES')) // Define all other columns...
              ],
              rows: List<DataRow>.generate(
                data.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(data[index]["item"].toString())),
                    DataCell(Text(data[index]["date"].toString())),
                    DataCell(Text(data[index]["date"].toString())),
                    DataCell(Text(data[index]["date"].toString())),
                    DataCell(Text(data[index]["date"].toString())),
                    DataCell(Text(data[index]["date"].toString())),
                    DataCell(Row(
                      children: [
                        Icon(Icons.edit),
                        Icon(Icons.delete),
                        InkWell(
                          child: Icon(Icons.remove_red_eye),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormatoMedicinaScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    )),

                    // Define all other cells...
                  ],
                ),
              ),
            ),
            _buildPagination(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new intervention logic
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildFilterForm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'PERIODO',
              border: OutlineInputBorder(),
            ),
            value: '2024',
            items:
                ['2024', '2025'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              // Update the period filter
            },
          ),
        ),
        SizedBox(width: 8), // Adjust spacing based on your design
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'PIAS',
              border: OutlineInputBorder(),
            ),
            value: 'BAP YAHUAS',
            items: ['BAP YAHUAS', 'BAP OTHER']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              // Update the PIAS filter
            },
          ),
        ),
        SizedBox(width: 8), // Adjust spacing based on your design
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'CAMPAÑA',
              border: OutlineInputBorder(),
            ),
            value: 'Campaign 1',
            items: ['Campaign 1', 'Campaign 2']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              // Update the campaign filter
            },
          ),
        ),
        SizedBox(width: 8), // Adjust spacing based on your design
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'N° INTERVENCION',
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) {
              // Update the campaign filter
            },
          ),
        ),
        // If you have more filters, add them here with the same pattern...
      ],
    );
  }

  Widget _buildFilterFormButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Filter action
          },
          child: Row(
            children: [
              Icon(Icons.filter_list, size: 20), // Icon size can be adjusted
              Text(" Filtrar"),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Background color
            onPrimary: Colors.white, // Text color
            elevation: 2, // Shadow elevation
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        SizedBox(width: 10), // Spacing between the buttons
        ElevatedButton(
          onPressed: () {
            // Clear/Refresh action
          },
          child: Row(
            children: [
              Icon(Icons.refresh, size: 20), // Icon size can be adjusted
              Text(" Limp. / Refre."),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade700, // Background color
            onPrimary: Colors.white, // Text color
            elevation: 2, // Shadow elevation
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
// Pagination logic to go back
            },
          ),
          Text('1-5 de 5'),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
// Pagination logic to go forward
            },
          ),
        ],
      ),
    );
  }
}
