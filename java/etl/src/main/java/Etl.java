import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Etl {
   public Map<String, Integer> transform(Map<Integer, List<String>> old) {
       Map<String, Integer> answer = new HashMap<String, Integer>();

       old.forEach((Integer key, List<String> value) -> {
		       for(String s : value) {
			   answer.put(s.toLowerCase(), key);
		       }
	           });

       return answer;
   }
}
