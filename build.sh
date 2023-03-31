## Cred: root:atos-team


virsh net-define /usr/share/libvirt/networks/default.xml
chmod +x ./create-vm.sh

subscription-manager register --auto-attach
git clone https://github.com/luisarizmendi/rhel-edge-quickstart.git
cd rhel-edge-quickstart

# copy blueprint.toml
./0-pre-requisites-osbuild.sh
./1-create-image.sh -b blueprint.toml
./2-publish-image.sh -i <IMG_ID>
./3-create-offline-deployment.sh -f -F https://fdo-manufacturing-server-atos-development.apps.wa6eqszp.uksouth.aroapp.io -d vda 

# Copy edge-iso from image-builder guest to vm host
scp -i atos rhel-edge-quickstart/images/e4809c99-1f95-4e8d-a7fc-3132e9795f0d-simplified-installer.iso atos@192.168.122.1:/home/atos/edge/edge-img.iso