---
layout: page
title: Graduações
permalink: /graduacoes/
---

> **Conteúdo de exemplo.** As técnicas abaixo são ilustrativas; o programa oficial de cada exame deve ser confirmado com o sensei.

Escolha o exame para ver as técnicas exigidas.

<div class="list-group">
{% assign grades = site.graduacoes | sort: "order" %}
{% for grade in grades %}
  <a class="list-group-item" href="{{ grade.url | relative_url }}">
    <strong>{{ grade.title }}</strong> <span class="text-muted">&middot; faixa {{ grade.belt | downcase }} &middot; {{ grade.techniques | size }} técnicas</span>
  </a>
{% endfor %}
</div>
