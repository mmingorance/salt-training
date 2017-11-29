{% for user, uid in pillar.get('users', {}).items() %}
{{user}}-creation:
  user.present:
    - name: {{user}}
    - uid: {{uid}}
    - home: /home/{{user}}
    - shell: /bin/bash
    - gid_from_name: True
    - groups:
      - sudo
      - staff
    - createhome: True
{% endfor %}
