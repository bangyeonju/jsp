
public class PersonMain {
	public static void main(String[] args) {

		Person per = new Person();
		//per.name = "태연";
		per.setName("태연");
		per.setAge(20);
		per.setAddr("서울");
		
		System.out.println(per.getName());
		System.out.println(per.getAge());
		System.out.println(per.getAddr());
	}

}
