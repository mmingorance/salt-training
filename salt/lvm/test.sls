{% for device in grains['SSDs'] -%}

{% if device | regex_match('(.*)[b-z]$') -%}

disk-{{device}}:
  lvm:
    - pv_present
    - name: /dev/{{device}}

{% endif %}
{% endfor %}
