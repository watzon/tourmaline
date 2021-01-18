module Tourmaline::Models
  class Poll
    enum Type
      Quiz
      Regular
    end

    def quiz?
      @type.quiz?
    end

    def regular?
      @type.regular?
    end
  end
end
