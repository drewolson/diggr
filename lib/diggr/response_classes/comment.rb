module Diggr
  class Comment
    attr_accessor :date, :id, :story, :up, :down, :replies, :replyto, :user, :content, :level, :root

    def self.new_from_parsed_json(data)
      comment = Comment.new

      data.each do |key,val|
        comment.send("#{key}=",val)
      end

      comment
    end  
  end
end
