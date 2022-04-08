# lazy-loadtest

## Disclaimer
Some of the tools deployed by these scripts have not been tested and I do not know what their purpose is. Verify this code is load testing your own servers ONLY before using.

## What is this for
Light touch deployment of load testing tools.

## What to do
Fork this repository and make it private, make the noted changes and deploy

## Prerequisites 
- A cloud VM. This should work on Digital Ocean using a **Fedora image** (yum is assumed to be the package manager) or AWS Linux. Note that if you use Digital Ocean you should use a [SSH key](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/) (these scripts assume you are using this method).
A coupon for Digital Ocean can be found following the setup instructions from [here](https://itarmy.com.ua/vps/?lang=en)
- VPN 

## Files that require updating
- /userdata : Replace REDACTED_TOKEN and REDACTED_GITUSERNAME with a [Github token](https://github.com/settings/tokens) and username respectively. Remove the comment (#) from whichever load testing tool you are intending to use.
- /vpn/provider_secret : Replace with your username and password for the VPN provider (This may not be your login details. Check provider instructions).
- /vpn/provider_??.conf : Replace file with a configuration from your VPN provider (May be under "manual configuration". Check provider instructions). Rename the file/files to the provider_*something*.conf format.

## Next steps
- Start the process of deploying a cloud VM, paste the contents of the updated **userdata** file into the userdata field
- Deploy the VM

After 10 minutes or so you can check the progress of either tool by connecting to the VM and running **docker logs -f _containername_**


Slava Ukraini!