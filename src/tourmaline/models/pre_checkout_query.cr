module Tourmaline::Models
  class PreCheckoutQuery
    def answer(ok, **kwargs)
      client.answer_pre_checkout_query(id, ok, **kwargs)
    end
  end
end
