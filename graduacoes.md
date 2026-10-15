---
layout: page
title: Graduações
permalink: /graduacoes/
---

> **Conteúdo de exemplo.** As técnicas abaixo são ilustrativas; o programa oficial de cada exame deve ser confirmado com o sensei.

Técnicas exigidas em cada exame de graduação. Os dados vêm de `_data/grades.yml`.

<div class="list-group">
{% for grade in site.data.grades %}
  <a class="list-group-item" href="#{{ grade.id }}">{{ grade.name }} <span class="text-muted">&middot; faixa {{ grade.belt | downcase }}</span></a>
{% endfor %}
</div>

{% for grade in site.data.grades %}
<h2 id="{{ grade.id }}">{{ grade.name }} <small>faixa {{ grade.belt | downcase }}</small></h2>

{% if grade.notes %}<p>{{ grade.notes }}</p>{% endif %}

<div class="table-responsive">
<table class="table table-striped">
  <thead>
    <tr>
      <th>Técnica</th>
      <th>Ataque</th>
      <th>Variações</th>
      <th>Vídeo</th>
    </tr>
  </thead>
  <tbody>
  {% for t in grade.techniques %}
    <tr>
      <td>
        <strong>{{ t.name }}</strong>{% if t.japanese %} <span class="text-muted">{{ t.japanese }}</span>{% endif %}
        {% if t.meaning %}<br><small>{{ t.meaning }}</small>{% endif %}
      </td>
      <td>{{ t.attack }}</td>
      <td>{{ t.variants | join: ", " }}</td>
      <td>{% if t.video and t.video != "" %}<a href="{{ t.video }}" target="_blank" rel="noopener">Assistir</a>{% endif %}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
</div>
{% endfor %}
