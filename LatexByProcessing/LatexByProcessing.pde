Table table;

void setup() {
  
  table = loadTable("Schedule.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    String topic = row.getString("Topic in Intro");

    println(topic);
  }
  
}
