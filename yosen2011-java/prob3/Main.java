import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    int n = sc.nextInt();
    int k = sc.nextInt();
    for(int i = 0; i < k; i++) {
      int x = sc.nextInt()-1;
      int y = sc.nextInt()-1;
      int z = n-x-1;
      int w = n-y-1;
      int m = min(min(x,y),min(z,w));
      System.out.println(m%3+1);
    }
  }
}

