package com.springapp.mvc.service;


import com.springapp.mvc.dao.BookDao;
import com.springapp.mvc.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void createBook(Book book) {
        this.bookDao.createBook(book);
    }

    @Override
    @Transactional
    public void readBook(int id) {
        this.bookDao.readBook(id);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void deleteBook(int id) {
        this.bookDao.deleteBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
       return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }

    @Override
    @Transactional
    public List<Book> listBooksFiltered(String title, String author) {
        return this.bookDao.listBooksFiltered(title, author);
    }
}
