package com.lms.controller;

import java.util.List;

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
public class DeleteBookController {

	@Autowired
	LMSService lmsService;

	@RequestMapping(value = "/deleteBookOptions", method = RequestMethod.GET)
	public ModelAndView deleteOptions(HttpServletRequest request) {

		HttpSession session = request.getSession();
		List<Book> books = lmsService.getAllBooks();
		session.setAttribute("books", books);
		return new ModelAndView("DeleteBookOptions");
	}

	@RequestMapping(value = "/deleteBook", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute Book book, HttpServletRequest request) {

		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isBookDeleted = lmsService.deleteBook(id);
		if (isBookDeleted) {
			session.setAttribute("status", "Record is Deleted SuccesFull");
		} else {
			session.setAttribute("status", "Record is not Deleted");
		}

		return new ModelAndView("Save");
	}

}
