package swu.edu.cn.util;

import java.util.regex.Pattern;

public class Function {
	  /**
     * 判断是否是合法的 email 地址 (按长度,'@')
     * @param strEMail
     * @return
     */
    public static boolean isEmail( String strEMail )
    {
        int nDelima = strEMail.indexOf( "@" ) ;
        int nDot = strEMail.lastIndexOf( "." ) ;
        
        if( nDelima != -1 && nDot > nDelima )
        {
            return true ;
        }
        
        return false;
    }
    /**
     * 去掉字符串的空
     */
    public static String normalizeString( String strValue )
    {
        return ( ( strValue == null ) ? "" : strValue.trim() ) ;
    }
    
    /**
     * 得到随机数字符
     * @return 返回随机数
     */
    public static String getRnd()
    {
        return String.valueOf((long)((10000000000l - 1000000000l + 1) * Math.random())   + 1000000000l);
    }
    
    /**
     * 入库字符窜限制长度
     * @param strData 字符
     * @param nLength 显示的长度
     */
    public static String inLibString(String strSRC, int nLen) throws Exception
    {

        if(strSRC==null)
        {
            return "";
        }
        else
        {
            byte[] byTemp = strSRC.getBytes();
            if( nLen < byTemp.length )
            {
                boolean bDouble = false;
                int i ;
                for( i = 0; i < nLen; i++ )
                {
                    if( bDouble )
                    {
                        bDouble = (false);
                    }
                    else
                    {
                        bDouble = ( ((short)byTemp[i] & 0xff)> 0x80 );
                    }
                }
                if ( bDouble ) i--;
                return new String( byTemp, 0, i );
            }
            return strSRC;
        }
    
    }
    
    /**
     * 格式化字符串
     * @param strData 字符串数据
     */
    public static String formatString(String strData)
    {
        if (strData==null)
        {
            return "";
        }
        else
        {
            if(strData.equals("null"))
            {
                return "";
            }
            else
            {
                return strData;
            }
        }
    }
    /**
     * 格式化字符串
     * @param strData 字符串数据判断一个字符串是否都为数字
     */
    public static boolean isDigit(String str){
    	for (int i = 0; i < str.length(); i++) {
           // System.out.println(str.charAt(i));
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }
}
