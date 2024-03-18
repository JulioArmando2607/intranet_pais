import 'package:flutter/material.dart';

class FormatoMedicinaScreen extends StatelessWidget {
  final columns = [
    'PERSONA',
    'LUGAR',
    'DX 01',
    'DX 02',
    'DX 03',
    'DX 04',
    'Ecografía',
    'Teleconsulta por médico',
    '...'
  ];

  // Esta lista debe ser poblada con tus datos
  final data = [
    ['ANGEL QUISPE YANARICO', 'Intramuro', 'J42', '', '', '', '0', '0', '...'],
    // Más datos...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDICINA'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: getColumns(columns),
            rows: getRows(data),
          ),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<List<String>> data) =>
      data.map((List<String> row) {
        final cells = row.map((cell) => DataCell(Text(cell))).toList();

        return DataRow(cells: cells);
      }).toList();
}
