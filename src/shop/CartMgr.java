
package shop;

import java.util.Hashtable;

//��ٱ��� ��Ȱ�� ���
public class CartMgr {

	//key : ��ǰ��ȣ(productNo) , value : �ֹ���ü
	private Hashtable<Integer, OrderBean> hCart = 
			new Hashtable<Integer, OrderBean>();
	
	//Cart Add
	public void addCart(OrderBean order) {
		int productNo = order.getProductNo();
		int quantity /*�ֹ�����*/= order.getQuantity();
		if(quantity>0) {
			if(hCart.containsKey(productNo)) {//cart�� �ֹ��� ��ǰ�� �ִ� ���
				//������ �� �ִ� �ֹ���ü
				OrderBean temp = hCart.get(productNo);
				quantity+=temp.getQuantity();//���ο� �ֹ�+������ �ֹ� ��ħ.
				order.setQuantity(quantity);//order ��ü�� ������ �ֹ����� setter
				hCart.put(productNo, order);//īƮ�� �ٽ� �����ϸ� ������ �ֹ���ü�� �����
			}else{//cart�� �ֹ��� ��ǰ�� ���� ���
				hCart.put(productNo, order);
			}
		}
	}
	
	//Cart Update
	public void updateCart(OrderBean order) {
		int productNo = order.getProductNo();
		//hCart�� ������ Ű������ �����Ѵٸ� �����
		hCart.put(productNo/*����ڽ�*/, order);
	}
	
	//Cart Delete
	public void deleteCart(OrderBean order) {
		int productNo = order.getProductNo();
		hCart.remove(productNo);//����ڽ�
	}
	
	//Cart List
	public Hashtable<Integer, OrderBean> getCartList(){		
		return hCart;
	}
	
}