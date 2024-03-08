/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.hompage;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import java.lang.reflect.Type;
import model.Book;
import java.sql.Date;

/**
 *
 * @author d
 */
public class BookDeserializer implements JsonDeserializer<Book> {

    @Override
    public Book deserialize(JsonElement json, Type type, JsonDeserializationContext jdc) throws JsonParseException {
        JsonObject jsonBook = json.getAsJsonObject();
        int id = Integer.parseInt(jsonBook.get("book_id").getAsString());
        String name = jsonBook.get("name").getAsString();
        String author = jsonBook.get("author").getAsString();
        String publisher = jsonBook.get("publisher").getAsString();
        double price = Double.parseDouble(jsonBook.get("price").getAsString());
        String description = jsonBook.get("description").getAsString();
        String genre = jsonBook.get("genre").getAsString();
        int quantity = Integer.parseInt(jsonBook.get("quantity").getAsString());
        Date publicationDate = Date.valueOf(jsonBook.get("publication_date").getAsString());
        String image = jsonBook.get("image").getAsString();
        int categoryId = Integer.parseInt(jsonBook.get("category_id").getAsString());
        int bookHot = Integer.parseInt(jsonBook.get("book_hot").getAsString());
        Book book = new Book(id, name, author, publisher, price,
                description, genre, quantity,
                publicationDate, image, categoryId,
                bookHot);
        return book;
    }

}
