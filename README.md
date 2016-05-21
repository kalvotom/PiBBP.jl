# PiBBP

A toy Julia implementation of [Bailey-Borwein-Plouffe (BBP) alogithm](http://www.davidhbailey.com/dhbpapers/bbp-alg.pdf) for computation
of hexadecimal digits of Pi.

## Project status

[![Tests](https://travis-ci.org/kalvotom/PiBBP.jl.svg?branch=master)](https://travis-ci.org/kalvotom/PiBBP.jl)
[![Coverage Status](https://coveralls.io/repos/github/kalvotom/PiBBP.jl/badge.svg?branch=master)](https://coveralls.io/github/kalvotom/PiBBP.jl?branch=master)

## Documentation

[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://kalvotom.github.io/PiBBP.jl/stable)
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://kalvotom.github.io/PiBBP.jl/latest)

## Installation

Install via package manager

```
julia> Pkg.clone("https://github.com/kalvotom/PiBBP.jl")
```

## Usage

Load the package.

```
julia> using PiBBP
```

The call to `digpi(d)` computes `d+1`th hexadecimal digit of the fractional part of `pi`.

```
julia> digpi(1000000)
6
````
