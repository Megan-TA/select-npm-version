#!/usr/bin/env node
const program = require("commander");
const exec = require('child_process').exec

const selectVersion = require("../src/selectVersion");
const PACKAGE = require("../package.json");

program.version(PACKAGE.version);

program.on("--help", () => {
  console.log("Select release version using cli");
});

if (!process.argv.slice(2).length) {
  selectVersion()
    .then(version => {
      process.stdout.write(version + '\n');
      exec(`npm version --no-git-tag-version ${version}`, err => {
        if (err) {
          Promise.reject(err)
        }
      })
    })
    .catch(err => {
      console.error(err);
      process.exit(1);
    });
}

program.parse(process.argv);
