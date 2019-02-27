# irmaios

This library enables the starting of IRMA sessions from an iOS app. Specifically, it implements the handing of the IRMA session to the `irma_mobile` app.

## Installation

This repository contains an XCode project of the library. The easiest way to incorporate this into your iOS app is to add it as a subproject to your app's XCode project.

## Usage

First, this library assumes that you have implemented some way of getting a session pointer from you backend systems. For information on how to get this, see the IRMA documentation and the `demosrv` sample server implementation. Furthermore, it is assumed that you have set up some form of url-based scheme to let the `irma_mobile` app hand control back to your app. For an example on how to implement this using scheme urls see the `IRMAiOSDemoApp` project.

Given these two ingredients, the session can be handed to `irma_mobile` using:

```swift
import irmaios
//...
		if !StartIrma(sessionPointer: sesptr, returnURL: returnURL) {
			// Handle error
		}
```

`StartIrma()` returns `true` on success, and `false` when the session pointer is malformed.

## Example app

For an example of a complete flow, including a backend server, take a look at the `demosrv` and `IRMAiOSDemoApp` projects.
