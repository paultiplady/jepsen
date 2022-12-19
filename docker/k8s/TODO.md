# TODO

Failures:


```
 - statefulset/node: container node is backing off waiting to restart
    - pod/node-0: container node is backing off waiting to restart
      > [node-0 node] run-parts: executing /usr/local/preinit/00-checkroot
      > [node-0 node] Cleaning up; ignore errors here:
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/namespace': Read-only file system
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/ca.crt': Read-only file system
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/token': Read-only file system
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/..2022_12_17_05_18_07.471148714/namespace': Read-only file system
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/..2022_12_17_05_18_07.471148714/ca.crt': Read-only file system
      > [node-0 node] find: cannot delete './secrets/kubernetes.io/serviceaccount/..2022_12_17_05_18_07.471148714/token': Read-only file system
      > [node-0 node] Cleaning up temporary files... /tmpbootclean: Failure cleaning /run. ... failed!
      > [node-0 node]  /run/lock failed!
      > [node-0 node] run-parts: executing /usr/local/preinit/00-setinit
      > [node-0 node] run-parts: executing /usr/local/preinit/01-syslog
      > [node-0 node] Sending syslog to Docker (config file /etc/syslog.conf.stdout)
      > [node-0 node] run-parts: executing /usr/local/preinit/01-timezone
      > [node-0 node] run-parts: executing /usr/local/preinit/02-ssh-server
      > [node-0 node] SSH server enabled; unset DEBBASE_SSH to disable
      > [node-0 node] Synchronizing state of ssh.service with SysV service script with /lib/systemd/systemd-sysv-install.
      > [node-0 node] Executing: /lib/systemd/systemd-sysv-install enable ssh
      > [node-0 node] Generating SSH host keys...
      > [node-0 node] debconf: unable to initialize frontend: Dialog
      > [node-0 node] debconf: (TERM is not set, so the dialog frontend is not usable.)
      > [node-0 node] debconf: falling back to frontend: Readline
      > [node-0 node] debconf: unable to initialize frontend: Readline
      > [node-0 node] debconf: (This frontend requires a controlling tty.)
      > [node-0 node] debconf: falling back to frontend: Teletype
      > [node-0 node] Creating SSH2 RSA key; this may take some time ...
      > [node-0 node] 2048 SHA256:dLSBO2K8cIW77tGeP+Y71pUlxlszRkJuT/C9vlrcPhg root@node-0 (RSA)
      > [node-0 node] Creating SSH2 ECDSA key; this may take some time ...
      > [node-0 node] 256 SHA256:OgLlbuMTGC3IFhJ43Gi+q1bY9BtwgV35Ah98vJG+M10 root@node-0 (ECDSA)
      > [node-0 node] Creating SSH2 ED25519 key; this may take some time ...
      > [node-0 node] 256 SHA256:5DNAW/yNzd1fIptsQ/edxV1O6R9LJbBt19OEou2wAsE root@node-0 (ED25519)
      > [node-0 node] invoke-rc.d: could not determine current runlevel
      > [node-0 node] run-parts: executing /usr/local/preinit/03-setup-jepsen
      > [node-0 node] total 24
      > [node-0 node] drwx------ 1 root root 4096 Dec 17 05:21 .
      > [node-0 node] drwx------ 1 root root 4096 Dec 17 04:16 ..
      > [node-0 node] -rw------- 1 root root  608 Dec 17 05:18 authorized_keys
      > [node-0 node] -rw------- 1 root root 2602 Dec 17 05:18 id_rsa
      > [node-0 node] -rw------- 1 root root  573 Dec 17 05:18 id_rsa.pub
      > [node-0 node] Starting systemd
```

Working (compose) version:

