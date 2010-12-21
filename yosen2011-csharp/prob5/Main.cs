using System;
using System.Collections.Generic;

class MainProgram {
  static void Main() {
    string[] hwn_raw = Console.ReadLine().Split(' ');
    int h = int.Parse(hwn_raw[0]);
    int w = int.Parse(hwn_raw[1]);
    int n = int.Parse(hwn_raw[2]);
    string[] map = new string[h];
    int[] checkpoints = new int[n+1];
    for(int y = 0; y < h; y++) {
      map[y] = Console.ReadLine();
      for(int x = 0; x < w; x++) {
        int i = "S123456789".IndexOf(map[y][x]);
        if(0 <= i) {
          checkpoints[i] = y*w+x;
        }
      }
    }
    int count = 0;
    for(int i = 0; i < n; i++) {
      Queue<int> q = new Queue<int>();
      int[] tim = new int[h*w];
      q.Enqueue(checkpoints[i]);
      tim[checkpoints[i]] = 1;
      while(0<q.Count) {
        int pos = q.Dequeue();
        int x = pos%w;
        int y = pos/w;
        if(pos==checkpoints[i+1]) {
          count+=tim[pos]-1;
          break;
        }
        if(0<=x-1) {
          int next = y*w+x-1;
          if(map[y][x-1]!='X' && tim[next]==0) {
            tim[next]=tim[pos]+1;
            q.Enqueue(next);
          }
        }
        if(0<=y-1) {
          int next = (y-1)*w+x;
          if(map[y-1][x]!='X' && tim[next]==0) {
            tim[next]=tim[pos]+1;
            q.Enqueue(next);
          }
        }
        if(x+1<w) {
          int next = y*w+x+1;
          if(map[y][x+1]!='X' && tim[next]==0) {
            tim[next]=tim[pos]+1;
            q.Enqueue(next);
          }
        }
        if(y+1<h) {
          int next = (y+1)*w+x;
          if(map[y+1][x]!='X' && tim[next]==0) {
            tim[next]=tim[pos]+1;
            q.Enqueue(next);
          }
        }
      }
    }
    Console.WriteLine(count);
  }
}

