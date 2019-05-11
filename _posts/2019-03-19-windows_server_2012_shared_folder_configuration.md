--- 
layout: post 
title: "Windows Server 2012 Shared Folder Configuration" 
date: 2019-03-19 21:44:47 
author: Dewey Mao 
categories: Server 
--- 

### Delete user credential
```
Control panel -> User account -> Credential manager
```

### Open Guest account
```
Control panel -> User account -> Manage other acccounts
```

### Manage password of Guest account
```
Control panel -> Computer management -> Local user and group -> User
```

### Modify Local Group Policy
```
run: gpedit.msc
Local Computer Policy -> Computer Configuration -> Windows Setting -> Security Setting -> Local policy -> User Rights Assignment:
Remove Guest from 'Deny access to this computer from network'
Local Computer Policy -> Computer Configuration -> Windows Setting -> Security Setting -> Local policy -> Security Options:
Network access - Sharing and security model for local accounts: Guest only - authenticate the local user, who is the guest
Network access - Anonymously accessible shares: Name of your shared folder
Accounts - Status of Guest : Enabled
```

### Set shared folder and access authority
```
Folder -> Attribute -> Share: Share and Advanced Share settings
Folder -> Attribute -> Security
```

### Turn off password protection share
```
Control panel -> Network and Share Center -> Advanced Share Setting -> All networks -> turn off password protection share
```

### Enable 445 port in firewall
```
Control panel -> Windows defender firewall -> Advanced setting
```
