package DTO;

public class inputBean {
	private String name; 
	private int[] jumsu;
	private String[] group; 
	private String song;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int[] getJumsu() {
		return jumsu;
	}
	public void setJumsu(int[] jumsu) {
		this.jumsu = jumsu;
	}
	public String[] getGroup() {
		return group;
	}
	public void setGroup(String[] group) {
		this.group = group;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
	}  
	
}
