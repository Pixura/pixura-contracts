--------------------------------------------------------------------------------
-- | ERC721Full
--------------------------------------------------------------------------------

module Contracts.ERC721Full where

import Prelude 

import Data.Either (Either)
import Data.Functor.Tagged (Tagged, tagged)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Eq (genericEq)
import Data.Generic.Rep.Show (genericShow)
import Data.Lens ((.~))
import Data.Maybe (Maybe(..), fromJust)
import Data.Newtype (class Newtype)
import Data.Symbol (SProxy)
import Network.Ethereum.Web3 (_address, _topics, call, class EventFilter, deployContract, sendTx)
import Network.Ethereum.Web3.Contract.Internal (uncurryFields)
import Network.Ethereum.Web3.Solidity (ByteString, BytesN, D2, D4, D5, D6, DOne, Tuple0(..), Tuple1(..), Tuple2(..), Tuple3(..), Tuple4(..), UIntN, class IndexedEvent, unTuple1)
import Network.Ethereum.Web3.Solidity.Size (type (:&))
import Network.Ethereum.Web3.Types (Address, CallError, ChainCursor, HexString, NoPay, TransactionOptions, Web3, defaultFilter, mkHexString)
import Partial.Unsafe (unsafePartial)
--------------------------------------------------------------------------------
-- | ConstructorFn
--------------------------------------------------------------------------------


type ConstructorFn = Tagged (SProxy "constructor(string,string)") (Tuple2 (Tagged (SProxy "name") String) (Tagged (SProxy "symbol") String))

constructor :: TransactionOptions NoPay -> HexString -> { name :: String, symbol :: String } -> Web3 HexString
constructor x0 bc r = uncurryFields  r $ constructor' x0 bc
   where
    constructor' :: TransactionOptions NoPay -> HexString -> (Tagged (SProxy "name") String) -> (Tagged (SProxy "symbol") String) -> Web3 HexString
    constructor' y0 bc' y2 y3 = deployContract y0 bc' ((tagged $ Tuple2 y2 y3) :: ConstructorFn)

--------------------------------------------------------------------------------
-- | Transfer
--------------------------------------------------------------------------------


newtype Transfer = Transfer {from :: Address,to :: Address,tokenId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeTransfer :: Newtype Transfer _

instance eventFilterTransfer :: EventFilter Transfer where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"),Nothing,Nothing,Nothing]

instance indexedEventTransfer :: IndexedEvent (Tuple3 (Tagged (SProxy "from") Address) (Tagged (SProxy "to") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6)))) (Tuple0 ) Transfer where
  isAnonymous _ = false

derive instance genericTransfer :: Generic Transfer _

instance eventGenericTransferShow :: Show Transfer where
  show = genericShow

instance eventGenericTransfereq :: Eq Transfer where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Approval
--------------------------------------------------------------------------------


newtype Approval = Approval {owner :: Address,approved :: Address,tokenId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeApproval :: Newtype Approval _

instance eventFilterApproval :: EventFilter Approval where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925"),Nothing,Nothing,Nothing]

instance indexedEventApproval :: IndexedEvent (Tuple3 (Tagged (SProxy "owner") Address) (Tagged (SProxy "approved") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6)))) (Tuple0 ) Approval where
  isAnonymous _ = false

derive instance genericApproval :: Generic Approval _

instance eventGenericApprovalShow :: Show Approval where
  show = genericShow

instance eventGenericApprovaleq :: Eq Approval where
  eq = genericEq

--------------------------------------------------------------------------------
-- | ApprovalForAll
--------------------------------------------------------------------------------


newtype ApprovalForAll = ApprovalForAll {owner :: Address,operator :: Address,approved :: Boolean}

derive instance newtypeApprovalForAll :: Newtype ApprovalForAll _

instance eventFilterApprovalForAll :: EventFilter ApprovalForAll where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31"),Nothing,Nothing]

instance indexedEventApprovalForAll :: IndexedEvent (Tuple2 (Tagged (SProxy "owner") Address) (Tagged (SProxy "operator") Address)) (Tuple1 (Tagged (SProxy "approved") Boolean)) ApprovalForAll where
  isAnonymous _ = false

derive instance genericApprovalForAll :: Generic ApprovalForAll _

instance eventGenericApprovalForAllShow :: Show ApprovalForAll where
  show = genericShow

instance eventGenericApprovalForAlleq :: Eq ApprovalForAll where
  eq = genericEq

--------------------------------------------------------------------------------
-- | ApproveFn
--------------------------------------------------------------------------------


