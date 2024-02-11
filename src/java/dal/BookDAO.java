/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import model.Book;

/**
 *
 * @author d
 */
public class BookDAO extends GenericDAO<Book> {

    @Override
    public List<Book> findAll() {
        return queryGenericDAO(Book.class);
    }

    public List<Book> getListBookHot() {
        String sql = "select b.book_id,b.name,b.author,b.publisher,b.price,"
                + "b.description,b.genre,b.quantity,b.publication_date\n"
                + ",b.image,b.book_hot,c.category_id,c.name as category_name\n"
                + "from Book b join Category c on b.category_id = c.category_id\n"
                + "where b.book_hot >= ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("quantitySeller", 300);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> getListNewBook() {
        String sql = "SELECT TOP (20) b.book_id,b.name,b.author,b.publisher,b.price,"
                + "b.description,b.genre,b.quantity,b.publication_date\n"
                + ",b.image,b.book_hot,c.category_id,c.name as category_name\n"
                + " FROM Book b join Category c on b.category_id = c.category_id\n"
                + " WHERE [publication_date] >= DATEADD(DAY, - 40, GETDATE())\n"
                + " ORDER BY [publication_date] DESC;";
        parameterMap = new LinkedHashMap<>();
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public static void main(String[] args) {
        for (Book book : new BookDAO().getListBookPagination(2, 10, new BookDAO().getListBookByAuthor("", "a"))) {
            System.out.println(book);
        }
    }

    public List<Book> getListBookByName(String category, String name) {
        String sql = "select b.book_id,b.name,b.author,b.publisher,b.price,"
                + "b.description,b.genre,b.quantity,b.publication_date\n"
                + ",b.image,b.book_hot,c.category_id,c.name as category_name\n"
                + "from Book b join Category c on b.category_id = c.category_id\n"
                + "where c.name like ? and b.name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category", "%" + category + "%");
        parameterMap.put("name", "%" + name + "%");
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> getListBookByAuthor(String category, String author) {
        String sql = "select b.book_id,b.name,b.author,b.publisher,b.price,b.description,b.genre,b.quantity,b.publication_date\n"
                + ",b.image,b.book_hot,c.category_id,c.name as category_name\n"
                + "from Book b join Category c on b.category_id = c.category_id\n"
                + "where c.name like ? and b.author like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category", "%" + category + "%");
        parameterMap.put("name", "%" + author + "%");
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> getListBookPagination(int page, int limit, List<Book> listBook) {
        int start = (page - 1) * limit + 1;
        int end = page * limit;
        List<Book> listBookPagination = new ArrayList<>();
        for (int i = start - 1; i < end; i++) {
            try {
                if (listBook.get(i) != null) {
                    listBookPagination.add(listBook.get(i));
                }
            } catch (Exception e) {
            }
        }
        return listBookPagination;
    }

    public void sortBookByPrice(List<Book> listBook, String sortBook) {
        Collections.sort(listBook, (Book firstBook, Book secondBook) -> {
            if (sortBook.equalsIgnoreCase("ascending")) {
                return Double.compare(firstBook.getPrice(), secondBook.getPrice());
            } else if (sortBook.equalsIgnoreCase("decrease")) {
                return Double.compare(secondBook.getPrice(), firstBook.getPrice());
            } else {
                return 0;
            }
        });
    }

    public List<Book> listBookByCategory(String keyword) {
        String sql = "select b.book_id,b.name,b.author,b.publisher,b.price,"
                + "b.description,b.genre,b.quantity,b.publication_date\n"
                + ",b.image,b.book_hot,c.category_id,c.name as category_name\n"
                + "from Book b join Category c on b.category_id = c.category_id\n"
                + "where c.name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("keyword", "%" + keyword + "%");
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    @Override
    public int insert(Book t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
