import 'package:flutter/material.dart';

class FormatoMedicinaScreen extends StatefulWidget {
  @override
  _FormatoMedicinaScreenState createState() => _FormatoMedicinaScreenState();
}

class _FormatoMedicinaScreenState extends State<FormatoMedicinaScreen> {
  final ScrollController _fixedColumnController = ScrollController();
  final ScrollController _scrollingBodyController = ScrollController();

  @override
  void dispose() {
    _fixedColumnController.dispose();
    _scrollingBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDICINA'),
      ),
      body: Row(
        children: <Widget>[
          // Columnas fijas
          Container(
            width: 200, // ajusta esto a la anchura de tus columnas fijas
            child: _buildFixedColumn(),
          ),
          // Columnas desplazables
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollingBodyController,
              child: _buildScrollingBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixedColumn() {
    return SingleChildScrollView(
      controller: _fixedColumnController,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ITEM')),
          DataColumn(label: Text('TIPO DOCUMENTO')),
          // Añade aquí las columnas adicionales que deberían estar fijas
        ],
        rows: List<DataRow>.generate(
          20, // El número de filas que quieres en la tabla
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text('DNI: 0123456789')),
              // Añade aquí más celdas de datos que deberían estar fijas
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScrollingBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        _fixedColumnController.jumpTo(_scrollingBodyController.offset);
        return true;
      },
      child: DataTable(
        columns: [
          DataColumn(label: Text('PERSONA')),
          DataColumn(label: Text('LUGAR')),
          DataColumn(label: Text('DX 01')),
          // Añade aquí las columnas adicionales que deberían desplazarse
        ],
        rows: List<DataRow>.generate(
          20, // El número de filas que quieres en la tabla
          (index) => DataRow(
            cells: [
              DataCell(Text('Nombre ${index + 1}')),
              DataCell(Text('Lugar')),
              DataCell(Text('Info')),
              // Añade aquí más celdas de datos que deberían desplazarse
            ],
          ),
        ),
      ),
    );
  }
}
