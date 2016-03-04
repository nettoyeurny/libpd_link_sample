libpd
=====

    git clone --recursive git@github.com:nettoyeurny/libpd_link_sample.git

Open PdLink.xcodeproj in Xcode. If the libpd_link_sample directory is in the same directory as the LinkKit directory, the sample app should just work. Otherwise you'll need to adjust a few paths in the project settings.

The directory libpd/abstractions contains an abstraction, abl_link~.pd, that mimics the behavior of the Link external, as well as a help patch that explains how to use it.

