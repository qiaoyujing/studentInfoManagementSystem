package swu.edu.cn.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

public class DateUtil
{
	  public static final int FMT_DATE_YYYYMMDD = 1;
      public static final int FMT_DATE_YYYYMMDD_HHMMSS = 2;
      public static final int FMT_DATE_HHMMSS = 3;
      public static final int FMT_DATE_HHMM = 4;
      //date->String
      public static String formatDate( Date date , int nFmt )
      {
          SimpleDateFormat fmtDate = new SimpleDateFormat();
          switch( nFmt )
          {
              default:
              case 1:
                  fmtDate.applyLocalizedPattern( "yyyy-MM-dd" ) ;
                  break;
              case 2:
                  fmtDate.applyLocalizedPattern( "yyyy-MM-dd HH:mm:ss" );
                  break;
              case 3:
                  fmtDate.applyLocalizedPattern( "HH:mm" ) ;
                  break;
              case 4:
                  fmtDate.applyLocalizedPattern( "HH:mm:ss" ) ;
                  break;
          }
          
          return fmtDate.format( date ) ;
      }
     //String->Date  
      public static Date parseDate( String strDate, int nFmtDate) throws Exception
      {
          SimpleDateFormat fmtDate = new SimpleDateFormat();
          
          switch( nFmtDate )
          {
              default:
              case 1:
                  fmtDate.applyLocalizedPattern( "yyyy-MM-dd" ) ;
                  break;
              case 2:
                  fmtDate.applyLocalizedPattern( "yyyy-MM-dd HH:mm:ss" );
                  break;
              case 3:
                  fmtDate.applyLocalizedPattern( "HH:mm" ) ;
                  break;
              case 4:
                  fmtDate.applyLocalizedPattern( "HH:mm:ss" ) ;
                  break;
          }
          
          return fmtDate.parse( strDate ) ;
      }
      //获得系统时间
      static public java.sql.Timestamp getDateTime(Connection con) throws SQLException
      {
          java.sql.Statement stmt=null;
          java.sql.ResultSet rs=null;
          java.sql.Timestamp ts=null;
          
          try
          {
              stmt=con.createStatement();
              rs=stmt.executeQuery("select sysdate from dual");
              //select to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') from dual
              if(rs.next())
                  ts=rs.getTimestamp(1);
              rs.close();
              stmt.close();
          }
          catch(SQLException sqe)
          {
              System.out.println("SQLExcepiton");
              sqe.printStackTrace();
              throw sqe;
          }
          return ts;
      }
      //获取时间字符串
      static public String getDateString() throws SQLException
      {
          
          java.util.Date dt=null;
          java.util.Calendar calendar=Calendar.getInstance();
          String strMonth=String.valueOf(calendar.get(Calendar.MONTH)+1);
          if(strMonth.length()==1)
          {
              strMonth="0" + strMonth;
          }
          String strDay=String.valueOf(calendar.get(Calendar.DATE));
          if(strDay.length()==1)
          {
              strDay="0" + strDay;
          }
          return calendar.get(Calendar.YEAR)+"-"+strMonth + "-"+ strDay+" 00:00:00"; 
      }
      
}
