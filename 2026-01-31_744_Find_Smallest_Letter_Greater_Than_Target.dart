# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 744 - Find Smallest Letter Greater Than Target
Submission: https://leetcode.com/problems/find-smallest-letter-greater-than-target/solutions/7583041/easy-by-codeauragirl-jmva
Solution (Dart):

```
class Solution {
  String nextGreatestLetter(List<String> a, String t) {
    int l = 0, r = a.length - 1;
    if (a[r].compareTo(t) <= 0) return a[0];
    while (l < r) {
      int m = (l + r) >> 1;
      if (a[m].compareTo(t) <= 0) {
        l = m + 1;
      } else {
        r = m;
      }
    }
    return a[l];
  }
}
```

If you like my solution, please give it a rating. Thank you.
