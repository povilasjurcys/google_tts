# GoogleTts

Ruby gem that provides text-to-speech (tts) functionality in many languages.

This gem is based on https://github.com/pbrazdil/tts_based_on_google gem.

## Installation

Add this line to your application's Gemfile:

    gem 'google_tts', git: 'git@github.com:bloomrain/google_tts.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_tts

## Usage

Basic example:

    phrase = GoogleTts::Phrase.new("Hell, yeah!", :en)
    file = phrase.file
    text = phrase.text
    language = phrase.language

By default it will save google tts output to tempfile. If you want you can specify output like this:
	phrase = GoogleTts::Phrase.new( "Hell, yeah!", :en, File.new("uhlala.mp3") )

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
