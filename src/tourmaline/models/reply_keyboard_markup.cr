require "json"
require "../keyboard_builder"

module Tourmaline::Models
  alias Button = KeyboardButton | InlineKeyboardButton

  class ReplyKeyboardMarkup
    def <<(row : Int32, key : KeyboardButton)
      keyboard[row] << key
    end

    def <<(keys : Array(KeyboardButton))
      keyboard << keys
    end

    def swap_row(row : Int32, keys : Array(KeyboardButton))
      keyboard[row] = keys
    end

    def delete_row(row)
      keyboard[row].delete
    end

    def size
      keyboard.size
    end

    def self.build(*args, columns = nil, **options)
      builder = Builder.new(*args, **options)
      with builder yield builder
      builder.keyboard(columns)
    end

    class Builder < KeyboardBuilder(KeyboardButton, ReplyKeyboardMarkup)
      def keyboard(columns = nil) : G
        buttons = KeyboardBuilder(T, G).build_keyboard(@keyboard, columns: columns || 1)
        ReplyKeyboardMarkup.new(buttons, @resize, @one_time, @selective)
      end

      def text_button(text)
        button(text)
      end

      def contact_request_button(text)
        button(text, request_contact: true)
      end

      def location_request_button(text)
        button(text, request_location: true)
      end

      def poll_request_button(text, type)
        type = KeyboardButtonPollType.new(type.to_s)
        button(text, request_poll: type)
      end
    end
  end
end
