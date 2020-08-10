
public class PersonDao {
	private static PersonDao per; // per =null 객체를 만들지않고 class 이름으로 호출하기 위해서
	
	public static PersonDao getInstance() {
		if(per==null) {
			per = new PersonDao();
		}
		return per; 
	}
	
	private PersonDao() {
		System.out.println("객체생성");
	}
}
/*
singleton 패턴 객체만드는규칙
1.생성자는 private한다.
2.생성된 객체를 리턴하는 static 메서드를 만든다.(getInstance) //왜 static으로 만드나??? >> 객체를 만들지않고 class 이름으로 호출하기 위해서
3.현재클래스 타입의 변수를 만든다.

*/