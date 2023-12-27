#Global variables
declare -a gi_versions=(3.2.11 3.2.12 3.2.13)
declare -a gi_cases=(2.2.11 2.2.12 2.2.13)
declare -a ics_versions=(3.19.18 3.19.19)
declare -a ics_cases=(ibm-cp-common-services-1.15.18.tgz ibm-cp-common-services-1.15.19.tgz)
declare -a bundled_in_gi_ics_versions=(0 0 1)
declare -a ocp_versions=(0 1 2)
declare -a ocp_major_versions=(4.10 4.12 4.14)
declare -a ocp_supported_by_gi=(0:1 0:1 0:1)
declare -a ocp_supported_by_ics=(0:1 0:1)
declare -a ocp_supported_by_cp4s="0:1"
declare -a gi_sizes=(values-dev values-small)
declare -a fedora_supp_releases=(38)
registry_version=2.8.3
rook_version="v1.9.9"
rook_sc=("rook-cephfs" "rook-ceph-block")
ocs_sc=("ocs-storagecluster-cephfs" "ocs-storagecluster-ceph-rbd")
galaxy_community_general="5.8.10"
galaxy_ansible_utils="2.10.3"
galaxy_community_crypto="2.15.1"
galaxy_containers_podman="1.10.4"
matchbox_version="0.10.0"
nfs_provisioner_version=4.0.2
ibm_ocp_pak_version=1.11.2
cp4s_channel="1.10"
cp4s_redis_release="1.6.11"
declare -a cp4s_versions=(1.10.17)
declare -a cp4s_cases=(1.0.42)
GI_HOME=`pwd`
GI_TEMP=$GI_HOME/gi-temp
file=$GI_HOME/variables.sh
linux_soft=("tar" "ansible" "haproxy" "openldap" "perl" "podman-docker" "ipxe-bootimgs" "chrony" "dnsmasq" "unzip" "wget" "httpd-tools" "policycoreutils-python-utils" "python3-ldap" "openldap-servers" "openldap-clients" "pip" "skopeo" "nfs-utils" "openssl")
python_soft=("passlib" "dnspython" "beautifulsoup4" "argparse" "jmespath")
galaxy_soft=("community-general-${galaxy_community_general}" "ansible-utils-${galaxy_ansible_utils}" "community-crypto-${galaxy_community_crypto}" "containers-podman-${galaxy_containers_podman}" )
