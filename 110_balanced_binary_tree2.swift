class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return getIsBalancedAndDepth(root, 0).0
    }
    func getIsBalancedAndDepth(_ node: TreeNode?,_ depth: Int) -> (Bool, Int) {
        guard let n = node else { return (true, depth) }
        let (isLeftB, leftD) = getIsBalancedAndDepth(n.left, depth+1)
        let (isRightB, rightD) = getIsBalancedAndDepth(n.right, depth+1)
        return (isLeftB && isRightB && abs(leftD-rightD)<=1, max(leftD, rightD))
    }
}