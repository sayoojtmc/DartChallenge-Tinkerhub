
class Participant{
  String name;
  String email;
  List stack;
  bool isMentor=false;
  int timeAvailable;
  Participant(String name,String email,int timeAvailable)
  {
    this.name = name;
    this.email = email;
    this.timeAvailable = timeAvailable;
  }
  void setMentorOrLearner(int x)
  {
    if(x==1)
    {
      isMentor = true;
    }
    else if(x==2)
    {
      isMentor = false;
    }
  }
  void getMentor(List stack,int time,Map map)
  {
    Map mentorNames  = new Map<String,List>();
    stack.forEach((el){
      mentorNames[el]= new List();
      map[el].forEach((mentor){
        if(mentor.timeAvailable>=time)
        {
          mentorNames[el].add(mentor.name);
        }
      });
    });
    print("your mentors are: ");
    stack.forEach((el){
      print("$el : ${mentorNames[el]}");
    });
  }
  
}

void main() {   //Driver Code
  print("Enter your name:");
  
  Map mentorMap = new Map<String,List<Participant>>();  // this map is used to keep track of technology name and mentors experienced in that specific tech
  Participant p1 = new Participant("abc1","123@gmail.com",30);
  Participant p2 = new Participant("xddd","456@gmail.com",40);
  Participant p3 = new Participant("xddd","789@gmail.com",20);
  List dummyList = ["React","Vue","flutter","Java"]; //Add available tech here
  dummyList.forEach((el)
                    {
                      mentorMap[el]=new List<Participant>();
                    });
  print("Are you a mentor?(y/n)");    //just randomly setting two mentors
  
  p1.setMentorOrLearner(1);
  p1.setMentorOrLearner(1);
 
  String stack ="React,Vue,flutter";  // comma seperated input
  List stck = stack.split(",");
  stck.forEach((el)=>{
    mentorMap[el].add(p1)
  });
  String stack2 ="React,flutter";
  stck = stack.split(",");
  stck.forEach((el)=>{
    mentorMap[el].add(p2)
  });
  p2.getMentor(['flutter','React'],20,mentorMap);
}
