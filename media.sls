#
# Video/audio playing apps
#
{% if grains['os'] == 'Ubuntu' %}
mark_media:
    pkg.installed:
        - pkgs:
            - vlc
            - clementine
{% endif %}
