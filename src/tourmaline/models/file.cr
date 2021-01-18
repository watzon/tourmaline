module Tourmaline::Models
  class TFile
    def link
      if file_path = @file_path
        File.join("#{API_URL}/file/bot#{@api_key}", file_path)
      end
    end
  end
end
