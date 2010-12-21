import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  // I : 0
  // O : 1
  // J : 2
  static final char[] numchar = {'I','O','J'};
  static Scanner sc = new Scanner(System.in);
  static final int MOD = 100000;
  public static void main(String[] args) {
    int m = sc.nextInt();
    int n = sc.nextInt();
    String[] snip = new String[m];
    for(int i = 0; i < m; i++) snip[i] = sc.next();
    int wholecount = 1;
    int[][] dp = new int[3][1<<(n-1)];
    dp[0][0] = 1;
    for(int y = 0; y < m; y++) {
      for(int x = 0; x < n; x++) {
        int[][] dp2 = new int[3][1<<(n-1)];
        char cur = snip[y].charAt(x);
        if(cur=='?') {
          wholecount=wholecount*3%MOD;
        }
        for(int c = 0; c < 3; c++) {
          if(cur!='?' && cur!=numchar[c]) continue;
          for(int r = 0; r < 3; r++) {
            for(int p = 0; p < (1<<(n-1)); p++) {
              while(true) {
                int aa = p&(p>>1);
                if(aa==0) break;
                p += aa;
              }
              if(p >= (1<<(n-1))) break;
              int np = p>>1;
              if(r==2 && c==1 && 0<x) np |= 1<<(n-2);
              if((p&1)==1 && c==0) continue;
              dp2[c][np] = (dp2[c][np]+dp[r][p])%MOD;
            }
          }
        }
        dp = dp2;
      }
    }
    int sum = wholecount;
    for(int r = 0; r < 3; r++) {
      for(int p = 0; p < (1<<(n-1)); p++) {
        sum = (sum+MOD-dp[r][p])%MOD;
      }
    }
    System.out.println(sum);
  }
}

