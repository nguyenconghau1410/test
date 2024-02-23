class Utils {
  static String reverseString(String text) {
    String res = "";
    for(int i = text.length - 1; i >= 0; i--) {
      res += text[i];
    }
    return res;
  }
  static String format_VND(String text) {
    String format = "";
    int cnt = 0;
    for(int i = text.length - 1; i >=0; i--) {
      ++cnt;
      format += text[i];
      if(cnt == 3 && i != 0) {
        format += ".";
        cnt = 0;
      }
    }
    return reverseString(format);
  }
}