# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 110 - Balanced Binary Tree 
Submission: https://leetcode.com/problems/balanced-binary-tree/solutions/7578447/easy-by-codeauragirl-rbf7/
Solution (Dart):

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  bool isBalanced(TreeNode? r) {
    var ok = true;
    int h(TreeNode? n) {
      if (n == null || !ok) return 0;
      final l = h(n.left), r2 = h(n.right);
      if ((l - r2).abs() > 1) ok = false;
      return (l > r2 ? l : r2) + 1;
    }
    h(r);
    return ok;
  }
}

If you like my solution, please give it a rating. Thank you 🚀
