class Detail_item {
  String TeacherName;
  String UrlAvata;
  String Date_time;
  int Number_of_exercises;
  Detail_item({ required this.TeacherName, required this.UrlAvata, required this.Date_time,  required this.Number_of_exercises});
}

class Detail_item_information{
  String UserName;
  String Class;
  int Phone;
  String Email;
  String School;

  Detail_item_information({required this.UserName, required this.Class, required this.Phone, required this.Email, required this.School});
}
class Detail_item_attendance{
  String Date;
  Enum ? Status;

  Detail_item_attendance({ required this.Date,this.Status});

}
class Detail_item_listStudent{
  int id;
  String nameStudent;
  String dateOfBirth;


  Detail_item_listStudent({required this.id, required this.nameStudent, required this.dateOfBirth});
}

class Detail_item_notifi{
  int id;
  String content;
  Detail_item_notifi({required this.id, required this.content});

}
class Detail_item_subject_score{
  String urlImage;
  String nameStatusdiemmonhoc;

  Detail_item_subject_score({required this.urlImage,required  this.nameStatusdiemmonhoc});
}
 class Detail_item_date_exercise{
  int week;
  String startDate;
  String endDate;
  Detail_item_date_exercise({required this.week, required this.startDate, required this.endDate});


 }
class Detail_item_exercise{
  String urlImg;
  String exerciseName;
  String assignmentCreationTime;
  String typOfExercise;
  Detail_item_exercise({required this.urlImg, required this.exerciseName, required this.assignmentCreationTime, required this.typOfExercise});
}

class Detail_item_exerciseFiles{
  String urlImage;
  String title;
  Detail_item_exerciseFiles({
    required this.urlImage, required this.title
});

}
