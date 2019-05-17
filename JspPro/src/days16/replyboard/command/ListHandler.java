package days16.replyboard.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.replyboard.model.ReplyBoardDTO;
import days16.replyboard.service.ListService;




public class ListHandler implements CommandHandler {

	private ListService listService = new ListService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {

		// ListHandler가 해야 할일 
		
		///DB에서 해당 페이지 및 그에 해당하는 게시물들 select해서 뿌리는 작업
		
		
		List<ReplyBoardDTO> list = listService.select();
		req.setAttribute("list", list);

		return "/days16/list";
	}

}
