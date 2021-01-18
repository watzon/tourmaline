module Tourmaline::Models
  class ShippingQuery
    def answer(ok, **kwargs)
      client.answer_shipping_query(id, ok, **kwargs)
    end
  end
end