```
Attaching to jepsen-control, jepsen-n1, jepsen-n2, jepsen-n3, jepsen-n4, jepsen-n5
jepsen-n1       | run-parts: executing /usr/local/preinit/00-checkroot
jepsen-n1       | Cleaning up; ignore errors here:
jepsen-n1       | [....] Cleaning up temporary files... /tmpfind: cannot delete './secrets/authorized_keys': Device or resource busy
[FAILn-n1       | [....] bootclean: Failure cleaning /run. ... failed!
[FAILn-n1       |  /run/lock failed!
jepsen-n1       | run-parts: executing /usr/local/preinit/00-setinit
jepsen-n1       | run-parts: executing /usr/local/preinit/01-syslog
jepsen-n1       | Sending syslog to Docker (config file /etc/syslog.conf.stdout)
jepsen-n1       | run-parts: executing /usr/local/preinit/01-timezone
jepsen-n1       | run-parts: executing /usr/local/preinit/02-ssh-server
jepsen-n1       | SSH server enabled; unset DEBBASE_SSH to disable
jepsen-n1       | Synchronizing state of ssh.service with SysV service script with /lib/systemd/systemd-sysv-install.
jepsen-n1       | Executing: /lib/systemd/systemd-sysv-install enable ssh
jepsen-n1       | Generating SSH host keys...
jepsen-n1       | debconf: unable to initialize frontend: Dialog
jepsen-n1       | debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
jepsen-n1       | debconf: falling back to frontend: Readline
...
jepsen-n1       | Starting systemd
jepsen-n1       | Failed to lookup module alias 'autofs4': Function not implemented
jepsen-n1       | systemd 241 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default-hierarchy=hybrid)
jepsen-n1       | Detected virtualization docker.
jepsen-n1       | Detected architecture x86-64.
jepsen-n1       |
jepsen-n1       | Welcome to Debian GNU/Linux 10 (buster)!
jepsen-n1       |
jepsen-n1       | Set hostname to <n1>.
```

Systemd is failing with error 255.
Tried adding a tty.

This got us further.

Adding CAP ALL gets us to:

```

[node] Welcome to Debian GNU/Linux 10 (buster)!
[node]
[node] Set hostname to <node-0>.
[node] Failed to create /init.scope control group: Read-only file system
[node] Failed to allocate manager object: Read-only file system
[node] [!!!!!!] Failed to allocate manager object.
[node] Exiting PID 1...
```

Something to do with the root filesystem being RO?
This issue maybe: https://github.com/moby/moby/issues/42275

I tried the /run mount, that didn't help.

Try adding privileged. OR, running our k8s in Podman: https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container

Privileged solves this.

Next problem -- how can I get the IP of the nodes?

```
root@control-0:/jepsen# nslookup node-0.node.default.svc.cluster.local
Server:		10.96.0.10
Address:	10.96.0.10#53

Name:	node-0.node.default.svc.cluster.local
Address: 10.1.0.60

root@control-0:/jepsen# nslookup node.default.svc.cluster.local
Server:		10.96.0.10
Address:	10.96.0.10#53

Name:	node.default.svc.cluster.local
Address: 10.1.0.60

root@control-0:/jepsen#
```

Can I get the pod names from DNS? Doesn't look like it.

https://kubernetes.io/docs/tasks/run-application/access-api-from-pod/#without-using-a-proxy

Can get the pods like this: http://localhost:8001/api/v1/namespaces/default/pods/?labelSelector=app=node

Got the pods. Now we have `/root/.ssh/known_hosts` being populated, but it still doesn't fix the key exchange:


```
root@control-0:/jepsen# ssh node-0.node
Warning: Permanently added the ED25519 host key for IP address '10.1.0.73' to the list of known hosts.
root@node-0.node's password:

root@control-0:/jepsen# cat /root/.ssh/known_hosts

node-0.node ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdHcu6dU/JWCcr3MXfy66KBG98+4Glvnm93RcqY323yiE+0tiEvKJJuseaHuUa0TG4GyXkZh+BgmKSfzocka/0Y335E8Y8/jaX5K4NXB5AQCWubyJMaldE8HCF3GYWUlS1Edfz+h6aUirNvnoqjy3chXQJLwQpmykAyELw7t6yTnYIHPe6IUAOQINO6Vb15K0Ayj2A42OGWCud1L/sSUbEoKHC9GFecGi0nkgRRwt5vYKSt1v7eRL6HQRBy7TfKFPQ+FQx4iJj5r77kmuyXiuIvIyKPyJVboSja7GPT3+aJEJKuYTZaL/igPyO+HB+L03A+mggJP/9vyxfQIF2UKlh
node-0.node ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCUFWUoTo0GTjpydpZud2h2pMJwrSlfy3SJZ8Izmp4X
|1|OMF0QFji9pHoJVGAQ1WLrHbirBU=|5lkNfwiT4b+LtYisUhEKAYqHH/I= ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCUFWUoTo0GTjpydpZud2h2pMJwrSlfy3SJZ8Izmp4X
```