# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 67 - Add Binary
Submission: https://leetcode.com/problems/add-binary/solutions/7581975/easy-by-codeauragirl-0s7z
Solution (Dart):

``
class Solution {
  String addBinary(String a, String b) =>
      (BigInt.parse(a, radix: 2) + BigInt.parse(b, radix: 2))
          .toRadixString(2);
}
```

If you like my solution, please give it a rating. Thank you.
