// LeetCode 269. Alien Dictionary
// https://leetcode.com/problems/alien-dictionary/
//

class Solution {
    public String alienOrder(String[] words) {
        final int num = 26;
        Set<Integer>[] adjList = new HashSet[num];
        int[] inDegree = new int[num];
        Arrays.fill(inDegree, -1);
        for (int i = 0; i < num; i++) adjList[i] = new HashSet();

        scanWord(words[0], inDegree);
        for (int i = 1; i < words.length; i++) {
            scanWord(words[i], inDegree);
            int j = 0;
            String w1 = words[i - 1];
            String w2 = words[i];
            int len = Math.min(w1.length(), w2.length());
            while (j < len && w1.charAt(j) == w2.charAt(j)) {
                j++;
            }
            if (j < len) {
                int c1 = w1.charAt(j) - 'a';
                int c2 = w2.charAt(j) - 'a';
                if (!adjList[c1].contains(c2)) {
                    adjList[c1].add(c2);
                    inDegree[c2]++;
                }
            }
        }

        List<Character> list = new LinkedList();
        StringBuilder sb = new StringBuilder();
        Queue<Integer> queue = new LinkedList();
        for (int i = 0; i < num; i++) {
            if (inDegree[i] == 0) queue.offer(i);
        }

        while (!queue.isEmpty()) {
            int src = queue.poll();
            sb.append((char)(src + 'a'));
            for (int dest: adjList[src]) {
                inDegree[dest]--;
                if (inDegree[dest] == 0) queue.offer(dest);
            }
        }

        for (int i = 0; i < num; i++) {
            if (inDegree[i] > 0) return "";
        }

        return sb.toString();
    }

    private void scanWord(String word, int[] inDegree) {
        for (char c: word.toCharArray()) {
            if (inDegree[c - 'a'] == -1) inDegree[c - 'a'] = 0;
        }
    }
}
