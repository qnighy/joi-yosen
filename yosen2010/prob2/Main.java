import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    // aoj version
    while(true) {
      int n = sc.nextInt();
      int m = sc.nextInt();
      if(n==0)break;
      int[] commands = new int[n];
      for(int i = 0; i < n; i++) commands[i] = sc.nextInt();
      int[] dice = new int[m];
      for(int i = 0; i < m; i++) dice[i] = sc.nextInt();
      int curr = 0;
      for(int i = 0; i < m; i++) {
        curr += dice[i];
        if(n-1 <= curr) {
          System.out.println(i+1);
          break;
        }
        curr += commands[curr];
        if(n-1 <= curr) {
          System.out.println(i+1);
          break;
        }
      }
    }
  }
}

