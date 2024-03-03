/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.hompage;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.lang.reflect.Type;
import model.Book;
import model.Item;

/**
 *
 * @author d
 */
public class ItemDeserialize implements JsonSerializer<Item[]>, JsonDeserializer<Item[]> {

    @Override
    public JsonElement serialize(Item[] items, Type type, JsonSerializationContext context) {
        JsonArray jsonArray = new JsonArray();
        for (Item item : items) {
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("book", context.serialize(item.getBook()));
            jsonObject.addProperty("quantity", item.getQuantity());
            jsonObject.addProperty("price", item.getPrice());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @Override
    public Item[] deserialize(JsonElement json, Type type, JsonDeserializationContext jdc) throws JsonParseException {
        JsonArray jsonArray = json.getAsJsonArray();
        Item[] items = new Item[jsonArray.size()];
        for (int i = 0; i < jsonArray.size(); i++) {
            JsonElement jsonItem = jsonArray.get(i);
            JsonElement jsonBook = jsonItem.getAsJsonObject().get("book");
            Gson gson = new Gson();
            Book book = gson.fromJson(jsonBook, Book.class);
            int quantity = jsonItem.getAsJsonObject().get("quantity").getAsInt();
            double price = jsonItem.getAsJsonObject().get("price").getAsDouble();
            Item item = new Item();
            item.setBook(book);
            item.setQuantity(quantity);
            item.setPrice(price);
            items[i] = item;
        }
        return items;
    }

}
