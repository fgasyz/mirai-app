import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  CalenderState createState() => CalenderState();
}

class CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('20/10',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        const Text('2024'),
                      ],
                    )),
                Container(
                    child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_left_rounded)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right_rounded))
                  ],
                ))
              ],
            ),
            TableCalendar(
              calendarStyle: CalendarStyle(
                  defaultTextStyle: Theme.of(context).textTheme.bodySmall!),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              headerVisible: false,
            ),
          ],
        ));
  }
}
