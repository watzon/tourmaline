module Tourmaline::Models
  class MessageEntity
    enum Type
     Mention
     TextMention
     Hashtag
     Cashtag
     BotCommand
     Url
     Email
     PhoneNumber
     Bold
     Italic
     Code
     Pre
     TextLink
     Underline
     Strikethrough
    end

    {% for type in MessageEntity::Type.constants %}
    def {{ type.id.underscore }}?
      @type.{{ type.id.underscore }}?
    end
    {% end %}
  end
end
