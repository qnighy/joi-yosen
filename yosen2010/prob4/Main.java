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
      int k = sc.nextInt();
      if(n==0)break;
      Set<String> strs = new HashSet<String>();
      String[] cards = new String[n];
      for(int i = 0; i < n; i++) cards[i] = sc.next();
      dfs(strs, cards, k, "");
      System.out.println(strs.size());
    }
  }
  static void dfs(Set<String> strs, String[] cards, int k, String s) {
    if(k==0) { strs.add(s); return; }
    for(int i = 0; i < cards.length; i++) {
      String sc = cards[i];
      if(sc==null) continue;
      cards[i] = null;
      dfs(strs, cards, k-1, s+sc);
      cards[i] = sc;
    }
  }
}

