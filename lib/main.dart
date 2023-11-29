import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:vnlunar/vnlunar.dart';
import './even.dart';
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
  //DateTime today = DateTime.now();

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay= DateTime.now();
  // DateTime focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;


  Map<DateTime, List<Event>> selectedEvents ={};
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }


  // void _onDaySelected(DateTime day, DateTime focusedDay) {
  //   setState(() {
  //     today = day;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lịch"),
        flexibleSpace: Image(
          image: AssetImage('assets/image1.png'),
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: Colors.grey,
      ),
      body: content(),
      
    );
  }

  // String convertToLunar(DateTime date) {
  //   final chuyenngay = Lunar(createdFromSolar: true, date: date);

  //   return "${chuyenngay.day}-${chuyenngay.month}-${chuyenngay.year}";
  // }

  Widget infoBox(Widget widget, bool hasBorder) {
    return Expanded(
      child: (Container(
       // padding: const EdgeInsets.only(right: -.10, left: -.10, top: 2, bottom: 2),
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
      color: Colors.deepPurple.withOpacity(0.3),
      child: (IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            infoBox(
                 Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Hôm nay", style: TextStyle(fontSize: 23)),
                    Text(
                      "${DateFormat('EE d-MMM-yyyy').format(DateTime.now())}",
                      style: TextStyle(height: -.3, fontSize: 23), ),
                  ],
                ),
                false),
            infoBox(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Dương Lịch:", style: TextStyle(fontSize: 23)),
                    Text(
                      "${DateFormat('dd-MM-yyyy').format(date)}",
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
          ],
        ),
      )),
    );
  }

  Widget content() {
    return Scaffold(
      // appBar: AppBar(
        
      // ),
      body: Column(
        children: [
          Container(
            child: getDateInfo(selectedDay),
          ),

          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            // daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          // Wiew event
            ..._getEventsfromDay(selectedDay).map(
            (Event event) => Container(
              margin: EdgeInsets.only(top: 20.0),
              width: 800,
              child: ListTile(
              title: Text(
                event.title,
                style: TextStyle(
                  color: Colors.white,
                  
                ),
                textAlign: TextAlign.center,
              ),
              tileColor: Color.fromARGB(255, 88, 87, 87),
            ),
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Thêm sự kiện"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              
              TextButton(
                child: Text("Thêm"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {
                    selectedEvents[selectedDay] = [
                        Event(_eventController.text)
                      ];
                    // if (selectedEvents[selectedDay] != null) {
                    //   selectedEvents[selectedDay].add(
                    //     Event(_eventController.text),
                    //   );
                    // } else {
                    //   selectedEvents[selectedDay] = [
                    //     Event(_eventController.text)
                    //   ];
                    // }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Thêm sự kiện"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
