package com.springapp.mvc.dao;


import com.springapp.mvc.model.Book;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory; // entity for creating session to make connection with our DB

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void createBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book); // for add book
        logger.info("Book successfully added. Book details: " + book);
    }

    @Override
    public void readBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        book.setBookIsRead((byte)1);
        session.update(book);
        logger.info("Book successfully read. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully updated. Book details: " + book);
    }

    @Override
    public void deleteBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id)); // for loading book from DB

        if (book != null) {
            session.delete(book);
        }
        logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id)); // for loading book from DB
        if (book != null) {
            logger.info("Book successfully loaded. Book details: " + book);
            return book;
        }
        logger.info("Book NOT loaded. ID is: " + id);
        return null;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list(); // query for loading all objects Book.class
        for(Book book: bookList) {
            logger.info("Book list: " + book);
        }
        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooksFiltered(String title, String author) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book");
        if(title.isEmpty() && !author.isEmpty()) {
            query = session.createQuery("from Book where bookAuthor = :paramAuthor");
            query.setParameter("paramAuthor", author);
        }
        if(!title.isEmpty() && author.isEmpty()) {
            query = session.createQuery("from Book where bookTitle = :paramTitle");
            query.setParameter("paramTitle", title);
        }
        if(!title.isEmpty() && !author.isEmpty()) {
            query = session.createQuery("from Book where bookTitle = :paramTitle and bookAuthor = :paramAuthor");
            query.setParameter("paramTitle", title);
            query.setParameter("paramAuthor", author);
        }
        List<Book> bookList = query.list();
        for(Book book: bookList) {
            logger.info("Book list: " + book);
        }
        return bookList;
    }
}
