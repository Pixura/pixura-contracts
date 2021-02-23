{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Pixura.Contracts.KnownOriginDigitalAsset where

import Network.Ethereum.Contract.TH

[abiFrom|contracts/abis/KnownOriginDigitalAsset.json|]
