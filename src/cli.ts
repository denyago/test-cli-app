#!/usr/bin/env node

import chalk = require("chalk");
import clear = require("clear");
import figlet = require("figlet");
import commander = require("commander");
import process from "process";

clear();
console.log(
  chalk.red(figlet.textSync("my-cli-test", { horizontalLayout: "full" }))
);

const prog = commander.program
  .version("0.0.1")
  .description("An example CLI for ordering pizza")
  .option("-p, --peppers", "Add peppers")
  .option("-P, --pineapple", "Add pineapple")
  .option("-b, --bbq", "Add bbq sauce")
  .option("-c, --cheese <type>", "Add the specified type of cheese [marble]")
  .option("-C, --no-cheese", "You do not want any cheese")
  .parse(process.argv);

if (!process.argv.slice(2).length) {
  prog.outputHelp();
  process.exit(1);
}

const opts = prog.opts();

console.log("you ordered a pizza with:");
if (opts.peppers) console.log("  - peppers");
if (opts.pineapple) console.log("  - pineapple");
if (opts.bbq) console.log("  - bbq");
const cheese: string = true === opts.cheese ? "marble" : opts.cheese || "no";
console.log("  - %s cheese", cheese);
