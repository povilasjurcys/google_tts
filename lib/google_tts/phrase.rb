require 'net/http'
require 'tempfile'
require 'uri'

class GoogleTts::Phrase
  URL_HOST = "translate.google.com"
  URL_PATH = lambda { |text, lang| "/translate_tts?ie=UTF-8&q=#{URI.escape(text)}&tl=#{lang}" }

  attr_reader :lang
  attr_reader :text

  def initialize(text, lang = :en)
    @text = text
    @lang = lang
    @tempfile_is_downloaded = false
  end

  def file
    @file ||= Tempfile.new "tts_#{rand(10**9)}"
    return @file if @downloaded

    save_to_file(@file)
  end

  def save_to_file(file)
    Net::HTTP.start(URL_HOST) do |http|
      open(file.path, "wb") do |f|
        chopped_text.each do |part|
          response = http.get(URL_PATH.call(part, lang.to_s))
          f.write(response.body)
        end
      end
    end
    @tempfile_is_downloaded ||= file == @file
    
    file
  end

  private

  def chopped_text
    return @chopped_text if @chopped_text.present?

    @chopped_text = []
    formated_text = @text.squeeze(".").gsub(/[\n\r]/, " ").squeeze(" ")

    formated_text.split(".").each do |sentence|
      if sentence.length <= 100
        @chopped_text << "#{sentence}."
        next
      end

      @chopped_text << "" if @chopped_text.last != ""
      sentence.split(" ").each do |word|
        next if word.length > 100 # if word is longer than 100 symbols, probably it's nonsence
        
        if (@chopped_text.last + word).length > 100
          @chopped_text += [word] # add word as new part
        else
          @chopped_text.last += word
        end
      end
    end

    @chopped_text
  end
end