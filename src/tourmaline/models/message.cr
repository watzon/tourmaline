module Tourmaline::Models
  class Message
    def reply_message
      reply_to_message
    end

    def link
      if chat.username
        "https://t.me/#{chat.username}/#{message_id}"
      else
        "https://t.me/c/#{chat.id.to_s[5..]}/#{message_id}"
      end
    end

    def text_entities
      [entities, caption_entities].flatten.reduce({} of MessageEntity => String) do |acc, ent|
        acc[ent] = text.to_s[ent.offset..ent.length]
        acc
      end
    end

    def raw_text(parse_mode : ParseMode = :markdown)
      if txt = text
        Helpers.unparse_text(txt, entities, parse_mode)
      end
    end

    def raw_caption(parse_mode : ParseMode = :markdown)
      if txt = caption
        Helpers.unparse_text(txt, entities, parse_mode)
      end
    end

    def users
      users = [] of User?
      users << self.from
      users << self.forward_from
      users << self.left_chat_member
      users.concat(self.new_chat_members)
      users.compact.uniq
    end

    def users(&block : User ->)
      self.users.each { |u| block.call(u) }
    end

    def chats
      chats = [] of Chat?
      chats << self.chat
      chats << self.forward_from_chat
      if reply_message = self.reply_message
        chats.concat(reply_message.chats)
      end
      chats.compact.uniq
    end

    def chats(&block : Chat ->)
      self.chats.each { |c| block.call(c) }
    end

    # Delete the message. See `Tourmaline::Client#delete_message`.
    def delete
      client.delete_message(chat, message_id)
    end

    # Edits the message's media. See `Tourmaline::Client#edit_message_media`
    def edit_media(media, **kwargs)
      client.edit_message_media(chat, media, **kwargs, message: message_id)
    end

    # Edits the message's caption. See `Tourmaline::Client#edit_message_caption`
    def edit_caption(caption, **kwargs)
      client.edit_message_caption(chat, caption, **kwargs, message: message_id)
    end

    # Set the reply markup for the message. See `Tourmaline::Client#edit_message_reply_markup`.
    def edit_reply_markup(reply_markup)
      client.edit_message_reply_markup(chat, message: message_id, reply_markup: reply_markup)
    end

    # Edits the text of a message. See `Tourmaline::Client#edit_message_text`.
    def edit_text(text, **kwargs)
      client.edit_message_text(chat, text, **kwargs, message: message_id)
    end

    # Edits the message's live_location. See `Tourmaline::Client#edit_message_live_location`
    def edit_live_location(lat, long, **kwargs)
      client.edit_message_live_location(chat, lat, long, **kwargs, message: message_id)
    end

    # Forward the message to another chat. See `Tourmaline::Client#forward_message`.
    def forward(to_chat, **kwargs)
      client.forward_message(to_chat, chat, message_id, **kwargs)
    end

    # Pin the message. See `Tourmaline::Client#pin_chat_message`.
    def pin(**kwargs)
      client.pin_chat_message(chat, message_id, **kwargs)
    end

    # Unpin the message. See `Tourmaline::Client#unpin_chat_message`.
    def unpin(**kwargs)
      client.unpin_chat_message(chat, message_id, **kwargs)
    end

    # Reply to a message. See `Tourmaline::Client#send_message`.
    def reply(message, **kwargs)
      client.send_message(chat, message, **kwargs, reply_to_message: message_id)
    end

    # Respond to a message. See `Tourmaline::Client#send_message`.
    def respond(message, **kwargs)
      client.send_message(chat, message, **kwargs)
    end

    {% for content_type in %w[audio animation contact document location photo media_group venu video video_note voice invoice poll dice dart basketball slot_machine] %}
      def reply_with_{{content_type.id}}(*args, **kwargs)
        client.send_{{content_type.id}}(chat, *args, **kwargs, reply_to_message: message_id)
      end

      def respond_with_{{content_type.id}}(*args, **kwargs)
        client.send_{{content_type.id}}(chat, *args, **kwargs)
      end
    {% end %}

    def edit_live_location(latitude, longitude, **kwargs)
      client.edit_message_live_location(chat, latitude, longitude, **kwargs, message: message_id)
    end

    def stop_live_location(**kwargs)
      client.stop_message_live_location(chat, message_id, **kwargs)
    end
  end
end
