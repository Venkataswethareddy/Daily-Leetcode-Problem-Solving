# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3637 - Trionic Array I
Submission: https://leetcode.com/problems/trionic-array-i/solutions/7582983/easy-by-codeauragirl-h6tw
Solution (Dart):

```
class Solution {
  bool isTrionic(List<int> nums) {
    int n = nums.length;
    if (n < 4) return false;

    int i = 1;

    // First increasing
    while (i < n && nums[i] > nums[i - 1]) {
      i++;
    }
    if (i == 1 || i == n) return false;

    // Then decreasing
    int j = i;
    while (j < n && nums[j] < nums[j - 1]) {
      j++;
    }
    if (j == i || j == n) return false;

    // Then increasing again
    int k = j;
    while (k < n && nums[k] > nums[k - 1]) {
      k++;
    }

    return k == n;
  }
}
```

If you like my solution, please give it a rating. Thank you.
