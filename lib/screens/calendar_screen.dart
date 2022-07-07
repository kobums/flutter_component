import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);
  String todayYear = DateFormat('yyyy').format(DateTime.now());
  String todayMonth = DateFormat('MM').format(DateTime.now());
  String todayDay = DateFormat('dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    String lastDay = DateFormat('dd')
        .format(DateTime(int.parse(todayYear), int.parse(todayMonth) + 1, 0));
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                '경조휴가',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(child: Text('일')),
                  Expanded(child: Text('월')),
                  Expanded(child: Text('화')),
                  Expanded(child: Text('수')),
                  Expanded(child: Text('목')),
                  Expanded(child: Text('금')),
                  Expanded(child: Text('토')),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '$todayYear.$todayMonth',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(int.parse(todayYear),
                      int.parse(todayMonth), int.parse(todayDay)),
                  lastDay: DateTime.utc(int.parse(todayYear),
                      int.parse(todayMonth), int.parse(lastDay)),
                  headerVisible: false,
                  daysOfWeekVisible: false,
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      if (day.weekday == DateTime.sunday) {
                        final text = DateFormat.E().format(day);

                        return Center(
                          child: Text(
                            text,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    ));
  }
}
