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

{% endif %}
#
# otherwise, need the pre-requisites, maybe wheels for numpy, scipy, etc
