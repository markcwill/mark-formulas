#
# Music recording/playback apps
#
{% if grains['os'] == 'Ubuntu' %}

mark_audio:
    pkg.installed:
        - pkgs:
            - mixxx
            - ardour
            - audacity

{% endif %}
