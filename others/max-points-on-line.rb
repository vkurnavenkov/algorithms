# Definition for a point.
# class Point
#     attr_accessor :x, :y
#     def initialize(x=0, y=0)
#         @x = x
#         @y = y
#     end
# end

def gcd(n1, n2)
    if n1.abs < n2.abs
        n1, n2 = n2, n1
    end
    return n1 if n2 == 0
    gcd(n2, n1 % n2)
end

# @param {Point[]} points
# @return {Integer}
def max_points(points)
    max_count = 0
    slope_counts = Hash.new { |h, k| h[k] = 0 }
    for i in 0..points.size - 1
        p1 = points[i]
        # puts "=== #{p1.x},#{p1.y}"
        vertical_count = 0
        overlap_count = 0
        cur_count = 0
        for j in i + 1..points.size - 1
            p2 = points[j]
            # puts "#{p2.x},#{p2.y}"
            if p1.x == p2.x && p1.y == p2.y
                overlap_count += 1
            elsif p1.x == p2.x
                vertical_count += 1
                cur_count = [cur_count, vertical_count].max
                # puts "Vertical : #{vertical_count}"
            else
                dx, dy = p2.x - p1.x, p2.y - p1.y
                # puts "dx: #{dx}, dy: #{dy}"
                g = gcd(dy, dx)
                # g = dy.gcd(dx)
                dx /= g
                dy /= g
                slope_counts[[dy, dx]] += 1
                # puts "Slope #{[dy, dx]}: #{slope_counts[[dy, dx]]}"
                cur_count = [cur_count, slope_counts[[dy, dx]]].max
            end
            # puts "Cur: #{cur_count}"
        end
        max_count = [max_count, cur_count + overlap_count + 1].max
        slope_counts.clear
    end
    max_count
end

puts max_points([[1,1],[2,2],[3,3]]) # 3
puts max_points([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]) # 4
