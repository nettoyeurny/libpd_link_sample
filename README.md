Link and libpd --- quick and dirty sample app
=====

**This version uses Ableton Link 1.0.2.**

This sample app shows how to integrate the [Ableton Link external](https://github.com/nettoyeurny/pd_link_bridge) into iOS apps.

Quick start: In the parent directory of your LinkKit directory (i.e., /some_path/LinkKit/..), say

    git clone --recursive git@github.com:nettoyeurny/libpd_link_sample.git

This will clone the sample app, libpd, and the Ableton Link external. Open libpd_link_sample/PdLink.xcodeproj in Xcode. You should be able to run the sample app without having to make any changes.

The directory libpd_link_sample/pd_link_bridge/abstractions contains an abstraction, abl_link~.pd, that mimics the behavior of the Link external, as well as a help patch that explains how to use it.

