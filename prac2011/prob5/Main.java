import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    int n = sc.nextInt();
    int r = 1;
    for(int i = 0; i < n; i++) {
      r = r*3%100000;
    }
    System.out.println(r);
  }
}

