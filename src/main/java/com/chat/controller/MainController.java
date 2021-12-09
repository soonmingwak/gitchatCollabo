package com.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/")
	public String main() {
		return "main/main";
	}
	@RequestMapping(value = "/calender")
	public String calender() {
		return "main/calender";
	}
	@RequestMapping(value = "/notice")
	public String notice() {
		return "main/notice";
	}
	@RequestMapping(value = "/att")
	public String att() {
		return "main/att";
	}
	@RequestMapping(value = "/todo")
	public String todo() {
		return "main/todo";
	}
	@RequestMapping(value = "/orgchart")
	public String orgchart() {
		return "main/orgchart";
	}
	@RequestMapping(value = "/chat")
	public String chat() {
		return "main/chat";
	}
}
