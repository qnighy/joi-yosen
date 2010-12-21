import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    String s = sc.next();
    int n = sc.nextInt();
    int cnt = 0;
    for(int i = 0; i < n; i++) {
      String r = sc.next();
      boolean f = false;
      for(int j = 0; j < 10; j++) {
        if(rotate(r,j).startsWith(s)) f=true;
      }
      if(f) cnt++;
    }
    System.out.println(cnt);
  }
  static String rotate(String str, int at) {
    return str.substring(at) + str.substring(0,at);
  }
}

