
public class PersonMain {
	public static void main(String[] args) {

		Person per = new Person();
		//per.name = "�¿�";
		per.setName("�¿�");
		per.setAge(20);
		per.setAddr("����");
		
		System.out.println(per.getName());
		System.out.println(per.getAge());
		System.out.println(per.getAddr());
	}

}
