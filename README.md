# image-builder

The image-builder service is responsible for creating and generating RHEL for Edge images, which can be deployed on the PoS edge devices (or in this case on the guest vm)

The image builder uses the scripts provided by [https://github.com/luisarizmendi/rhel-edge-quickstart](https://github.com/luisarizmendi/rhel-edge-quickstart) to build the image.

## Setup

Before the image-builder can be used, a new guest VM is created to have the service run in a separate vm. To create a new VM via libvirt, the `create-vm.sh` script was used (incl. the `kickstart.cfg` file).

## Image creation

Now that the image-builder vm was created, it is ready to create an edge image. To do that, the `build.sh` script was used. It will create the ostree image, publish it, create an offline deployment in order to have the image as installable .iso file and finally copies the file back to the host vm, from where it can be used to create / install a new RHEL for Edge vm (see [https://github.com/TailorShift/edge-setup](https://github.com/TailorShift/edge-setup))