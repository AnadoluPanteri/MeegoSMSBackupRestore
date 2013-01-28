# SMS Backup and Restore for Meego

Original Version:

https://github.com/wwwjfy/MeegoSMSBackupRestore
http://talk.maemo.org/showthread.php?t=83166

## Installation

Deb file can be downloaded from <https://github.com/wwwjfy/MeegoSMSBackupRestore/downloads>.

run on device

    dpkg -i smsbackuprestore_0.1_armel.deb

## Format

It uses psudo-csv format without header.

	phone_number,direction,date,"content"

- phone_number: the phone number sending or receiving SMS
- direction: 1 for inbound, 2 for outbound
- date: the format is yyyy-MM-dd hh:mm:ss
- content: double quotes are used in case any CRLF line breaks. If double quotes included in content, use "".

## Functionalities

### Import

Usage:

    smsbackuprestore import [filename]

It'll take quite long time to commit the changes if you've got thousands of messages.
Time needed varies as groups creation also takes time.

### Export

Usage:

    smsbackuprestore export [filename]

Exporting is quite fast as it need not commit to tracker database.

## Why not use standard Meego SDK

Because Meego SDK doesn't support SMS manipulation, new SMS can not be in Draft, so I use [Harmattan Platform SDK](http://harmattan-dev.nokia.com/platform-sdk/).

## Thanks

Thank [Philipp Zabel](philipp.zabel@gmail.com), the author of [mff](http://gitorious.org/mff/mff), which imports SMS messages from N900(el-v1.db). The deb file can be downloaded in <http://talk.maemo.org/showthread.php?t=77415&page=4>

Referencing a lot commhistory-tool.cpp in [libcommhistory](https://gitorious.org/commhistory/libcommhistory).
