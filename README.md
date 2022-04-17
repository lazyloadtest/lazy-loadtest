# lazy-loadtest

## Disclaimer
Some of the tools deployed by these scripts have not been tested and I do not know what their purpose is. Verify this code is load testing your own servers ONLY before using.

## What is this for
Light touch deployment of load testing tools.

## What to do
Past the contents of /userdata into the userdata field for a cloud VM, OR run it yourself manually with **bash lazy-loadtest/userdata**

## Prerequisites 
- A linux cloud VM or any machine running a RPM family package manager (others will require you to edit these scripts yourself). This should work on Digital Ocean using a **Fedora image** (yum is assumed to be the package manager) or AWS Linux. Note that if you use Digital Ocean you should use a [SSH key](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/) (these scripts assume you are using this method).
A coupon for Digital Ocean can be found following the setup instructions from [here](https://itarmy.com.ua/vps/?lang=en)
- VPN 

## Files that require updating
- /userdata : Remove the comment (#) from whichever load testing tool you are intending to use.
- /vpn/provider_secret : Replace with your username and password for the VPN provider (This may not be your login details. Check provider instructions).
- /vpn/provider_??.conf : Replace file with a configuration from your VPN provider (May be under "manual configuration". Check provider instructions). Rename the file/files to the provider_*something*.conf format.

## Next steps
- Start the process of deploying a cloud VM, paste the contents of the [userdata](userdata) file into the userdata field
- Deploy the VM
- **If using db1000n or disbalancer**, log into the VM and update ~/secrets/provider_secret with your VPN password details AND configuration files from your provider then restart openvpn-client and the application. e.g. **docker restart openvpn-client db1000n**

## Optional
- Adjust the [userdata](userdata) script to grab the [vpn](/vpn) directroy from your own source and overwrite the example files. See [private_example] for a way to do this with a private git repo


After 10 minutes or so you can check the progress of either tool by connecting to the VM and running **docker logs -f _containername_**


Slava Ukraini!
