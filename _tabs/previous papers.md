---
icon: fas fa-stream
order: 1
---

# पिछले साल के प्रश्नपत्र

<ul>
{% assign papers = site.pages | where_exp:"page","page.path contains 'PREVIOUS-PAPERS/Y'" %}
{% assign sorted_papers = papers | sort: "title" | reverse %}
{% for paper in sorted_papers %}
  <li><a href="{{ paper.url }}">{{ paper.title }}</a></li>
{% endfor %}
</ul>
