import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    int n = sc.nextInt();
    int acnt = 0, bcnt = 0;
    for(int i = 0; i < n; i++) {
      int a = sc.nextInt();
      int b = sc.nextInt();
      if(a>b) acnt++;
      if(a<b) bcnt++;
    }
    System.out.println(acnt+" "+bcnt);
  }
}

