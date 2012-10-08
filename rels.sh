#!/bin/bash


cd rels/r1
../../rebar -f generate
cd ../r2
../../rebar -f generate
cd ../r3
../../rebar -f generate
