#
# Salt state - Python dev package installs
# (Ubuntu only, for now)
#
{% if grains['os'] == 'Ubuntu' %}
# Notes: python-zmq, python-jinja2, python-yaml installed by salt.
python_developer:
    pkg.installed:
        - pkgs:
            - ipython
            - python-dev
            - python-pip
            - python-virtualenv
            - python-flake8
            - python-numpy

python_scientific:
    pkg.installed:
        - pkgs:
            - python-scipy
            - python-matplotlib
            - mayavi2
{% endif %}
# TODO: add obspy, then break out to separate module