type ApproveFn = Tagged (SProxy "approve(address,uint256)") (Tuple2 (Tagged (SProxy "to") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

approve :: TransactionOptions NoPay -> { to :: Address, tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
approve x0 r = uncurryFields  r $ approve' x0
   where
    approve' :: TransactionOptions NoPay -> (Tagged (SProxy "to") Address) -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    approve' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: ApproveFn)

--------------------------------------------------------------------------------
-- | BalanceOfFn
--------------------------------------------------------------------------------


type BalanceOfFn = Tagged (SProxy "balanceOf(address)") (Tuple1 (Tagged (SProxy "owner") Address))

balanceOf :: TransactionOptions NoPay -> ChainCursor -> { owner :: Address } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
balanceOf x0 cm r = uncurryFields  r $ balanceOf' x0 cm
   where
    balanceOf' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "owner") Address) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    balanceOf' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: BalanceOfFn)

--------------------------------------------------------------------------------
-- | GetApprovedFn
--------------------------------------------------------------------------------


type GetApprovedFn = Tagged (SProxy "getApproved(uint256)") (Tuple1 (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

getApproved :: TransactionOptions NoPay -> ChainCursor -> { tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Address)
getApproved x0 cm r = uncurryFields  r $ getApproved' x0 cm
   where
    getApproved' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Address)
    getApproved' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: GetApprovedFn)

--------------------------------------------------------------------------------
-- | IsApprovedForAllFn
--------------------------------------------------------------------------------


type IsApprovedForAllFn = Tagged (SProxy "isApprovedForAll(address,address)") (Tuple2 (Tagged (SProxy "owner") Address) (Tagged (SProxy "operator") Address))

isApprovedForAll :: TransactionOptions NoPay -> ChainCursor -> { owner :: Address, operator :: Address } -> Web3 (Either CallError Boolean)
isApprovedForAll x0 cm r = uncurryFields  r $ isApprovedForAll' x0 cm
   where
    isApprovedForAll' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "owner") Address) -> (Tagged (SProxy "operator") Address) -> Web3 (Either CallError Boolean)
    isApprovedForAll' y0 cm' y2 y3 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple2 y2 y3) :: IsApprovedForAllFn)

--------------------------------------------------------------------------------
-- | NameFn
--------------------------------------------------------------------------------


type NameFn = Tagged (SProxy "name()") (Tuple0 )

name :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
name x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: NameFn)

--------------------------------------------------------------------------------
-- | OwnerOfFn
--------------------------------------------------------------------------------


