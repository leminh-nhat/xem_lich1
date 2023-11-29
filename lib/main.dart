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

class _MyAppState extends State<MyApp>  {
  //DateTime today = DateTime.now();

  DateTime selectedDay = DateTime.now();
<<<<<<< HEAD
  DateTime focusedDay = DateTime.now();
  // DateTime focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  Map<DateTime, List<Event>> selectedEvents = {};
  TextEditingController _eventController = TextEditingController();
=======
  DateTime focusedDay= DateTime.now();
  // tạo biến trả về 1 Class  DateTime đại diện cho ngày hiện tại
  // DateTime focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
   /* khai báo một biến format và gán cho nó giá trị CalendarFormat.month.
    CalendarFormat là một enum định nghĩa các định dạng lịch khác nhau có thể được sử dụng để hiển thị lịch. */

  Map<DateTime, List<Event>> selectedEvents ={};
  /* khai báo và khởi tạo một bản đồ trống có tên selectedEvents. 
  Bản đồ này liên kết mỗi đối tượng DateTime với một danh sách các đối tượng Event */
>>>>>>> 317b77c12c3d135cc37e64256e6e13831a4eb4df

  TextEditingController _eventController = TextEditingController();
  // khai báo và khởi tạo một thể hiện mới của lớp TextEditingController có tên _eventController.
  // Lớp TextEditingController là một widget cung cấp khả năng chỉnh sửa văn bản trong Flutter
  @override
  void initState() {
    super.initState();
  }
    
  // Đoạn mã @override void initState() { super.initState(); } 
  // định nghĩa một phương thức initState() được ghi đè cho một StatefulWidget trong Flutter
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }
<<<<<<< HEAD

  // void _onDaySelected(DateTime day, DateTime focusedDay) {
  //   setState(() {
  //     today = day;
  //   });
  // }

=======
  /* Đoạn mã List<Event> _getEventsfromDay(DateTime date) { return selectedEvents[date] ?? []; } 
định nghĩa một hàm có tên _getEventsfromDay lấy một đối tượng DateTime làm đầu vào và trả về một danh sách các đối tượng Event */

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  /* Định nghĩa hàm: void _onDaySelected(DateTime day, DateTime focusedDay) { ... } 
  - Dòng này định nghĩa một hàm có tên _onDaySelected lấy hai đối tượng DateTime làm tham số: day và focusedDay.
  Cập nhật trạng thái: setState(() { today = day; }); - Khối mã này cập nhật biến trạng thái today bằng phương thức setState(). 
  Phương thức setState() được sử dụng để thông báo cho Flutter rằng đã có thay đổi trạng thái, điều này sẽ kích hoạt việc xây dựng lại cây widget.
 */
>>>>>>> 317b77c12c3d135cc37e64256e6e13831a4eb4df
  @override
  Widget build(BuildContext context) {
    int season() {
      if (selectedDay.month==3||selectedDay.month==4||selectedDay.month==5) {
        return 1;
      }
      if (selectedDay.month==6||selectedDay.month==7||selectedDay.month==8) {
        return 2;
      }
      if (selectedDay.month==9||selectedDay.month==10||selectedDay.month==11) {
        return 3;
      }
      if (selectedDay.month==12||selectedDay.month==1||selectedDay.month==2) {
        return 4;
      }
      return 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Lịch"),
        flexibleSpace: Image(
          image: AssetImage('assets/image${season()}.jpg'),
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: Colors.grey,
      ),
      body: content(),
    );
  }

  // String convertToLunar(DateTime date) {
  //   final chuyenngay = Lunar(createdFromSolar: true, date: date);

<<<<<<< HEAD
  //   return "${chuyenngay.day}-${chuyenngay.month}-${chuyenngay.year}";
  // }
=======
    return "${chuyenngay.day}-${chuyenngay.month}-${chuyenngay.year}";
  }
  /* định nghĩa một hàm có tên `convertToLunar` lấy một đối tượng `DateTime` làm đầu vào và trả về một chuỗi đại diện cho ngày âm lịch tương ứng
  
   */
