# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 693 - Binary Number with Alternating Bits
Submission: https://leetcode.com/problems/binary-number-with-alternating-bits/solutions/7588437/simple-solution-in-dart-by-codeauragirl-9juo
Solution (Dart):

```
class Solution {
  bool hasAlternatingBits(int n) {
    int bit = n^(n>>1);
     return (bit&(bit+1)) ==0;
  }
}
```

If you like my solution, please give it a rating. Thank you.
