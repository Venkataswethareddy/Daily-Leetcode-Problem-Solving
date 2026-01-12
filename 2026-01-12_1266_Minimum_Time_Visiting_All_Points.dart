# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1266 - Minimum Time Visiting All Points
Submission: https://leetcode.com/problems/minimum-time-visiting-all-points/solutions/7585790/easy-by-codeauragirl-zuj7
Solution (Dart):

```
import 'dart:math';

class Solution {
  int minTimeToVisitAllPoints(List<List<int>> points) {
    int ans = 0;

    for (int i = 1; i < points.length; i++) {
      ans += max(
        (points[i][0] - points[i - 1][0]).abs(),
        (points[i][1] - points[i - 1][1]).abs(),
      );
    }

    return ans;
  }
}
```

If you like my solution, please give it a rating. Thank you.
