package com.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lms.bean.Book;
import com.lms.service.LMSService;

@Controller
public class GetBooksController {

	@Autowired
	LMSService lmsService;

	@RequestMapping(value = "/getOptions", method = RequestMethod.GET)
	public ModelAndView display() {

		return new ModelAndView("GetBook");
	}

	@RequestMapping(value = "/getRecords", method = RequestMethod.POST)
	public ModelAndView libraryReport(HttpServletRequest request, @RequestParam String type) {

		HttpSession session = request.getSession();
		List<Book> books = lmsService.getRecords(type);
		session.setAttribute("books", books);

		return new ModelAndView("GetRecords");

	}

}
