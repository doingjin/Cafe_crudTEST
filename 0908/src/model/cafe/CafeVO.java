package model.cafe;

public class CafeVO {
	private String coff;
	private int price;
	
	public String getCoff() {
		return coff;
	}
	public void setCoff(String coff) {
		this.coff = coff;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "CafeVO [coff=" + coff + ", price=" + price + "]";
	}
	
}
