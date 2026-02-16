# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 190 - Reverse Bits
Submission: https://leetcode.com/problems/reverse-bits/solutions/7583898/easy-by-codeauragirl-agub
Solution (Dart):

```
class Solution {
  int reverseBits(int n) {
    int ans = 0;

    for (int i = 0; i < 32; i++) {
      if (((n >> i) & 1) == 1) {
        ans |= (1 << (31 - i));
      }
    }

    // Ensure result behaves like unsigned 32-bit
    return ans & 0xFFFFFFFF;
  }
}
```

If you like my solution, please give it a rating. Thank you.