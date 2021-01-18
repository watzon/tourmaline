module Tourmaline::Models
  abstract class InlineQueryResult
    def self.build(&block)
      builder = Builder.new
      with builder yield builder
      builder.results
    end

    class Builder
      getter results : Array(Tourmaline::InlineQueryResult)

      def initialize
        @results = [] of Tourmaline::InlineQueryResult
      end

      def article(*args, **opts)
        results << InlineQueryResultArticle.new("article", *args, **opts)
      end

      def audio(*args, **opts)
        results << InlineQueryResultAudio.new("audio", *args, **opts)
      end

      def cached_audio(*args, **opts)
        results << InlineQueryResultCachedAudio.new("audio", *args, **opts)
      end

      def cached_document(*args, **opts)
        results << InlineQueryResultCachedDocument.new("document", *args, **opts)
      end

      def cached_gif(*args, **opts)
        results << InlineQueryResultCachedGif.new("gif", *args, **opts)
      end

      def cached_mpeg4_gif(*args, **opts)
        results << InlineQueryResultCachedMpeg4Gif.new("mpeg4_gif", *args, **opts)
      end

      def cached_photo(*args, **opts)
        results << InlineQueryResultCachedPhoto.new("photo", *args, **opts)
      end

      def cached_sticker(*args, **opts)
        results << InlineQueryResultCachedSticker.new("sticker", *args, **opts)
      end

      def cached_video(*args, **opts)
        results << InlineQueryResultCachedVideo.new("video", *args, **opts)
      end

      def cached_voice(*args, **opts)
        results << InlineQueryResultCachedVoice.new("voice", *args, **opts)
      end

      def contact(*args, **opts)
        results << InlineQueryResultContact.new("contact", *args, **opts)
      end

      def document(*args, **opts)
        results << InlineQueryResultDocument.new("document", *args, **opts)
      end

      def gif(*args, **opts)
        results << InlineQueryResultGif.new("gif", *args, **opts)
      end

      def location(*args, **opts)
        results << InlineQueryResultLocation.new("location", *args, **opts)
      end

      def mpeg4_gif(*args, **opts)
        results << InlineQueryResultMpeg4Gif.new("mpeg4_gif", *args, **opts)
      end

      def photo(*args, **opts)
        results << InlineQueryResultPhoto.new("photo", *args, **opts)
      end

      def venue(*args, **opts)
        results << InlineQueryResultVenue.new("venue", *args, **opts)
      end

      def video(*args, **opts)
        results << InlineQueryResultVideo.new("video", *args, **opts)
      end
    end
  end
end
