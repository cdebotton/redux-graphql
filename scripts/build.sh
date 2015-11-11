#!/bin/sh -e

NODE_ENV=production `npm bin`/babel src --out-dir dist
