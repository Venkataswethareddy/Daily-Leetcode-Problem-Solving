# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3047 - Find the Largest Area of Square Inside Two Rectangles
Submission: https://leetcode.com/problems/find-the-largest-area-of-square-inside-two-rectangles/solutions/7585743/easy-by-codeauragirl-6e2u
Solution (Dart):

```
class Solution{
 int largestSquareArea(List<List<int>> a,List<List<int>> b){
  int r=0;
  for(int i=0;i<a.length;i++)for(int j=i+1;j<a.length;j++){
   int s=[b[i][0],b[j][0]].reduce((x,y)=>x<y?x:y)
        -[a[i][0],a[j][0]].reduce((x,y)=>x>y?x:y);
   int t=[b[i][1],b[j][1]].reduce((x,y)=>x<y?x:y)
        -[a[i][1],a[j][1]].reduce((x,y)=>x>y?x:y);
   int k=s<t?s:t;
   if(k>0) r=r>k*k?r:k*k;
  }
  return r;
 }
}
```

If you like my solution, please give it a rating. Thank you.
