# LeetCode 362. Design Hit Counter
# https://leetcode.com/problems/design-hit-counter/
#
# Design a hit counter which counts the number of hits received in the past 5 minutes.
#
# Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.
#
# It is possible that several hits arrive roughly at the same time.
#
# Example:
#
# HitCounter counter = new HitCounter();
#
# // hit at timestamp 1.
# counter.hit(1);
#
# // hit at timestamp 2.
# counter.hit(2);
#
# // hit at timestamp 3.
# counter.hit(3);
#
# // get hits at timestamp 4, should return 3.
# counter.getHits(4);
#
# // hit at timestamp 300.
# counter.hit(300);
#
# // get hits at timestamp 300, should return 4.
# counter.getHits(300);
#
# // get hits at timestamp 301, should return 3.
# counter.getHits(301);
#

class HitCounter

=begin
    Initialize your data structure here.
=end
    def initialize()
        @queue = []
    end


=begin
    Record a hit.
        @param timestamp - The current timestamp (in seconds granularity).
    :type timestamp: Integer
    :rtype: Void
=end
    def hit(timestamp)
        clear_queue(@queue, timestamp)
        @queue.push(timestamp)
    end

=begin
    Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity).
    :type timestamp: Integer
    :rtype: Integer
=end
    def get_hits(timestamp)
        clear_queue(@queue, timestamp)
        @queue.size
    end

    private

    def clear_queue(queue, timestamp)
        while !queue.empty? && timestamp - queue.first >= 300
            queue.shift
        end
    end
end

# Your HitCounter object will be instantiated and called as such:
# obj = HitCounter.new()
# obj.hit(timestamp)
# param_2 = obj.get_hits(timestamp)
