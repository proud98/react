package spring.anno.ex6;

import org.springframework.stereotype.Component;

@Component("pmanggo") //pmanggo��� bean�� ����
public class PhilipinManggo implements Manggo { //�����������̽��� ���� �� Ŭ���� 

	@Override
	public void writeManggoName() {
		// TODO Auto-generated method stub
		
		System.out.println("�ʸ��� ����");
	}

}
