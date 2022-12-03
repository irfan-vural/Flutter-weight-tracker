import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../models/record.dart';
import '../view-models/controller.dart';
import '../widgets/record_list_tile.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;

    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _controller.addRecord();
                  });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: records.isEmpty
            ? Center(
                child: Container(
                  child: Text('Please add some records'),
                ),
              )
            : ListView(
                physics: BouncingScrollPhysics(),
                children: records
                    .map((record) => RecordListTile(record: record))
                    .toList(),
              )));
  }
}
