#
# Salt - Obspy install
#

# only works for Ubuntu/Debian package repo right now...
#
{% if grains['os_family'] == 'Debian' %}

obspy:
    pkgrepo.managed:
        - humanname: ObsPy - Python framework for seismology
        - name: deb http://deb.obspy.org {{ grains['oscodename'] }} main
        - file: /etc/apt/sources.list.d/obspy.list
        - key_url: https://raw.github.com/obspy/obspy/master/misc/debian/public.key

    pkg.installed:
        - name: python-obspy
        - refresh: True

{% elif grains['os_family'] == 'RedHat' %}
#
# otherwise, need the pre-requisites, maybe wheels for numpy, scipy, etc
#

# Method 1: pip -> Requires fedora/Scientific w/epel
obspy_pkg_dependencies:
    pkg.installed:
        - pkgs:
            - python-pip
            - python-devel      
            - python-setuptools
            - numpy
            - scipy
            - python-matplotlib
            - python-lxml
            - python-suds
            - python-sqlalchemy
            - gcc-gfortran

obspy_pip_distribute:
    pip.installed:
        - name: distribute
        - require:
            - pkg: obspy_pkg_dependencies

obspy:
    pip.installed:
        - require:
            - pkg: obspy_pkg_dependencies
            - pip: obspy_pip_distribute
        
{% endif %}
