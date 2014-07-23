module LikesCounter

  class Page

    attr_accessor :id, :name, :likes

    def self.by_id(*ids)
      Query.instance.pages_by_id(ids)
    end

    def to_s
      "#{name} (#{id}): #{likes}"
    end

  end

end
