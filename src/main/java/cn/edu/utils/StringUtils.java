package cn.edu.utils;

import java.util.*;

/**
 * 继承自Spring util的工具类，减少jar依赖
 * @author L.cm
 */
public class StringUtils extends org.springframework.util.StringUtils {
    /**
     * Check whether the given {@code CharSequence} contains actual <em>text</em>.
     * <p>More specifically, this method returns {@code true} if the
     * {@code CharSequence} is not {@code null}, its length is greater than
     * 0, and it contains at least one non-whitespace character.
     * <p><pre class="code">
     * StringUtils.isBlank(null) = true
     * StringUtils.isBlank("") = true
     * StringUtils.isBlank(" ") = true
     * StringUtils.isBlank("12345") = false
     * StringUtils.isBlank(" 12345 ") = false
     * </pre>
     * @param  {@code CharSequence} to check (may be {@code null})
     * @return {@code true} if the {@code CharSequence} is not {@code null},
     * its length is greater than 0, and it does not contain whitespace only
     * @see Character#isWhitespace
     */
    public static boolean isBlank(final CharSequence cs) {
        return !StringUtils.isNotBlank(cs);
    }
    
    /**
     * <p>Checks if a CharSequence is not empty (""), not null and not whitespace only.</p>
     *
     * <pre>
     * StringUtils.isNotBlank(null)      = false
     * StringUtils.isNotBlank("")        = false
     * StringUtils.isNotBlank(" ")       = false
     * StringUtils.isNotBlank("bob")     = true
     * StringUtils.isNotBlank("  bob  ") = true
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if the CharSequence is
     *  not empty and not null and not whitespace
     * @see Character#isWhitespace
     */
    public static boolean isNotBlank(final CharSequence cs) {
        return StringUtils.hasText(cs);
    }
    
    /**
     * Convert a {@code Collection} into a delimited {@code String} (e.g. CSV).
     * <p>Useful for {@code toString()} implementations.
     * @param coll the {@code Collection} to convert
     * @param delim the delimiter to use (typically a ",")
     * @return the delimited {@code String}
     */
    public static String join(Collection<?> coll, String delim) {
        return StringUtils.collectionToDelimitedString(coll, delim);
    }
    
    /**
     * Convert a {@code String} array into a delimited {@code String} (e.g. CSV).
     * <p>Useful for {@code toString()} implementations.
     * @param arr the array to display
     * @param delim the delimiter to use (typically a ",")
     * @return the delimited {@code String}
     */
    public static String join(Object[] arr, String delim) {
        return StringUtils.arrayToDelimitedString(arr, delim);
    }
    
    /**
     * 生成uuid
     * @return UUID
     */
    public static String getUUId() {
        return UUID.randomUUID().toString();
    }
    
    public static List<Integer> str2ListInt(String s){
    	String str[]=s.split(",");
    	List<Integer> list=new ArrayList<Integer>();
    	for(int i=0;i<str.length;i++) {
    		list.add(Integer.parseInt(str[i]));
    	}
    	return list;
    }
    public static List<Long> str2ListLong(String s){
    	String str[]=s.split(",");
    	List<Long> list=new ArrayList<Long>();
    	for(int i=0;i<str.length;i++) {
    		list.add(Long.parseLong(str[i]));
    	}
    	return list;
    }

    /**
     * list转字符串区中括号
     * @param list
     * @return
     */
    public static  String strip(List list){
        String target= org.apache.commons.lang.StringUtils.strip(list.toString(),
                "[]");
        return target;
    }


}