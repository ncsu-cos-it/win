# wol-broughton
WOL Scripts for Broughton Hall
==================

wol.py is A small Python 3 script to allow the sending of a WOL Magic packet so that LAN clients can be remotely switched on from another machine on the same subnet. Rather than needing to know the MAC address of the desired machine, the script allows you to specify by hostname, so long as that host is included in the configuration file.

For a quick and lazy way to create the configuration file, see [The Wake On Lan section of my router build documentation](https://www.bentasker.co.uk/documentation/linux/258-usurping-the-bthomehub-with-a-raspberry-pi-part-three-routing-remote-administration-and-utilities#WakeOnLan)

Acquired from https://github.com/bentasker/Wake-On-Lan-Python
Local modifications made.

Usage
-------

    wol.py [hostname]

or

    wol.py list


Configuration File(s)
--------------------

The configuration file is just a basic INI file, containing one section per host;

    [General]
    broadcast=192.168.1.255
    
    [MyPc]
    mac=00:13:0d:e4:60:61


USAGE
--------------------
* Keep configs/[building]-[description]_config.ini files updated with current Mac addresses.
* cd configs
* ./create-sas_config.py 
   * {Windows} python create-sas_config.py
* cp [building]_config.ini ../wol_config.ini
* cd ..
* ./wol.py list
  *  {Windows} python wol.py list
* ./wol.py [host]
  *  {Windows}  python wol.py [host]

**DO NOT have capital letters in for the Mac Address**
