module Tourmaline::Models
  class InlineQuery
    def answer(results, **kwargs)
      client.answer_inline_query(id, results, **kwargs)
    end
  end
end
