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
      @SuppressWarnings({"unchecked"})
      ArrayList<Integer>[] graph = (ArrayList<Integer>[])new ArrayList[n];
      for(int i = 0; i < n; i++) graph[i] = new ArrayList<Integer>();
      for(int i = 0; i < m; i++) {
        int a = sc.nextInt(); a--;
        int b = sc.nextInt(); b--;
        graph[a].add(b);
        graph[b].add(a);
      }
      boolean[] flags = new boolean[n];
      for(int f : graph[0])
        flags[f] = true;
      for(int f : graph[0])
        for(int ff : graph[f])
          flags[ff] = true;
      flags[0] = false;
      int count = 0;
      for(boolean f : flags) if(f) count++;
      System.out.println(count);
    }
  }
}

