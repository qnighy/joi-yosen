using System;
using System.Collections.Generic;

class MainProgram {
  static void Main() {
    string s = Console.ReadLine();
    int n = int.Parse(Console.ReadLine());
    int cnt = 0;
    for(int i = 0; i < n; i++) {
      string r = Console.ReadLine();
      if((r+r).Contains(s)) cnt++;
    }
    Console.WriteLine(cnt);
  }
}

