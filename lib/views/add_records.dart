import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Record'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.weightScale,
                    size: 40,
                  ),
                  Stack(alignment: Alignment.bottomCenter, children: [
                    NumberPicker(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        step: 1,
                        itemHeight: 50,
                        itemWidth: 80,
                        itemCount: 3,
                        axis: Axis.horizontal,
                        minValue: 0,
                        maxValue: 300,
                        value: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        }),
                    Icon(
                      FontAwesomeIcons.chevronUp,
                      size: 16,
                    )
                  ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              var initialDate = DateTime.now();
              _selectedDate = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                            data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme(
                                    brightness: Brightness.light,
                                    primary: Colors.black,
                                    onPrimary: Colors.white,
                                    secondary: Colors.yellow,
                                    onSecondary: Colors.brown,
                                    error: Colors.red,
                                    onError: Colors.orange,
                                    background: Colors.blueAccent,
                                    onBackground: Colors.blueGrey,
                                    surface: Colors.blue,
                                    onSurface: Colors.black26)),
                            child: child ?? Text(''));
                      },
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)) ??
                  _selectedDate;
              setState(() {});
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('EEE, MMM d').format(_selectedDate),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: 'Leave yourself a note',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: Icon(Icons.cleaning_services_rounded),
                    )),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Save Record'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}
