import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:vnlunar/vnlunar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Nhóm 17: Nhật, Danh, Gia',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lịch"),
        flexibleSpace: Image(
          image: AssetImage('assets/image1.png'),
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: Colors.blue,
      ),
      body: content(),
    );
  }

  String convertToLunar(DateTime date) {
    final chuyenngay = Lunar(createdFromSolar: true, date: date);

    return "${chuyenngay.day}-${chuyenngay.month}-${chuyenngay.year}";
  }

  Widget infoBox(Widget widget, bool hasBorder) {
    return Expanded(
      child: (Container(
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            border: Border(
                right:
                    BorderSide(color: Colors.grey, width: hasBorder ? 1 : 0))),
        child: widget,
      )),
    );
  }

  Widget getDateInfo(DateTime date) {
    
    var lunar = Lunar(createdFromSolar: true, date: date);// solar to lunar
    return Container(
      height: 120,
      color: Color.fromARGB(255, 112, 55, 217)..withOpacity(0.3),
      child: (IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            infoBox(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Dương Lịch:", style: TextStyle(fontSize: 23)),
                    Text(
                      "${DateFormat('dd-MM-yyyy').format(today)}",
                      style: TextStyle(height: -.3, fontSize: 23),
                    ),
                  ],
                ),
                true),
            infoBox(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Âm Lịch:", style: TextStyle(fontSize: 23)),
                    Text(
                      "${lunar.day}-${lunar.month}-${lunar.year}",
                      style: TextStyle(height: -.3, fontSize: 23),
                    ),
                  ],
                ),
                true),
            // infoBox(
            //     const Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Text("Tháng"),
            //      //   Text(lunarMonth.toString(), style: bodyStyle),
            //      //   Text(lunarMonthName, style: bottomStyle),
            //       ],
            //     ),
            //     false)
          ],
        ),
      )),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Text(
          //     "Selected Day (Dương lịch) = ${DateFormat('dd-MM-yyyy').format(today)}"),
          // Text("Selected Day (Âm lịch) = ${convertToLunar(today)}"),
          Container(
            child: getDateInfo(today),
          ),

          Container(
            child: TableCalendar(
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              locale: "en_US",
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2050, 10, 16),
            ),
          ),
        ],
      ),
    );
  }
}
