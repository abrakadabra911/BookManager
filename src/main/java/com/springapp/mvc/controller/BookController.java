package com.springapp.mvc.controller;

import com.springapp.mvc.model.Book;
import com.springapp.mvc.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if(book.getId() == 0) {
            this.bookService.createBook(book);
        }
        else {
            this.bookService.updateBook(book);
        }
        return "redirect:/books";   // after updating we redirect our page to main page
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.deleteBook(id);
        return "redirect:/books";   // after updating we redirect our page to main page
    }

    @RequestMapping(value = "/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks());
        return "books";
    }

    @RequestMapping(value = "/read/{id}")
    public String readBook(@PathVariable("id") int id) {
        this.bookService.readBook(id);
        return "redirect:/books";   // after updating we redirect our page to main page
    }

    @RequestMapping(value = "/bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));
        return "bookdata";
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks (Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks());
        return "books";
    }

    @RequestMapping(value = "/books/filtering", method = RequestMethod.POST)
    public String listBooksFiltered (@RequestParam("title") String title,
                                     @RequestParam("author") String author,  Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooksFiltered(title, author));
        return "books";
    }
}
