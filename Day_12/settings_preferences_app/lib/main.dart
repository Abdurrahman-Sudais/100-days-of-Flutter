import 'package:flutter/material.dart';
import 'package:settings_preferences_app/notifier/notifiers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Settings Preference App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black38,

              brightness: value ? Brightness.dark : Brightness.light,
            ),
          ),
          home: MySettings(),
        );
      },
    );
  }
}

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool Switch = false;
  bool? checkBox = false;
  double sliderValue = 0.0;
  TextEditingController NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Preference App"),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black12,
        leading: Icon(Icons.home_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: NameController,
                onEditingComplete: () {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: const Text("Enter Your Name"),
                ),
              ),
            ),
            Text("Hello,${NameController.text}"),
            SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: isDarkMode,
              builder: (BuildContext context, dynamic isDark, Widget? child) {
                return SwitchListTile(
                  title: const Text("Enable Dark Mode"),
                  value: Switch,
                  onChanged: (value) {
                    setState(() {
                      Switch = value;
                      isDarkMode.value = !isDarkMode.value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              value: checkBox,
              onChanged: (value) {
                setState(() {
                  checkBox = value;
                });
              },
              title: Text("Enable Notifications"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Volume:     ${sliderValue.round()}"),
                Slider(
                  max: 50,
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Preferences Saved!")));
                },
                child: const Text("Save Preferences"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
