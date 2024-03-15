class ShopService {
	
	//외부에서 값 변경하지못하게 private, 단 하나만 만들수 있게 static
	private static ShopService instance = new ShopService();

	private ShopService() {}
	//인스턴스 외부에서 생성할 수 없게 생성자를 private으로.
	
	public static ShopService getInstance() {
		return instance;
	} 
	
	
}

class ShopServiceExample {
    public static void main(String[] args){
          ShopService obj1 = ShopService.getInstance();
          ShopService obj2 = ShopService.getInstance();

          if(obj1 == obj2) {
              System.out.println("같은 객체이다.");
          }
          else{
              System.out.println("다른 객체이다.");
          }
    }
}