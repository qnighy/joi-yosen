using System;
using System.Collections.Generic;

class MainProgram {
  static void Main() {
    int n = int.Parse(Console.ReadLine());
    int k = int.Parse(Console.ReadLine());
    for(int i = 0; i < k; i++) {
      string[] pos_raw = Console.ReadLine().Split(' ');
      int x = int.Parse(pos_raw[0])-1;
      int y = int.Parse(pos_raw[1])-1;
      int z = n-1-x;
      int w = n-1-y;
      int m = Math.Min(
          Math.Min(x,y),
          Math.Min(z,w));
      Console.WriteLine(m%3+1);
    }
  }
}

