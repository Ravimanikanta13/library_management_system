package com.lms.service;

import java.util.List;

import com.lms.bean.Book;

public interface LMSService {
	int addBook(Book book);

	boolean editBookDetails(Book book);

	boolean deleteBook(int id);

	Book getBook(int id);

	List<Book> getAllBooks();

	List<Book> getRecords(String type);
}
