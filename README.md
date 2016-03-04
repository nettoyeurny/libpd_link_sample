Link and libpd --- quick and dirty sample app
=====

Quick start: In the parent directory of your LinkKit directory (i.e., /some_path/LinkKit/..), say

    git clone --recursive git@github.com:nettoyeurny/libpd_link_sample.git

This will clone the sample app as well as the Link-enabled version of libpd. Open libpd_link_sample/PdLink.xcodeproj in Xcode. You should be able to run the sample app without having to make any changes.

The directory libpd_link_sample/libpd/abstractions contains an abstraction, abl_link~.pd, that mimics the behavior of the Link external, as well as a help patch that explains how to use it.

