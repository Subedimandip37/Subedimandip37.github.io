---
layout: page
title: Gallery
permalink: /gallery/
description: A collection of moments from my projects and passions.
nav: true
nav_order: 5
display_categories: [work, personal]
horizontal: false
---

<!-- pages/gallery.md -->
<div class="projects">
{% if site.enable_gallery_categories and page.display_categories %}
  <!-- Display categorized gallery items -->
  {% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{% if category == 'work' %}Work{% else %}{{ category | capitalize }}{% endif %}</h2>
  </a>
  {% assign categorized_gallery = site.gallery | where: "category", category %}
  {% assign sorted_gallery = categorized_gallery | sort: "importance" %}
  <!-- Generate cards for each gallery item -->
  {% if page.horizontal %}
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for gallery_item in sorted_gallery %}
      {% include gallery_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for gallery_item in sorted_gallery %}
      {% include gallery.liquid %}
    {% endfor %}
  </div>
  {% endif %}
  {% endfor %}

{% else %}

<!-- Display gallery items without categories -->
{% assign sorted_gallery = site.gallery | sort: "importance" %}

  <!-- Generate cards for each gallery item -->
{% if page.horizontal %}
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for gallery_item in sorted_gallery %}
      {% include gallery_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for gallery_item in sorted_gallery %}
      {% include gallery.liquid %}
    {% endfor %}
  </div>
  {% endif %}
{% endif %}
</div> 