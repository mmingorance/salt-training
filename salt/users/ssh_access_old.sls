{% for user, uid in pillar.get('users', {}).items() %}
{{user}}-ssh-user:
  file:
    - managed
    - name: /home/{{user}}/.ssh/authorized_keys
    - source: salt://users/files/ssh_keys
    - mode: 600
    - user: {{user}}
    - group: {{user}}

{{user}}-ssh-folder:
  file.directory:
    - name: /home/{{user}}/.ssh
    - user: {{user}}
    - group: {{user}}
    - dir_mode: 700
{% endfor %}
