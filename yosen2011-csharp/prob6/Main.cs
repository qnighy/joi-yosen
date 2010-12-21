using System;
using System.Collections.Generic;

class MainProgram {
  // I : 0
  // O : 1
  // J : 2
  static readonly char[] numchar = new char[] {'I','O','J'};
  const int MOD = 100000;
  static void Main() {
    string[] mn_raw = Console.ReadLine().Split(' ');
    int m = int.Parse(mn_raw[0]);
    int n = int.Parse(mn_raw[1]);
    string[] snip = new string[m];
    for(int i = 0; i < m; i++) snip[i] = Console.ReadLine();
    int wholecount = 1;
    int[,] dp = new int[3,1<<(n-1)];
    dp[0,0] = 1;
    for(int y = 0; y < m; y++) {
      for(int x = 0; x < n; x++) {
        int[,] dp_old = dp;
        dp = new int[3,1<<(n-1)];
        char cur = snip[y][x];
        if(cur=='?') {
          wholecount = wholecount*3%MOD;
        }
        for(int c = 0; c < 3; c++) {
          if(cur!='?' && cur!=numchar[c]) continue;
          for(int r = 0; r < 3; r++) {
            for(int p = 0; p < (1<<(n-1)); p++) {
              int np = p>>1;
              if(r==2 && c==1 && 0<x) np |= 1<<(n-2);
              if((p&1)==1 && c==0) continue;
              dp[c,np] = (dp[c,np]+dp_old[r,p])%MOD;
            }
          }
        }
      }
    }
    int sum = wholecount;
    for(int c = 0; c < 3; c++) {
      for(int p = 0; p < (1<<(n-1)); p++) {
        sum = (sum+MOD-dp[c,p])%MOD;
      }
    }
    Console.WriteLine(sum);
  }
}

