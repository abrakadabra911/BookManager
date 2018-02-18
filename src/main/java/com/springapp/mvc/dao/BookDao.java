package com.springapp.mvc.dao;

import com.springapp.mvc.model.Book;

import java.util.List;

public interface BookDao {

    public void createBook(Book book);

    public void readBook(int id);

    public void updateBook(Book book);

    public void deleteBook(int id);

    public Book getBookById(int id);

    public List<Book> listBooks();

    public List<Book> listBooksFiltered(String title, String author);
}
