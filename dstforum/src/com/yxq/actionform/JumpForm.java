package com.yxq.actionform;

import org.apache.struts.action.ActionForm;

public class JumpForm extends ActionForm {
	private String boardId;
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {		
		this.boardId = boardId;
	}
}
