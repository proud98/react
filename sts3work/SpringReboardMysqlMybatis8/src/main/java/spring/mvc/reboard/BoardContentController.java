package spring.mvc.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reanswer.data.model.ReanswerDao;
import reanswer.data.model.ReanswerDto;
import reboard.data.model.ReBoardDao;
import reboard.data.model.ReBoardDto;

@Controller
public class BoardContentController {
	
	@Autowired
	ReBoardDao dao;
	
	@Autowired
	ReanswerDao adao;
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam int num, @RequestParam int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		//readcount �޾ƿ���
		dao.updateReadCount(num);
		//dto �޾ƿ���
		ReBoardDto dto=dao.getData(num);
		
		model.addObject("dto", dto); //dto�ȿ��� num�� �ֿ�
		model.addObject("currentPage", currentPage);
		
		//num�� �ش��ϴ� ��� db���� �����ͼ� �����ֱ�
		List<ReanswerDto> alist=adao.getAnswerList(num);
		
		model.addObject("acount", alist.size()); //alist�� ���� ������ ���ϸ� ������ �� �� ���� �񱼾� ���� ���� ���� �� 
		model.addObject("alist", alist); //��۸��
		
		model.setViewName("content");
		
		return model;
	}
	
	

}
