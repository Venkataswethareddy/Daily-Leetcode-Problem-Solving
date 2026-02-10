# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3719 - Longest Balanced Subarray I  
Submission: https://leetcode.com/problems/longest-balanced-subarray-i/submissions/?envType=daily-question&envId=2026-02-10
Solution (Dart):

class Solution {
  int longestBalanced(List<int> a) {
    var ans = 0;
    for (var i = 0; i < a.length; i++) {
      final e = <int>{}, o = <int>{};
      for (var j = i; j < a.length; j++) {
        (a[j] & 1) == 0 ? e.add(a[j]) : o.add(a[j]);
        if (e.length == o.length && j - i + 1 > ans) ans = j - i + 1;
      }
    }
    return ans;
  }
}

If you like my solution, please give it a rating. Thank you 🚀
