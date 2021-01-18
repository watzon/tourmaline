module Tourmaline::Models
  class CallbackQuery
    def answer(*args, **kwargs)
      client.answer_callback_query(id, *args, **kwargs)
    end
  end
end
