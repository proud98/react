package spring.anno.ex6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component //tiwanManggo�� ���
public class ManggoController {
	
	@Autowired 
	//�������̽� ���� ������ Ŭ������ �ʸ��ɸ��� �� �� �϶��� �ڵ������� �Ǵµ� �±�������� �ΰ��� ������ (�ڵ����� ���� �߻� > ��Ȯ�� �̸��� �����ָ� ��)
	//��Ȯ�� bean�� �̸����� �����Ϸ��� @Resource(name="��Ȯ���̸�") >  @Resource(name="tiwanManggo") �̷������� �ϸ� �� �ٵ� tiwanManggo���� ���� .. 
	Manggo manggo;
	
	public void writeManggo() {
		
		System.out.println("���� �����ϴ� ������~~");
		manggo.writeManggoName();
	}

}
