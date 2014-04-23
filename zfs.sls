#
# Salt state - ZFS for Ubuntu
#

# Add PPA and install zfs
{% if grains['os'] == 'Ubuntu' %}
zfs:
    pkgrepo.managed:
        - ppa: zfs-native/stable
    pkg.installed:
        - name: ubuntu-zfs
        - refresh: True

# Most Ubuntus and Debian need this if no patched mount binary
/etc/default/zfs:
    file.replace:
        - pattern: "ZFS_MOUNT='no'"
        - repl: "ZFS_MOUNT='yes'"

{% elif grains['os'] == 'ScientificLinux' %}
zfs:
    pkg.installed:
        - enablerepo: sl-addons

{% endif %}
