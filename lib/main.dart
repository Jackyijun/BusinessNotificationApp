import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(fontFamily: 'Lexend'),
          unselectedLabelStyle: TextStyle(fontFamily: 'Lexend'),
        ),
      ),
      home: const MyHomePage(title: 'Dermose Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          TopPart(),
          SizedBox(height: 10),
          CalendarRow(),
          Divider(color: Color(0xFF6B7280)),
          ScheduleCards(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat.yMMMM().format(DateTime.now()),
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
              ),
              onPressed: () {},
              child: const Text(
                "+\$200",
                style: TextStyle(
                  color: Color(0xFF057747),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarRow extends StatelessWidget {
  const CalendarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return calendarRow(context);
  }

  Widget calendarRow(BuildContext context) {
    Map<int, String> dayOfWeek = {
      1: 'M',
      2: 'T',
      3: 'W',
      4: 'T',
      5: 'F',
      6: 'S',
      7: 'S',
    };
    var today = DateTime.now();
    List<String> dates = [];
    List<String> dayOfWeeks = [];
    dates.add(DateFormat.d().format(today));
    dayOfWeeks.add(dayOfWeek[today.weekday]!);
    for (int i = 1; i < 14; i++) {
      var date =
          DateTime(today.year, today.month, today.day).add(Duration(days: i));
      dates.add(DateFormat.d().format(date));
      dayOfWeeks.add(dayOfWeek[date.weekday]!);
    }

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 65,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 55,
                  child: Column(
                    children: [
                      Text(
                        dayOfWeeks[index],
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          color: index == 0
                              ? Colors.black
                              : const Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 5),
                      index == 0
                          ? Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: Center(
                                child: Text(
                                  dates[index],
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent),
                              child: Center(
                                child: Text(
                                  dates[index],
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () => _selectDate(
              context), // Ensure you define _selectDate or replace its functionality
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12.0),
          ),
          child: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class ScheduleCards extends StatelessWidget {
  const ScheduleCards({super.key});

  @override
  Widget build(BuildContext context) {
    var timeSchedule = [
      '9:00 AM - 10:45 AM',
      '11:00 AM - 11:30 AM',
      '12:00 PM - 12:30 PM'
    ];

    var time = ['9:00 AM', '11:00 AM', '12:00 PM'];

    var duration = ['1h', '30min', '1h'];

    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(index == 0 ? 0 : 20, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index == 0 ? '•   ${time[index]}' : time[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend',
                          fontSize: 15,
                          color: index == 0
                              ? const Color(0xFF057747)
                              : Colors.black,
                        ),
                      ),
                      Text(
                        duration[index],
                        style: const TextStyle(
                            fontFamily: 'Lexend', color: Color(0xFF6B7280)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: double
                      .infinity, // Changed to double.infinity for responsiveness
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF9CA3AF)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(
                          'Service(s) here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Lexend',
                            color: index == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          'John Doe',
                          style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 15,
                              fontFamily: 'Lexend'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
                        child: Text(
                          timeSchedule[index],
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 15,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<void> _selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Initial date set to current date
    firstDate: DateTime(2024), // Earliest allowable date
    lastDate: DateTime(2025), // Latest allowable date
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.black, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          dialogBackgroundColor: Colors.white, // background color
        ),
        child: child!,
      );
    },
  );
  if (pickedDate != null) {
    // Do something with the pickedDate
    // print("Selected Date: ${pickedDate.toString()}");
  }
}
