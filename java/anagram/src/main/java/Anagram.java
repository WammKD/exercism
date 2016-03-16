import java.util.List;
import javaslang.collection.CharSeq;
import javaslang.collection.Vector;

public class Anagram {
    private CharSeq orig;
    private CharSeq word;

    public Anagram(String w) {
	orig = CharSeq.of(w.toLowerCase());
	word = orig.sorted();
    }

    public List<String> match(List<String> list_of_words) {
	return Vector.ofAll(list_of_words).filter((String s) -> {
		                                      CharSeq temp = CharSeq.of(s.toLowerCase());
		                                      return (orig.equals(temp)) ? false : temp.sorted().equals(word);
	                                          }).toJavaList();
    }
}
