{% for user in salt['pillar.get']('users', '') -%}
{% set sudorights = salt['pillar.get']('users:' + user + ':sudo', '') -%}
{% if sudorights == True %}
sudo_user_{{ user }}:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}
    - template: jinja
    - source: salt://users/files/sudotemplate.sls
    - context:
        sudouser: {{ user }}
{% endif %}
{% endfor %}
