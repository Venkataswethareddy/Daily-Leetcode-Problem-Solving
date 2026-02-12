# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3714 - Longest Balanced Substring II  
Submission: https://leetcode.com/problems/longest-balanced-substring-i/solutions/7575948/easy-by-codeauragirl-9whg/

Solution (Dart):

class Solution {
  int longestBalanced(String s) {
    int r = 0;
    for (int i = 0; i < s.length; i++) {
      var f = List.filled(26, 0); int k = 0, m = 0;
      for (int j = i; j < s.length; j++) {
        int x = s.codeUnitAt(j) - 97;
        if (++f[x] == 1) k++;
        if (f[x] > m) m = f[x];
        if (m * k == j - i + 1 && j - i + 1 > r) r = j - i + 1;
      }
    }
    return r;
  }
}

If you like my solution, please give it a rating. Thank you 🚀
