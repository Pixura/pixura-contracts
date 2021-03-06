{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Warning: Don't Move This Top-Level Comment!

Due to how `dhall format` currently works, this comment's
instructions cannot appear near corresponding sections below
because `dhall format` will delete the comment. However,
it will not delete a top-level comment like this one.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
Replace the overrides' "{=}" (an empty record) with the following idea
The "//" or "⫽" means "merge these two records and
  when they have the same value, use the one on the right:"
-------------------------------
let overrides =
  { packageName =
      upstream.packageName // { updateEntity1 = "new value", updateEntity2 = "new value" }
  , packageName =
      upstream.packageName // { version = "v4.0.0" }
  , packageName =
      upstream.packageName // { repo = "https://www.example.com/path/to/new/repo.git" }
  }
-------------------------------

Example:
-------------------------------
let overrides =
  { halogen =
      upstream.halogen // { version = "master" }
  , halogen-vdom =
      upstream.halogen-vdom // { version = "v4.0.0" }
  }
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
Replace the additions' "{=}" (an empty record) with the following idea:
-------------------------------
let additions =
  { package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , etc.
  }
-------------------------------

Example:
-------------------------------
let additions =
  { benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
  }
-------------------------------
-}


let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20201007/packages.dhall sha256:35633f6f591b94d216392c9e0500207bb1fec42dd355f4fecdfd186956567b6b

let overrides = {=}

let additions =
      { logging =
          { dependencies =
            [ "prelude"
            , "contravariant"
            , "console"
            , "effect"
            , "transformers"
            , "tuples"
            , "either"
            ]
          , repo = "https://github.com/rightfold/purescript-logging"
          , version = "v3.0.0"
          }
      , ring-modules =
          { dependencies = [ "prelude" ]
          , repo = "https://github.com/f-o-a-m/purescript-ring-modules"
          , version = "v5.0.1"
          }
      , mkdirp =
          { dependencies =
            [ "console"
            , "effect"
            , "either"
            , "exceptions"
            , "functions"
            , "node-fs"
            , "nullable"
            , "prelude"
            , "psci-support"
            ]
          , repo = "https://github.com/f-o-a-m/purescript-mkdirp"
          , version = "v1.0.0"
          }
      , tagged =
          { dependencies = [ "identity", "profunctor" ]
          , repo = "https://github.com/LiamGoodacre/purescript-tagged"
          , version = "v3.0.0"
          }
      , web3-generator =
          { dependencies =
            [ "argonaut"
            , "ordered-collections"
            , "prelude"
            , "errors"
            , "yargs"
            , "ansi"
            , "node-fs-aff"
            , "console"
            , "string-parsers"
            , "web3"
            , "mkdirp"
            , "fixed-points"
            , "record-extra"
            ]
          , repo = "https://github.com/charlescrain/purescript-web3-generator"
          , version = "765bd7c93a96fab63e1e4c24880e78a9a699a123"
          }
      , eth-core =
          { dependencies =
            [ "prelude"
            , "ring-modules"
            , "foreign-generic"
            , "simple-json"
            , "ordered-collections"
            , "bytestrings"
            , "argonaut"
            , "parsing"
            ]
          , repo = "https://github.com/f-o-a-m/purescript-eth-core"
          , version = "v6.0.0"
          }
      , solc =
          { dependencies =
            [ "argonaut"
            , "web3-generator"
            , "effect"
            , "node-path"
            , "eth-core"
            , "aff"
            ]
          , repo = "https://github.com/f-o-a-m/purescript-solc.git"
          , version = "v2.0.0"
          }
      , coroutine-transducers =
          { dependencies =
            [ "aff", "coroutines", "effect", "maybe", "psci-support" ]
          , repo =
              "https://github.com/blinky3713/purescript-coroutine-transducers"
          , version = "v1.0.0"
          }
      , web3 =
          { dependencies =
            [ "errors"
            , "avar"
            , "profunctor-lenses"
            , "foreign"
            , "foreign-generic"
            , "proxy"
            , "eth-core"
            , "partial"
            , "parsing"
            , "transformers"
            , "identity"
            , "aff"
            , "tagged"
            , "free"
            , "coroutines"
            , "typelevel-prelude"
            , "fork"
            , "coroutine-transducers"
            , "variant"
            , "heterogeneous"
            ]
          , repo = "https://github.com/f-o-a-m/purescript-web3.git"
          , version = "v3.0.0"
          }
      , chanterelle =
          { dependencies =
            [ "web3"
            , "web3-generator"
            , "solc"
            , "console"
            , "node-process"
            , "optparse"
            , "logging"
            , "validation"
            , "foreign-object"
            ]
          , repo = "https://github.com/f-o-a-m/chanterelle.git"
          , version = "a918c3e9ff2590d456955cc4fe5ea5dc98102a8b"
          }
      , truffle-hd-wallet =
          { dependencies = [ "web3" ]
          , repo =
              "https://github.com/Pixura/purescript-truffle-hd-wallet-provider/"
          , version = "v0.1.0"
          }
      , simple-gql-query =
          { dependencies =
            [ "aff"
            , "aff-promise"
            , "affjax"
            , "console"
            , "effect"
            , "exceptions"
            , "generics-rep"
            , "node-fs-aff"
            , "parsing"
            , "prelude"
            , "prettier"
            , "psci-support"
            , "simple-json"
            ]
          , repo = "https://github.com/charlescrain/purescript-simple-gql-query"
          , version = "v1.0.0"
          }
      }

in  upstream ⫽ overrides ⫽ additions
