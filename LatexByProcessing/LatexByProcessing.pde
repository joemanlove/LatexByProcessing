Table table;
String [] topics= {};
int [] daysInMonth = {31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
String [] months = {"December", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int month = 8;
int date = 27;
int year = 2018;
int endMonth = 12;
int endDate = 11;

void setup() {
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
  
  //while (month<endMonth || (month == endMonth && date< endDate)) {
    println("\\bf{" + months[month] +"} \\hfill\\bf{" +date+"}");
     
    date = date + 2;
  //}
  //for (int i =0; i <12; i++) {
  //  println(months[i] + " has " + daysInMonth[i] + " days.");
  //}
}