type OwnerOfFn = Tagged (SProxy "ownerOf(uint256)") (Tuple1 (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

ownerOf :: TransactionOptions NoPay -> ChainCursor -> { tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Address)
ownerOf x0 cm r = uncurryFields  r $ ownerOf' x0 cm
   where
    ownerOf' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Address)
    ownerOf' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: OwnerOfFn)

--------------------------------------------------------------------------------
-- | SafeTransferFrom4Fn
--------------------------------------------------------------------------------


type SafeTransferFrom4Fn = Tagged (SProxy "safeTransferFrom4(address,address,uint256,bytes)") (Tuple4 (Tagged (SProxy "from") Address) (Tagged (SProxy "to") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_data") ByteString))

safeTransferFrom4 :: TransactionOptions NoPay -> { from :: Address, to :: Address, tokenId :: (UIntN (D2 :& D5 :& DOne D6)), _data :: ByteString } -> Web3 HexString
safeTransferFrom4 x0 r = uncurryFields  r $ safeTransferFrom4' x0
   where
    safeTransferFrom4' :: TransactionOptions NoPay -> (Tagged (SProxy "from") Address) -> (Tagged (SProxy "to") Address) -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_data") ByteString) -> Web3 HexString
    safeTransferFrom4' y0 y1 y2 y3 y4 = sendTx y0 ((tagged $ Tuple4 y1 y2 y3 y4) :: SafeTransferFrom4Fn)

--------------------------------------------------------------------------------
-- | SafeTransferFrom3Fn
--------------------------------------------------------------------------------


type SafeTransferFrom3Fn = Tagged (SProxy "safeTransferFrom3(address,address,uint256)") (Tuple3 (Tagged (SProxy "from") Address) (Tagged (SProxy "to") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

safeTransferFrom3 :: TransactionOptions NoPay -> { from :: Address, to :: Address, tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
safeTransferFrom3 x0 r = uncurryFields  r $ safeTransferFrom3' x0
   where
    safeTransferFrom3' :: TransactionOptions NoPay -> (Tagged (SProxy "from") Address) -> (Tagged (SProxy "to") Address) -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    safeTransferFrom3' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: SafeTransferFrom3Fn)

--------------------------------------------------------------------------------
-- | SetApprovalForAllFn
--------------------------------------------------------------------------------


type SetApprovalForAllFn = Tagged (SProxy "setApprovalForAll(address,bool)") (Tuple2 (Tagged (SProxy "to") Address) (Tagged (SProxy "approved") Boolean))

setApprovalForAll :: TransactionOptions NoPay -> { to :: Address, approved :: Boolean } -> Web3 HexString
setApprovalForAll x0 r = uncurryFields  r $ setApprovalForAll' x0
   where
    setApprovalForAll' :: TransactionOptions NoPay -> (Tagged (SProxy "to") Address) -> (Tagged (SProxy "approved") Boolean) -> Web3 HexString
    setApprovalForAll' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: SetApprovalForAllFn)

--------------------------------------------------------------------------------
-- | SupportsInterfaceFn
--------------------------------------------------------------------------------


type SupportsInterfaceFn = Tagged (SProxy "supportsInterface(bytes4)") (Tuple1 (Tagged (SProxy "interfaceId") (BytesN (DOne D4))))

supportsInterface :: TransactionOptions NoPay -> ChainCursor -> { interfaceId :: (BytesN (DOne D4)) } -> Web3 (Either CallError Boolean)
supportsInterface x0 cm r = uncurryFields  r $ supportsInterface' x0 cm
   where
    supportsInterface' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "interfaceId") (BytesN (DOne D4))) -> Web3 (Either CallError Boolean)
    supportsInterface' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: SupportsInterfaceFn)

--------------------------------------------------------------------------------
-- | SymbolFn
--------------------------------------------------------------------------------


type SymbolFn = Tagged (SProxy "symbol()") (Tuple0 )

symbol :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
symbol x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: SymbolFn)

--------------------------------------------------------------------------------
-- | TokenByIndexFn
--------------------------------------------------------------------------------


type TokenByIndexFn = Tagged (SProxy "tokenByIndex(uint256)") (Tuple1 (Tagged (SProxy "index") (UIntN (D2 :& D5 :& DOne D6))))

tokenByIndex :: TransactionOptions NoPay -> ChainCursor -> { index :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
tokenByIndex x0 cm r = uncurryFields  r $ tokenByIndex' x0 cm
   where
    tokenByIndex' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "index") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    tokenByIndex' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokenByIndexFn)

--------------------------------------------------------------------------------
-- | TokenOfOwnerByIndexFn
--------------------------------------------------------------------------------


type TokenOfOwnerByIndexFn = Tagged (SProxy "tokenOfOwnerByIndex(address,uint256)") (Tuple2 (Tagged (SProxy "owner") Address) (Tagged (SProxy "index") (UIntN (D2 :& D5 :& DOne D6))))

tokenOfOwnerByIndex :: TransactionOptions NoPay -> ChainCursor -> { owner :: Address, index :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
tokenOfOwnerByIndex x0 cm r = uncurryFields  r $ tokenOfOwnerByIndex' x0 cm
   where
    tokenOfOwnerByIndex' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "owner") Address) -> (Tagged (SProxy "index") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    tokenOfOwnerByIndex' y0 cm' y2 y3 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple2 y2 y3) :: TokenOfOwnerByIndexFn)

--------------------------------------------------------------------------------
-- | TokenURIFn
--------------------------------------------------------------------------------


type TokenURIFn = Tagged (SProxy "tokenURI(uint256)") (Tuple1 (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

tokenURI :: TransactionOptions NoPay -> ChainCursor -> { tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError String)
tokenURI x0 cm r = uncurryFields  r $ tokenURI' x0 cm
   where
    tokenURI' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError String)
    tokenURI' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokenURIFn)

--------------------------------------------------------------------------------
-- | TotalSupplyFn
--------------------------------------------------------------------------------


type TotalSupplyFn = Tagged (SProxy "totalSupply()") (Tuple0 )

totalSupply :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalSupply x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TotalSupplyFn)

--------------------------------------------------------------------------------
-- | TransferFromFn
--------------------------------------------------------------------------------


type TransferFromFn = Tagged (SProxy "transferFrom(address,address,uint256)") (Tuple3 (Tagged (SProxy "from") Address) (Tagged (SProxy "to") Address) (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

transferFrom :: TransactionOptions NoPay -> { from :: Address, to :: Address, tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
transferFrom x0 r = uncurryFields  r $ transferFrom' x0
   where
    transferFrom' :: TransactionOptions NoPay -> (Tagged (SProxy "from") Address) -> (Tagged (SProxy "to") Address) -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    transferFrom' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: TransferFromFn)