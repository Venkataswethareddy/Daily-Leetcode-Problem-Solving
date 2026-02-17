# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 401 - Binary Watch
Submission: https://leetcode.com/problems/binary-watch/solutions/7585198/easy-in-dart-language-by-codeauragirl-7mhx
Solution (Dart):

```
class Solution {
  List<String> readBinaryWatch(int turnedOn) {
    List<String> res = [];
    for(int hour = 0; hour < 12; hour++) {
        for(int min = 0; min < 60; min++) {
            String temp = hour.toRadixString(2) + min.toRadixString(2);
            int count = 0;
            for(int i = 0; i < temp.length; i++) {
                if(temp[i] == '1')
                    count++;
            }
            if(count == turnedOn) {
                res.add('$hour:${min.toString().padLeft(2, '0')}');
            }
        }
    }
    return res;
  }
}
```

If you like my solution, please give it a rating. Thank you.
