# Leetcode 588. Design In-Memory File System
#
# Design an in-memory file system to simulate the following functions:
#
# ls: Given a path in string format. If it is a file path, return a list that only contains this file's name. If it is a directory path, return the list of file and directory names in this directory. Your output (file and directory names together) should in lexicographic order.
#
# mkdir: Given a directory path that does not exist, you should make a new directory according to the path. If the middle directories in the path don't exist either, you should create them as well. This function has void return type.
#
# addContentToFile: Given a file path and file content in string format. If the file doesn't exist, you need to create that file containing given content. If the file already exists, you need to append given content to original content. This function has void return type.
#
# readContentFromFile: Given a file path, return its content in string format.
#
#
#
# Example:
#
# Input:
# ["FileSystem","ls","mkdir","addContentToFile","ls","readContentFromFile"]
# [[],["/"],["/a/b/c"],["/a/b/c/d","hello"],["/"],["/a/b/c/d"]]
#
# Output:
# [null,[],null,null,["a"],"hello"]
#
# Explanation:
# filesystem
#
#
# Note:
#
# You can assume all file or directory paths are absolute paths which begin with / and do not end with / except that the path is just "/".
# You can assume that all operations will be passed valid parameters and users will not attempt to retrieve file content or list a directory or file that does not exist.
# You can assume that all directory names and file names only contain lower-case letters, and same names won't exist in the same directory.
#

Node = Struct.new(:name, :content, :type, :parent, :children)

class FileSystem
    def initialize()
        @tree = Node.new('', '', 'D', nil, {})
    end

=begin
    :type path: String
    :rtype: String[]
=end
    def ls(path)
        node = find_path(path)
        if node
            node.type == 'D' ? node.children.keys.sort : [node.name]
        else
            []
        end
    end


=begin
    :type path: String
    :rtype: Void
=end
    def mkdir(path)
        create_folder(path)
    end


=begin
    :type file_path: String
    :type content: String
    :rtype: Void
=end
    def add_content_to_file(file_path, content)
        path = file_path.split('/')
        file = path.pop
        node = create_folder(path[1..-1])
        if node.children[file]
            node.children[file].content += content
        else
            file_node = Node.new(file, content, 'F', node, {})
            node.children[file] = file_node
        end
    end


=begin
    :type file_path: String
    :rtype: String
=end
    def read_content_from_file(file_path)
        node = find_path(file_path)
        node ? node.content : ''
    end

    private

    def find_path(path)
        cur = @tree
        names = path.is_a?(Array) ? path : path[1..-1].split('/')
        names.each do |n|
            if cur.children.include?(n)
                cur = cur.children[n]
            else
                return nil
            end
        end
        cur
    end

    def create_folder(path)
        cur = @tree
        names = path.is_a?(Array) ? path : path[1..-1].split('/')
        names.each do |n|
            unless cur.children.include?(n)
                cur.children[n] = Node.new(n, '', 'D', cur, {})
            end
            cur = cur.children[n]
        end
        cur
    end
end

# Your FileSystem object will be instantiated and called as such:
# obj = FileSystem.new()
# param_1 = obj.ls(path)
# obj.mkdir(path)
# obj.add_content_to_file(file_path, content)
# param_4 = obj.read_content_from_file(file_path)
