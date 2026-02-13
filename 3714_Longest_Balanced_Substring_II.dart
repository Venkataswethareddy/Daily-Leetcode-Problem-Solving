# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3714 - Longest Balanced Substring II  
Submission: https://leetcode.com/problems/longest-balanced-substring-ii/solutions/7575893/easy-solution-by-codeauragirl-qxy3/

Solution (Dart):

class Solution {
  int longestBalanced(String s) {
    int n = s.length;

    int a = 0, b = 0, c = 0;
    int ans = 0;

    Map<String, int> map = {};

    for (int i = 0; i <= n; i++) {

      if (i > 0) {
        if (s.codeUnitAt(i - 1) == 97) {
          a++;
        } else if (s.codeUnitAt(i - 1) == 98) {
          b++;
        } else {
          c++;
        }
      }

      List<String> keys = [
        "-1_${a-b}_${a-c}",
        "-2_${a-b}_$c",
        "-3_${b-c}_$a",
        "-4_${c-a}_$b",
        "-5_${b}_$c",
        "-6_${c}_$a",
        "-7_${a}_$b"
      ];

      for (var key in keys) {
        if (!map.containsKey(key)) {
          map[key] = i;
        } else {
          int len = i - map[key]!;
          if (len > ans) ans = len;
        }
      }
    }

    return ans;
  }
}

If you like my solution, please give it a rating. Thank you 🚀
