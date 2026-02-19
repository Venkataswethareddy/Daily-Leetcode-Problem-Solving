# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 696 - Count Binary Substrings
Submission: https://leetcode.com/problems/count-binary-substrings/solutions/7591492/count-binary-substrings-in-dart-by-codea-5sza
Solution (Dart):

```
class Solution {
  int countBinarySubstrings(String s) {
    final List<int> counts = [];
    var count = 1;
    for (int i = 0; i < s.length - 1; i++) {
        if (s[i] == s[i + 1]) {
            count += 1;
        } else {
            counts.add(count);
            count = 1;
        }
    }
    counts.add(count);
    var total = 0;
    for (int i = 0; i < counts.length - 1; i++) {
        final mini = min(counts[i], counts[i + 1]);
        total += mini;
    }
    return total;
  }
}
```

If you like my solution, please give it a rating. Thank you.
