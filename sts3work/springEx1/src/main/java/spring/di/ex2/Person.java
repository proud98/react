package spring.di.ex2;

public class Person {
	
	String schoolName; //setter�� ���� �ް�
	MyInfo info; //myinfoŬ������ ����� ������... �����ڷ� ���� �ް�
	
	public Person(MyInfo info) {
		super(); //super�� ������ �������� 
		this.info=info;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	//���
	public void write() {
		
		System.out.println("** �л����� ��� **");
		System.out.println("�б���: "+schoolName);
		System.out.println("�̸�: "+info.name);
		System.out.println("����: "+info.age);
		System.out.println("�ּ�: "+info.addr);
	}
	
	

}
