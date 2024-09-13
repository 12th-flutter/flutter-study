import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스케줄 알람',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SchedulePage(),
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _titleController = TextEditingController();
  DateTime? _selectedDateTime;
  final List<Map<String, dynamic>> _schedules = [];
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotification();
    tz.initializeTimeZones(); // 시간대 초기화
  }

  void _initializeNotification() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSSettings = DarwinInitializationSettings();
    const settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);

    await _flutterLocalNotificationsPlugin.initialize(settings);
  }

  void _scheduleNotification(
      int id, DateTime scheduledTime, String title) async {
    final tz.TZDateTime tzScheduledTime =
        tz.TZDateTime.from(scheduledTime, tz.local);

    const androidDetails = AndroidNotificationDetails(
      'schedule_channel',
      '일정 알림',
      channelDescription: '일정 이벤트에 대한 알림',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iOSDetails = DarwinNotificationDetails();
    const notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title, // 제목을 알림의 제목으로 사용
      title, // 제목을 알림의 본문으로 사용
      tzScheduledTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // 일치하는 시간에 알람 발생
    );
  }

  void _setSchedule() {
    if (_selectedDateTime != null && _titleController.text.isNotEmpty) {
      final newSchedule = {
        'id': _schedules.length + 1,
        'title': _titleController.text,
        'time': _selectedDateTime!,
      };

      _schedules.add(newSchedule);
      _scheduleNotification(newSchedule['id'] as int,
          newSchedule['time'] as DateTime, newSchedule['title'] as String);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '"${_titleController.text}" 일정이 $_selectedDateTime에 예약되었습니다')),
      );

      setState(() {
        _titleController.clear();
        _selectedDateTime = null;
      });
    }
  }

  void _deleteSchedule(int id) {
    setState(() {
      _schedules.removeWhere((schedule) => schedule['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ID $id 일정이 삭제되었습니다')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('스케줄 알람'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '"일정의 제목을 입력하세요: "'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  _selectedDateTime == null
                      ? ''
                      : '선택된 시간: ${_selectedDateTime.toString()}',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (selectedDate != null) {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          _selectedDateTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  child: const Text('시간 설정하기'),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _setSchedule,
              child: const Text('스케줄 추가하기'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _schedules.length,
                itemBuilder: (context, index) {
                  final schedule = _schedules[index];
                  return ListTile(
                    title: Text(schedule['title']),
                    subtitle: Text(schedule['time'].toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteSchedule(schedule['id'] as int),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
