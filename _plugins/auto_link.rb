module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts, current_post_url = nil)
      posts.each do |post|
        next unless post.data['words']

        # उसी post में खुद का link न बने
        next if post.url == current_post_url

        post.data['words'].each do |word|
          url = post.url

          # regex: avoid replacing inside tags
          regex = /(?<!["'>])\b#{Regexp.escape(word)}\b(?!["'<])/

          linked_once = false
          input = input.gsub(regex) do |match|
            if linked_once
              match  # बाद की बार replace मत करो
            else
              linked_once = true
              "<a href='#{url}'>#{match}</a>"
            end
          end
        end
      end
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AutoLinkFilter)
