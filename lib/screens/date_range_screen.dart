import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateRangeController extends GetxController {
  final _startDate = DateTime.now().subtract(const Duration(days: 1)).obs;
  final _endDate = DateTime.now().subtract(const Duration(days: 1)).obs;
  final _startCheck = false.obs;

  // final Rxn<DateTime> _startDate = Rxn<DateTime>();
  // final Rxn<DateTime> _endDate = Rxn<DateTime>();

  // final _startDate = obs;
  // final _endDate = ;

  DateTime? get startDate => _startDate.value;
  set startDate(value) => _startDate.value = value;
  DateTime? get endDate => _endDate.value;
  set endDate(value) => _endDate.value = value;
  bool get startCheck => _startCheck.value;
  set startCheck(value) => _startCheck.value = value;
}

class DateRangeScreen extends StatelessWidget {
  const DateRangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: OutlinedButton(
            onPressed: () {
              ShowBottomCalendar(context);
            },
            child: const Text('aaa')),
      ),
    );
  }

  void ShowBottomCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          // padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: const [
                      Text(
                        '경조휴가',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 7),
                      Text('12일 사용 가능', style: TextStyle(fontSize: 13))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                  Expanded(
                    // padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView(
                      children: [
                        for (int i = 0; i < 7; i++) MonthCalendar(nextMonth: i),
                      ],
                    ),
                  ),
                ]),
            // ),
          ),
        );
      },
    );
  }
}

class MonthCalendar extends StatelessWidget {
  final int nextMonth;

  MonthCalendar({
    Key? key,
    required this.nextMonth,
  }) : super(key: key);

  final DateRangeController c = Get.put(DateRangeController());

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    // 이번 달의 첫날
    var first = DateTime(now.year, now.month + nextMonth, 1);

    // 이번 달의 마지막날
    var last = DateTime(first.year, first.month + 1, 0);

    //첫날의 요일
    var DayOfWeek = first.weekday;

    //첫날의 요일 % 7 나머지
    var DayOfWeekS = first.weekday % 7;

    //마지막 날
    var lastDay =
        DateFormat('dd').format(DateTime(first.year, first.month + 1, 0));

    //마지막날의 숫자
    int lastDayInt = int.parse(lastDay);

    //년 String
    var yearString = DateFormat('yyyy').format(first);

    //달String
    var monthString = DateFormat('MM').format(first);

    var week = ((DayOfWeekS + lastDayInt) / 7).ceil();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            '$yearString.$monthString',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                for (int w = 0; w < week; w++)
                  Row(
                    children: [
                      for (int d = 0; d < 7; d++)
                        Expanded(
                          child: returnDateTime(first, w, d, 'MM') ==
                                  monthString
                              ? Obx(
                                  () => TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: c.startDate ==
                                                    returnDate(first, w, d) ||
                                                c.endDate ==
                                                    returnDate(first, w, d)
                                            ? Colors.blue
                                            : null,
                                        shape: const CircleBorder()),
                                    onPressed: checkPreDate(first, w, d)
                                        ? null
                                        : () {
                                            chooseDate(first, w, d);
                                          },
                                    child: Text(
                                      returnDateTime(first, w, d, 'dd'),
                                      style: TextStyle(
                                          color: checkPreDate(first, w, d)
                                              ? Colors.grey
                                              : checkWeek(first, w, d)
                                                  ? Colors.red
                                                  : Colors.black),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

DateTime returnDate(var dateTime, var week, var day) {
  DateTime date;
  if (dateTime.weekday == 7) {
    date = dateTime
        .subtract(Duration(days: dateTime.weekday - 7 - (week * 7) - day));
  } else {
    date =
        dateTime.subtract(Duration(days: dateTime.weekday - (week * 7) - day));
  }
  return date;
}

String returnDateTime(var dateTime, var week, var day, String type) {
  DateTime date = returnDate(dateTime, week, day);

  if (type == 'dd') {
    return DateFormat('dd').format(date);
  } else if (type == 'MM') {
    return DateFormat('MM').format(date);
  } else {
    return '';
  }
}

bool checkWeek(var dateTime, var week, var day) {
  DateTime date = returnDate(dateTime, week, day);

  if (date.weekday == 7) {
    return true;
  } else {
    return false;
  }
}

bool checkPreDate(var dateTime, var week, var day) {
  DateTime now = DateTime.now();
  DateTime date = returnDate(dateTime, week, day);
  var diff =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .difference(DateTime(date.year, date.month, date.day))
          .inDays;
  if (diff > 0) {
    return true;
  } else {
    return false;
  }
}

void chooseDate(var dateTime, var week, var day) {
  final DateRangeController c = Get.put(DateRangeController());
  DateTime date = returnDate(dateTime, week, day);

  log('${date.difference(c.startDate!).inDays}');

  if (c.startCheck == true && date.difference(c.startDate!).inDays > 0) {
    c.endDate = date;
    c.startCheck = false;
  } else {
    c.startDate = date;
    c.startCheck = true;
    c.endDate = DateTime.now();
  }

  // log('${date.difference(c.startDate!).inDays}');
  // c.startDate = date;
  // log('${c.startDate}');
  // log('$date');
}
