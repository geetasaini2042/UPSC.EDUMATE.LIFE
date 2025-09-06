module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts)
      posts.each do |post|
        if post.data['words']
          post.data['words'].each do |word|
            url = post.url
            input = input.gsub(/\b#{word}\b/, "<a href='#{url}'>#{word}</a>")
          end
        end
      end
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AutoLinkFilter)
