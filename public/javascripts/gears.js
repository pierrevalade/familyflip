// Copyright 2007, Google Inc.
//
// Redistribution and use in source and binary forms, with or without 
// modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, 
//     this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//  3. Neither the name of Google Inc. nor the names of its contributors may be
//     used to endorse or promote products derived from this software without
//     specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
// EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Change this to set the name of the managed resource store to create.
// You use the name with the createManagedStore, and removeManagedStore,
// and openManagedStore APIs. It isn't visible to the user.
var STORE_NAME = "pixshare";

// Change this to set the URL of tha manifest file, which describe which
// URLs to capture. It can be relative to the current page, or an
// absolute URL.
var MANIFEST_FILENAME = "/manifest.json";

var localServer;
var store;

// Called onload to initialize local server and store variables
function init() {
  // if (!window.google || !google.gears) {
  //   textOut("NOTE:  You must install Gears first.");
  // } else {
  //   textOut("Yeay, Gears is already installed.");
  //   localServer = google.gears.factory.create("beta.localserver");
  //   store = localServer.createManagedStore(STORE_NAME);
  //   store.manifestUrl = MANIFEST_FILENAME;
  //   textOut(store.currentVersion);
  // }
}

// Create the managed resource store
function createStore() {
  if (!window.google || !google.gears) {
    alert("You must install Gears first.");
    return;
  }
  
  $('.lightButton').hide();
  $('.image').show();
  
  store.checkForUpdate();
  
  store.onprogress = function() {
    
  }
  
  store.oncomplete = function() {
      textOut("The documents are now available offline.\n" + 
              "With your browser offline, load the document at " +
              "its normal online URL to see the locally stored " +
			        "version. The version stored is: " + 
              store.currentVersion);
      go('/albums');
  }
  
  store.onerror =  function() {
    textOut("Error: " + store.lastErrorMessage);
  }
}

// Remove the managed resource store.
function removeStore() {
  if (!window.google || !google.gears) {
    alert("You must install Gears first.");
    return;
  }

  localServer.removeManagedStore(STORE_NAME);
  textOut("Done. The local store has been removed." +
          "You will now see online versions of the documents.");
          
  go('/');
}

// Utility function to output some status text.
function textOut(s) {
 console.log(s);
}
