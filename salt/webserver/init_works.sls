apache2:
  pkg.installed:
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% elif grains['os'] == 'Ubuntu' %}
      - name: apache2
    {% endif %}
  service.running:
    - require:
      {% if grains['os'] == 'RedHat' %}
        - pkg: httpd
      {% elif grains['os'] == 'Ubuntu' %}
        - pkg: apache2
      {% endif %}

/var/www/html/index.html:
  file:
    - managed
    - source: salt://webserver/files/index.html
    - require:
      {% if grains['os'] == 'RedHat' %}
        - pkg: httpd
      {% elif grains['os'] == 'Ubuntu' %}
        - pkg: apache2
      {% endif %}
