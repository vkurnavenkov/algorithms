// Leetcode 588. Design In-Memory File System
//
// Design an in-memory file system to simulate the following functions:
//
// ls: Given a path in string format. If it is a file path, return a list that only contains this file's name. If it is a directory path, return the list of file and directory names in this directory. Your output (file and directory names together) should in lexicographic order.
//
// mkdir: Given a directory path that does not exist, you should make a new directory according to the path. If the middle directories in the path don't exist either, you should create them as well. This function has void return type.
//
// addContentToFile: Given a file path and file content in string format. If the file doesn't exist, you need to create that file containing given content. If the file already exists, you need to append given content to original content. This function has void return type.
//
// readContentFromFile: Given a file path, return its content in string format.
//
//
//
// Example:
//
// Input:
// ["FileSystem","ls","mkdir","addContentToFile","ls","readContentFromFile"]
// [[],["/"],["/a/b/c"],["/a/b/c/d","hello"],["/"],["/a/b/c/d"]]
//
// Output:
// [null,[],null,null,["a"],"hello"]
//
// Explanation:
// filesystem
//
//
// Note:
//
// You can assume all file or directory paths are absolute paths which begin with / and do not end with / except that the path is just "/".
// You can assume that all operations will be passed valid parameters and users will not attempt to retrieve file content or list a directory or file that does not exist.
// You can assume that all directory names and file names only contain lower-case letters, and same names won't exist in the same directory.
//

class FileSystem {
    class Node {
        String name;
        String content;
        boolean isFile = false;
        Map<String, Node> children = new HashMap<>();

        public Node(String name) {
            this(name, "");
        }
        public Node(String name, String content) {
            this.name = name;
            this.content = content;
        }
    }

    Node root;

    public FileSystem() {
        root = new Node("");
    }

    public List<String> ls(String path) {
        List<String> files;
        String[] names = path.split("/");
        Node cur = root;
        for (int i = 1; i < names.length; i++) {
            if (!cur.children.containsKey(names[i])) {
                return null;
            }
            cur = cur.children.get(names[i]);
        }
        if (cur.isFile) {
            files = new ArrayList<>();
            files.add(cur.name);
        } else {
            files = new ArrayList<>(cur.children.keySet());
            Collections.sort(files);
        }
        return files;
    }

    public void mkdir(String path) {
        String[] names = path.split("/");
        Node cur = root;
        for (int i = 1; i < names.length; i++) {
            if (!cur.children.containsKey(names[i])) {
                cur.children.put(names[i], new Node(names[i]));
            }
            cur = cur.children.get(names[i]);
        }
    }

    public void addContentToFile(String filePath, String content) {
        String[] names = filePath.split("/");
        Node cur = root;
        for (int i = 1; i < names.length - 1; i++) {
            cur = cur.children.get(names[i]);
        }
        String fileName = names[names.length - 1];
        if (!cur.children.containsKey(fileName)) {
            cur.children.put(fileName, new Node(fileName));
        }
        Node f = cur.children.get(fileName);
        f.isFile = true;
        f.content += content;
    }

    public String readContentFromFile(String filePath) {
        String[] names = filePath.split("/");
        Node cur = root;
        for (int i = 1; i < names.length - 1; i++) {
            cur = cur.children.get(names[i]);
        }
        String fileName = names[names.length - 1];
        return cur.children.get(fileName).content;
    }
}

/**
 * Your FileSystem object will be instantiated and called as such:
 * FileSystem obj = new FileSystem();
 * List<String> param_1 = obj.ls(path);
 * obj.mkdir(path);
 * obj.addContentToFile(filePath,content);
 * String param_4 = obj.readContentFromFile(filePath);
 */
