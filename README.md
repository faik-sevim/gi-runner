<B>Cloud Pak's installation automation tool on bare metal</B>
<HR>
<P>Automates OCP installation for releases: 4.12, 4.14
<P>Automates CPFS installation for releases: 3.19.22
<P>Automates GI installation for releases: 3.3.5
<P>Automates CP4S installation for 1.10 channel
<P>Automates EDR installation ifor release 1.0.2 (online installation only because of bug in the images list)
<P>Supports installation with direct access to the Internet, using proxy or air-gapped (restricted) approach
<P>Supported storage backends: rook-ceph, ODF, Portworx Essentials (only online installation)
<P>Implemented OCP architectures:
<LI>3 masters and 3+n workers
<LI>3 masters only
<LI>Bastion setup requires Fedora 38 or 39 as a operating system
<HR>
Examples of use at this link: <A href=https://guardiumnotes.wordpress.com/2021/09/09/automation-of-openshift-and-guardium-insights-installation-on-bare-metal/>https://guardiumnotes.wordpress.com/2021/09/09/automation-of-openshift-and-guardium-insights-installation-on-bare-metal/</A>
<HR>
This tool installs everything from scratch. It does not support installation CPFS or GI on preinstalled OCP.
<HR>
For online installation execute init.sh script to collect installation parameteres. Then shell variables defined in variables.sh file control Ansible playbook - plays/install.yaml to deploy all desired solutions.
<HR>
For offline installation you need collect installation tools and container images and then deliver them to bastion located in the restricted network.
All archives for air-gapped installation are now managed by one script - prepare_offline.sh
prepare_offline.sh accepts parameter for skip some prepared before archives:
<UL>
<LI>1 - skips phase to gather OS, Python and Ansible packages
<LI>2 - skips phase 1 and OCP archives preparation
<LI>3 - skips 1, 2 and rook archives preparation
<LI>4 - skips 1, 2, 3 and collection openldap and nfs-client images, move to task to collect Cloud Pak's image
</UL>
<HR>
init.sh script supports parameter skip_offline - it skip archives extraction and bastion offline preparation in case of restart the init.sh for air-gapped installation (avoid to untar GB's of data again)
<HR>
The play install.yaml accepts skip_phase  parameter, must be specified with -e flag (like ansible-playbook plays/install -e skip_phase=<phase>):
<UL>
skip_phase allows restart install.yaml play from defined point (to avoid full restart of deployment), possible values:
<LI>1 ignores bastion setup preparation, play waiting for OCP bootstrap phase finish
<LI>2 moves to storage deployment, OCP must be deployed fully
<LI>3 moves to image registry setup, assumes that storage option is correctly deployed
<LI>4 moves to CPFS deployment
<LI>5 moves to openldap deployment, assumes that CPFS has been installed (GI and standalone CPFS deployment)
<LI>6 moves to nfs client deployment, assumes that CPFS and openldap has been installed
<LI>7 moves to Cloud Pak deployment, all other phase must be finished with success

