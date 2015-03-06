# vagrant_puppet_jenkins
Resources for a CentOS instance provisioned with Puppet

### Installation
There is an assumption that you have vagrant and a VM provider like VirtualBox installed. (If not... https://www.vagrantup.com/)

Clone this repo

```
cd vagrant_puppet_jenkins
bundle install
librarian-puppet update
vagrant up
vagrant provision
```

In a browser visit http://192.168.33.60:8080/
