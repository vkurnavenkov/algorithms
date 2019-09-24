puts 'Hello world - Ruby!'
permutations
[1,2,3] : [1,2,3] , [1, 3,2] [2,1,3] [2,3,1] [3,1,2], [3,2,1]

a[i]: a[0..i-1] - a [i+1..n-1]

function f(a, result, l, r)
result.size == a.size -> result -> results -> return
i = l..r
  f(a, result.push(a[i]), l..i-1)
  f(a, result.push(a[i]), i+1..r)

  results


  [1, 2, 3]

  1 -> [1], [2, 3] -> [1, 2], [3] -> [1, 2, 3]
                   -> [1, 3], [2] -> [1, 3, 2]
    -> [2], [1, 3] -> [2, 1], [3] -> [2, 1, 3]
                   -> [2, 3], [1] -> [2, 3, 1]

    /**
     * Given two nodes of a tree,
     * method should return the deepest common ancestor of those nodes.
     *
     *          A
     *         / \
     *        B   C
     *       / \
     *      D   E
     *         / \
     *        G   F
     *
     *  commonAncestor(D, F) = B
     *  commonAncestor(C, G) = A
     *  commonAncestor(E, B) = B
     */
    final Node parent;
    final Node left;
    final Node right;
 
