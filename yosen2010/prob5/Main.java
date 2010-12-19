import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  static final int MOD = 100000;
  public static void main(String[] args) {
    // aoj version
    while(true) {
      int w = sc.nextInt();
      int h = sc.nextInt();
      if(w==0)break;
      int[][] dp1 = new int[w+2][h+2];
      int[][] dp2 = new int[w+2][h+2];
      dp1[0][0] = 1;
      dp2[0][0] = 1;
      for(int x = 0; x < w; x++) {
        for(int y = 0; y < h; y++) {
          System.out.println(x+","+y+" "+dp1[x][y]+" "+dp2[x][y]);
          dp1[x][y+1] = (dp1[x][y+1]+dp1[x][y])%MOD;
          dp1[x][y+2] = (dp1[x][y+2]+dp2[x][y])%MOD;
          dp2[x+1][y] = (dp2[x+1][y]+dp2[x][y])%MOD;
          dp2[x+2][y] = (dp2[x+2][y]+dp1[x][y])%MOD;
        }
      }
    }
  }
}

