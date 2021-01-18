module Tourmaline
  module Model
    def client
      Tourmaline::Container.client
    end
  end
end

require "./models/generated"
require "./models/*"

module Tourmaline
  include Models
end
