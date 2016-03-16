import javaslang.collection.CharSeq;

public class Pangrams {
    final private static CharSeq alphabetic = CharSeq.of("abcdefghijklmnopqrstuvwxyz");

    public static boolean isPangram(String phrase) {
	String p = phrase.toLowerCase();

	return alphabetic.forAll((Character c) ->
				     p.indexOf(c) != -1);
    }
}
