module Jekyll
  module AutoLinkFilter
    def auto_link(input, posts, current_post_url = nil)
      # Step 1: सभी words के लिए URLs इकट्ठे करें
      words_with_urls = []

      posts.each do |post|
        next unless post.data['words']

        post.data['words'].each do |word|
          # हर word के लिए उस word को लिंक करने वाले सभी पोस्ट collect करें,
          # except current_post_url
          posts.each do |link_post|
            next if link_post.url == current_post_url  # खुद के URL से link न लगाएँ

            if link_post.data['words']&.include?(word)
              words_with_urls << { 'word' => word, 'url' => link_post.url }
            end
          end
        end
      end

      # Step 2: लंबाई के अनुसार reverse sort (बड़े word पहले)
      words_with_urls.sort_by! { |w| -w['word'].length }

      # Step 3: content में link लगाएँ
      words_with_urls.each do |entry|
        word = entry['word']
        url = entry['url']
        linked_once = false

        # Regex: Unicode / देवनागरी word boundaries के लिए
        regex = /
          (?<!["'>])                # <a href=""> वगैरह के अंदर मत पकड़ो
          (?:<[^>]+>)*              # optional HTML formatting tag (<em>, <strong> etc.)
          (?<!\p{L})#{Regexp.escape(word)}(?!\p{L}) # Unicode-safe word boundary
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
