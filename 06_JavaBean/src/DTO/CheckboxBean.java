package DTO;

public class CheckboxBean {
	private String name;
	private String[] fruit;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setFruit(String[] fruit) {
		for(int i=0;i<fruit.length;i++){
			System.out.println(fruit[i]+" ");
		}
		this.fruit = fruit;
	}
	public String[] getFruit() {
		return fruit;
	}
	
	
	
}
