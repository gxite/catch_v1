static class Score {
  static int total = 0;
  static int lastScore = 0;
  static int highScore = 0;
  
  Score() {
  }
  
  static void scoreAdd(int i) {
    total += i;
    if (total < 0) {
      total = 0;  
    }
    if (total > highScore)
      highScore = total;
  }
  
  static int getTotalScore() {
    return total;
  }
}
