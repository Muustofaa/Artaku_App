import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transaksi'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Logic to add transaction dialog
              },
            ),
          ],
        ),
        body: Column(
          children: [
            _buildFilterSection(),
            _buildSearchBar(),
            Expanded(child: _buildTransactionList()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(items: [], onChanged: null), // Tanggal
        DropdownButton(items: [], onChanged: null), // Kategori
        DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              value: 'Pemasukan',
              child: Text('Pemasukan'),
            ),
            DropdownMenuItem<String>(
              value: 'Pengeluaran',
              child: Text('Pengeluaran'),
            ),
          ],
          onChanged: (String? newValue) {
            // Handle the change here
            print(newValue);
          },
          hint: Text("Pilih Transaksi"),
        ), // Jenis
        ElevatedButton(onPressed: () {}, child: Text('Terapkan Filter')),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari Transaksi',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      itemCount: 10, // Ganti dengan jumlah transaksi
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Transaksi ${index + 1}'),
          subtitle: Text('Detail transaksi'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
