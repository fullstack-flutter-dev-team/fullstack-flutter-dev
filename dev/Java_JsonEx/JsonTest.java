import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class JsonTest {
    
    public static void main(String[] args) {
        Gson gson = new Gson();
 
        // Json key, value 추가
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("name", "anna");
        jsonObject.addProperty("id", 1);
 
        // JsonObject를 Json 문자열로 변환
        String jsonStr = gson.toJson(jsonObject);
 
        // 생성된 Json 문자열 출력
        System.out.println(jsonStr); // {"name":"anna","id":1}
    }
}
