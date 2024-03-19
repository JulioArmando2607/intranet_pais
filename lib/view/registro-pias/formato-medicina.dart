import 'package:flutter/material.dart';

class FormatoMedicinaScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data = List.generate(
    10,
    (index) => {
      'name': 'ANGEL QUISPE YANARICO',
      'place': 'Intramuro',
      'dx01': 'DX Data $index',
      // Add more data fields as necessary
    },
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna fija a la izquierda
          IntrinsicWidth(
            child: Column(
              children: [
                _buildFixedHeader(),
                ..._buildFixedRows(),
              ],
            ),
          ),
          // Columnas desplazables a la derecha dentro de un área desplazable
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  _buildScrollingHeader(), // Encabezado de las columnas desplazables
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: _createScrollingColumns(),
                      rows: _createScrollingRows(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollingHeader() {
    // Crear encabezados para las columnas desplazables
    return DataTable(
      columns: _createScrollingColumns(),
      rows: const [],
    );
  }

  Widget _buildFixedHeader() {
    // Crea el encabezado fijo
    return DataTable(
      headingRowHeight: 56,
      columns: [
        DataColumn(label: Text('TIPO DOCUMENTO')),
        DataColumn(label: Text('PERSONA')),
      ],
      rows: [], // No rows, only header
    );
  }

  List<Widget> _buildFixedRows() {
    // Crea las filas fijas
    return List.generate(
      data.length,
      (index) => DataRow(
        cells: [
          DataCell(Text('DNI: ${data[index]['dni']}')),
          DataCell(Text(data[index]['name'])),
        ],
      ).toWidget(),
    );
  }

  DataRow _createScrollingRow(Map<String, dynamic> rowData) {
    // Crear una fila desplazable basada en los datos de la fila proporcionados
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(rowData['dx01'])),
        DataCell(Text(rowData['dx02'])),
        // Continuar agregando DataCell basado en los datos de la fila
      ],
    );
  }

  List<DataRow> _createScrollingRows() {
    // Crear las filas desplazables basadas en los datos
    return data.map((rowData) => _createScrollingRow(rowData)).toList();
  }

  List<DataColumn> _createScrollingColumns() {
    // Crear las columnas desplazables para el DataTable
    return <DataColumn>[
      DataColumn(label: Text('DX 01')),
      DataColumn(label: Text('DX 02')),
      DataColumn(label: Text('DX 03')),
      DataColumn(label: Text('DX 04')),
      // ... agrega tantas columnas como necesites ...
    ];
  }
}

extension DataRowExtension on DataRow {
  Widget toWidget() {
    // Deberías cambiar el Text widget para mostrar el contenido real del DataCell.
    return Row(
      children: cells.map((cell) {
        // Asumimos que cada celda tiene un Text widget como hijo
        final textWidget = cell.child as Text;
        return Container(
          padding: EdgeInsets.all(8.0), // Padding para el contenido de la celda
          child: Text(textWidget.data ?? ''), // Muestra el texto de la celda
        );
      }).toList(),
    );
  }
}
