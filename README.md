# Hello TouchApp!

A [CouchApp](http://couchapp.org) is an HTML5 app served directly from CouchDB.

[TouchDB](https://github.com/couchbaselabs/TouchDB-iOS/) is a lightweight mobile database that syncs with CouchDB and offers a similar (but not identical) REST-style API.

## What's a TouchApp?

I guess it's an HTML5 app served from TouchDB.

## Why is it neat?

I think it's neat because now it means that people who love the HTML5 style of development, and the power of CouchSync, can build HTML5 apps that sync.

## How do I run it?

Clone it, open in Xcode, and hit run. (Works on iPad or iPhone)

## Is this for real?

This repo is the result of a 1/2 day experiment, and is really meant to illustrate the proof of concept. The contained app isn't yet configured to do any syncing, or much in the way of database access at all. But now that I've done the work of bootstrapping a WebView and pointing it at TouchDB, the rest of the code can be done in JavaScript.

One thing that is cool about this is that it's not actually using HTTP as the transport layer, yet another way it is more lightweight than a traditional CouchApp. More about that on [the TouchDB docs page.](https://github.com/couchbaselabs/TouchDB-iOS/wiki/Using-TouchDB)

## What's Next?

This app is the beginning of a project I have in mind. The next steps include:

* scripting the `couchapp` tool so it's JSON output is automatically bundled into the build
* figuring out how to do this with a [PhoneGap](http://phonegap.com) powered web view

Feel free to use this app as the starting point for your experiments. If you make other changes that you think would be useful as part of a toolkit for TouchApp creators.

## And then?

In the long run this same pattern should work well on Android also, using [Android TouchDB](https://github.com/couchbaselabs/TouchDB-Android).





