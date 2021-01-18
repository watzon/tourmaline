module Tourmaline::Models
  # <p>This object represents the content of a media message to be sent. It should be one of</p>
  # 
  # - `InputMediaAnimation`
  # - `InputMediaDocument`
  # - `InputMediaAudio`
  # - `InputMediaPhoto`
  # - `InputMediaVideo`
  abstract class InputMedia
  end

  # <p>This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:</p>
  # 
  # - `InlineQueryResultCachedAudio`
  # - `InlineQueryResultCachedDocument`
  # - `InlineQueryResultCachedGif`
  # - `InlineQueryResultCachedMpeg4Gif`
  # - `InlineQueryResultCachedPhoto`
  # - `InlineQueryResultCachedSticker`
  # - `InlineQueryResultCachedVideo`
  # - `InlineQueryResultCachedVoice`
  # - `InlineQueryResultArticle`
  # - `InlineQueryResultAudio`
  # - `InlineQueryResultContact`
  # - `InlineQueryResultGame`
  # - `InlineQueryResultDocument`
  # - `InlineQueryResultGif`
  # - `InlineQueryResultLocation`
  # - `InlineQueryResultMpeg4Gif`
  # - `InlineQueryResultPhoto`
  # - `InlineQueryResultVenue`
  # - `InlineQueryResultVideo`
  # - `InlineQueryResultVoice`
  abstract class InlineQueryResult
  end

  # <p>This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 4 types:</p>
  # 
  # - `InputTextMessageContent`
  # - `InputLocationMessageContent`
  # - `InputVenueMessageContent`
  # - `InputContactMessageContent`
  abstract class InputMessageContent
  end

  # <p>This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user. It should be one of:</p>
  # 
  # - `PassportElementErrorDataField`
  # - `PassportElementErrorFrontSide`
  # - `PassportElementErrorReverseSide`
  # - `PassportElementErrorSelfie`
  # - `PassportElementErrorFile`
  # - `PassportElementErrorFiles`
  # - `PassportElementErrorTranslationFile`
  # - `PassportElementErrorTranslationFiles`
  # - `PassportElementErrorUnspecified`
  abstract class PassportElementError
  end

  # <p>This object represents an incoming update.
  # At most **one** of the optional parameters can be present in any given update.</p>
  class Update
    include JSON::Serializable
    include Tourmaline::Model
  
    # The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you're using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
    property update_id : Int64
  
    # New incoming message of any kind — text, photo, sticker, etc.
    property message : Message?
  
    # New version of a message that is known to the bot and was edited
    property edited_message : Message?
  
    # New incoming channel post of any kind — text, photo, sticker, etc.
    property channel_post : Message?
  
    # New version of a channel post that is known to the bot and was edited
    property edited_channel_post : Message?
  
    # New incoming inline query
    property inline_query : InlineQuery?
  
    # The result of an feedback collecting for details on how to enable these updates for your bot.
    property chosen_inline_result : ChosenInlineResult?
  
    # New incoming callback query
    property callback_query : CallbackQuery?
  
    # New incoming shipping query. Only for invoices with flexible price
    property shipping_query : ShippingQuery?
  
    # New incoming pre-checkout query. Contains full information about checkout
    property pre_checkout_query : PreCheckoutQuery?
  
    # New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot
    property poll : Poll?
  
    # A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
    property poll_answer : PollAnswer?
  
    def initialize(@update_id : Int64, @message : Message? = nil, @edited_message : Message? = nil, @channel_post : Message? = nil, @edited_channel_post : Message? = nil, @inline_query : InlineQuery? = nil, @chosen_inline_result : ChosenInlineResult? = nil, @callback_query : CallbackQuery? = nil, @shipping_query : ShippingQuery? = nil, @pre_checkout_query : PreCheckoutQuery? = nil, @poll : Poll? = nil, @poll_answer : PollAnswer? = nil)
    end
  end

  # <p>Contains information about the current status of a webhook.</p>
  class WebhookInfo
    include JSON::Serializable
    include Tourmaline::Model
  
    # Webhook URL, may be empty if webhook is not set up
    property url : String
  
    # True, if a custom certificate was provided for webhook certificate checks
    property has_custom_certificate : Bool = false
  
    # Number of updates awaiting delivery
    property pending_update_count : Int64
  
    # Currently used webhook IP address
    property ip_address : String?
  
    # Unix time for the most recent error that happened when trying to deliver an update via webhook
    @[JSON::Field(converter: Time::EpochConverter)]
    property last_error_date : Time?
  
    # Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
    property last_error_message : String?
  
    # Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
    property max_connections : Int64?
  
    # A list of update types the bot is subscribed to. Defaults to all update types
    property allowed_updates : Array(String) = [] of String
  
    def initialize(@url : String, @pending_update_count : Int64, @has_custom_certificate : Bool = false, @ip_address : String? = nil, @last_error_date : Time? = nil, @last_error_message : String? = nil, @max_connections : Int64? = nil, @allowed_updates : Array(String) = [] of String)
    end
  end

  # <p>This object represents a Telegram user or bot.</p>
  class User
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique identifier for this user or bot
    property id : Int64
  
    # True, if this user is a bot
    property is_bot : Bool = false
  
    # User's or bot's first name
    property first_name : String
  
    # User's or bot's last name
    property last_name : String?
  
    # User's or bot's username
    property username : String?
  
    # IETF language tag of the user's language
    property language_code : String?
  
    # True, if the bot can be invited to groups. Returned only in getMe.
    property can_join_groups : Bool? = false
  
    # True, if getMe.
    property can_read_all_group_messages : Bool? = false
  
    # True, if the bot supports inline queries. Returned only in getMe.
    property supports_inline_queries : Bool? = false
  
    def initialize(@id : Int64, @first_name : String, @is_bot : Bool = false, @last_name : String? = nil, @username : String? = nil, @language_code : String? = nil, @can_join_groups : Bool? = false, @can_read_all_group_messages : Bool? = false, @supports_inline_queries : Bool? = false)
    end
  end

  # <p>This object represents a chat.</p>
  class Chat
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    property id : Int64
  
    # Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    property type : Type
  
    # Title, for supergroups, channels and group chats
    property title : String?
  
    # Username, for private chats, supergroups and channels if available
    property username : String?
  
    # First name of the other party in a private chat
    property first_name : String?
  
    # Last name of the other party in a private chat
    property last_name : String?
  
    # Chat photo. Returned only in getChat.
    property photo : ChatPhoto?
  
    # Bio of the other party in a private chat. Returned only in getChat.
    property bio : String?
  
    # Description, for groups, supergroups and channel chats. Returned only in getChat.
    property description : String?
  
    # Chat invite link, for groups, supergroups and channel chats. Each administrator in a chat generates their own invite links, so the bot must first generate the link using getChat.
    property invite_link : String?
  
    # The most recent pinned message (by sending date). Returned only in getChat.
    property pinned_message : Message?
  
    # Default chat member permissions, for groups and supergroups. Returned only in getChat.
    property permissions : ChatPermissions?
  
    # For supergroups, the minimum allowed delay between consecutive messages sent by each unpriviledged user. Returned only in getChat.
    property slow_mode_delay : Int64?
  
    # For supergroups, name of group sticker set. Returned only in getChat.
    property sticker_set_name : String?
  
    # True, if the bot can change the group sticker set. Returned only in getChat.
    property can_set_sticker_set : Bool? = false
  
    # Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier. Returned only in getChat.
    property linked_chat_id : Int64?
  
    # For supergroups, the location to which the supergroup is connected. Returned only in getChat.
    property location : ChatLocation?
  
    def initialize(@id : Int64, @type : Type, @linked_chat_id : Int64? = nil, @can_set_sticker_set : Bool? = false, @sticker_set_name : String? = nil, @slow_mode_delay : Int64? = nil, @permissions : ChatPermissions? = nil, @pinned_message : Message? = nil, @invite_link : String? = nil, @description : String? = nil, @bio : String? = nil, @photo : ChatPhoto? = nil, @last_name : String? = nil, @first_name : String? = nil, @username : String? = nil, @title : String? = nil, @location : ChatLocation? = nil)
    end
  end

  # <p>This object represents a message.</p>
  class Message
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique message identifier inside this chat
    property message_id : Int64
  
    # Sender, empty for messages sent to channels
    property from : User?
  
    # Sender of the message, sent on behalf of a chat. The channel itself for channel messages. The supergroup itself for messages from anonymous group administrators. The linked channel for messages automatically forwarded to the discussion group
    property sender_chat : Chat?
  
    # Date the message was sent in Unix time
    @[JSON::Field(converter: Time::EpochConverter)]
    property date : Time
  
    # Conversation the message belongs to
    property chat : Chat
  
    # For forwarded messages, sender of the original message
    property forward_from : User?
  
    # For messages forwarded from channels or from anonymous administrators, information about the original sender chat
    property forward_from_chat : Chat?
  
    # For messages forwarded from channels, identifier of the original message in the channel
    property forward_from_message_id : Int64?
  
    # For messages forwarded from channels, signature of the post author if present
    property forward_signature : String?
  
    # Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
    property forward_sender_name : String?
  
    # For forwarded messages, date the original message was sent in Unix time
    @[JSON::Field(converter: Time::EpochConverter)]
    property forward_date : Time?
  
    # For replies, the original message. Note that the Message object in this field will not contain further `reply_to_message` fields even if it itself is a reply.
    property reply_to_message : Message?
  
    # Bot through which the message was sent
    property via_bot : User?
  
    # Date the message was last edited in Unix time
    @[JSON::Field(converter: Time::EpochConverter)]
    property edit_date : Time?
  
    # The unique identifier of a media message group this message belongs to
    property media_group_id : String?
  
    # Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
    property author_signature : String?
  
    # For text messages, the actual UTF-8 text of the message, 0-4096 characters
    property text : String?
  
    # For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    property entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Message is an animation, information about the animation. For backward compatibility, when this field is set, the `document` field will also be set
    property animation : Animation?
  
    # Message is an audio file, information about the file
    property audio : Audio?
  
    # Message is a general file, information about the file
    property document : Document?
  
    # Message is a photo, available sizes of the photo
    property photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize
  
    # Message is a sticker, information about the sticker
    property sticker : Sticker?
  
    # Message is a video, information about the video
    property video : Video?
  
    # Message is a video note, information about the video message
    property video_note : VideoNote?
  
    # Message is a voice message, information about the file
    property voice : Voice?
  
    # Caption for the animation, audio, document, photo, video or voice, 0-1024 characters
    property caption : String?
  
    # For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Message is a shared contact, information about the contact
    property contact : Contact?
  
    # Message is a dice with random value
    property dice : Dice?
  
    # Message is a game, information about the game. More about games »
    property game : Game?
  
    # Message is a native poll, information about the poll
    property poll : Poll?
  
    # Message is a venue, information about the venue. For backward compatibility, when this field is set, the `location` field will also be set
    property venue : Venue?
  
    # Message is a shared location, information about the location
    property location : Location?
  
    # New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    property new_chat_members : Array(User) = [] of Tourmaline::Models::User
  
    # A member was removed from the group, information about them (this member may be the bot itself)
    property left_chat_member : User?
  
    # A chat title was changed to this value
    property new_chat_title : String?
  
    # A chat photo was change to this value
    property new_chat_photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize
  
    # Service message: the chat photo was deleted
    property delete_chat_photo : Bool? = false
  
    # Service message: the group has been created
    property group_chat_created : Bool? = false
  
    # Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    property supergroup_chat_created : Bool? = false
  
    # Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    property channel_chat_created : Bool? = false
  
    # The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    property migrate_to_chat_id : Int64?
  
    # The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    property migrate_from_chat_id : Int64?
  
    # Specified message was pinned. Note that the Message object in this field will not contain further `reply_to_message` fields even if it is itself a reply.
    property pinned_message : Message?
  
    # Message is an invoice for a More about payments »
    property invoice : Invoice?
  
    # Message is a service message about a successful payment, information about the payment. More about payments »
    property successful_payment : SuccessfulPayment?
  
    # The domain name of the website on which the user has logged in. More about Telegram Login »
    property connected_website : String?
  
    # Telegram Passport data
    property passport_data : PassportData?
  
    # Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    property proximity_alert_triggered : ProximityAlertTriggered?
  
    # Inline keyboard attached to the message. `login_url` buttons are represented as ordinary `url` buttons.
    property reply_markup : InlineKeyboardMarkup?
  
    def initialize(@message_id : Int64, @date : Time, @chat : Chat, @contact : Contact? = nil, @dice : Dice? = nil, @game : Game? = nil, @poll : Poll? = nil, @venue : Venue? = nil, @location : Location? = nil, @new_chat_members : Array(User) = [] of Tourmaline::Models::User, @left_chat_member : User? = nil, @new_chat_title : String? = nil, @new_chat_photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize, @delete_chat_photo : Bool? = false, @group_chat_created : Bool? = false, @supergroup_chat_created : Bool? = false, @channel_chat_created : Bool? = false, @migrate_to_chat_id : Int64? = nil, @migrate_from_chat_id : Int64? = nil, @pinned_message : Message? = nil, @invoice : Invoice? = nil, @successful_payment : SuccessfulPayment? = nil, @connected_website : String? = nil, @passport_data : PassportData? = nil, @proximity_alert_triggered : ProximityAlertTriggered? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @caption : String? = nil, @from : User? = nil, @sender_chat : Chat? = nil, @forward_from : User? = nil, @forward_from_chat : Chat? = nil, @forward_from_message_id : Int64? = nil, @forward_signature : String? = nil, @forward_sender_name : String? = nil, @forward_date : Time? = nil, @reply_to_message : Message? = nil, @via_bot : User? = nil, @edit_date : Time? = nil, @media_group_id : String? = nil, @author_signature : String? = nil, @text : String? = nil, @entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @animation : Animation? = nil, @audio : Audio? = nil, @document : Document? = nil, @photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize, @sticker : Sticker? = nil, @video : Video? = nil, @video_note : VideoNote? = nil, @voice : Voice? = nil, @reply_markup : InlineKeyboardMarkup? = nil)
    end
  end

  # <p>This object represents a unique message identifier.</p>
  class MessageId
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique message identifier
    property message_id : Int64
  
    def initialize(@message_id : Int64)
    end
  end

  # <p>This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.</p>
  class MessageEntity
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the entity. Can be “mention” (`@username`), “hashtag” (`#hashtag`), “cashtag” (`$USD`), “bot_command” (`/start@jobs_bot`), “url” (`https://telegram.org`), “email” (`do-not-reply@telegram.org`), “phone_number” (`+1-212-555-0123`), “bold” (**bold text**), “italic” (`italic text`), “underline” (underlined text), “strikethrough” (strikethrough text), “code” (monowidth string), “pre” (monowidth block), “text_link” (for clickable text URLs), “text_mention” (for users without usernames)
    property type : Type
  
    # Offset in UTF-16 code units to the start of the entity
    property offset : Int64
  
    # Length of the entity in UTF-16 code units
    property length : Int64
  
    # For “text_link” only, url that will be opened after user taps on the text
    property url : String?
  
    # For “text_mention” only, the mentioned user
    property user : User?
  
    # For “pre” only, the programming language of the entity text
    property language : String?
  
    def initialize(@type : Type, @offset : Int64, @length : Int64, @url : String? = nil, @user : User? = nil, @language : String? = nil)
    end
  end

  # <p>This object represents one size of a photo or a sticker thumbnail.</p>
  class PhotoSize
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Photo width
    property width : Int64
  
    # Photo height
    property height : Int64
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @width : Int64, @height : Int64, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).</p>
  class Animation
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Video width as defined by sender
    property width : Int64
  
    # Video height as defined by sender
    property height : Int64
  
    # Duration of the video in seconds as defined by sender
    property duration : Int64
  
    # Animation thumbnail as defined by sender
    property thumb : PhotoSize?
  
    # Original animation filename as defined by sender
    property file_name : String?
  
    # MIME type of the file as defined by sender
    property mime_type : String?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @width : Int64, @height : Int64, @duration : Int64, @thumb : PhotoSize? = nil, @file_name : String? = nil, @mime_type : String? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents an audio file to be treated as music by the Telegram clients.</p>
  class Audio
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Duration of the audio in seconds as defined by sender
    property duration : Int64
  
    # Performer of the audio as defined by sender or by audio tags
    property performer : String?
  
    # Title of the audio as defined by sender or by audio tags
    property title : String?
  
    # Original filename as defined by sender
    property file_name : String?
  
    # MIME type of the file as defined by sender
    property mime_type : String?
  
    # File size
    property file_size : Int64?
  
    # Thumbnail of the album cover to which the music file belongs
    property thumb : PhotoSize?
  
    def initialize(@file_id : String, @file_unique_id : String, @duration : Int64, @performer : String? = nil, @title : String? = nil, @file_name : String? = nil, @mime_type : String? = nil, @file_size : Int64? = nil, @thumb : PhotoSize? = nil)
    end
  end

  # <p>This object represents a general file (as opposed to audio files).</p>
  class Document
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Document thumbnail as defined by sender
    property thumb : PhotoSize?
  
    # Original filename as defined by sender
    property file_name : String?
  
    # MIME type of the file as defined by sender
    property mime_type : String?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @thumb : PhotoSize? = nil, @file_name : String? = nil, @mime_type : String? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents a video file.</p>
  class Video
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Video width as defined by sender
    property width : Int64
  
    # Video height as defined by sender
    property height : Int64
  
    # Duration of the video in seconds as defined by sender
    property duration : Int64
  
    # Video thumbnail
    property thumb : PhotoSize?
  
    # Original filename as defined by sender
    property file_name : String?
  
    # Mime type of a file as defined by sender
    property mime_type : String?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @width : Int64, @height : Int64, @duration : Int64, @thumb : PhotoSize? = nil, @file_name : String? = nil, @mime_type : String? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents a v.4.0).</p>
  class VideoNote
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Video width and height (diameter of the video message) as defined by sender
    property length : Int64
  
    # Duration of the video in seconds as defined by sender
    property duration : Int64
  
    # Video thumbnail
    property thumb : PhotoSize?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @length : Int64, @duration : Int64, @thumb : PhotoSize? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents a voice note.</p>
  class Voice
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Duration of the audio in seconds as defined by sender
    property duration : Int64
  
    # MIME type of the file as defined by sender
    property mime_type : String?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @duration : Int64, @mime_type : String? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents a phone contact.</p>
  class Contact
    include JSON::Serializable
    include Tourmaline::Model
  
    # Contact's phone number
    property phone_number : String
  
    # Contact's first name
    property first_name : String
  
    # Contact's last name
    property last_name : String?
  
    # Contact's user identifier in Telegram
    property user_id : Int64?
  
    # Additional data about the contact in the form of a vCard
    property vcard : String?
  
    def initialize(@phone_number : String, @first_name : String, @last_name : String? = nil, @user_id : Int64? = nil, @vcard : String? = nil)
    end
  end

  # <p>This object represents an animated emoji that displays a random value.</p>
  class Dice
    include JSON::Serializable
    include Tourmaline::Model
  
    # Emoji on which the dice throw animation is based
    property emoji : String
  
    # Value of the dice, 1-6 for “![🎲](https://telegram.org/img/emoji/40/F09F8EB2.png)” and “![🎯](https://telegram.org/img/emoji/40/F09F8EAF.png)” base emoji, 1-5 for “![🏀](https://telegram.org/img/emoji/40/F09F8F80.png)” and “![⚽](https://telegram.org/img/emoji/40/E29ABD.png)” base emoji, 1-64 for “![🎰](https://telegram.org/img/emoji/40/F09F8EB0.png)” base emoji
    property value : Int64
  
    def initialize(@emoji : String, @value : Int64)
    end
  end

  # <p>This object contains information about one answer option in a poll.</p>
  class PollOption
    include JSON::Serializable
    include Tourmaline::Model
  
    # Option text, 1-100 characters
    property text : String
  
    # Number of users that voted for this option
    property voter_count : Int64
  
    def initialize(@text : String, @voter_count : Int64)
    end
  end

  # <p>This object represents an answer of a user in a non-anonymous poll.</p>
  class PollAnswer
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique poll identifier
    property poll_id : String
  
    # The user, who changed the answer to the poll
    property user : User
  
    # 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    property option_ids : Array(Int64) = [] of Int64
  
    def initialize(@poll_id : String, @user : User, @option_ids : Array(Int64) = [] of Int64)
    end
  end

  # <p>This object contains information about a poll.</p>
  class Poll
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique poll identifier
    property id : String
  
    # Poll question, 1-300 characters
    property question : String
  
    # List of poll options
    property options : Array(PollOption) = [] of Tourmaline::Models::PollOption
  
    # Total number of users that voted in the poll
    property total_voter_count : Int64
  
    # True, if the poll is closed
    property is_closed : Bool = false
  
    # True, if the poll is anonymous
    property is_anonymous : Bool = false
  
    # Poll type, currently can be “regular” or “quiz”
    property type : Type
  
    # True, if the poll allows multiple answers
    property allows_multiple_answers : Bool = false
  
    # 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.
    property correct_option_id : Int64?
  
    # Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    property explanation : String?
  
    # Special entities like usernames, URLs, bot commands, etc. that appear in the `explanation`
    property explanation_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Amount of time in seconds the poll will be active after creation
    property open_period : Int64?
  
    # Point in time (Unix timestamp) when the poll will be automatically closed
    @[JSON::Field(converter: Time::EpochConverter)]
    property close_date : Time?
  
    def initialize(@id : String, @question : String, @total_voter_count : Int64, @type : Type, @options : Array(PollOption) = [] of Tourmaline::Models::PollOption, @is_closed : Bool = false, @is_anonymous : Bool = false, @allows_multiple_answers : Bool = false, @correct_option_id : Int64? = nil, @explanation : String? = nil, @explanation_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @open_period : Int64? = nil, @close_date : Time? = nil)
    end
  end

  # <p>This object represents a point on the map.</p>
  class Location
    include JSON::Serializable
    include Tourmaline::Model
  
    # Longitude as defined by sender
    property longitude : Float64
  
    # Latitude as defined by sender
    property latitude : Float64
  
    # The radius of uncertainty for the location, measured in meters; 0-1500
    property horizontal_accuracy : Float64?
  
    # Time relative to the message sending date, during which the location can be updated, in seconds. For active live locations only.
    property live_period : Int64?
  
    # The direction in which user is moving, in degrees; 1-360. For active live locations only.
    property heading : Int64?
  
    # Maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only.
    property proximity_alert_radius : Int64?
  
    def initialize(@longitude : Float64, @latitude : Float64, @horizontal_accuracy : Float64? = nil, @live_period : Int64? = nil, @heading : Int64? = nil, @proximity_alert_radius : Int64? = nil)
    end
  end

  # <p>This object represents a venue.</p>
  class Venue
    include JSON::Serializable
    include Tourmaline::Model
  
    # Venue location. Can't be a live location
    property location : Location
  
    # Name of the venue
    property title : String
  
    # Address of the venue
    property address : String
  
    # Foursquare identifier of the venue
    property foursquare_id : String?
  
    # Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    property foursquare_type : String?
  
    # Google Places identifier of the venue
    property google_place_id : String?
  
    # Google Places type of the venue. (See supported types.)
    property google_place_type : String?
  
    def initialize(@location : Location, @title : String, @address : String, @foursquare_id : String? = nil, @foursquare_type : String? = nil, @google_place_id : String? = nil, @google_place_type : String? = nil)
    end
  end

  # <p>This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user.</p>
  class ProximityAlertTriggered
    include JSON::Serializable
    include Tourmaline::Model
  
    # User that triggered the alert
    property traveler : User
  
    # User that set the alert
    property watcher : User
  
    # The distance between the users
    property distance : Int64
  
    def initialize(@traveler : User, @watcher : User, @distance : Int64)
    end
  end

  # <p>This object represent a user's profile pictures.</p>
  class UserProfilePhotos
    include JSON::Serializable
    include Tourmaline::Model
  
    # Total number of profile pictures the target user has
    property total_count : Int64
  
    # Requested profile pictures (in up to 4 sizes each)
    property photos : Array(Array(PhotoSize)) = [] of Array(Tourmaline::Models::PhotoSize)
  
    def initialize(@total_count : Int64, @photos : Array(Array(PhotoSize)) = [] of Array(Tourmaline::Models::PhotoSize))
    end
  end

  # <p>This object represents a file ready to be downloaded. The file can be downloaded via the link `https://api.telegram.org/file/bot&lt;token&gt;/&lt;file_path&gt;`. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.</p>
  class TFile
    include JSON::Serializable
    include Tourmaline::Model
    def initialize
    end
  end

  # <p>This object represents a Introduction to bots for details and examples).</p>
  class ReplyKeyboardMarkup
    include JSON::Serializable
    include Tourmaline::Model
  
    # Array of button rows, each represented by an Array of KeyboardButton objects
    property keyboard : Array(Array(KeyboardButton)) = [] of Array(Tourmaline::Models::KeyboardButton)
  
    # Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to `false`, in which case the custom keyboard is always of the same height as the app's standard keyboard.
    property resize_keyboard : Bool? = false
  
    # Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to `false`.
    property one_time_keyboard : Bool? = false
  
    # Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the `text` of the Message object; 2) if the bot's message is a reply (has `reply_to_message_id`), sender of the original message.
    # 
    # __Example:__ A user requests to change the bot's language, bot replies to the request with a keyboard to select the new language. Other users in the group don't see the keyboard.
    property selective : Bool? = false
  
    def initialize(@keyboard : Array(Array(KeyboardButton)) = [] of Array(Tourmaline::Models::KeyboardButton), @resize_keyboard : Bool? = false, @one_time_keyboard : Bool? = false, @selective : Bool? = false)
    end
  end

  # <p>This object represents one button of the reply keyboard. For simple text buttons `String` can be used instead of this object to specify text of the button. Optional fields `request_contact`, `request_location`, and `request_poll` are mutually exclusive.</p>
  class KeyboardButton
    include JSON::Serializable
    include Tourmaline::Model
  
    # Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
    property text : String
  
    # If `True`, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only
    property request_contact : Bool? = false
  
    # If `True`, the user's current location will be sent when the button is pressed. Available in private chats only
    property request_location : Bool? = false
  
    # If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only
    property request_poll : KeyboardButtonPollType?
  
    def initialize(@text : String, @request_contact : Bool? = false, @request_location : Bool? = false, @request_poll : KeyboardButtonPollType? = nil)
    end
  end

  # <p>This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed.</p>
  class KeyboardButtonPollType
    include JSON::Serializable
    include Tourmaline::Model
  
    # If `quiz` is passed, the user will be allowed to create only polls in the quiz mode. If `regular` is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type.
    property type : Type?
  
    def initialize(@type : Type? = nil)
    end
  end

  # <p>Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).</p>
  class ReplyKeyboardRemove
    include JSON::Serializable
    include Tourmaline::Model
  
    # Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use `one_time_keyboard` in ReplyKeyboardMarkup)
    property remove_keyboard : Bool = false
  
    # Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the `text` of the Message object; 2) if the bot's message is a reply (has `reply_to_message_id`), sender of the original message.
    # 
    # __Example:__ A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
    property selective : Bool? = false
  
    def initialize(@remove_keyboard : Bool = false, @selective : Bool? = false)
    end
  end

  # <p>This object represents an inline keyboard that appears right next to the message it belongs to.</p>
  class InlineKeyboardMarkup
    include JSON::Serializable
    include Tourmaline::Model
  
    # Array of button rows, each represented by an Array of InlineKeyboardButton objects
    property inline_keyboard : Array(Array(InlineKeyboardButton)) = [] of Array(Tourmaline::Models::InlineKeyboardButton)
  
    def initialize(@inline_keyboard : Array(Array(InlineKeyboardButton)) = [] of Array(Tourmaline::Models::InlineKeyboardButton))
    end
  end

  # <p>This object represents one button of an inline keyboard. You **must** use exactly one of the optional fields.</p>
  class InlineKeyboardButton
    include JSON::Serializable
    include Tourmaline::Model
  
    # Label text on the button
    property text : String
  
    # HTTP or tg:// url to be opened when button is pressed
    property url : String?
  
    # An HTTP URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
    property login_url : LoginUrl?
  
    # Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
    property callback_data : String?
  
    # If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. Can be empty, in which case just the bot's username will be inserted.
    # 
    # **Note:** This offers an easy way for users to start using your bot in `switch_pm…` actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
    property switch_inline_query : String?
  
    # If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot's username will be inserted.
    # 
    # This offers a quick way for the user to open your bot in inline mode in the same chat – good for selecting something from multiple options.
    property switch_inline_query_current_chat : String?
  
    # Description of the game that will be launched when the user presses the button.
    # 
    # **NOTE:** This type of button **must** always be the first button in the first row.
    property callback_game : CallbackGame?
  
    # Specify True, to send a Pay button.
    # 
    # **NOTE:** This type of button **must** always be the first button in the first row.
    property pay : Bool? = false
  
    def initialize(@text : String, @url : String? = nil, @login_url : LoginUrl? = nil, @callback_data : String? = nil, @switch_inline_query : String? = nil, @switch_inline_query_current_chat : String? = nil, @callback_game : CallbackGame? = nil, @pay : Bool? = false)
    end
  end

  # <p>This object represents a parameter of the inline keyboard button used to automatically authorize a user. Serves as a great replacement for the Telegram Login Widget when the user is coming from Telegram. All the user needs to do is tap/click a button and confirm that they want to log in:</p>
  class LoginUrl
    include JSON::Serializable
    include Tourmaline::Model
    def initialize
    end
  end

  # <p>This object represents an incoming callback query from a callback button in an inline mode), the field `inline_message_id` will be present. Exactly one of the fields `data` or `game_short_name` will be present.</p>
  class CallbackQuery
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique identifier for this query
    property id : String
  
    # Sender
    property from : User
  
    # Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
    property message : Message?
  
    # Identifier of the message sent via the bot in inline mode, that originated the query.
    property inline_message_id : String?
  
    # Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    property chat_instance : String
  
    # Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
    property data : String?
  
    # Short name of a Game to be returned, serves as the unique identifier for the game
    property game_short_name : String?
  
    def initialize(@id : String, @from : User, @chat_instance : String, @message : Message? = nil, @inline_message_id : String? = nil, @data : String? = nil, @game_short_name : String? = nil)
    end
  end

  # <p>Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot's message and tapped 'Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.</p>
  class ForceReply
    include JSON::Serializable
    include Tourmaline::Model
  
    # Shows reply interface to the user, as if they manually selected the bot's message and tapped 'Reply'
    property force_reply : Bool = false
  
    # Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the `text` of the Message object; 2) if the bot's message is a reply (has `reply_to_message_id`), sender of the original message.
    property selective : Bool? = false
  
    def initialize(@force_reply : Bool = false, @selective : Bool? = false)
    end
  end

  # <p>This object represents a chat photo.</p>
  class ChatPhoto
    include JSON::Serializable
    include Tourmaline::Model
  
    # File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    property small_file_id : String
  
    # Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property small_file_unique_id : String
  
    # File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    property big_file_id : String
  
    # Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property big_file_unique_id : String
  
    def initialize(@small_file_id : String, @small_file_unique_id : String, @big_file_id : String, @big_file_unique_id : String)
    end
  end

  # <p>This object contains information about one member of a chat.</p>
  class ChatMember
    include JSON::Serializable
    include Tourmaline::Model
  
    # Information about the user
    property user : User
  
    # The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
    property status : String
  
    # Owner and administrators only. Custom title for this user
    property custom_title : String?
  
    # Owner and administrators only. True, if the user's presence in the chat is hidden
    property is_anonymous : Bool? = false
  
    # Administrators only. True, if the bot is allowed to edit administrator privileges of that user
    property can_be_edited : Bool? = false
  
    # Administrators only. True, if the administrator can post in the channel; channels only
    property can_post_messages : Bool? = false
  
    # Administrators only. True, if the administrator can edit messages of other users and can pin messages; channels only
    property can_edit_messages : Bool? = false
  
    # Administrators only. True, if the administrator can delete messages of other users
    property can_delete_messages : Bool? = false
  
    # Administrators only. True, if the administrator can restrict, ban or unban chat members
    property can_restrict_members : Bool? = false
  
    # Administrators only. True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    property can_promote_members : Bool? = false
  
    # Administrators and restricted only. True, if the user is allowed to change the chat title, photo and other settings
    property can_change_info : Bool? = false
  
    # Administrators and restricted only. True, if the user is allowed to invite new users to the chat
    property can_invite_users : Bool? = false
  
    # Administrators and restricted only. True, if the user is allowed to pin messages; groups and supergroups only
    property can_pin_messages : Bool? = false
  
    # Restricted only. True, if the user is a member of the chat at the moment of the request
    property is_member : Bool? = false
  
    # Restricted only. True, if the user is allowed to send text messages, contacts, locations and venues
    property can_send_messages : Bool? = false
  
    # Restricted only. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes
    property can_send_media_messages : Bool? = false
  
    # Restricted only. True, if the user is allowed to send polls
    property can_send_polls : Bool? = false
  
    # Restricted only. True, if the user is allowed to send animations, games, stickers and use inline bots
    property can_send_other_messages : Bool? = false
  
    # Restricted only. True, if the user is allowed to add web page previews to their messages
    property can_add_web_page_previews : Bool? = false
  
    # Restricted and kicked only. Date when restrictions will be lifted for this user; unix time
    @[JSON::Field(converter: Time::EpochConverter)]
    property until_date : Time?
  
    def initialize(@user : User, @status : String, @can_add_web_page_previews : Bool? = false, @can_send_other_messages : Bool? = false, @can_send_polls : Bool? = false, @can_send_media_messages : Bool? = false, @can_send_messages : Bool? = false, @is_member : Bool? = false, @can_pin_messages : Bool? = false, @can_invite_users : Bool? = false, @can_change_info : Bool? = false, @can_promote_members : Bool? = false, @can_restrict_members : Bool? = false, @can_delete_messages : Bool? = false, @can_edit_messages : Bool? = false, @can_post_messages : Bool? = false, @can_be_edited : Bool? = false, @is_anonymous : Bool? = false, @custom_title : String? = nil, @until_date : Time? = nil)
    end
  end

  # <p>Describes actions that a non-administrator user is allowed to take in a chat.</p>
  class ChatPermissions
    include JSON::Serializable
    include Tourmaline::Model
  
    # True, if the user is allowed to send text messages, contacts, locations and venues
    property can_send_messages : Bool? = false
  
    # True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
    property can_send_media_messages : Bool? = false
  
    # True, if the user is allowed to send polls, implies can_send_messages
    property can_send_polls : Bool? = false
  
    # True, if the user is allowed to send animations, games, stickers and use inline bots, implies can_send_media_messages
    property can_send_other_messages : Bool? = false
  
    # True, if the user is allowed to add web page previews to their messages, implies can_send_media_messages
    property can_add_web_page_previews : Bool? = false
  
    # True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
    property can_change_info : Bool? = false
  
    # True, if the user is allowed to invite new users to the chat
    property can_invite_users : Bool? = false
  
    # True, if the user is allowed to pin messages. Ignored in public supergroups
    property can_pin_messages : Bool? = false
  
    def initialize(@can_send_messages : Bool? = false, @can_send_media_messages : Bool? = false, @can_send_polls : Bool? = false, @can_send_other_messages : Bool? = false, @can_add_web_page_previews : Bool? = false, @can_change_info : Bool? = false, @can_invite_users : Bool? = false, @can_pin_messages : Bool? = false)
    end
  end

  # <p>Represents a location to which a chat is connected.</p>
  class ChatLocation
    include JSON::Serializable
    include Tourmaline::Model
  
    # The location to which the supergroup is connected. Can't be a live location.
    property location : Location
  
    # Location address; 1-64 characters, as defined by the chat owner
    property address : String
  
    def initialize(@location : Location, @address : String)
    end
  end

  # <p>This object represents a bot command.</p>
  class BotCommand
    include JSON::Serializable
    include Tourmaline::Model
  
    # Text of the command, 1-32 characters. Can contain only lowercase English letters, digits and underscores.
    property command : String
  
    # Description of the command, 3-256 characters.
    property description : String
  
    def initialize(@command : String, @description : String)
    end
  end

  # <p>Contains information about why a request was unsuccessful.</p>
  class ResponseParameters
    include JSON::Serializable
    include Tourmaline::Model
  
    # The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    property migrate_to_chat_id : Int64?
  
    # In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    property retry_after : Int64?
  
    def initialize(@migrate_to_chat_id : Int64? = nil, @retry_after : Int64? = nil)
    end
  end

  # <p>Represents a photo to be sent.</p>
  class InputMediaPhoto < InputMedia
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `photo`
    property type : String
  
    # File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
    property media : String
  
    # Caption of the photo to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the photo caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    def initialize(@type : String, @media : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity)
    end
  end

  # <p>Represents a video to be sent.</p>
  class InputMediaVideo < InputMedia
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `video`
    property type : String
  
    # File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
    property media : String
  
    # Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
    property thumb : (InputFile | String)?
  
    # Caption of the video to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the video caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Video width
    property width : Int64?
  
    # Video height
    property height : Int64?
  
    # Video duration
    property duration : Int64?
  
    # Pass `True`, if the uploaded video is suitable for streaming
    property supports_streaming : Bool? = false
  
    def initialize(@type : String, @media : String, @thumb : (InputFile | String)? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @width : Int64? = nil, @height : Int64? = nil, @duration : Int64? = nil, @supports_streaming : Bool? = false)
    end
  end

  # <p>Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.</p>
  class InputMediaAnimation < InputMedia
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `animation`
    property type : String
  
    # File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
    property media : String
  
    # Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
    property thumb : (InputFile | String)?
  
    # Caption of the animation to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the animation caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Animation width
    property width : Int64?
  
    # Animation height
    property height : Int64?
  
    # Animation duration
    property duration : Int64?
  
    def initialize(@type : String, @media : String, @thumb : (InputFile | String)? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @width : Int64? = nil, @height : Int64? = nil, @duration : Int64? = nil)
    end
  end

  # <p>Represents an audio file to be treated as music to be sent.</p>
  class InputMediaAudio < InputMedia
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `audio`
    property type : String
  
    # File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
    property media : String
  
    # Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
    property thumb : (InputFile | String)?
  
    # Caption of the audio to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the audio caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Duration of the audio in seconds
    property duration : Int64?
  
    # Performer of the audio
    property performer : String?
  
    # Title of the audio
    property title : String?
  
    def initialize(@type : String, @media : String, @thumb : (InputFile | String)? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @duration : Int64? = nil, @performer : String? = nil, @title : String? = nil)
    end
  end

  # <p>Represents a general file to be sent.</p>
  class InputMediaDocument < InputMedia
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `document`
    property type : String
  
    # File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
    property media : String
  
    # Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
    property thumb : (InputFile | String)?
  
    # Caption of the document to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the document caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Disables automatic server-side content type detection for files uploaded using multipart/form-data. Always true, if the document is sent as part of an album.
    property disable_content_type_detection : Bool? = false
  
    def initialize(@type : String, @media : String, @thumb : (InputFile | String)? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @disable_content_type_detection : Bool? = false)
    end
  end

  # <p>This object represents the contents of a file to be uploaded. Must be posted using multipart/form-data in the usual way that files are uploaded via the browser.</p>
  class InputFile
    include JSON::Serializable
    include Tourmaline::Model
    def initialize
    end
  end

  # <p>This object represents a sticker.</p>
  class Sticker
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # Sticker width
    property width : Int64
  
    # Sticker height
    property height : Int64
  
    # `True`, if the sticker is animated
    property is_animated : Bool = false
  
    # Sticker thumbnail in the .WEBP or .JPG format
    property thumb : PhotoSize?
  
    # Emoji associated with the sticker
    property emoji : String?
  
    # Name of the sticker set to which the sticker belongs
    property set_name : String?
  
    # For mask stickers, the position where the mask should be placed
    property mask_position : MaskPosition?
  
    # File size
    property file_size : Int64?
  
    def initialize(@file_id : String, @file_unique_id : String, @width : Int64, @height : Int64, @is_animated : Bool = false, @thumb : PhotoSize? = nil, @emoji : String? = nil, @set_name : String? = nil, @mask_position : MaskPosition? = nil, @file_size : Int64? = nil)
    end
  end

  # <p>This object represents a sticker set.</p>
  class StickerSet
    include JSON::Serializable
    include Tourmaline::Model
  
    # Sticker set name
    property name : String
  
    # Sticker set title
    property title : String
  
    # `True`, if the sticker set contains animated stickers
    property is_animated : Bool = false
  
    # `True`, if the sticker set contains masks
    property contains_masks : Bool = false
  
    # List of all set stickers
    property stickers : Array(Sticker) = [] of Tourmaline::Models::Sticker
  
    # Sticker set thumbnail in the .WEBP or .TGS format
    property thumb : PhotoSize?
  
    def initialize(@name : String, @title : String, @is_animated : Bool = false, @contains_masks : Bool = false, @stickers : Array(Sticker) = [] of Tourmaline::Models::Sticker, @thumb : PhotoSize? = nil)
    end
  end

  # <p>This object describes the position on faces where a mask should be placed by default.</p>
  class MaskPosition
    include JSON::Serializable
    include Tourmaline::Model
  
    # The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    property point : String
  
    # Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    property x_shift : Float64
  
    # Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    property y_shift : Float64
  
    # Mask scaling coefficient. For example, 2.0 means double size.
    property scale : Float64
  
    def initialize(@point : String, @x_shift : Float64, @y_shift : Float64, @scale : Float64)
    end
  end

  # <p>This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.</p>
  class InlineQuery
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique identifier for this query
    property id : String
  
    # Sender
    property from : User
  
    # Sender location, only for bots that request user location
    property location : Location?
  
    # Text of the query (up to 256 characters)
    property query : String
  
    # Offset of the results to be returned, can be controlled by the bot
    property offset : String
  
    def initialize(@id : String, @from : User, @query : String, @offset : String, @location : Location? = nil)
    end
  end

  # <p>Represents a link to an article or web page.</p>
  class InlineQueryResultArticle < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `article`
    property type : String
  
    # Unique identifier for this result, 1-64 Bytes
    property id : String
  
    # Title of the result
    property title : String
  
    # Content of the message to be sent
    property input_message_content : InputMessageContent
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # URL of the result
    property url : String?
  
    # Pass `True`, if you don't want the URL to be shown in the message
    property hide_url : Bool? = false
  
    # Short description of the result
    property description : String?
  
    # Url of the thumbnail for the result
    property thumb_url : String?
  
    # Thumbnail width
    property thumb_width : Int64?
  
    # Thumbnail height
    property thumb_height : Int64?
  
    def initialize(@type : String, @id : String, @title : String, @input_message_content : InputMessageContent, @reply_markup : InlineKeyboardMarkup? = nil, @url : String? = nil, @hide_url : Bool? = false, @description : String? = nil, @thumb_url : String? = nil, @thumb_width : Int64? = nil, @thumb_height : Int64? = nil)
    end
  end

  # <p>Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the photo.</p>
  class InlineQueryResultPhoto < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `photo`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid URL of the photo. Photo must be in **jpeg** format. Photo size must not exceed 5MB
    property photo_url : String
  
    # URL of the thumbnail for the photo
    property thumb_url : String
  
    # Width of the photo
    property photo_width : Int64?
  
    # Height of the photo
    property photo_height : Int64?
  
    # Title for the result
    property title : String?
  
    # Short description of the result
    property description : String?
  
    # Caption of the photo to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the photo caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the photo
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @photo_url : String, @thumb_url : String, @photo_width : Int64? = nil, @photo_height : Int64? = nil, @title : String? = nil, @description : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the animation.</p>
  class InlineQueryResultGif < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `gif`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid URL for the GIF file. File size must not exceed 1MB
    property gif_url : String
  
    # Width of the GIF
    property gif_width : Int64?
  
    # Height of the GIF
    property gif_height : Int64?
  
    # Duration of the GIF
    property gif_duration : Int64?
  
    # URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    property thumb_url : String
  
    # MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
    property thumb_mime_type : String?
  
    # Title for the result
    property title : String?
  
    # Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the GIF animation
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @gif_url : String, @thumb_url : String, @gif_width : Int64? = nil, @gif_height : Int64? = nil, @gif_duration : Int64? = nil, @thumb_mime_type : String? = nil, @title : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the animation.</p>
  class InlineQueryResultMpeg4Gif < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `mpeg4_gif`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid URL for the MP4 file. File size must not exceed 1MB
    property mpeg4_url : String
  
    # Video width
    property mpeg4_width : Int64?
  
    # Video height
    property mpeg4_height : Int64?
  
    # Video duration
    property mpeg4_duration : Int64?
  
    # URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    property thumb_url : String
  
    # MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
    property thumb_mime_type : String?
  
    # Title for the result
    property title : String?
  
    # Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the video animation
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @mpeg4_url : String, @thumb_url : String, @mpeg4_width : Int64? = nil, @mpeg4_height : Int64? = nil, @mpeg4_duration : Int64? = nil, @thumb_mime_type : String? = nil, @title : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the video.</p>
  class InlineQueryResultVideo < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
    def initialize
    end
  end

  # <p>Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the audio.</p>
  class InlineQueryResultAudio < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `audio`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid URL for the audio file
    property audio_url : String
  
    # Title
    property title : String
  
    # Caption, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the audio caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Performer
    property performer : String?
  
    # Audio duration in seconds
    property audio_duration : Int64?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the audio
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @audio_url : String, @title : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @performer : String? = nil, @audio_duration : Int64? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the the voice message.</p>
  class InlineQueryResultVoice < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `voice`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid URL for the voice recording
    property voice_url : String
  
    # Recording title
    property title : String
  
    # Caption, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the voice message caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Recording duration in seconds
    property voice_duration : Int64?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the voice recording
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @voice_url : String, @title : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @voice_duration : Int64? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the file. Currently, only **.PDF** and **.ZIP** files can be sent using this method.</p>
  class InlineQueryResultDocument < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `document`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # Title for the result
    property title : String
  
    # Caption of the document to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the document caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # A valid URL for the file
    property document_url : String
  
    # Mime type of the content of the file, either “application/pdf” or “application/zip”
    property mime_type : String
  
    # Short description of the result
    property description : String?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the file
    property input_message_content : InputMessageContent?
  
    # URL of the thumbnail (jpeg only) for the file
    property thumb_url : String?
  
    # Thumbnail width
    property thumb_width : Int64?
  
    # Thumbnail height
    property thumb_height : Int64?
  
    def initialize(@type : String, @id : String, @title : String, @document_url : String, @mime_type : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @description : String? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil, @thumb_url : String? = nil, @thumb_width : Int64? = nil, @thumb_height : Int64? = nil)
    end
  end

  # <p>Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the location.</p>
  class InlineQueryResultLocation < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `location`
    property type : String
  
    # Unique identifier for this result, 1-64 Bytes
    property id : String
  
    # Location latitude in degrees
    property latitude : Float64
  
    # Location longitude in degrees
    property longitude : Float64
  
    # Location title
    property title : String
  
    # The radius of uncertainty for the location, measured in meters; 0-1500
    property horizontal_accuracy : Float64?
  
    # Period in seconds for which the location can be updated, should be between 60 and 86400.
    property live_period : Int64?
  
    # For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    property heading : Int64?
  
    # For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    property proximity_alert_radius : Int64?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the location
    property input_message_content : InputMessageContent?
  
    # Url of the thumbnail for the result
    property thumb_url : String?
  
    # Thumbnail width
    property thumb_width : Int64?
  
    # Thumbnail height
    property thumb_height : Int64?
  
    def initialize(@type : String, @id : String, @latitude : Float64, @longitude : Float64, @title : String, @horizontal_accuracy : Float64? = nil, @live_period : Int64? = nil, @heading : Int64? = nil, @proximity_alert_radius : Int64? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil, @thumb_url : String? = nil, @thumb_width : Int64? = nil, @thumb_height : Int64? = nil)
    end
  end

  # <p>Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the venue.</p>
  class InlineQueryResultVenue < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `venue`
    property type : String
  
    # Unique identifier for this result, 1-64 Bytes
    property id : String
  
    # Latitude of the venue location in degrees
    property latitude : Float64
  
    # Longitude of the venue location in degrees
    property longitude : Float64
  
    # Title of the venue
    property title : String
  
    # Address of the venue
    property address : String
  
    # Foursquare identifier of the venue if known
    property foursquare_id : String?
  
    # Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    property foursquare_type : String?
  
    # Google Places identifier of the venue
    property google_place_id : String?
  
    # Google Places type of the venue. (See supported types.)
    property google_place_type : String?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the venue
    property input_message_content : InputMessageContent?
  
    # Url of the thumbnail for the result
    property thumb_url : String?
  
    # Thumbnail width
    property thumb_width : Int64?
  
    # Thumbnail height
    property thumb_height : Int64?
  
    def initialize(@type : String, @id : String, @latitude : Float64, @longitude : Float64, @title : String, @address : String, @foursquare_id : String? = nil, @foursquare_type : String? = nil, @google_place_id : String? = nil, @google_place_type : String? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil, @thumb_url : String? = nil, @thumb_width : Int64? = nil, @thumb_height : Int64? = nil)
    end
  end

  # <p>Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the contact.</p>
  class InlineQueryResultContact < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `contact`
    property type : String
  
    # Unique identifier for this result, 1-64 Bytes
    property id : String
  
    # Contact's phone number
    property phone_number : String
  
    # Contact's first name
    property first_name : String
  
    # Contact's last name
    property last_name : String?
  
    # Additional data about the contact in the form of a vCard, 0-2048 bytes
    property vcard : String?
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the contact
    property input_message_content : InputMessageContent?
  
    # Url of the thumbnail for the result
    property thumb_url : String?
  
    # Thumbnail width
    property thumb_width : Int64?
  
    # Thumbnail height
    property thumb_height : Int64?
  
    def initialize(@type : String, @id : String, @phone_number : String, @first_name : String, @last_name : String? = nil, @vcard : String? = nil, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil, @thumb_url : String? = nil, @thumb_width : Int64? = nil, @thumb_height : Int64? = nil)
    end
  end

  # <p>Represents a Game.</p>
  class InlineQueryResultGame < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `game`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # Short name of the game
    property game_short_name : String
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    def initialize(@type : String, @id : String, @game_short_name : String, @reply_markup : InlineKeyboardMarkup? = nil)
    end
  end

  # <p>Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the photo.</p>
  class InlineQueryResultCachedPhoto < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `photo`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier of the photo
    property photo_file_id : String
  
    # Title for the result
    property title : String?
  
    # Short description of the result
    property description : String?
  
    # Caption of the photo to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the photo caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the photo
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @photo_file_id : String, @title : String? = nil, @description : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with specified content instead of the animation.</p>
  class InlineQueryResultCachedGif < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `gif`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier for the GIF file
    property gif_file_id : String
  
    # Title for the result
    property title : String?
  
    # Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the GIF animation
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @gif_file_id : String, @title : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the animation.</p>
  class InlineQueryResultCachedMpeg4Gif < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `mpeg4_gif`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier for the MP4 file
    property mpeg4_file_id : String
  
    # Title for the result
    property title : String?
  
    # Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the video animation
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @mpeg4_file_id : String, @title : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the sticker.</p>
  class InlineQueryResultCachedSticker < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `sticker`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier of the sticker
    property sticker_file_id : String
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the sticker
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @sticker_file_id : String, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the file.</p>
  class InlineQueryResultCachedDocument < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `document`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # Title for the result
    property title : String
  
    # A valid file identifier for the file
    property document_file_id : String
  
    # Short description of the result
    property description : String?
  
    # Caption of the document to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the document caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the file
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @title : String, @document_file_id : String, @description : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the video.</p>
  class InlineQueryResultCachedVideo < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `video`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier for the video file
    property video_file_id : String
  
    # Title for the result
    property title : String
  
    # Short description of the result
    property description : String?
  
    # Caption of the video to be sent, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the video caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the video
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @video_file_id : String, @title : String, @description : String? = nil, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the voice message.</p>
  class InlineQueryResultCachedVoice < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `voice`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier for the voice message
    property voice_file_id : String
  
    # Voice message title
    property title : String
  
    # Caption, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the voice message caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the voice message
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @voice_file_id : String, @title : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents a link to an MP3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use `input_message_content` to send a message with the specified content instead of the audio.</p>
  class InlineQueryResultCachedAudio < InlineQueryResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # Type of the result, must be `audio`
    property type : String
  
    # Unique identifier for this result, 1-64 bytes
    property id : String
  
    # A valid file identifier for the audio file
    property audio_file_id : String
  
    # Caption, 0-1024 characters after entities parsing
    property caption : String?
  
    # Mode for parsing entities in the audio caption. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in the caption, which can be specified instead of `parse_mode`
    property caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Inline keyboard attached to the message
    property reply_markup : InlineKeyboardMarkup?
  
    # Content of the message to be sent instead of the audio
    property input_message_content : InputMessageContent?
  
    def initialize(@type : String, @id : String, @audio_file_id : String, @caption : String? = nil, @parse_mode : ParseMode? = nil, @caption_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @reply_markup : InlineKeyboardMarkup? = nil, @input_message_content : InputMessageContent? = nil)
    end
  end

  # <p>Represents the content of a text message to be sent as the result of an inline query.</p>
  class InputTextMessageContent < InputMessageContent
    include JSON::Serializable
    include Tourmaline::Model
  
    # Text of the message to be sent, 1-4096 characters
    property message_text : String
  
    # Mode for parsing entities in the message text. See formatting options for more details.
    property parse_mode : ParseMode?
  
    # List of special entities that appear in message text, which can be specified instead of `parse_mode`
    property entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Disables link previews for links in the sent message
    property disable_web_page_preview : Bool? = false
  
    def initialize(@message_text : String, @parse_mode : ParseMode? = nil, @entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @disable_web_page_preview : Bool? = false)
    end
  end

  # <p>Represents the content of a location message to be sent as the result of an inline query.</p>
  class InputLocationMessageContent < InputMessageContent
    include JSON::Serializable
    include Tourmaline::Model
  
    # Latitude of the location in degrees
    property latitude : Float64
  
    # Longitude of the location in degrees
    property longitude : Float64
  
    # The radius of uncertainty for the location, measured in meters; 0-1500
    property horizontal_accuracy : Float64?
  
    # Period in seconds for which the location can be updated, should be between 60 and 86400.
    property live_period : Int64?
  
    # For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    property heading : Int64?
  
    # For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    property proximity_alert_radius : Int64?
  
    def initialize(@latitude : Float64, @longitude : Float64, @horizontal_accuracy : Float64? = nil, @live_period : Int64? = nil, @heading : Int64? = nil, @proximity_alert_radius : Int64? = nil)
    end
  end

  # <p>Represents the content of a venue message to be sent as the result of an inline query.</p>
  class InputVenueMessageContent < InputMessageContent
    include JSON::Serializable
    include Tourmaline::Model
  
    # Latitude of the venue in degrees
    property latitude : Float64
  
    # Longitude of the venue in degrees
    property longitude : Float64
  
    # Name of the venue
    property title : String
  
    # Address of the venue
    property address : String
  
    # Foursquare identifier of the venue, if known
    property foursquare_id : String?
  
    # Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    property foursquare_type : String?
  
    # Google Places identifier of the venue
    property google_place_id : String?
  
    # Google Places type of the venue. (See supported types.)
    property google_place_type : String?
  
    def initialize(@latitude : Float64, @longitude : Float64, @title : String, @address : String, @foursquare_id : String? = nil, @foursquare_type : String? = nil, @google_place_id : String? = nil, @google_place_type : String? = nil)
    end
  end

  # <p>Represents the content of a contact message to be sent as the result of an inline query.</p>
  class InputContactMessageContent < InputMessageContent
    include JSON::Serializable
    include Tourmaline::Model
  
    # Contact's phone number
    property phone_number : String
  
    # Contact's first name
    property first_name : String
  
    # Contact's last name
    property last_name : String?
  
    # Additional data about the contact in the form of a vCard, 0-2048 bytes
    property vcard : String?
  
    def initialize(@phone_number : String, @first_name : String, @last_name : String? = nil, @vcard : String? = nil)
    end
  end

  # <p>Represents a result of an inline query that was chosen by the user and sent to their chat partner.</p>
  class ChosenInlineResult
    include JSON::Serializable
    include Tourmaline::Model
  
    # The unique identifier for the result that was chosen
    property result_id : String
  
    # The user that chose the result
    property from : User
  
    # Sender location, only for bots that require user location
    property location : Location?
  
    # Identifier of the sent inline message. Available only if there is an edit the message.
    property inline_message_id : String?
  
    # The query that was used to obtain the result
    property query : String
  
    def initialize(@result_id : String, @from : User, @query : String, @location : Location? = nil, @inline_message_id : String? = nil)
    end
  end

  # <p>This object represents a portion of the price for goods or services.</p>
  class LabeledPrice
    include JSON::Serializable
    include Tourmaline::Model
  
    # Portion label
    property label : String
  
    # Price of the product in the `smallest units` of the currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    property amount : Int64
  
    def initialize(@label : String, @amount : Int64)
    end
  end

  # <p>This object contains basic information about an invoice.</p>
  class Invoice
    include JSON::Serializable
    include Tourmaline::Model
  
    # Product name
    property title : String
  
    # Product description
    property description : String
  
    # Unique bot deep-linking parameter that can be used to generate this invoice
    property start_parameter : String
  
    # Three-letter ISO 4217 currency code
    property currency : String
  
    # Total price in the `smallest units` of the currency (integer, **not** float/double). For example, for a price of `US$ 1.45` pass `amount = 145`. See the `exp` parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    property total_amount : Int64
  
    def initialize(@title : String, @description : String, @start_parameter : String, @currency : String, @total_amount : Int64)
    end
  end

  # <p>This object represents a shipping address.</p>
  class ShippingAddress
    include JSON::Serializable
    include Tourmaline::Model
  
    # ISO 3166-1 alpha-2 country code
    property country_code : String
  
    # State, if applicable
    property state : String
  
    # City
    property city : String
  
    # First line for the address
    property street_line1 : String
  
    # Second line for the address
    property street_line2 : String
  
    # Address post code
    property post_code : String
  
    def initialize(@country_code : String, @state : String, @city : String, @street_line1 : String, @street_line2 : String, @post_code : String)
    end
  end

  # <p>This object represents information about an order.</p>
  class OrderInfo
    include JSON::Serializable
    include Tourmaline::Model
  
    # User name
    property name : String?
  
    # User's phone number
    property phone_number : String?
  
    # User email
    property email : String?
  
    # User shipping address
    property shipping_address : ShippingAddress?
  
    def initialize(@name : String? = nil, @phone_number : String? = nil, @email : String? = nil, @shipping_address : ShippingAddress? = nil)
    end
  end

  # <p>This object represents one shipping option.</p>
  class ShippingOption
    include JSON::Serializable
    include Tourmaline::Model
  
    # Shipping option identifier
    property id : String
  
    # Option title
    property title : String
  
    # List of price portions
    property prices : Array(LabeledPrice) = [] of Tourmaline::Models::LabeledPrice
  
    def initialize(@id : String, @title : String, @prices : Array(LabeledPrice) = [] of Tourmaline::Models::LabeledPrice)
    end
  end

  # <p>This object contains basic information about a successful payment.</p>
  class SuccessfulPayment
    include JSON::Serializable
    include Tourmaline::Model
  
    # Three-letter ISO 4217 currency code
    property currency : String
  
    # Total price in the `smallest units` of the currency (integer, **not** float/double). For example, for a price of `US$ 1.45` pass `amount = 145`. See the `exp` parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    property total_amount : Int64
  
    # Bot specified invoice payload
    property invoice_payload : String
  
    # Identifier of the shipping option chosen by the user
    property shipping_option_id : String?
  
    # Order info provided by the user
    property order_info : OrderInfo?
  
    # Telegram payment identifier
    property telegram_payment_charge_id : String
  
    # Provider payment identifier
    property provider_payment_charge_id : String
  
    def initialize(@currency : String, @total_amount : Int64, @invoice_payload : String, @telegram_payment_charge_id : String, @provider_payment_charge_id : String, @shipping_option_id : String? = nil, @order_info : OrderInfo? = nil)
    end
  end

  # <p>This object contains information about an incoming shipping query.</p>
  class ShippingQuery
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique query identifier
    property id : String
  
    # User who sent the query
    property from : User
  
    # Bot specified invoice payload
    property invoice_payload : String
  
    # User specified shipping address
    property shipping_address : ShippingAddress
  
    def initialize(@id : String, @from : User, @invoice_payload : String, @shipping_address : ShippingAddress)
    end
  end

  # <p>This object contains information about an incoming pre-checkout query.</p>
  class PreCheckoutQuery
    include JSON::Serializable
    include Tourmaline::Model
  
    # Unique query identifier
    property id : String
  
    # User who sent the query
    property from : User
  
    # Three-letter ISO 4217 currency code
    property currency : String
  
    # Total price in the `smallest units` of the currency (integer, **not** float/double). For example, for a price of `US$ 1.45` pass `amount = 145`. See the `exp` parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    property total_amount : Int64
  
    # Bot specified invoice payload
    property invoice_payload : String
  
    # Identifier of the shipping option chosen by the user
    property shipping_option_id : String?
  
    # Order info provided by the user
    property order_info : OrderInfo?
  
    def initialize(@id : String, @from : User, @currency : String, @total_amount : Int64, @invoice_payload : String, @shipping_option_id : String? = nil, @order_info : OrderInfo? = nil)
    end
  end

  # <p>Contains information about Telegram Passport data shared with the bot by the user.</p>
  class PassportData
    include JSON::Serializable
    include Tourmaline::Model
  
    # Array with information about documents and other Telegram Passport elements that was shared with the bot
    property data : Array(EncryptedPassportElement) = [] of Tourmaline::Models::EncryptedPassportElement
  
    # Encrypted credentials required to decrypt the data
    property credentials : EncryptedCredentials
  
    def initialize(@credentials : EncryptedCredentials, @data : Array(EncryptedPassportElement) = [] of Tourmaline::Models::EncryptedPassportElement)
    end
  end

  # <p>This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.</p>
  class PassportFile
    include JSON::Serializable
    include Tourmaline::Model
  
    # Identifier for this file, which can be used to download or reuse the file
    property file_id : String
  
    # Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    property file_unique_id : String
  
    # File size
    property file_size : Int64
  
    # Unix time when the file was uploaded
    @[JSON::Field(converter: Time::EpochConverter)]
    property file_date : Time
  
    def initialize(@file_id : String, @file_unique_id : String, @file_size : Int64, @file_date : Time)
    end
  end

  # <p>Contains information about documents or other Telegram Passport elements shared with the bot by the user.</p>
  class EncryptedPassportElement
    include JSON::Serializable
    include Tourmaline::Model
  
    # Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
    property type : String
  
    # Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
    property data : String?
  
    # User's verified phone number, available only for “phone_number” type
    property phone_number : String?
  
    # User's verified email address, available only for “email” type
    property email : String?
  
    # Array of encrypted files with documents provided by the user, available for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    property files : Array(PassportFile) = [] of Tourmaline::Models::PassportFile
  
    # Encrypted file with the front side of the document, provided by the user. Available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    property front_side : PassportFile?
  
    # Encrypted file with the reverse side of the document, provided by the user. Available for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    property reverse_side : PassportFile?
  
    # Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    property selfie : PassportFile?
  
    # Array of encrypted files with translated versions of documents provided by the user. Available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    property translation : Array(PassportFile) = [] of Tourmaline::Models::PassportFile
  
    # Base64-encoded element hash for using in PassportElementErrorUnspecified
    property hash : String
  
    def initialize(@type : String, @hash : String, @data : String? = nil, @phone_number : String? = nil, @email : String? = nil, @files : Array(PassportFile) = [] of Tourmaline::Models::PassportFile, @front_side : PassportFile? = nil, @reverse_side : PassportFile? = nil, @selfie : PassportFile? = nil, @translation : Array(PassportFile) = [] of Tourmaline::Models::PassportFile)
    end
  end

  # <p>Contains data required for decrypting and authenticating Telegram Passport Documentation for a complete description of the data decryption and authentication processes.</p>
  class EncryptedCredentials
    include JSON::Serializable
    include Tourmaline::Model
  
    # Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
    property data : String
  
    # Base64-encoded data hash for data authentication
    property hash : String
  
    # Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    property secret : String
  
    def initialize(@data : String, @hash : String, @secret : String)
    end
  end

  # <p>Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes.</p>
  class PassportElementErrorDataField < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `data`
    property source : String
  
    # The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”
    property type : String
  
    # Name of the data field which has the error
    property field_name : String
  
    # Base64-encoded data hash
    property data_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @field_name : String, @data_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.</p>
  class PassportElementErrorFrontSide < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `front_side`
    property source : String
  
    # The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    property type : String
  
    # Base64-encoded hash of the file with the front side of the document
    property file_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @file_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.</p>
  class PassportElementErrorReverseSide < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `reverse_side`
    property source : String
  
    # The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card”
    property type : String
  
    # Base64-encoded hash of the file with the reverse side of the document
    property file_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @file_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.</p>
  class PassportElementErrorSelfie < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `selfie`
    property source : String
  
    # The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    property type : String
  
    # Base64-encoded hash of the file with the selfie
    property file_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @file_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.</p>
  class PassportElementErrorFile < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `file`
    property source : String
  
    # The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    property type : String
  
    # Base64-encoded file hash
    property file_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @file_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.</p>
  class PassportElementErrorFiles < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `files`
    property source : String
  
    # The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    property type : String
  
    # List of base64-encoded file hashes
    property file_hashes : Array(String) = [] of String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @message : String, @file_hashes : Array(String) = [] of String)
    end
  end

  # <p>Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes.</p>
  class PassportElementErrorTranslationFile < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `translation_file`
    property source : String
  
    # Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    property type : String
  
    # Base64-encoded file hash
    property file_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @file_hash : String, @message : String)
    end
  end

  # <p>Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.</p>
  class PassportElementErrorTranslationFiles < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `translation_files`
    property source : String
  
    # Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    property type : String
  
    # List of base64-encoded file hashes
    property file_hashes : Array(String) = [] of String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @message : String, @file_hashes : Array(String) = [] of String)
    end
  end

  # <p>Represents an issue in an unspecified place. The error is considered resolved when new data is added.</p>
  class PassportElementErrorUnspecified < PassportElementError
    include JSON::Serializable
    include Tourmaline::Model
  
    # Error source, must be `unspecified`
    property source : String
  
    # Type of element of the user's Telegram Passport which has the issue
    property type : String
  
    # Base64-encoded element hash
    property element_hash : String
  
    # Error message
    property message : String
  
    def initialize(@source : String, @type : String, @element_hash : String, @message : String)
    end
  end

  # <p>This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.</p>
  class Game
    include JSON::Serializable
    include Tourmaline::Model
  
    # Title of the game
    property title : String
  
    # Description of the game
    property description : String
  
    # Photo that will be displayed in the game message in chats.
    property photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize
  
    # Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls editMessageText. 0-4096 characters.
    property text : String?
  
    # Special entities that appear in `text`, such as usernames, URLs, bot commands, etc.
    property text_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity
  
    # Animation that will be displayed in the game message in chats. Upload via BotFather
    property animation : Animation?
  
    def initialize(@title : String, @description : String, @photo : Array(PhotoSize) = [] of Tourmaline::Models::PhotoSize, @text : String? = nil, @text_entities : Array(MessageEntity) = [] of Tourmaline::Models::MessageEntity, @animation : Animation? = nil)
    end
  end

  # <p>A placeholder, currently holds no information. Use BotFather to set up your game.</p>
  class CallbackGame
    include JSON::Serializable
    include Tourmaline::Model
    def initialize
    end
  end

  # <p>This object represents one row of the high scores table for a game.</p>
  class GameHighScore
    include JSON::Serializable
    include Tourmaline::Model
  
    # Position in high score table for the game
    property position : Int64
  
    # User
    property user : User
  
    # Score
    property score : Int64
  
    def initialize(@position : Int64, @user : User, @score : Int64)
    end
  end
end