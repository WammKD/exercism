import java.lang.IllegalArgumentException;
import javaslang.Tuple2;
import javaslang.collection.CharSeq;

public class Hamming {
    public static int compute(String n1, String n2) {
	if(n1.length() != n2.length()) throw new IllegalArgumentException();

	return CharSeq.of(n1).zip(CharSeq.of(n2)).count((Tuple2<Character,
							        Character> t) ->
							    t._1() != t._2());
    }
}
