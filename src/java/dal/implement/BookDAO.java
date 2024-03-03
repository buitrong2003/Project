/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import constant.CommonConst;
import dal.GenericDAO;
import java.util.Collections;
import java.util.Date;
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
        String sql = "select top 10 * from Book \n"
                + "order by book_hot desc";
        parameterMap = new LinkedHashMap<>();
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> getListNewBook() {
        String sql = "SELECT TOP 12 * FROM [Book]\n"
                + "order by publication_date desc";
        parameterMap = new LinkedHashMap<>();
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public static void main(String[] args) {
        for (Book book : new BookDAO().findAll()) {
            System.out.println(book);
        }
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
    public int insert(Book book) {
        String sql = "INSERT INTO [dbo].[Book]\n"
                + "           ([name]\n"
                + "           ,[author]\n"
                + "           ,[publisher]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[genre]\n"
                + "           ,[quantity]\n"
                + "           ,[publication_date]\n"
                + "           ,[image]\n"
                + "           ,[category_id]\n"
                + "           ,[book_hot]\n"
                + "           ,[status]\n"
                + "           ,[delete_date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?) ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", book.getName());
        parameterMap.put("author", book.getAuthor());
        parameterMap.put("pulisher", book.getPublisher());
        parameterMap.put("price", book.getPrice());
        parameterMap.put("description", book.getDescription());
        parameterMap.put("genre", book.getGenre());
        parameterMap.put("quantity", book.getQuantity());
        parameterMap.put("publication_date", book.getPublication_date());
        parameterMap.put("image", book.getImage());
        parameterMap.put("category_id", book.getCategory_id());
        parameterMap.put("book_hot", book.getBook_hot());
        parameterMap.put("status", book.getStatus());
        parameterMap.put("deleteDate", new java.sql.Date(new Date().getTime()));
        return insertGenericDAO(sql, parameterMap);
    }

    // sửa
    public List<Book> findByCategory(String idCategory, int page) {
        String sql = "select * from Book\n"
                + "where category_id = ?\n"
                + "order by book_id offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idCategory", idCategory);
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByName(String keyword, int page) {
        String sql = "select * from Book\n"
                + "where [name] like ?\n"
                + "order by book_id offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("keyword", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByAuthor(String keyword, int page) {
        String sql = "select * from Book\n"
                + "where [author] like ?\n"
                + "order by book_id offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("keyword", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecordByCategory(String idCategory) {
        String sql = "select count(*) from Book where category_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idCategory", idCategory);
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "select count(*) from Book where [name] like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idCategory", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecordByAuthor(String keyword) {
        String sql = "select count(*) from Book where [name] like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idCategory", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByPage(int page) {
        String sql = "select * from Book\n"
                + "order by book_id offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecord() {
        return findTotalRecordGenericDAO(Book.class);
    }

}
