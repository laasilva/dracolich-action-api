package dm.dracolich.api.action.service.action;

import java.util.Arrays;

public class assesment {
    static String toCamelCase(String s) {
        String[] words = s.split("[_-]");

        words[0].substring(0, 1).toUpperCase();


        String result = Arrays.toString(words);

        result = result.replace(", ", "");
        result = result.replace("[", "");
        result = result.replace("]", "");

        return result;
    }
}
