import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    long n = sc.nextLong();
    long nf = 1;
    for(long i = 1; i <= n; i++) {
      nf *= i;
    }
    System.out.println(nf);
  }
}

