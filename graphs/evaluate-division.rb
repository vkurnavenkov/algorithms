# Letcode 399. Evaluate Division
#
# Equations are given in the format A / B = k, where A and B are variables represented as strings, and k is a real number (floating point number). Given some queries, return the answers. If the answer does not exist, return -1.0.
#
# Example:
# Given a / b = 2.0, b / c = 3.0.
# queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ? .
# return [6.0, 0.5, -1.0, 1.0, -1.0 ].
#
# equations = [ ["a", "b"], ["b", "c"] ],
# values = [2.0, 3.0],
# queries = [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ].
#

def dfs(vars_map, visited, cur_var, target_var)
    return nil if vars_map[cur_var].empty?
    return nil if visited[cur_var]
    visited[cur_var] = true
    return 1.0 if cur_var == target_var
    return vars_map[cur_var][target_var] if vars_map[cur_var][target_var]

    vars_map[cur_var].keys.each do |v|
        rv = dfs(vars_map, visited, v, target_var)
        return rv * vars_map[cur_var][v] if rv
    end
    nil
end

def calc_equation(equations, values, queries)
    vars_map =
        equations.each.with_index.reduce(Hash.new { |h, k| h[k] = {} }) do |rv, (equation, idx)|
            var1, var2 = equation
            rv[var1][var2] = values[idx]
            rv[var2][var1] = 1 / values[idx]
            rv
        end
    queries.map do |(var1, var2)|
        dfs(vars_map, {}, var1, var2) || -1.0
    end
end

equations = [ ["a", "b"], ["b", "c"] ],
values = [2.0, 3.0],
queries = [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ].
puts calc_equation(equations, values, queries) # [6.0, 0.5, -1.0, 1.0, -1.0 ]
