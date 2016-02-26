
This module installs the simp_le client on a central server from source and
allows you to manually request and package certificates (.deb format).

The packages can be copied to certificate-using clients where only a thin
forwarding proxy to the central server is needed.

## Support

This module is tested with Puppet 3.7 and 3.8 and is currently only written to work on
Debian based operating systems, although it may work on others.

## Features

  * Centralized certificate creation (build server)
  * no extra software installed on clients

## Usage

To install the letsencrypt server you should provide an email address
to get certificate expiry information and for recovering your Let's encrypt account:

```puppet
class { ::letsencrypt::server:
  contact_email => 'foo@example.com',
}
```

On systems where you want to use certificates, the letsencrypt client is needed:

```puppet
class { ::letsencrypt::client:
  servername => 'letsencrypt.example.com',
  port       => '80',
}
```

ACME-challenge requests will be forwarded to http://$servername:$port/ 

## Creating certificates

```bash
letsencrypt-package-certificate example.com www.example.com www2.example.com
```
