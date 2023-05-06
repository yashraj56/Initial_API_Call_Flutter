import 'package:flutter/material.dart';
import 'API_.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Data List',
      home: MyDataListView(),
    );
  }
}

class MyDataListView extends StatefulWidget {
  @override
  _MyDataListViewState createState() => _MyDataListViewState();
}

class _MyDataListViewState extends State<MyDataListView> {
  late List<dynamic> _data;

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Data List'),
      ),
      body: _data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_data[index]['title']),
                  subtitle: Text(_data[index]['body']),
                );
              },
            ),
    );
  }
}

