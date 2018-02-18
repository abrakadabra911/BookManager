package com.springapp.mvc.model;

import javax.persistence.*;

@Entity
@Table(name = "books")
public class Book {

    @Id
    @Column(name = "book_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "book_title")
    private String bookTitle;

    @Column(name = "book_description")
    private String bookDescription;

    @Column(name = "book_author")
    private String bookAuthor;

    @Column(name = "book_isbn")
    private String bookISBN;

    @Column(name = "book_printYear")
    private int bookPrintYear;

    @Column(name = "book_readAlready")
    private byte bookIsRead;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookDescription() {
        return bookDescription;
    }

    public void setBookDescription(String bookDescription) {
        this.bookDescription = bookDescription;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookISBN() {
        return bookISBN;
    }

    public void setBookISBN(String bookISBN) {
        this.bookISBN = bookISBN;
    }

    public int getBookPrintYear() {
        return bookPrintYear;
    }

    public void setBookPrintYear(int bookPrintYear) {
        this.bookPrintYear = bookPrintYear;
    }

    public byte getBookIsRead() {
        return bookIsRead;
    }

    public void setBookIsRead(byte bookIsRead) {
        this.bookIsRead = bookIsRead;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookTitle='" + bookTitle + '\'' +
                ", bookDescription='" + bookDescription + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookISBN='" + bookISBN + '\'' +
                ", bookPrintYear=" + bookPrintYear +
                ", bookIsRead=" + bookIsRead +
                '}';
    }
}
