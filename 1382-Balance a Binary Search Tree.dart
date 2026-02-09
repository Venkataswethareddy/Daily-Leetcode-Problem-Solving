# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1382 - Balance a Binary Search Tree  
Submission: https://leetcode.com/problems/balance-a-binary-search-tree/solutions/7576066/easy-by-codeauragirl-vqnf/

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
    final List<int> arr = [];
    TreeNode? balanceBST(TreeNode? root) {
        inOrder(root!);
        return convertToBST(0, arr.length - 1);
    }

    void inOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        
        inOrder(root.left);
        arr.add(root.val);
        inOrder(root.right);
    }

    TreeNode? convertToBST(int start, int end) {
        if (start > end) {
            return null;
        }
        final mid = (start + end) ~/ 2;
        TreeNode root = TreeNode(arr[mid]);
        root.left = convertToBST(start, mid - 1);
        root.right = convertToBST(mid + 1, end);
        return root;
    }
}

If you like my solution, please give it a rating. Thank you 🚀
