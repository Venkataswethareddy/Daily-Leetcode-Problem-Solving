public int maxLevelSum(TreeNode root) {
        Queue<TreeNode> queue = new ArrayDeque<>();
        int smallestLevel = 0, maxSum = Integer.MIN_VALUE, level = 1;
        queue.add(root);

        while (!queue.isEmpty()) {
            int queueLength = queue.size();
            int currentSum = 0;
            for (int length = 0; length < queueLength; length++) {
                TreeNode currentNode = queue.poll();
                currentSum += currentNode.val;

                if (currentNode.left != null) {
                    queue.add(currentNode.left);
                }

                if (currentNode.right != null) {
                    queue.add(currentNode.right);
                }
            }

            if (currentSum > maxSum) {
                maxSum = currentSum;
                smallestLevel = level;
            }
            level++;
        }

        return smallestLevel;
    }