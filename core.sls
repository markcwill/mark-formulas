#
# Salt state - core packages
# Mark's workstations
# **Netrunner (Ubuntu) only for now**
#
{% if grains['os'] == 'Ubuntu' %}
core:
    pkg:
        - installed
        - pkgs:
            - vim
            - zsh
            - git
            - python-software-properties
            - nfs-common
{% endif %}
