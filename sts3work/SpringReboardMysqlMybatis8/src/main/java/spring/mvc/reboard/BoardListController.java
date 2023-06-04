package spring.mvc.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import reanswer.data.model.ReanswerDao;
import reboard.data.model.ReBoardDao;
import reboard.data.model.ReBoardDto;

@Controller
public class BoardListController {
	
	@Autowired
	ReBoardDao dao;
	
	@Autowired
	ReanswerDao adao;
	
	@GetMapping("/")
	public String start() {
		return "redirect:board/list";
	}
	
	//ajax �⤩�� ���ؼ� �ܼ� ������
	@GetMapping("/rest/list")
	public String strat2() {
		return "list";
	}
	
	
	//����¡ó��, ��� ����Ʈ
	@GetMapping("/board/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		//�� ����
		int totalCount=dao.getTotalCount();
		
		int totalPage; 
		int startPage; 
		int endPage; 
		int start; 
		int perPage=10; 
		int perBlock=5; 
		     
		//�� ������ ����
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//�� ���� ���� ������ 
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		    
		if(endPage>totalPage)
		   endPage=totalPage;
	    
	    //�� ���������� �ҷ� �� ���۹�ȣ
	    start=(currentPage-1)*perPage; 
	    
	    List<ReBoardDto> list=dao.getliList(start, perPage);
	    
	    int no=totalCount-(currentPage-1)*perPage;
	    
	    //����Ʈ�� ��۰��� ��Ÿ����
	    for(ReBoardDto d:list) {
	    	
	    	d.setAcount(adao.getAnswerList(d.getNum()).size());
	    	
	    }
	    
	    
	    //��¿� �ʿ��� ������ model�� ����
	    model.addObject("totalCount", totalCount);
	    model.addObject("list", list); //����� ���� �� �� ����
	    model.addObject("totalPage", totalPage);
	    model.addObject("startPage", startPage);
	    model.addObject("endPage", endPage);
	    model.addObject("perBlock", perBlock);
	    model.addObject("currentPage", currentPage);
	    model.addObject("no", no);
		
		model.setViewName("boardlist");
		
		return model;
	}
	

}
