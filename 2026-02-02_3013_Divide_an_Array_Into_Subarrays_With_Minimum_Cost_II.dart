# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3013 - Divide an Array Into Subarrays With Minimum Cost II
Submission: https://leetcode.com/problems/divide-an-array-into-subarrays-with-minimum-cost-ii/solutions/7582999/easy-by-codeauragirl-icd1
Solution (Dart):

```
import 'dart:collection';

class Solution {
  int minimumCost(List<int> nums, int k, int dist) {
    int windowSum = 0;

    final selected = SplayTreeMap<int, int>();
    final candidates = SplayTreeMap<int, int>();
    int selectedSize = 0;
    int candidateSize = 0;

    void add(SplayTreeMap<int, int> m, int x) {
      m[x] = (m[x] ?? 0) + 1;
    }

    void remove(SplayTreeMap<int, int> m, int x) {
      int c = m[x]!;
      if (c == 1) {
        m.remove(x);
      } else {
        m[x] = c - 1;
      }
    }

    for (int i = 1; i <= dist + 1; i++) {
      windowSum += nums[i];
      add(selected, nums[i]);
      selectedSize++;
    }

    windowSum = balance(windowSum, selected, candidates, k,
        () => selectedSize, () => candidateSize, (v) => selectedSize = v,
        (v) => candidateSize = v);

    int minWindowSum = windowSum;

    for (int i = dist + 2; i < nums.length; i++) {
      int outOfScope = nums[i - dist - 1];

      if (selected.containsKey(outOfScope)) {
        windowSum -= outOfScope;
        remove(selected, outOfScope);
        selectedSize--;
      } else {
        remove(candidates, outOfScope);
        candidateSize--;
      }

      int maxSelected = selected.lastKey()!;
      if (nums[i] < maxSelected) {
        windowSum += nums[i];
        add(selected, nums[i]);
        selectedSize++;
      } else {
        add(candidates, nums[i]);
        candidateSize++;
      }

      windowSum = balance(windowSum, selected, candidates, k,
          () => selectedSize, () => candidateSize, (v) => selectedSize = v,
          (v) => candidateSize = v);

      if (windowSum < minWindowSum) minWindowSum = windowSum;
    }

    return nums[0] + minWindowSum;
  }

  int balance(
    int windowSum,
    SplayTreeMap<int, int> selected,
    SplayTreeMap<int, int> candidates,
    int k,
    int Function() getSelSize,
    int Function() getCandSize,
    void Function(int) setSelSize,
    void Function(int) setCandSize,
  ) {
    while (getSelSize() < k - 1) {
      int minCandidate = candidates.firstKey()!;
      windowSum += minCandidate;
      _remove(candidates, minCandidate);
      _add(selected, minCandidate);
      setSelSize(getSelSize() + 1);
      setCandSize(getCandSize() - 1);
    }

    while (getSelSize() > k - 1) {
      int maxSelected = selected.lastKey()!;
      windowSum -= maxSelected;
      _remove(selected, maxSelected);
      _add(candidates, maxSelected);
      setSelSize(getSelSize() - 1);
      setCandSize(getCandSize() + 1);
    }

    return windowSum;
  }

  static void _add(SplayTreeMap<int, int> m, int x) {
    m[x] = (m[x] ?? 0) + 1;
  }

  static void _remove(SplayTreeMap<int, int> m, int x) {
    int c = m[x]!;
    if (c == 1) {
      m.remove(x);
    } else {
      m[x] = c - 1;
    }
  }
}
```

If you like my solution, please give it a rating. Thank you.
