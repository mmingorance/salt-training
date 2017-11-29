add_group:
  {% for user in salt['pillar.get']('users', '') -%}
  user.present:
    - name: {{ user }}
    - groups:
  {% for group in salt['pillar.get']('users:' + user + ':groups', '') -%}
      - {{ group }}
  {% endfor -%}

  {% endfor -%}
