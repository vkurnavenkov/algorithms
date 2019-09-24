# LeetCode 359. Logger Rate Limiter
# https://leetcode.com/problems/logger-rate-limiter/
#
# Design a logger system that receive stream of messages along with its timestamps, each message should be printed if and only if it is not printed in the last 10 seconds.
#
# Given a message and a timestamp (in seconds granularity), return true if the message should be printed in the given timestamp, otherwise returns false.
#
# It is possible that several messages arrive roughly at the same time.
#
# Example:
#
# Logger logger = new Logger();
#
# // logging string "foo" at timestamp 1
# logger.shouldPrintMessage(1, "foo"); returns true;
#
# // logging string "bar" at timestamp 2
# logger.shouldPrintMessage(2,"bar"); returns true;
#
# // logging string "foo" at timestamp 3
# logger.shouldPrintMessage(3,"foo"); returns false;
#
# // logging string "bar" at timestamp 8
# logger.shouldPrintMessage(8,"bar"); returns false;
#
# // logging string "foo" at timestamp 10
# logger.shouldPrintMessage(10,"foo"); returns false;
#
# // logging string "foo" at timestamp 11
# logger.shouldPrintMessage(11,"foo"); returns true;
#

class Logger

=begin
    Initialize your data structure here.
=end
    def initialize()
        @messages = {}
    end


=begin
    Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity.
    :type timestamp: Integer
    :type message: String
    :rtype: Boolean
=end
    def should_print_message(timestamp, message)
        result = true
        if @messages.key?(message)
            result = timestamp - @messages[message] >= 10
        end
        @messages[message] = timestamp if result
        result
    end
end

# Your Logger object will be instantiated and called as such:
# obj = Logger.new()
# param_1 = obj.should_print_message(timestamp, message)
