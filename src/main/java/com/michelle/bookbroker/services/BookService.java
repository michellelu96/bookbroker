package com.michelle.bookbroker.services;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.michelle.bookbroker.models.Book;
import com.michelle.bookbroker.models.User;
import com.michelle.bookbroker.repositories.BookRepository;



@Service
public class BookService {

		@Autowired
		private BookRepository bookRepo;
		
		
		// get all
		public List<Book> allBooks(){
			return bookRepo.findAll();
		}
		
		public List<Book> allNonBorrowed(){
			return bookRepo.findAllByBorrowId(null);
		}
		
		//get all borrowed books
		public List<Book> allBorrowedBooksById(Long id){
			return bookRepo.findAllByBorrowId(id);
		}
		
		//save borrowed book
		public Book saveBook(Book book, BindingResult result, HttpSession session) {
			User user = new User();
			user.setId((Long) session.getAttribute("user_id"));
			book.setReader(user);
			if(result.hasErrors()) return null;
			else return bookRepo.save(book);
		}
		
		//find one
		public Book getOneBook(Long id) {
			Optional<Book> optionalBook = bookRepo.findById(id);
			if(optionalBook.isPresent()) {
				return optionalBook.get();
			}else {
				return null;
			}
		}
		
		//check if user is authorized 
		public boolean authorizedUser(HttpSession session, Book book) {
			if((Long) session.getAttribute("user_id") == book.getReader().getId()) return true;
			else return false;
		}
		
		//add to borrowed books
		public Book borrowBook(Long id, HttpSession session) {
			User borrower= new User();
			borrower.setId((Long) session.getAttribute("user_id"));
			Book book = getOneBook(id);
			if(book != null) {
				book.setBorrow(borrower);
				return bookRepo.save(book);
			}else return null;
		}
		
		//return borrowed book
		public Book returnBook(Long id) {
			Book book = getOneBook(id);
			if(book != null) {
				book.setBorrow(null);
				return bookRepo.save(book);
			}else return null;
		}
		
		//create a book
		public Book createBook(Book book) {
			return bookRepo.save(book);
		}
		
		//update a book
		public Book updateBook(Book book) {
			return bookRepo.save(book);
		}
		
		//delete book by id
		public void deleteBook(Long id) {
			bookRepo.deleteById(id);
		}
		
		
}
