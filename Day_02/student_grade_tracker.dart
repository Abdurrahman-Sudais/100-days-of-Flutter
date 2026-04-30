void main() {
  List<String> students = ['Alice', 'Bob', 'Charlie'];
  Map<String, int> studentsResults = {"Alice": 95, "Bob": 30, "Charlie": 80};
  print("=== Student = Grade = Tracker ===");
  int passed = 0;
  int failed = 0;
  for (var results in studentsResults.entries) {
    String status = results.value >= 70 ? "passed" : "failed";
    if (results.value >= 70) {
      passed++;
    } else {
      failed++;
    }

    print("${results.key}  :  ${results.value}  :  $status");
  }
  int totalScore = studentsResults.values.reduce((a, b) => a + b);
  double averageScore = totalScore / studentsResults.length;

  print("Total score : $totalScore");
  print("Average score : $averageScore");
  print("number of passed : $passed");
  print("number of failed : $failed");
  print("list of students: $students");
}
