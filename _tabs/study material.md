---
# the default layout is 'page'
icon: fas fa-graduation-cap
order: 3
---

{% include lang.html %}

<div class="page-content mb-4">
  {{ content }}
</div>

<!-- पहला Ad -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6225893138851886"
     crossorigin="anonymous"></script>
<ins class="adsbygoogle"
     style="display:block; text-align:center;"
     data-ad-layout="in-article"
     data-ad-format="fluid"
     data-ad-client="ca-pub-6225893138851886"
     data-ad-slot="1023470228"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% assign all_pinned = site.posts | where: 'pin', 'true' %}
{% assign all_normal = site.posts | where_exp: 'item', 'item.pin != true and item.hidden != true' %}

<!-- Pagination के लिए final list -->
{% assign combined_posts = all_pinned | concat: all_normal %}
{% assign posts = combined_posts | slice: paginator.first_index, paginator.per_page %}

<div id="post-list" class="flex-grow-1 px-xl-1">
  {% for post in posts %}
    <article class="card-wrapper card">
      <a href="{{ post.url | relative_url }}" class="post-preview row g-0 flex-md-row-reverse">
        {% assign card_body_col = '12' %}

        {% if post.image %}
          {% assign src = post.image.path | default: post.image %}
          {% unless src contains '//' %}
            {% assign src = post.media_subpath | append: '/' | append: src | replace: '//', '/' %}
          {% endunless %}
          {% assign alt = post.image.alt | xml_escape | default: 'Preview Image' %}

          <div class="col-md-5">
            <img src="{{ src }}" alt="{{ alt }}">
          </div>
          {% assign card_body_col = '7' %}
        {% endif %}

        <div class="col-md-{{ card_body_col }}">
          <div class="card-body d-flex flex-column">
            <h1 class="card-title my-2 mt-md-0">{{ post.title }}</h1>

            <div class="card-text content mt-0 mb-3">
              <p>{% include post-description.html %}</p>
            </div>

            <div class="post-meta flex-grow-1 d-flex align-items-end">
              <div class="me-auto">
                <i class="far fa-calendar fa-fw me-1"></i>
                {% include datetime.html date=post.date lang=lang %}

                {% if post.categories.size > 0 %}
                  <i class="far fa-folder-open fa-fw me-1"></i>
                  <span class="categories">
                    {% for category in post.categories %}
                      {{ category }}{% unless forloop.last %},{% endunless %}
                    {% endfor %}
                  </span>
                {% endif %}
              </div>

              {% if post.pin %}
                <div class="pin ms-1">
                  <i class="fas fa-thumbtack fa-fw"></i>
                  <span>{{ site.data.locales[lang].post.pin_prompt }}</span>
                </div>
              {% endif %}
            </div>
          </div>
        </div>
      </a>
    </article>
  {% endfor %}
</div>

<!-- दूसरा Ad -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6225893138851886"
     crossorigin="anonymous"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="fluid"
     data-ad-layout-key="-gw-3+1f-3d+2z"
     data-ad-client="ca-pub-6225893138851886"
     data-ad-slot="2162960375"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% if paginator.total_pages > 1 %}
  {% include post-paginator.html %}
{% endif %}
