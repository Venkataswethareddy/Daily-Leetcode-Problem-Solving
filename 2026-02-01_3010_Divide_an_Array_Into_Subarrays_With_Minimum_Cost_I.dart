# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3010 - Divide an Array Into Subarrays With Minimum Cost I
Submission: https://leetcode.com/problems/divide-an-array-into-subarrays-with-minimum-cost-i/solutions/7583020/easy-by-codeauragirl-513i
Solution (Dart):

```
class Solution {
  int minimumCost(List<int> a) {
    int m1 = 51, m2 = 52;
    for (int i = 1; i < a.length; i++) {
      int v = a[i];
      if (v < m1) { m2 = m1; m1 = v; }
      else if (v < m2) m2 = v;
    }
    return a[0] + m1 + m2;
  }
}
```

If you like my solution, please give it a rating. Thank you.
