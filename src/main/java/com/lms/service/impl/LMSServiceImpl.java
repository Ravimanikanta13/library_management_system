package com.lms.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lms.bean.Book;
import com.lms.repository.BookRepository;
import com.lms.service.LMSService;

@Service
public class LMSServiceImpl implements LMSService {

	@Autowired
	private BookRepository bookRepository;

	@Transactional
	@Override
	public int addBook(Book Book) {
		return bookRepository.save(Book).getId();
	}

	@Transactional
	@Override
	public boolean editBookDetails(Book Book) {
		return addBook(Book) > 0;
	}

	@Override
	public boolean deleteBook(int id) {
		try {
			bookRepository.deleteById(id);
		} catch (Exception ex) {
			return false;
		}
		return true;
	}

	@Override
	public Book getBook(int id) {
		return bookRepository.findById(id).get();
	}

	@Override
	public List<Book> getAllBooks() {
		return bookRepository.findAll();
	}

	@Override
	public List<Book> getRecords(String type) {
		return bookRepository.findByType(type);
	}

}
