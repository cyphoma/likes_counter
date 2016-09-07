module LikesCounter

  class Page

    attr_accessor :id, :name, :likes

    def to_s
      "#{name} (#{id}): #{likes}"
    end

  end

end
