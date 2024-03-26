package mybean.model;

//공장은 하나만 있으면 됨. 그러니까 싱글톤 객체로 만들어야함.
public class FactoryCommand {
	
	private FactoryCommand() {}
	
	//객체 딱 하나만 생성
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance() {
		return instance;
	}
	//여기까지가 싱글톤 생성 코드
	
	

	//원래는 return값이 각기다른 객체여서 리턴값이 다 다른데, ICommand가 부모니까 ICommand로 리턴값지정가능.
	public ICommand createInstance(String cmd) {
		if(cmd.equals("confirm")) {
			return new ConfirmCommand();
			
		}
		else if(cmd.equals("complete")) {
			return new CompleteCommand();
		}
		
		else {
			return new RegisterCommand();
		}
		
	}


}
