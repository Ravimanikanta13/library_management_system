package com.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lms.bean.Book;
import com.lms.service.LMSService;

@Controller
public class AddBookController {

	@Autowired
	LMSService lmsService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView display() {
		return new ModelAndView("AddBook");
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.GET)
	public ModelAndView save(@ModelAttribute Book book, HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = lmsService.addBook(book);
		if (userId > 0) {
			session.setAttribute("status", "New Book Added in library is SuccesFull");
		} else {
			session.setAttribute("status", "New Book is not added in the library");
		}

		return new ModelAndView("Save");
	}

}
