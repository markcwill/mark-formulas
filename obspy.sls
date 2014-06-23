#
# Salt - ObsPy install
# Only supported obspy install methods are used (deb + pip)
#
# Use the native package management system for dependencies
# whenever possible. Use pip for everything else.
#

#######################################################################
# REPOSITORY INSTALL
#######################################################################

#- Debian/Ubuntu
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

#######################################################################
# PIP INSTALL
#######################################################################
{% else %}

#--- 1. Get dependencies from package system -------------------------#
#
# TODO: break distro variables out to a map.jinja file
#

#- RHEL/CentOS
#
{% if grains['os_family'] == 'RedHat' %}
# 6.x, requires EPEL (resolved by salt-bootstrap)
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
            - gcc

#- Arch Linux
#
{% elif grains['os_family'] == 'Arch' %}
obspy_pkg_dependencies:
    pkg.installed:
        - pkgs:
            - python-pip
            - python-setuptools
            - python-numpy
            - python-scipy
            - python-matplotlib
            - python-lxml
            - python-sqlalchemy
            - gcc-gfortran
            - gcc
    # PIP install suds-jurko
    pip.installed:
        - name: suds-jurko
        - require:
            - pkg: obspy_pkg_dependencies

#- Default
#
{% else %}
# Cry, whine, complain (actually need to exit gracefully??)

{% endif %}


#--- 2. Install obspy w/ pip  -----------------------------------------#
obspy_pip_future:
    pip.installed:
        - name: future
        - require:
            - pkg: obspy_pkg_dependencies
            
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
            - pip: obspy_pip_future

{% endif %}
