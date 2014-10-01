#!/bin/env node

var exec = require('child_process').exec

function randomFromTo(from, to) {
  return Math.floor(Math.random() * (to - from + 1)) + from }

exec('find /srv/image/* -type f', function(err, stdout, stderr) {
  console.log('gotz', err, stdout, stderr)
  var lines = stdout.split('\n')
  var cmd = 'timeout 5 fbv -k "' + lines[randomFromTo(0, lines.length - 1)] + '"'
  console.log('doing', cmd)
  exec(cmd, function(err, stdout, stderr) {
    console.log('done with', cmd, err, stdout, stderr) } ) } )
