import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String? selectedGrade;
  List courses = [];
  double cgpa = 0.0;
  TextEditingController courseCode = TextEditingController();
  TextEditingController units = TextEditingController();
  int get totalUnits =>
      courses.fold(0, (sum, c) => sum + (int.tryParse(c["units"]) ?? 0));

  @override
  void dispose() {
    courseCode.dispose();
    units.dispose();
    super.dispose();
  }

  Widget gradeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField(
              value: selectedGrade,
              hint: Text("Grade"),
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: ["A", "B", "C", "D", "E", "F"].map((grade) {
                return DropdownMenuItem<String>(
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGrade = value;
                });
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                addCourse();
                calculateCgpa();
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              child: Text("Add Course"),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("courses(${courses.length})"),
          OutlinedButton(
            onPressed: () {
              calculateCgpa();
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size(150, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            child: Text("Calculate CGPA"),
          ),
        ],
      ),
    );
  }

  Widget rowCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(totalUnits.toString()), Text("Total units")],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(courses.length.toString()), Text("Courses")],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("0"), Text("Quality Pts.")],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addCourse() {
    if (courseCode.text.trim().isEmpty) return;
    if (units.text.trim().isEmpty) return;
    if (selectedGrade == null) return;

    setState(() {
      courses.add({
        "course": courseCode.text.trim(),
        "units": units.text.trim(),
        "grade": selectedGrade,
      });
      courseCode.clear();
      units.clear();
      selectedGrade = null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Course added!"),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  void calculateCgpa() {
    if (courses.isEmpty) return;

    double totalQualityPoints = 0;
    int totalUnits = 0;

    for (var course in courses) {
      int unit = int.tryParse(course["units"]) ?? 0;
      double gradePoint = getGradePoint(course["grade"]);

      totalUnits += unit;
      totalQualityPoints += unit * gradePoint;
    }

    setState(() {
      cgpa = totalQualityPoints / totalUnits;
    });
  }

  double getGradePoint(String grade) {
    switch (grade) {
      case "A":
        return 5.0;
      case "B":
        return 4.0;
      case "C":
        return 3.0;
      case "D":
        return 2.0;
      case "E":
        return 1.0;
      case "F":
        return 0.0;
      default:
        return 0.0;
    }
  }

  String getClassification() {
    if (cgpa >= 4.5) return "First class";
    if (cgpa >= 3.5) return "Second upper";
    if (cgpa >= 2.4) return "Second lower";
    if (cgpa >= 1.5) return "Third class";
    if (cgpa >= 1.0) return "Pass";

    return "Fail";
  }

  Color getClassificationColor() {
    if (cgpa >= 4.5) return Colors.greenAccent;
    if (cgpa >= 3.5) return Colors.blueAccent;
    if (cgpa >= 2.4) return Colors.orangeAccent;
    if (cgpa >= 1.5) return Colors.deepOrangeAccent;
    return Colors.redAccent;
  }

  Color getGradeColor(String grade) {
    switch (grade) {
      case "A":
        return Colors.greenAccent;
      case "B":
        return Colors.blueAccent;
      case "C":
        return Colors.orangeAccent;
      case "D":
        return Colors.deepOrangeAccent;
      case "E":
        return Colors.redAccent;
      case "F":
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Widget textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: courseCode,
              onSubmitted: (value) {
                addCourse();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Course code e.g MTH 101",
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: units,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Units",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget cgpaCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Current cgpa", style: TextStyle(color: Colors.white24)),
                  Text(
                    courses.isEmpty ? "—" : cgpa.toStringAsFixed(2),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              courses.isEmpty
                  ? Text(
                      "No courses yet",
                      style: TextStyle(color: Colors.white24),
                    )
                  : Card(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          getClassification(),
                          style: TextStyle(color: getClassificationColor()),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget courseList() {
    return courses.isEmpty
        ? placeHolder()
        : ListView.builder(
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int index) {
              final course = courses[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: getGradeColor(
                    course["grade"],
                  ).withOpacity(0.2),
                  child: Text(
                    course["grade"],
                    style: TextStyle(color: getGradeColor(course["grade"])),
                  ),
                ),
                title: Text(course["course"]),
                subtitle: Text("${course["units"]} units"),
                trailing: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      courses.removeAt(index);
                      calculateCgpa();
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(50, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Icon(Icons.delete_sharp),
                ),
              );
            },
          );
  }

  Widget placeHolder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school_outlined, size: 60, color: Colors.white24),
          SizedBox(height: 12),
          Text("No courses added"),
          SizedBox(height: 6),
          Text(
            "Add your courses above to calculate your GPA.",
            style: TextStyle(color: Colors.white24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CGPA Calculator")),
      body: Column(
        children: [
          Text("Computer Enginnering • 200lvl"),
          Divider(),
          cgpaCard(),
          rowCard(),
          SizedBox(height: 10),
          textField(),
          SizedBox(height: 10),
          gradeSelector(),
          SizedBox(height: 15),
          Divider(),
          actionRow(),
          Expanded(child: courseList()),
        ],
      ),
    );
  }
}
