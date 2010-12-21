using System;
using System.Collections.Generic;

class MainProgram {
  static void Main() {
    int n = int.Parse(Console.ReadLine());
    string[] a_raw = Console.ReadLine().Split(' ');
    long[] dp = new long[21];
    dp[int.Parse(a_raw[0])] = 1;
    for(int i = 1; i < n-1; i++) {
      long[] dp2 = new long[21];
      int num = int.Parse(a_raw[i]);
      for(int j = 0; j < 21; j++) {
        if(j+num<21) dp2[j+num]+=dp[j];
        if(0<=j-num) dp2[j-num]+=dp[j];
      }
      dp = dp2;
    }
    Console.WriteLine(dp[int.Parse(a_raw[n-1])]);
  }
}

