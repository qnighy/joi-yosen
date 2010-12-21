import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  static final char[] pts = {'S','1','2','3','4','5','6','7','8','9'};
  public static void main(String[] args) {
    int h = sc.nextInt();
    int w = sc.nextInt();
    int n = sc.nextInt();
    StringBuffer mapBuf = new StringBuffer();
    for(int y=0; y<h; y++) mapBuf.append(sc.next());
    String map = mapBuf.toString();

    @SuppressWarnings({"unchecked"})
    ArrayList<Integer>[] graph = (ArrayList<Integer>[])new ArrayList[w*h];
    for(int i = 0; i < w*h; i++) graph[i]=new ArrayList<Integer>();
    for(int x = 0; x < w; x++) {
      for(int y = 0; y < h; y++) {
        if(x+1<w) {
          int a = at(w,x,y);
          int b = at(w,x+1,y);
          if(map.charAt(a)!='X' && map.charAt(b)!='X') {
            graph[a].add(b);
            graph[b].add(a);
          }
        }
        if(y+1<h) {
          int a = at(w,x,y);
          int b = at(w,x,y+1);
          if(map.charAt(a)!='X' && map.charAt(b)!='X') {
            graph[a].add(b);
            graph[b].add(a);
          }
        }
      }
    }

    int stepsum = 0;
    for(int i = 0; i < n; i++) {
      int start = map.indexOf(pts[i]);
      int goal = map.indexOf(pts[i+1]);
      int[] tim = new int[w*h];
      for(int j = 0; j < w*h; j++) tim[j]=-1;
      ArrayDeque<Integer> q = new ArrayDeque<Integer>();
      q.add(start); tim[start]=0;
      while(!q.isEmpty()) {
        int cur = q.poll();
        int curTime = tim[cur];
        if(cur == goal) {
          stepsum += curTime;
          break;
        }
        for(int to : graph[cur]) {
          if(tim[to]==-1) {
            q.add(to);
            tim[to] = curTime+1;
          }
        }
      }
    }
    System.out.println(stepsum);
  }
  static int at(int w, int x, int y) {
    return y*w+x;
  }
}

