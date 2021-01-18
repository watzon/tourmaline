module Tourmaline::Models
  class BotCommand
    def to_h
      {"command" => command, "description" => description}
    end
  end
end
