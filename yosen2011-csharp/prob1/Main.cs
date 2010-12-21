using System;
using System.Collections.Generic;

class MainProgram {
  static void Main() {
    int sec =
      int.Parse(Console.ReadLine()) +
      int.Parse(Console.ReadLine()) +
      int.Parse(Console.ReadLine()) +
      int.Parse(Console.ReadLine());
    Console.WriteLine(sec/60);
    Console.WriteLine(sec%60);
  }
}

