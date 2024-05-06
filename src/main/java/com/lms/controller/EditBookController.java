package com.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lms.bean.Book;
import com.lms.service.LMSService;

@Controller
public class EditBookController {

	@Autowired
	LMSService lmsService;

	@RequestMapping(value = "/showEditBookOptions", method = RequestMethod.GET)
	public ModelAndView getEditBookOptions(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		List<Book> books = lmsService.getAllBooks();
		session.setAttribute("books", books);

		return new ModelAndView("GetEditBookOptions");
	}
	@RequestMapping(value="/showEditBook", method= RequestMethod.POST)
	public ModelAndView showEditBook(HttpServletRequest request, @RequestParam int id) {
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		Book book  = lmsService.getBook(id);
		session.setAttribute("book", book);
		return new ModelAndView("EditBook");
		
	}
	@RequestMapping(value="/editBook", method= RequestMethod.POST)
	public ModelAndView editBook(HttpServletRequest request, @ModelAttribute Book book) {
		
		HttpSession session = request.getSession();
		Book bookDB = (Book) session.getAttribute("book");
		book.setId(bookDB.getId());
		
		boolean isEditBook = lmsService.editBookDetails(book);
		
		if(isEditBook) {
			session.setAttribute("status", "Book Details Edited SuccesFully");
		}else {
			session.setAttribute("status", "Book Details Edited failed");
		}
		
		return new ModelAndView("Save");
		
	}

}
