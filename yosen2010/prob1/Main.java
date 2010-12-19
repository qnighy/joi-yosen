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
    if(n==0)break;
    for(int i = 0; i < 9; i++)
      n -= sc.nextInt();
    System.out.println(n);
    }
  }
}

