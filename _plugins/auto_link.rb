module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts)
      posts.each do |post|
        next unless post.data['words']

        post.data['words'].each do |word|
          url = post.url
          # Avoid replacing inside <a> tags
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
