Table table;
String [] topics= {};
int [] daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
String [] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

//Start Month is for example: 8 for august - 1
int startMonth = 8 - 1;
//start must be on a tuesday...
int startDate = 27;
int dayOfYear = 0;
int numWeeks =15;
int date;
int year = 2018;
int endMonth = 12;
int endDate = 11;

void setup() {
  //initialize dayOfYear
  for (int i =0; i < startMonth; i++) {
    dayOfYear += daysInMonth[i];
  }
  dayOfYear += startDate;

  //month = getMonth(dayOfYear);
  //dateT = dayOfYear;

  generateDates();
}

void generateCode() {
  table = loadTable("Schedule.csv", "header");
  //println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    String topic = row.getString("Topic in Intro");
    topics = append(topics, topic);
  }

  for (int i=0; i < topics.length; i+=2) {
    println(topics[i] + " & "+ topics[i+1] + " \\\\");
  }
}

void generateDates() {
  //\bf{August} \hfill\bf{27}& \hfill\bf{29}&\hfill\bf{31} \\
  for(int i=0; i<numWeeks;i++){
  println("\\bf{" + months[getMonth(dayOfYear + 7*i)] +"} \\hfill\\bf{" +getDate(dayOfYear+ 7*i)+"} & \\bf{" + months[getMonth(dayOfYear+2+7*i)] + "} \\hfill\\bf{" + getDate(dayOfYear+2+7*i) + "} \\\\");
  }
}

int getMonth(int day) {
  int totalDaysSoFar =0;
  for (int i =0; i < 12; i++) {
    totalDaysSoFar += daysInMonth[i];
    if (day < totalDaysSoFar) {
      return i;
    }
  }
  return -1;
}

int getDate(int day){
  int totalDaysSoFar =0;
  for (int i =0; i < getMonth(day); i++) {
    totalDaysSoFar += daysInMonth[i];
  }
  return day-totalDaysSoFar;
}
