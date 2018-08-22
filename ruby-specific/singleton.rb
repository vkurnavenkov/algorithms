# class Configuration
#   def self.instance
#     @@instance
#   end
#
#   @@instance = Configuration.new
#
#   private_class_method :new
# end
#
# puts Configuration.instance

class Configuration
  def self.instance
    @@instance ||= Configuration.new
  end

  private_class_method :new
end

puts Configuration.instance
