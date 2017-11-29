{% for user in salt['pillar.get']('users', '') -%}
{% set uid = salt['pillar.get']('users:' + user + ':uid', '') -%}
{% set ssh_key = salt['pillar.get']('users:' + user + ':ssh', '') -%}
{% set password = salt['pillar.get']('users:' + user + ':password', '') -%}
{{user}}-creation:
  user.present:
    - name: {{user}}
    - uid: {{uid}}
    - home: /home/{{user}}
    - shell: /bin/bash
    - gid_from_name: True
    - groups:
      {% for group in salt['pillar.get']('users:' + user + ':groups', '') -%} 
      - {{ group }} 
      {% endfor %}
    - createhome: True
    - password: {{password}}

{{user}}-ssh-folder:
  file.directory:
    - name: /home/{{user}}/.ssh
    - user: {{user}}
    - group: {{user}}
    - dir_mode: 700


{{user}}-ssh-user:
  file:
    - managed
    - template: jinja
    - name: /home/{{user}}/.ssh/authorized_keys
    - source: salt://users/files/ssh_keys
    - mode: 600
    - user: {{user}}
    - group: {{user}}
    - context:
        ssh_key: {{ ssh_key }}

{% endfor %}
