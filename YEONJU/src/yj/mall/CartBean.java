package yj.mall;

import java.util.ArrayList;
import java.util.Vector;

import yj.food.FoodBean;
import yj.food.FoodDao;

public class CartBean { 
	private Vector<FoodBean> clist;
	
	public CartBean() {
		
		clist = new Vector<FoodBean>();
		
	}
	
	
	public void addFood(int pnum,int oqty) {
		FoodDao fdao = FoodDao.getInstance();
		ArrayList<FoodBean> alist = fdao.getOneSelectByPnum(pnum);
		for(int i=0;i<clist.size();i++) {
			int cpnum = clist.get(i).getPnum();
			if(pnum == cpnum){
				int cqty = clist.get(i).getPqty();
				clist.get(i).setPqty(oqty+cqty);
				clist.get(i).setTotalprice(clist.get(i).getPrice()*(cqty+oqty));
				clist.get(i).setTotalpoint(clist.get(i).getPoint()*(cqty+oqty));
				return;
			}
		}
		alist.get(0).setPqty(oqty);
		int totalPrice = alist.get(0).getPrice() * oqty;
		int totalPoint = alist.get(0).getPoint() * oqty;
		alist.get(0).setTotalprice(totalPrice);
		alist.get(0).setTotalpoint(totalPoint);
		
		clist.add(alist.get(0));
		
		for(int i=0;i<clist.size();i++) {
			System.out.println(clist.get(i).getPnum()+","+
							clist.get(i).getPname() +"," +
							clist.get(i).getPqty() +","+
							clist.get(i).getTotalprice());
		}//for
		
		System.out.println("-------------------");
		
		
	}
	
	public Vector<FoodBean>getAllFood(){
		return clist;
	}
	
	public void deleteFood(int pnum) {
		for(FoodBean fb : clist) {
			if(fb.getPnum() == pnum) {
				clist.removeElement(fb);
				break;
			}
		}
		
	}
	
	public void setEdit(int pnum,int oqty) {
		for(FoodBean fb : clist ) {
			if(fb.getPnum() == pnum) {
				if(oqty == 0) {
					clist.removeElement(fb);
					break;
				}
				else {
					fb.setPqty(oqty);
					int price = fb.getPrice() * oqty;
					int point = fb.getPoint() * oqty;
					
					fb.setTotalpoint(point);
					fb.setTotalprice(price);
					break;
				}
				
			}
		}
		
	
		}
		
	
	
}







