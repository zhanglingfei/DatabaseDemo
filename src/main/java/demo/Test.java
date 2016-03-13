package demo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2015/3/28.
 */
public class Test {
    public static void main(String[] args) {
        System.out.println("hello".toUpperCase());

        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    }


}
