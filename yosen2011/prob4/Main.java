import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    int n = sc.nextInt();
    long[] dp = new long[21];
    dp[0] = 1;
    for(int i = 0; i < n-1; i++) {
      long[] dp2 = new long[21];
      int x = sc.nextInt();
      for(int f = 0; f <= 20; f++) {
        int t = f+x;
        if(t<=20) dp2[t]+=dp[f];
      }
      for(int f = 0; f <= 20; f++) {
        int t = f-x;
        if(0<=t) dp2[t]+=dp[f];
      }
      dp = dp2;
    }
    System.out.println(dp[sc.nextInt()]);
  }
}

