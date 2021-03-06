{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "pixura-contracts"
, dependencies =
  [ "console"
  , "effect"
  , "psci-support"
  , "web3-generator"
  , "chanterelle"
  , "spec"
  , "quickcheck"
  , "simple-gql-query"
  , "truffle-hd-wallet"
  ]
, packages = ./packages.dhall
, sources = [ "purs-contracts/src/**/*.purs", "purs-contracts/test/**/*.purs" ]
}
