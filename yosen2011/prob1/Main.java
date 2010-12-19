import java.util.*;
import java.io.*;
import static java.lang.Math.*;
import static java.util.Arrays.*;

public class Main {
  static Scanner sc = new Scanner(System.in);
  public static void main(String[] args) {
    int sec =
      sc.nextInt() +
      sc.nextInt() +
      sc.nextInt() +
      sc.nextInt();
    System.out.println(sec/60);
    System.out.println(sec%60);
  }
}