>>>>>>> 317b77c12c3d135cc37e64256e6e13831a4eb4df

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
    var lunar = Lunar(createdFromSolar: true, date: date); // solar to lunar
    return Container(
      height: 120,
      color: Colors.deepPurple.withOpacity(0.3),
      child: (IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          /* 
            có lượng khoảng trống bằng nhau giữa mỗi widget, và cũng sẽ có lượng khoảng trống bằng nhau ở đầu và cuối hàng hoặc cột. */
          children: <Widget>[
            infoBox(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  /*  Nó chỉ định rằng các widget nên được căn chỉnh ở trung tâm của trục chéo.  */
                  children: <Widget>[
                    Text("Hôm nay", style: TextStyle(fontSize: 23)),
                    Text(
                      "${DateFormat('EE d-MMM-yyyy').format(DateTime.now())}",
                      style: TextStyle(height: -.3, fontSize: 23),
                    ),
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
              /* hàm gọi lại onFormatChanged được gọi bất cứ khi nào người dùng thay đổi định dạng lịch. 
              Hàm cập nhật biến trạng thái format để phản ánh lựa chọn định dạng mới. 
              Điều này cho phép ứng dụng theo dõi định dạng lịch hiện tại và hiển thị lịch cho phù hợp. */
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            //xác định ngày bắt đầu của tuần trong lịch.
            // daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              /* định nghĩa một hàm gọi lại có tên onDaySelected nhận hai đối tượng DateTime làm đầu vào: selectDay và focusDay. 
              Hàm gọi lại được sử dụng để cập nhật hai biến trạng thái, selectedDay và focusedDay, khi người dùng chọn một ngày trong lịch. */
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
              /* này định nghĩa một hàm gọi lại có tên selectedDayPredicate nhận một đối tượng DateTime làm đầu vào và trả về một giá trị bool.
               Hàm gọi lại được sử dụng để xác định xem ngày đã cho có nên được tô sáng làm ngày được chọn trong widget lịch hay không. */
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true, // tô sáng ngày hôm nay
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,// Mã này sẽ tạo ra một widget Container có hình chữ nhật.
                borderRadius: BorderRadius.circular(5.0), //  các góc của widget sẽ được bo tròn với độ cong là 5.0 đơn vị.
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
<<<<<<< HEAD
          ..._getEventsfromDay(selectedDay).map((Event event) => Container(
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
=======

            // ..._getEventsfromDay(...) = _getEventsfromDay(...).toList()
            ..._getEventsfromDay(selectedDay).map(
            //Đoạn mã mẫu ..._getEventsfromDay(selectedDay).map((Event event) => Container(..)) 
            //được sử dụng để biến đổi các sự kiện cho ngày đã chọn thành một danh sách các widget Container
            (Event event) => Container(
              margin: EdgeInsets.only(top: 20.0),
              width: 800,
              child: ListTile(
              title: Text(
                event.title,
                style: TextStyle(
                  color: Colors.white,
                  
>>>>>>> 317b77c12c3d135cc37e64256e6e13831a4eb4df
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        //được sử dụng để định nghĩa và cấu hình nút hành động nổi
        onPressed: () => showDialog(
          //Đoạn code onPressed: () => showDialog( ... ) sẽ gọi hàm showDialog() khi nút được nhấn. 
          //Hàm showDialog() sẽ hiển thị một hộp thoại trên màn hình.
          context: context,
          // context: context có nghĩa là sử dụng biến context hiện tại.
          // Biến context hiện tại là biến context của widget đang được render.
          builder: (context) => AlertDialog(
            // sẽ gọi hàm tạo AlertDialog() với tham số context. Hàm tạo AlertDialog()
            title: Text("Thêm sự kiện"),
            content: TextFormField(
              //Thuộc tính này xác định nội dung của hộp thoại.
              controller: _eventController,
              // Thuộc tính này xác định bộ điều khiển của trường văn bản.
              // Bộ điều khiển là một đối tượng quản lý trạng thái của trường văn bản,
              // chẳng hạn như giá trị, vị trí con trỏ và vùng chọn.
            ),
            actions: [
              TextButton(
                child: Text("Thêm"),
                onPressed: () {
<<<<<<< HEAD
                    selectedEvents[selectedDay] = [ Event(_eventController.text)];
                    
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
=======
                  if (_eventController.text.isEmpty) {
                     
                  } 
                  else {
                    selectedEvents[selectedDay] = [
                        Event(_eventController.text)
                        // thêm một sự kiện mới vào danh sách selectedEvents cho ngày hiện tại.
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
                  Navigator.pop(context); // đóng hộp thoại
                  _eventController.clear(); // xóa nội dung của _eventController
                  setState((){}); // và thông báo cho Flutter về thay đổi trạng thái.
>>>>>>> 317b77c12c3d135cc37e64256e6e13831a4eb4df
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Thêm sự kiện"), // Thuộc tính này xác định nhãn văn bản sẽ hiển thị bên cạnh biểu tượng trong nút
        icon: Icon(Icons.add),  
        //sẽ tạo ra một biểu tượng có nội dung "+" (thêm). Biểu tượng này sẽ được hiển thị trong nút FAB.
      ),
    );
  }
}
