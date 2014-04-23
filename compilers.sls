#
# Salt state - Ubuntu compilers
#
# **for Netrunner, java already installed**

{% if grains['os'] == 'Ubuntu' %}

compilers:
    pkg:
        - installed
        - pkgs:
            - build-essential
            - gfortran
            - scala
            - golang-go
{% endif %}

