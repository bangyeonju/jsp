package my.shop.mall;

import java.util.ArrayList;
import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {
	

	private Vector<ProductBean> clist; // cartbean 클래스 안에 clist가 관리하는 장바구니가 있다 .

	public CartBean() {

		clist = new Vector<ProductBean>();// 비어있는 장바구니를 만든당
	}

	public void addProduct(int pnum, int oqty) {
		
		ProductDao pdao = ProductDao.getInstance();
		ArrayList<ProductBean> alist =pdao.productSelect(pnum);
		
		
		for(int i=0;i<clist.size();i++) { //장바구니를 돌면서 해당 상품ㅇ ㅣ장바구니에 이미 담겨있을때
			
			int cpnum = clist.get(i).getPnum();
			
			if(cpnum==pnum) {//장바구니에 해당 상품이 담겨 있는경우이다.
				
				int cqty = clist.get(i).getPqty();//장바구니에 담아둔 수량
				clist.get(i).setPqty(cqty+oqty);//수량 바꿈
				clist.get(i).setTotalPrice(clist.get(i).getPrice()*(cqty+oqty));//가격계산
				clist.get(i).setTotalPoint(clist.get(i).getPoint()*(cqty+oqty));//포인트계산
				for(int j =0;j<clist.size();j++) {
					System.out.println(clist.get(j).getPnum()+","+
								clist.get(j).getPname()+","+
								clist.get(j).getPqty()+","+
								clist.get(j).getTotalPrice());
				}
				System.out.println("-------");
				
				return;
			}
		}
		//새상품일때
		alist.get(0).setPqty(oqty);
		int totalPrice = alist.get(0).getPrice()*oqty;
		int totalPoint = alist.get(0).getPoint()*oqty;
		alist.get(0).setTotalPrice(totalPrice);
		alist.get(0).setTotalPoint(totalPoint);
		clist.add(alist.get(0));
		
		for(int i =0;i<clist.size();i++) {
			System.out.println(clist.get(i).getPnum()+","+
						clist.get(i).getPname()+","+
						clist.get(i).getPqty()+","+
						clist.get(i).getTotalPrice());
			
		}
		System.out.println("-------");
	}
	
	public Vector<ProductBean> getAllProducts(){
		return  clist;
	}
	
	public void setEdit(int pnum,int oqty){// 3번 상품, 주문수량 2개로 수정
		
		for( ProductBean pb : clist) {
			if(pb.getPnum() == pnum) {
				
				if(oqty == 0) {
					clist.removeElement(pb);
					break;
				}else {
					
				
				pb.setPqty(oqty);
				int price = pb.getPrice() * oqty;
				int point = pb.getPoint() * oqty;
				
				pb.setTotalPrice(price);
				pb.setTotalPoint(point);
				
				break;
				}
			}
		}
		
	}//setEdit
	
	public void removeProduct(int pnum) {
		for(ProductBean pb : clist) {
			if(pb.getPnum()==pnum) {
				clist.removeElement(pb);
				break;
			}
		}
		
	}
}
