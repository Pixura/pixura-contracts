module Test.Spec.Contracts.SupeRare where

import Prelude
import Chanterelle.Internal.Deploy (DeployReceipt)
import Chanterelle.Internal.Types (NoArgs)
import Chanterelle.Test (buildTestConfig)
import Contracts.SupeRare (addNewToken, isWhitelisted, ownerOf, tokenURI, whitelistCreator) as SupeRare
import Data.Array (drop, length, replicate, take, zipWith, (..))
import Data.Array.Partial (head)
import Data.Lens ((?~))
import Data.Traversable (for, traverse)
import Deploy.Contracts.SupeRare (deployScript) as SupeRare
import Deploy.Utils (awaitTxSuccessWeb3)
import Effect.Aff (Aff)
import Effect.Aff.Class (liftAff)
import Network.Ethereum.Web3 (Address, ChainCursor(..), Provider, UIntN, Web3, _to)
import Network.Ethereum.Web3.Solidity.Sizes (S256)
import Partial.Unsafe (unsafePartial)
import Test.Spec (SpecT, beforeAll, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Contracts.Utils (defaultTxOpts, intToUInt256, mkTokenUris, throwOnCallError, web3Test)

-----------------------------------------------------------------------------
-- | spec
-----------------------------------------------------------------------------
spec :: SpecT Aff Unit Aff Unit
spec =
  beforeAll init
    $ describe "SupeRare" do
        it "can whitelist accounts" \tenv@{ provider, supeRare, accounts, primaryAccount } ->
          web3Test provider do
            void $ for accounts (whitelistAddress tenv)
            isWhitelistRess <- for accounts (isWhitelisted tenv)
            isWhitelistRess `shouldEqual` replicate 4 true
        it "can mint tokens" \tenv@{ provider, supeRare, accounts, primaryAccount } ->
          web3Test provider do
            let
              tokenIds = map intToUInt256 (1 .. (length accounts))
            tokenUris <- mkTokenUris $ length tokenIds
            void
              $ for (zipWith ({ acc: _, _uri: _ }) accounts tokenUris)
                  (\{ acc, _uri } -> addNewToken tenv acc _uri)
            owners <- for tokenIds (ownerOf tenv)
            owners `shouldEqual` accounts
            uris <- for tokenIds (tokenURI tenv)
            uris `shouldEqual` tokenUris

-----------------------------------------------------------------------------
-- | TestEnv
-----------------------------------------------------------------------------
type TestEnv r
  = { supeRare :: DeployReceipt NoArgs
    , provider :: Provider
    , accounts :: Array Address
    , primaryAccount :: Address
    | r
    }

init :: Aff (TestEnv ())
init = do
  { provider, supeRare, accounts } <- liftAff $ buildTestConfig "http://localhost:8545" 60 SupeRare.deployScript
  pure { provider, supeRare, accounts: take 4 $ drop 1 accounts, primaryAccount: unsafePartial head accounts }

-----------------------------------------------------------------------------
-- | Utils
-----------------------------------------------------------------------------
addNewToken :: forall r. TestEnv r -> Address -> String -> Web3 Unit
addNewToken { supeRare: { deployAddress }, primaryAccount } from _uri =
  SupeRare.addNewToken (defaultTxOpts from # _to ?~ deployAddress)
    { _uri }
    >>= awaitTxSuccessWeb3

whitelistAddress :: forall r. TestEnv r -> Address -> Web3 Unit
whitelistAddress { supeRare: { deployAddress }, primaryAccount } _creator =
  SupeRare.whitelistCreator
    (defaultTxOpts primaryAccount # _to ?~ deployAddress)
    { _creator }
    >>= awaitTxSuccessWeb3

tokenURI :: forall r. TestEnv r -> UIntN S256 -> Web3 String
tokenURI { supeRare: { deployAddress }, primaryAccount } _tokenId =
  throwOnCallError
    $ SupeRare.tokenURI
        (defaultTxOpts primaryAccount # _to ?~ deployAddress)
        Latest
        { _tokenId }

isWhitelisted :: forall r. TestEnv r -> Address -> Web3 Boolean
isWhitelisted { supeRare: { deployAddress }, primaryAccount } _creator =
  throwOnCallError
    $ SupeRare.isWhitelisted
        (defaultTxOpts primaryAccount # _to ?~ deployAddress)
        Latest
        { _creator }

ownerOf :: forall r. TestEnv r -> UIntN S256 -> Web3 Address
ownerOf { supeRare: { deployAddress }, primaryAccount } _tokenId =
  throwOnCallError
    $ SupeRare.ownerOf
        (defaultTxOpts primaryAccount # _to ?~ deployAddress)
        Latest
        { _tokenId }