# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3634 - Minimum Removals to Balance Array
Submission: https://leetcode.com/problems/minimum-removals-to-balance-array/solutions/7582010/easy-by-codeauragirl-as16
Solution (Dart):

```
class Solution {
  int minRemoval(List<int> a, int k) {
    a.sort();
    int w = 0, c = 0;
    for (final x in a) {
      if (x.toInt() > k * a[w]) { w++; c++; }
    }
    return c;
  }
}
```

If you like my solution, please give it a rating. Thank you.
