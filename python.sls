#
# Salt state - Python dev package installs
#

# On RHEL. pip is on EPEL, should be already a repo if salt 
# was bootstrapped from script/installed from there...
python-pip:
    pkg.installed

python-gevent:
    pkg.installed

python-requests:
    pkg.installed

pypy:
    pkg.installed

{% if grains['os'] == 'Ubuntu' %}
# Notes: python-zmq, python-jinja2, python-yaml installed by salt.
python_developer:
    pkg.installed:
        - pkgs:
            - ipython
            - python-dev
            - python-virtualenv
            - python-flake8
            - python-numpy

python_scientific:
    pkg.installed:
        - pkgs:
            - python-scipy
            - python-matplotlib
            - mayavi2

{% elif grains['os_family'] == 'RedHat' %}

python_developer:
    pkg.installed:
        - pkgs:
            - ipython
            - python-devel
            - python-virtualenv
            - numpy

python_scientific:
    pkg.installed:
        - pkgs:
            - scipy
            - python-matplotlib
            - Mayavi

{% endif %}

wheel:
    pip.installed:
        - require:
            - pkg: python-pip

geojson:
    pip.installed:
        - require:
            - pkg: python-pip

Flask:
    pip.installed:
        - require:
            - pkg: python-pip
    
