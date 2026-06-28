package com.mockleetcode.judge.harness;

public final class NodeTemplates {

    public static final String LIST_NODE = """
            public class ListNode {
                int val;
                ListNode next;

                ListNode() {}

                ListNode(int val) {
                    this.val = val;
                }

                ListNode(int val, ListNode next) {
                    this.val = val;
                    this.next = next;
                }
            }
            """;

    public static final String TREE_NODE = """
            public class TreeNode {
                int val;
                TreeNode left;
                TreeNode right;

                TreeNode() {}

                TreeNode(int val) {
                    this.val = val;
                }

                TreeNode(int val, TreeNode left, TreeNode right) {
                    this.val = val;
                    this.left = left;
                    this.right = right;
                }
            }
            """;

    public static final String RANDOM_NODE = """
            public class Node {
                int val;
                Node next;
                Node random;

                Node(int val) {
                    this.val = val;
                    this.next = null;
                    this.random = null;
                }
            }
            """;

    private NodeTemplates() {
    }
}
