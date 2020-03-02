## **vCenter Packer Templates**
------------------------

I've created this repo to provide open HashiCorp Packer templates that can be used/modified to create Centos 7/8 and Ubuntu 1804 vCenter templates of varying disk sizing.

These templates all currently utilize HashiCorp Vault to retrieve sensitive data from my environment, however all user variables defined with vault can simply be redefined with your own variables within your environment.


**! IMPORTANT NOTE !** 

Usage of these Packer templates requires **Packer >= v1.5.2** as the vsphere-iso builders are now contained within those versions and do not require additional plugin downloads



### **Kickstart/Preseed Files**
------------------------

In addition to the template files themselves, you'll also need to supply your own kickstart/preseed files within the http directory supplied.

Example files for all of these Operating Systems can easily be found with a quick Google, once customized you can drop them directly into the ```http``` directory with standard naming ( ```ks.cfg``` and ```preseed.cfg``` for kickstart preseed respectively).



### **HashiCorp Vault Integration**
------------------------

The provided templates utilize HashiCorp Vault to retrieve sensitive information stored as secrets within Vault. You can utilize the configuration provided along with HashiCorp's documentation to retrieve secrets from your own Vault instance.

It is important to note however that the Vault integrations with Packer currently do not have a mechanism to allow you to login prior to running a Build. As such, it is necessary to obtain your own token prior to the build process.

This can be accomplished through whatever login methods are preferred (even AppRole) and are best accomplished through the addition of your own ```vault-login.sh``` script to the ```bin/``` directory. This script can be executed prior to a build to authenticate you to Vault and return your token. This token can be exported to an environment variable, or used directly with the vault-cli to login prior to build execution.

Once authenticated, Packer will retrieve the designated secrets seamlessly and the Build process will continue as expected.