package domain

import java.time.LocalDateTime
import java.lang.reflect.Type
import com.google.gson.JsonSerializer
import com.google.gson.JsonSerializationContext
import com.google.gson.JsonPrimitive
import java.time.format.DateTimeFormatter
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonParseException

class LocalDateTimeGsonConverter implements JsonSerializer<LocalDateTime>,JsonDeserializer<LocalDateTime>{
	
	static DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")
	
	override serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
		return new JsonPrimitive(src.format(dateTimeFormatter))
	}
	
	override deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
		return LocalDateTime.parse(json.getAsString(),dateTimeFormatter);
	}
	
}