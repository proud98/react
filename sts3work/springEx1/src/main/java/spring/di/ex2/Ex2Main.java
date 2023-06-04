package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//xml���
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
		
		//myinfo ����
		MyInfo my=(MyInfo)context.getBean("my");
		
		//��  Ȯ��
		System.out.println(my.toString());
		System.out.println(my); //my�θ� �����͵� ��
		
		//person����
		Person p=(Person)context.getBean("person");
		p.write();

	}

}
