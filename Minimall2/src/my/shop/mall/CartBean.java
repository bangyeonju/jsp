package my.shop.mall;

import java.util.ArrayList;
import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {

	private Vector<ProductBean> clist;

	public CartBean() {
		System.out.println("CartBean()");
		clist = new Vector<ProductBean>(); // 장바구니
	}

	public void addProduct(int pnum,int oqty){ 
		ProductDao pdao = ProductDao.getInstance();
		ArrayList<ProductBean> alist = pdao.getOneSelectByPnum(pnum);

		for(int i=0;i<clist.size();i++) {//해당 상품이 장바구니에 이미 담겨있을 때
			int cpnum = clist.get(i).getPnum();
			if(pnum == cpnum) { // 
				int cqty = clist.get(i).getPqty(); 
				clist.get(i).setPqty(cqty + oqty);
				clist.get(i).setTotalPrice(clist.get(i).getPrice() *(cqty + oqty) );
				clist.get(i).setTotalPoint(clist.get(i).getPoint() *(cqty + oqty) );
				return;
			}
		}

		// 새 상품일 때
		alist.get(0).setPqty(oqty);
		int totalPrice =  alist.get(0).getPrice() * oqty;
		int totalPoint =  alist.get(0).getPoint() * oqty;
		alist.get(0).setTotalPrice(totalPrice);
		alist.get(0).setTotalPoint(totalPoint);

		clist.add(alist.get(0));

		for(int i=0;i<clist.size();i++) {
			System.out.println(clist.get(i).getPnum()+"," + 
					clist.get(i).getPname() +"," + 
					clist.get(i).getPqty() +"," +
					clist.get(i).getTotalPrice() );
		}//for
		System.out.println("------------");
	}//

	public Vector<ProductBean> getAllProducts(){
		return clist;
	}//

	public void setEdit(int pnum,int oqty){// 3번 상품, 주문수량 2개로 수정

		for( ProductBean pb : clist) {
			if(pb.getPnum() == pnum) {

				if(oqty == 0) {
					clist.removeElement(pb);
					break;
				}
				else {
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
	
	public void removeProduct(int pnum){
		
		for( ProductBean pb : clist) {
			if(pb.getPnum() == pnum) {
				clist.removeElement(pb);
				break;
			}
		}
	}//removeProduct
	
	public void removeAllProduct() {
		clist.removeAllElements();
	}
	
}
 










