# Docker container for Supermicro® IPMIView

Inspired from [solarkennedy/ipmi-kvm-docker](https://github.com/solarkennedy/ipmi-kvm-docker)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* noNVC - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager

## Usage

```bash
git clone https://github.com/sunfoxcz/ipmiview
cd ipmiview
wget https://www.supermicro.com/wdl/utility/IPMIView/Linux/IPMIView_2.21.0_build.221118_bundleJRE_Linux_x64.tar.gz
tar zxvf IPMIView_2.21.0_build.221118_bundleJRE_Linux_x64.tar.gz
make
docker run -p 8080:8080 sunfoxcz/ipmiview:latest
```

Then open your browser with address `http://localhost:8080/vnc.html`.
