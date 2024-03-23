import 'package:learningdart/utils/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ToDoDatabase{
  List toDoList =[];

  //reference the box
   final mybox = Hive.box("DoList_db");


   //create initial data
   void createInitialData(){
    toDoList=[
      ["Complete Assignment",false],
      ["Learn java",false]
    ];
   }

   //load data from db
   void loadData(){
    toDoList =mybox.get("TODOLIST");
   }

   //update data
   void updateDb(){
    mybox.put("TODOLIST", toDoList);
   }

}


class HabitDatabase {

  final habitbox = Hive.box("Habit_db");

  List habitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // create initial default data
  void createInitialData() {
    habitList = [
      ["Run Fast", false],
      ["Read", false],
    ];

    habitbox.put("START_DATE", todaysDateFormatted());
  }

  // load data if it already exists
  void loadData() {
    // if it's a new day, get habit list from database
    if (habitbox.get(todaysDateFormatted()) == null) {
      habitList = habitbox.get("HABITLIST");
      // set all habit completed to false since it's a new day
      for (int i = 0; i < habitList.length; i++) {
        habitList[i][1] = false;
      }
    }
    // if it's not a new day, load todays list
    else {
      habitList = habitbox.get(todaysDateFormatted());
      loadHeatMap();
    }
  }

  // update database
  void updateDb() {
    
    habitbox.put(todaysDateFormatted(), habitList);   
    habitbox.put("HABITLIST", habitList);  
    calculateHabitPercentages();
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < habitList.length; i++) {
      if (habitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = habitList.isEmpty
        ? '0.0'
        : (countCompleted / habitList.length).toStringAsFixed(1);

    habitbox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(habitbox.get("START_DATE"));

    int daysInBetween = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        habitbox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}

class NoteDatabase{
 
  List notesList=[];

  //reference the box
   final mybox = Hive.box("Notes_db");


   //create initial data
   void createInitialNote(){
    notesList=[
      ["First Note","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus odio massa, vehicula non mollis a, iaculis eget enim. Suspendisse efficitur cursus odio ac consequat."],
      
      ["Second Note","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus odio massa, vehicula non mollis a, iaculis eget enim. Suspendisse efficitur cursus odio ac consequat."]
    ];
   }

   //load data from db
   void loadNote(){
    notesList =mybox.get("NOTELIST");
   }

   //update data
   void updateNote(){
    mybox.put("NOTELIST", notesList);
   }

}
