module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts, current_post_url = nil)
      # पहले सभी words को length के हिसाब से sort करो (लंबे पहले)
      words_with_urls = []

      posts.each do |post|
        next unless post.data['words']
        next if post.url == current_post_url   # खुद के post में link मत लगाओ

        post.data['words'].each do |word|
          words_with_urls << { 'word' => word, 'url' => post.url }
        end
      end

      # लंबाई के अनुसार reverse sort (लंबा पहले)
      words_with_urls.sort_by! { |w| -w['word'].length }

      words_with_urls.each do |entry|
        word = entry['word']
        url = entry['url']
        linked_once = false

        # Regex: शब्द को match करो भले वो <em>, <strong>, <b>, <i> tag के अंदर हो
        # लेकिन <a ...> tag के अंदर मत पकड़ो
        regex = /
          (?<!["'>])                # <a href=""> वगैरह के अंदर मत पकड़ो
          (?:<[^>]+>)*              # optional HTML formatting tag (<em>, <strong> etc.)
          \b#{Regexp.escape(word)}\b
          (?:<\/[^>]+>)*            # closing formatting tag
          (?!["'<])                 # <a> या attribute के बाद मत पकड़ो
        /x

        input = input.gsub(regex) do |match|
          if linked_once
            match
          else
            linked_once = true
            "<a href='#{url}'>#{match}</a>"
          end
        end
      end

      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AutoLinkFilter)
