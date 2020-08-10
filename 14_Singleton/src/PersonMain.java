//한개의 객체를 만들면 안만들어도 되게..? 
public class PersonMain {
 public static void main(String[] args) {
//	PersonDao p1 = new PersonDao();
//	PersonDao p2 = new PersonDao();
	 
	PersonDao p1 = PersonDao.getInstance();//클래스 이름으로 호출!
	PersonDao p2 = PersonDao.getInstance();
	
	
	
	System.out.println("p1:"+p1);
	System.out.println("p2:"+p2);
}
}
