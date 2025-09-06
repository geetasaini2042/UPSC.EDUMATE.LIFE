module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts)
      posts.each do |post|
        next unless post.data['words']

        post.data['words'].each do |word|
          url = post.url

          # Match word only in plain text, not inside existing tags
          regex = /(?<!["'>])\b#{Regexp.escape(word)}\b(?!["'<])/

          input = input.gsub(regex) do |match|
            "<a href='#{url}'>#{match}</a>"
          end
        end
      end
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AutoLinkFilter)
