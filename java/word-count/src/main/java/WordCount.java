import java.util.Map;
import javaslang.collection.CharSeq;
import javaslang.collection.HashMap;
import javaslang.collection.List;

public class WordCount {
    private final CharSeq punctuation = CharSeq.of(":!&@$%^&,");

    public Map<String, Integer> phrase(String sentence) {
	CharSeq[] punctuation_filtered = CharSeq.of(sentence.toLowerCase()).removeAll(punctuation).split("\\s+");

	return List.of(punctuation_filtered).foldLeft(HashMap.of(), (HashMap<String, Integer> h, CharSeq cs) ->
		                                                        h.put(cs.toString(),
									      h.get(cs.toString()).getOrElse(0) + 1)).toJavaMap();
    }
}
