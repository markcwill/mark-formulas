#
# Salt state to install docker on bare metal
#
{% if grains['os'] == 'Ubuntu' %}
# AND you are 13.04-13.10
docker_deps:
    pkg.installed:
        - name: linux-image-extra-{{ grains['kernelrelease'] }}

docker_io:
    pkgrepo.managed:
        - humanname: Docker container repo
        - name: deb http://get.docker.io/ubuntu docker main
        - file: /etc/apt/sources.list.d/docker.list
        - keyserver: keyserver.ubuntu.com
        - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9

    pkg.installed:  
        - name: lxc-docker
        - refresh: True

#
# Red Hat/CentOS coming soon?
#
{% endif %}
