#
# Extras for workstations
#
{% if grains['os'] == 'Ubuntu' %}

mark_workstation_extras:
    pkg.installed:
        - pkgs:
            - chromium-browser
            - zim
            - owncloud-client

{% endif %}
