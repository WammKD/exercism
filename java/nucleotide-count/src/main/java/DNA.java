import java.lang.IllegalArgumentException;
import java.util.Map;
import javaslang.collection.CharSeq;
import javaslang.collection.HashMap;

public class DNA {
    private CharSeq dna;
    private final HashMap<Character, Integer> st = HashMap.of('A', 0, 'C', 0,
							      'G', 0, 'T', 0);

    public DNA(String d) {
	dna = CharSeq.of(d.toCharArray());
    }

    public int count(char nucleotide) {
	if(!st.containsKey(nucleotide)) throw new IllegalArgumentException();

	return dna.count((Character c) -> c == nucleotide);
    }

    public Map<Character, Integer> nucleotideCounts() {
	return dna.foldLeft(st, (HashMap<Character, Integer> h, Character c) ->
			            h.put(c, h.get(c).get() + 1)).toJavaMap();
    }
}
