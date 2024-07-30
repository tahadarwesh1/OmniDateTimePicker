import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omni DateTime Picker',
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
        Locale('zh', 'CN')
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.light,
        ),
      ),
      home: const OmniExample(),
    );
  }
}

class OmniExample extends StatelessWidget {
  const OmniExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? dateTime =
                    await showOmniDateTimePicker(context: context);
                // Use dateTime here
                debugPrint('dateTime: $dateTime');
              },
              child: const Text('Show DateTime Picker'),
            ),
            ElevatedButton(
              onPressed: () async {
                final List<DateTime>? dateTime =
                    await showOmniDateTimeRangePicker(context: context);

                // Use dateTime here
                debugPrint('dateTime: $dateTime');
              },
              child: const Text('Show DateTime Picker'),
            ),
            ElevatedButton(
              onPressed: () async {
                // final DateTime? dateTime = await showOmniDateTimePicker(
                //   context: context,
                //   is24HourMode: false,
                //   isShowSeconds: true,
                //   type: OmniDateTimePickerType.time,
                // );

                final TimeOfDay? dateTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                // Use dateTime here
                debugPrint('dateTime: $dateTime');
              },
              child: const Text('Show Time Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
