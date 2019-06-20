package swu.edu.cn.util;

public class Notes {
	 public static int degree1=11;
	 public static int degree2=22;
	 public static int degree3=33;
	 public static int degree4=44;
	 public static double testRatio=0.4;
	 public static double examRatio=0.6;
	 public String getDegreeByCode(int i){
		 String result="00";
		 switch (i){
			 case 11:  result="大专"; break;
			 case 22: result="本科"; break;
			 case 33: result="硕士"; break;
			 case 44: result="博士"; break;
			 default:  result="00";
		 }
		 return result;
	 }
}
