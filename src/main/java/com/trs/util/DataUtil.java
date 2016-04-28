package com.trs.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtil {
    //covert from date to string
    public static String formatDate(Date date,String format){
        String result="";
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        if(date!=null){
            result=sdf.format(date);
        }
        return result;
    }

    //covert form string date
    public static Date formatString(String str,String format) throws ParseException
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.parse(str);
    }
}
