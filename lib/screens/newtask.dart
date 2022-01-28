import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class newtask extends StatefulWidget {
  const newtask({Key? key}) : super(key: key);

  @override
  _newtaskState createState() => _newtaskState();
}

class _newtaskState extends State<newtask> {
  DateTime? date = null;
  TimeOfDay? time = null;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is to be done?'),
            Row(
              children: [
                Flexible(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Enter Task Here',
                      )
                    ),),
                TextButton(
                  child: Icon(Icons.mic) ,
                  onPressed: (){},),
              ],
            ),
            SizedBox(height: 40,),
            Text('Due Date'),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    readOnly: true,
                    controller: dateController,
                  ),
                ),
                TextButton(
                  child: Icon(Icons.calendar_today_outlined),
                  onPressed: () async {
                   DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: date == null ? DateTime.now(): date!,
                        firstDate: DateTime.now()
                        lastDate: DateTime(2200));
                    if(pickedDate!=null){
                      date = pickedDate;
                      setState((){});
                      var dateString = DateFormat('EEEE, d MMM, yyyy').format(pickedDate);
                      dateController.text = dateString;
                    }
                  },
                ),
                Visibility(
                  visible: date == null? false:true,
                    child: TextButton(
                      child: Icon(Icons.cancel_rounded),
                      onPressed: (){
                        date = null;
                        time = null;
                        setState(() {});
                        dateController.text = "";
                        timeController.text = "";
                      }
                    ),
                ),
              ],
            ),
            Visibility(
              visible: date == null? false: true,
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        readOnly: true,
                        controller: timeController,
                      ),
                    ),
                    TextButton(
                      child: Icon(Icons.access_alarm_outlined),
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                        );
                        if(pickedTime!=null){
                        time = pickedTime;
                        setState((){});

                        timeController.text = pickedTime.format(context);
                        }
                      },
                    ),
                    Visibility(
                      visible: time == null? false:true,
                      child: TextButton(
                          child: Icon(Icons.cancel_rounded),
                          onPressed: (){
                            time = null;
                            setState(() {});
                            timeController.text = "";
                          }
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )
    );
  }
}
