# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3453 - Separate Squares I
Submission: https://leetcode.com/problems/separate-squares-i/solutions/7585786/easy-by-codeauragirl-d98d
Solution (Dart):

```
class Solution {
  double separateSquares(List<List<int>> sq) {
    double lo = 1e18, hi = -1e18, total = 0;
    for (var s in sq) {
      double y = s[1].toDouble(), z = s[2].toDouble();
      lo = lo < y ? lo : y;
      hi = hi > y + z ? hi : y + z;
      total += z * z;
    }

    for (int i = 0; i < 80; i++) {
      double mid = (lo + hi) / 2, below = 0;
      for (var s in sq) {
        double y = s[1].toDouble(), z = s[2].toDouble();
        if (mid > y) below += z * (mid - y < z ? mid - y : z);
      }
      if (below * 2 >= total) hi = mid; else lo = mid;
    }
    return lo;
  }
}
```

If you like my solution, please give it a rating. Thank you.
