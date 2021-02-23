--------------------------------------------------------------------------------
-- | MakersplaceV2
--------------------------------------------------------------------------------

module Contracts.MakersplaceV2 where

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
import Network.Ethereum.Web3.Solidity (ByteString, BytesN, D2, D3, D4, D5, D6, DOne, Tuple0(..), Tuple1(..), Tuple2(..), Tuple3(..), Tuple4(..), Tuple5(..), Tuple6, Tuple7, UIntN, class IndexedEvent, unTuple1)
import Network.Ethereum.Web3.Solidity.Size (type (:&))
import Network.Ethereum.Web3.Types (Address, CallError, ChainCursor, HexString, NoPay, TransactionOptions, Web3, defaultFilter, mkHexString)
import Partial.Unsafe (unsafePartial)
--------------------------------------------------------------------------------
-- | ConstructorFn
--------------------------------------------------------------------------------


type ConstructorFn = Tagged (SProxy "constructor(string,string,uint256,address,address)") (Tuple5 (Tagged (SProxy "_tokenName") String) (Tagged (SProxy "_tokenSymbol") String) (Tagged (SProxy "_tokenIdStartingCounter") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_dmsAddress") Address) (Tagged (SProxy "_crsAddress") Address))

constructor :: TransactionOptions NoPay -> HexString -> { _tokenName :: String, _tokenSymbol :: String, _tokenIdStartingCounter :: (UIntN (D2 :& D5 :& DOne D6)), _dmsAddress :: Address, _crsAddress :: Address } -> Web3 HexString
constructor x0 bc r = uncurryFields  r $ constructor' x0 bc
   where
    constructor' :: TransactionOptions NoPay -> HexString -> (Tagged (SProxy "_tokenName") String) -> (Tagged (SProxy "_tokenSymbol") String) -> (Tagged (SProxy "_tokenIdStartingCounter") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_dmsAddress") Address) -> (Tagged (SProxy "_crsAddress") Address) -> Web3 HexString
    constructor' y0 bc' y2 y3 y4 y5 y6 = deployContract y0 bc' ((tagged $ Tuple5 y2 y3 y4 y5 y6) :: ConstructorFn)

--------------------------------------------------------------------------------
-- | OboApprovalForAll
--------------------------------------------------------------------------------


newtype OboApprovalForAll = OboApprovalForAll {_owner :: Address,_operator :: Address,_approved :: Boolean}

derive instance newtypeOboApprovalForAll :: Newtype OboApprovalForAll _

instance eventFilterOboApprovalForAll :: EventFilter OboApprovalForAll where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "017e8a478826a4348bfb695968246edfab885f8a76b03279cf4630ac073945c9")]

instance indexedEventOboApprovalForAll :: IndexedEvent (Tuple0 ) (Tuple3 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_operator") Address) (Tagged (SProxy "_approved") Boolean)) OboApprovalForAll where
  isAnonymous _ = false

derive instance genericOboApprovalForAll :: Generic OboApprovalForAll _

instance eventGenericOboApprovalForAllShow :: Show OboApprovalForAll where
  show = genericShow

instance eventGenericOboApprovalForAlleq :: Eq OboApprovalForAll where
  eq = genericEq

--------------------------------------------------------------------------------
-- | OboDisabledForAll
--------------------------------------------------------------------------------


newtype OboDisabledForAll = OboDisabledForAll {_operator :: Address}

derive instance newtypeOboDisabledForAll :: Newtype OboDisabledForAll _

instance eventFilterOboDisabledForAll :: EventFilter OboDisabledForAll where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "fd0e0c743dbdd84ef4e7c513db9b7e085970164787288791343fda28575652dd")]

instance indexedEventOboDisabledForAll :: IndexedEvent (Tuple0 ) (Tuple1 (Tagged (SProxy "_operator") Address)) OboDisabledForAll where
  isAnonymous _ = false

derive instance genericOboDisabledForAll :: Generic OboDisabledForAll _

instance eventGenericOboDisabledForAllShow :: Show OboDisabledForAll where
  show = genericShow

instance eventGenericOboDisabledForAlleq :: Eq OboDisabledForAll where
  eq = genericEq

--------------------------------------------------------------------------------
-- | DigitalMediaReleaseCreateEvent
--------------------------------------------------------------------------------


newtype DigitalMediaReleaseCreateEvent = DigitalMediaReleaseCreateEvent {id :: (UIntN (D2 :& D5 :& DOne D6)),owner :: Address,printEdition :: (UIntN (D3 :& DOne D2)),tokenURI :: String,digitalMediaId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeDigitalMediaReleaseCreateEvent :: Newtype DigitalMediaReleaseCreateEvent _

instance eventFilterDigitalMediaReleaseCreateEvent :: EventFilter DigitalMediaReleaseCreateEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "775f53e4c75ce0c74e611f7f0bb660e4cd647e0522ef0f8aefd4ecef373c5df9")]

instance indexedEventDigitalMediaReleaseCreateEvent :: IndexedEvent (Tuple0 ) (Tuple5 (Tagged (SProxy "id") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "owner") Address) (Tagged (SProxy "printEdition") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "tokenURI") String) (Tagged (SProxy "digitalMediaId") (UIntN (D2 :& D5 :& DOne D6)))) DigitalMediaReleaseCreateEvent where
  isAnonymous _ = false

derive instance genericDigitalMediaReleaseCreateEvent :: Generic DigitalMediaReleaseCreateEvent _

instance eventGenericDigitalMediaReleaseCreateEventShow :: Show DigitalMediaReleaseCreateEvent where
  show = genericShow

instance eventGenericDigitalMediaReleaseCreateEventeq :: Eq DigitalMediaReleaseCreateEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | DigitalMediaCreateEvent
--------------------------------------------------------------------------------


newtype DigitalMediaCreateEvent = DigitalMediaCreateEvent {id :: (UIntN (D2 :& D5 :& DOne D6)),storeContractAddress :: Address,creator :: Address,totalSupply :: (UIntN (D3 :& DOne D2)),printIndex :: (UIntN (D3 :& DOne D2)),collectionId :: (UIntN (D2 :& D5 :& DOne D6)),metadataPath :: String}

derive instance newtypeDigitalMediaCreateEvent :: Newtype DigitalMediaCreateEvent _

instance eventFilterDigitalMediaCreateEvent :: EventFilter DigitalMediaCreateEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "794c5cd70604d9d8dc2cbca1f8be65f167e4147b6512541d41e8e410594098a0")]

instance indexedEventDigitalMediaCreateEvent :: IndexedEvent (Tuple0 ) (Tuple7 (Tagged (SProxy "id") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "storeContractAddress") Address) (Tagged (SProxy "creator") Address) (Tagged (SProxy "totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "printIndex") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "collectionId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "metadataPath") String)) DigitalMediaCreateEvent where
  isAnonymous _ = false

derive instance genericDigitalMediaCreateEvent :: Generic DigitalMediaCreateEvent _

instance eventGenericDigitalMediaCreateEventShow :: Show DigitalMediaCreateEvent where
  show = genericShow

instance eventGenericDigitalMediaCreateEventeq :: Eq DigitalMediaCreateEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | DigitalMediaCollectionCreateEvent
--------------------------------------------------------------------------------


newtype DigitalMediaCollectionCreateEvent = DigitalMediaCollectionCreateEvent {id :: (UIntN (D2 :& D5 :& DOne D6)),storeContractAddress :: Address,creator :: Address,metadataPath :: String}

derive instance newtypeDigitalMediaCollectionCreateEvent :: Newtype DigitalMediaCollectionCreateEvent _

instance eventFilterDigitalMediaCollectionCreateEvent :: EventFilter DigitalMediaCollectionCreateEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "01e2312dcdafe7cd3f82579d8c121fdb930d46ef2eb231953a521ac62093e277")]

instance indexedEventDigitalMediaCollectionCreateEvent :: IndexedEvent (Tuple0 ) (Tuple4 (Tagged (SProxy "id") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "storeContractAddress") Address) (Tagged (SProxy "creator") Address) (Tagged (SProxy "metadataPath") String)) DigitalMediaCollectionCreateEvent where
  isAnonymous _ = false

derive instance genericDigitalMediaCollectionCreateEvent :: Generic DigitalMediaCollectionCreateEvent _

instance eventGenericDigitalMediaCollectionCreateEventShow :: Show DigitalMediaCollectionCreateEvent where
  show = genericShow

instance eventGenericDigitalMediaCollectionCreateEventeq :: Eq DigitalMediaCollectionCreateEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | DigitalMediaBurnEvent
--------------------------------------------------------------------------------


newtype DigitalMediaBurnEvent = DigitalMediaBurnEvent {id :: (UIntN (D2 :& D5 :& DOne D6)),caller :: Address,storeContractAddress :: Address}

derive instance newtypeDigitalMediaBurnEvent :: Newtype DigitalMediaBurnEvent _

instance eventFilterDigitalMediaBurnEvent :: EventFilter DigitalMediaBurnEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "327ecc068f1b41267f69376098f6a50da487e4a4d762d53c01197d6a2f294b3e")]

instance indexedEventDigitalMediaBurnEvent :: IndexedEvent (Tuple0 ) (Tuple3 (Tagged (SProxy "id") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "caller") Address) (Tagged (SProxy "storeContractAddress") Address)) DigitalMediaBurnEvent where
  isAnonymous _ = false

derive instance genericDigitalMediaBurnEvent :: Generic DigitalMediaBurnEvent _

instance eventGenericDigitalMediaBurnEventShow :: Show DigitalMediaBurnEvent where
  show = genericShow

instance eventGenericDigitalMediaBurnEventeq :: Eq DigitalMediaBurnEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | DigitalMediaReleaseBurnEvent
--------------------------------------------------------------------------------


newtype DigitalMediaReleaseBurnEvent = DigitalMediaReleaseBurnEvent {tokenId :: (UIntN (D2 :& D5 :& DOne D6)),owner :: Address}

derive instance newtypeDigitalMediaReleaseBurnEvent :: Newtype DigitalMediaReleaseBurnEvent _

instance eventFilterDigitalMediaReleaseBurnEvent :: EventFilter DigitalMediaReleaseBurnEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "1e8df141f42ed659a8fe7e7c5966cbdf2d240d0c45f4c30cbe02526c618075ef")]

instance indexedEventDigitalMediaReleaseBurnEvent :: IndexedEvent (Tuple0 ) (Tuple2 (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "owner") Address)) DigitalMediaReleaseBurnEvent where
  isAnonymous _ = false

derive instance genericDigitalMediaReleaseBurnEvent :: Generic DigitalMediaReleaseBurnEvent _

instance eventGenericDigitalMediaReleaseBurnEventShow :: Show DigitalMediaReleaseBurnEvent where
  show = genericShow

instance eventGenericDigitalMediaReleaseBurnEventeq :: Eq DigitalMediaReleaseBurnEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | UpdateDigitalMediaPrintIndexEvent
--------------------------------------------------------------------------------


newtype UpdateDigitalMediaPrintIndexEvent = UpdateDigitalMediaPrintIndexEvent {digitalMediaId :: (UIntN (D2 :& D5 :& DOne D6)),printEdition :: (UIntN (D3 :& DOne D2))}

derive instance newtypeUpdateDigitalMediaPrintIndexEvent :: Newtype UpdateDigitalMediaPrintIndexEvent _

instance eventFilterUpdateDigitalMediaPrintIndexEvent :: EventFilter UpdateDigitalMediaPrintIndexEvent where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "12d99f5e49ef761c52953e4f9a109827fc3540292ba88c10d309fef470685259")]

instance indexedEventUpdateDigitalMediaPrintIndexEvent :: IndexedEvent (Tuple0 ) (Tuple2 (Tagged (SProxy "digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "printEdition") (UIntN (D3 :& DOne D2)))) UpdateDigitalMediaPrintIndexEvent where
  isAnonymous _ = false

derive instance genericUpdateDigitalMediaPrintIndexEvent :: Generic UpdateDigitalMediaPrintIndexEvent _

instance eventGenericUpdateDigitalMediaPrintIndexEventShow :: Show UpdateDigitalMediaPrintIndexEvent where
  show = genericShow

instance eventGenericUpdateDigitalMediaPrintIndexEventeq :: Eq UpdateDigitalMediaPrintIndexEvent where
  eq = genericEq

--------------------------------------------------------------------------------
-- | ChangedCreator
--------------------------------------------------------------------------------


newtype ChangedCreator = ChangedCreator {creator :: Address,newCreator :: Address}

derive instance newtypeChangedCreator :: Newtype ChangedCreator _

instance eventFilterChangedCreator :: EventFilter ChangedCreator where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "de6cfdf21fe76bcb45258138e27bcd332b76941b24d226b5da8dc5f9cd531c3e")]

instance indexedEventChangedCreator :: IndexedEvent (Tuple0 ) (Tuple2 (Tagged (SProxy "creator") Address) (Tagged (SProxy "newCreator") Address)) ChangedCreator where
  isAnonymous _ = false

derive instance genericChangedCreator :: Generic ChangedCreator _

instance eventGenericChangedCreatorShow :: Show ChangedCreator where
  show = genericShow

instance eventGenericChangedCreatoreq :: Eq ChangedCreator where
  eq = genericEq

--------------------------------------------------------------------------------
-- | SingleCreatorChanged
--------------------------------------------------------------------------------


newtype SingleCreatorChanged = SingleCreatorChanged {previousCreatorAddress :: Address,newCreatorAddress :: Address}

derive instance newtypeSingleCreatorChanged :: Newtype SingleCreatorChanged _

instance eventFilterSingleCreatorChanged :: EventFilter SingleCreatorChanged where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "384c948063df3740539b4b000658c1a22348e7f18c87f808085662e461e48e71"),Nothing,Nothing]

instance indexedEventSingleCreatorChanged :: IndexedEvent (Tuple2 (Tagged (SProxy "previousCreatorAddress") Address) (Tagged (SProxy "newCreatorAddress") Address)) (Tuple0 ) SingleCreatorChanged where
  isAnonymous _ = false

derive instance genericSingleCreatorChanged :: Generic SingleCreatorChanged _

instance eventGenericSingleCreatorChangedShow :: Show SingleCreatorChanged where
  show = genericShow

instance eventGenericSingleCreatorChangedeq :: Eq SingleCreatorChanged where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Transfer
--------------------------------------------------------------------------------


newtype Transfer = Transfer {_from :: Address,_to :: Address,_tokenId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeTransfer :: Newtype Transfer _

instance eventFilterTransfer :: EventFilter Transfer where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"),Nothing,Nothing]

instance indexedEventTransfer :: IndexedEvent (Tuple2 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address)) (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6)))) Transfer where
  isAnonymous _ = false

derive instance genericTransfer :: Generic Transfer _

instance eventGenericTransferShow :: Show Transfer where
  show = genericShow

instance eventGenericTransfereq :: Eq Transfer where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Approval
--------------------------------------------------------------------------------


newtype Approval = Approval {_owner :: Address,_approved :: Address,_tokenId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeApproval :: Newtype Approval _

instance eventFilterApproval :: EventFilter Approval where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925"),Nothing,Nothing]

instance indexedEventApproval :: IndexedEvent (Tuple2 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_approved") Address)) (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6)))) Approval where
  isAnonymous _ = false

derive instance genericApproval :: Generic Approval _

instance eventGenericApprovalShow :: Show Approval where
  show = genericShow

instance eventGenericApprovaleq :: Eq Approval where
  eq = genericEq

--------------------------------------------------------------------------------
-- | ApprovalForAll
--------------------------------------------------------------------------------


newtype ApprovalForAll = ApprovalForAll {_owner :: Address,_operator :: Address,_approved :: Boolean}

derive instance newtypeApprovalForAll :: Newtype ApprovalForAll _

instance eventFilterApprovalForAll :: EventFilter ApprovalForAll where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31"),Nothing,Nothing]

instance indexedEventApprovalForAll :: IndexedEvent (Tuple2 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_operator") Address)) (Tuple1 (Tagged (SProxy "_approved") Boolean)) ApprovalForAll where
  isAnonymous _ = false

derive instance genericApprovalForAll :: Generic ApprovalForAll _

instance eventGenericApprovalForAllShow :: Show ApprovalForAll where
  show = genericShow

instance eventGenericApprovalForAlleq :: Eq ApprovalForAll where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Pause
--------------------------------------------------------------------------------


newtype Pause = Pause {}

derive instance newtypePause :: Newtype Pause _

instance eventFilterPause :: EventFilter Pause where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "6985a02210a168e66602d3235cb6db0e70f92b3ba4d376a33c0f3d9434bff625")]

instance indexedEventPause :: IndexedEvent (Tuple0 ) (Tuple0 ) Pause where
  isAnonymous _ = false

derive instance genericPause :: Generic Pause _

instance eventGenericPauseShow :: Show Pause where
  show = genericShow

instance eventGenericPauseeq :: Eq Pause where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Unpause
--------------------------------------------------------------------------------


newtype Unpause = Unpause {}

derive instance newtypeUnpause :: Newtype Unpause _

instance eventFilterUnpause :: EventFilter Unpause where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "7805862f689e2f13df9f062ff482ad3ad112aca9e0847911ed832e158c525b33")]

instance indexedEventUnpause :: IndexedEvent (Tuple0 ) (Tuple0 ) Unpause where
  isAnonymous _ = false

derive instance genericUnpause :: Generic Unpause _

instance eventGenericUnpauseShow :: Show Unpause where
  show = genericShow

instance eventGenericUnpauseeq :: Eq Unpause where
  eq = genericEq

--------------------------------------------------------------------------------
-- | OwnershipTransferred
--------------------------------------------------------------------------------


newtype OwnershipTransferred = OwnershipTransferred {previousOwner :: Address,newOwner :: Address}

derive instance newtypeOwnershipTransferred :: Newtype OwnershipTransferred _

instance eventFilterOwnershipTransferred :: EventFilter OwnershipTransferred where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0"),Nothing,Nothing]

instance indexedEventOwnershipTransferred :: IndexedEvent (Tuple2 (Tagged (SProxy "previousOwner") Address) (Tagged (SProxy "newOwner") Address)) (Tuple0 ) OwnershipTransferred where
  isAnonymous _ = false

derive instance genericOwnershipTransferred :: Generic OwnershipTransferred _

instance eventGenericOwnershipTransferredShow :: Show OwnershipTransferred where
  show = genericShow

instance eventGenericOwnershipTransferredeq :: Eq OwnershipTransferred where
  eq = genericEq

--------------------------------------------------------------------------------
-- | AddApprovedTokenCreatorFn
--------------------------------------------------------------------------------


type AddApprovedTokenCreatorFn = Tagged (SProxy "addApprovedTokenCreator(address)") (Tuple1 (Tagged (SProxy "_creatorAddress") Address))

addApprovedTokenCreator :: TransactionOptions NoPay -> { _creatorAddress :: Address } -> Web3 HexString
addApprovedTokenCreator x0 r = uncurryFields  r $ addApprovedTokenCreator' x0
   where
    addApprovedTokenCreator' :: TransactionOptions NoPay -> (Tagged (SProxy "_creatorAddress") Address) -> Web3 HexString
    addApprovedTokenCreator' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: AddApprovedTokenCreatorFn)

--------------------------------------------------------------------------------
-- | ApproveFn
--------------------------------------------------------------------------------


type ApproveFn = Tagged (SProxy "approve(address,uint256)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

approve :: TransactionOptions NoPay -> { _to :: Address, _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
approve x0 r = uncurryFields  r $ approve' x0
   where
    approve' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    approve' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: ApproveFn)

--------------------------------------------------------------------------------
-- | ApprovedCreatorsFn
--------------------------------------------------------------------------------


type ApprovedCreatorsFn = Tagged (SProxy "approvedCreators(address)") (Tuple1 Address)

approvedCreators :: TransactionOptions NoPay -> ChainCursor -> Address -> Web3 (Either CallError Address)
approvedCreators x0 cm x2 = map unTuple1 <$> call x0 cm ((tagged $ Tuple1 x2) :: ApprovedCreatorsFn)

--------------------------------------------------------------------------------
-- | ApprovedTokenCreatorsFn
--------------------------------------------------------------------------------


type ApprovedTokenCreatorsFn = Tagged (SProxy "approvedTokenCreators(address)") (Tuple1 Address)

approvedTokenCreators :: TransactionOptions NoPay -> ChainCursor -> Address -> Web3 (Either CallError Boolean)
approvedTokenCreators x0 cm x2 = map unTuple1 <$> call x0 cm ((tagged $ Tuple1 x2) :: ApprovedTokenCreatorsFn)

--------------------------------------------------------------------------------
-- | BalanceOfFn
--------------------------------------------------------------------------------


type BalanceOfFn = Tagged (SProxy "balanceOf(address)") (Tuple1 (Tagged (SProxy "_owner") Address))

balanceOf :: TransactionOptions NoPay -> ChainCursor -> { _owner :: Address } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
balanceOf x0 cm r = uncurryFields  r $ balanceOf' x0 cm
   where
    balanceOf' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_owner") Address) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    balanceOf' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: BalanceOfFn)

--------------------------------------------------------------------------------
-- | BurnFn
--------------------------------------------------------------------------------


type BurnFn = Tagged (SProxy "burn(uint256)") (Tuple1 (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))))

burn :: TransactionOptions NoPay -> { tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
burn x0 r = uncurryFields  r $ burn' x0
   where
    burn' :: TransactionOptions NoPay -> (Tagged (SProxy "tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    burn' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: BurnFn)

--------------------------------------------------------------------------------
-- | BurnDigitalMediaFn
--------------------------------------------------------------------------------


type BurnDigitalMediaFn = Tagged (SProxy "burnDigitalMedia(uint256)") (Tuple1 (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))))

burnDigitalMedia :: TransactionOptions NoPay -> { _digitalMediaId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
burnDigitalMedia x0 r = uncurryFields  r $ burnDigitalMedia' x0
   where
    burnDigitalMedia' :: TransactionOptions NoPay -> (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    burnDigitalMedia' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: BurnDigitalMediaFn)

--------------------------------------------------------------------------------
-- | BurnTokenFn
--------------------------------------------------------------------------------


type BurnTokenFn = Tagged (SProxy "burnToken(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

burnToken :: TransactionOptions NoPay -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
burnToken x0 r = uncurryFields  r $ burnToken' x0
   where
    burnToken' :: TransactionOptions NoPay -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    burnToken' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: BurnTokenFn)

--------------------------------------------------------------------------------
-- | ChangeCreatorFn
--------------------------------------------------------------------------------


type ChangeCreatorFn = Tagged (SProxy "changeCreator(address,address)") (Tuple2 (Tagged (SProxy "_creator") Address) (Tagged (SProxy "_newCreator") Address))

changeCreator :: TransactionOptions NoPay -> { _creator :: Address, _newCreator :: Address } -> Web3 HexString
changeCreator x0 r = uncurryFields  r $ changeCreator' x0
   where
    changeCreator' :: TransactionOptions NoPay -> (Tagged (SProxy "_creator") Address) -> (Tagged (SProxy "_newCreator") Address) -> Web3 HexString
    changeCreator' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: ChangeCreatorFn)

--------------------------------------------------------------------------------
-- | ChangeSingleCreatorFn
--------------------------------------------------------------------------------


type ChangeSingleCreatorFn = Tagged (SProxy "changeSingleCreator(address)") (Tuple1 (Tagged (SProxy "_newCreatorAddress") Address))

changeSingleCreator :: TransactionOptions NoPay -> { _newCreatorAddress :: Address } -> Web3 HexString
changeSingleCreator x0 r = uncurryFields  r $ changeSingleCreator' x0
   where
    changeSingleCreator' :: TransactionOptions NoPay -> (Tagged (SProxy "_newCreatorAddress") Address) -> Web3 HexString
    changeSingleCreator' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: ChangeSingleCreatorFn)

--------------------------------------------------------------------------------
-- | CreateCollectionFn
--------------------------------------------------------------------------------


type CreateCollectionFn = Tagged (SProxy "createCollection(string)") (Tuple1 (Tagged (SProxy "_metadataPath") String))

createCollection :: TransactionOptions NoPay -> { _metadataPath :: String } -> Web3 HexString
createCollection x0 r = uncurryFields  r $ createCollection' x0
   where
    createCollection' :: TransactionOptions NoPay -> (Tagged (SProxy "_metadataPath") String) -> Web3 HexString
    createCollection' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: CreateCollectionFn)

--------------------------------------------------------------------------------
-- | CreateDigitalMediaFn
--------------------------------------------------------------------------------


type CreateDigitalMediaFn = Tagged (SProxy "createDigitalMedia(uint32,uint256,string)") (Tuple3 (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_metadataPath") String))

createDigitalMedia :: TransactionOptions NoPay -> { _totalSupply :: (UIntN (D3 :& DOne D2)), _collectionId :: (UIntN (D2 :& D5 :& DOne D6)), _metadataPath :: String } -> Web3 HexString
createDigitalMedia x0 r = uncurryFields  r $ createDigitalMedia' x0
   where
    createDigitalMedia' :: TransactionOptions NoPay -> (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) -> (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_metadataPath") String) -> Web3 HexString
    createDigitalMedia' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: CreateDigitalMediaFn)

--------------------------------------------------------------------------------
-- | CreateDigitalMediaAndReleasesFn
--------------------------------------------------------------------------------


type CreateDigitalMediaAndReleasesFn = Tagged (SProxy "createDigitalMediaAndReleases(uint32,uint256,string,uint32)") (Tuple4 (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_metadataPath") String) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

createDigitalMediaAndReleases :: TransactionOptions NoPay -> { _totalSupply :: (UIntN (D3 :& DOne D2)), _collectionId :: (UIntN (D2 :& D5 :& DOne D6)), _metadataPath :: String, _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
createDigitalMediaAndReleases x0 r = uncurryFields  r $ createDigitalMediaAndReleases' x0
   where
    createDigitalMediaAndReleases' :: TransactionOptions NoPay -> (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) -> (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_metadataPath") String) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    createDigitalMediaAndReleases' y0 y1 y2 y3 y4 = sendTx y0 ((tagged $ Tuple4 y1 y2 y3 y4) :: CreateDigitalMediaAndReleasesFn)

--------------------------------------------------------------------------------
-- | CreateDigitalMediaAndReleasesInNewCollectionFn
--------------------------------------------------------------------------------


type CreateDigitalMediaAndReleasesInNewCollectionFn = Tagged (SProxy "createDigitalMediaAndReleasesInNewCollection(uint32,string,string,uint32)") (Tuple4 (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "_digitalMediaMetadataPath") String) (Tagged (SProxy "_collectionMetadataPath") String) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

createDigitalMediaAndReleasesInNewCollection :: TransactionOptions NoPay -> { _totalSupply :: (UIntN (D3 :& DOne D2)), _digitalMediaMetadataPath :: String, _collectionMetadataPath :: String, _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
createDigitalMediaAndReleasesInNewCollection x0 r = uncurryFields  r $ createDigitalMediaAndReleasesInNewCollection' x0
   where
    createDigitalMediaAndReleasesInNewCollection' :: TransactionOptions NoPay -> (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) -> (Tagged (SProxy "_digitalMediaMetadataPath") String) -> (Tagged (SProxy "_collectionMetadataPath") String) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    createDigitalMediaAndReleasesInNewCollection' y0 y1 y2 y3 y4 = sendTx y0 ((tagged $ Tuple4 y1 y2 y3 y4) :: CreateDigitalMediaAndReleasesInNewCollectionFn)

--------------------------------------------------------------------------------
-- | CreateDigitalMediaReleasesFn
--------------------------------------------------------------------------------


type CreateDigitalMediaReleasesFn = Tagged (SProxy "createDigitalMediaReleases(uint256,uint32)") (Tuple2 (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

createDigitalMediaReleases :: TransactionOptions NoPay -> { _digitalMediaId :: (UIntN (D2 :& D5 :& DOne D6)), _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
createDigitalMediaReleases x0 r = uncurryFields  r $ createDigitalMediaReleases' x0
   where
    createDigitalMediaReleases' :: TransactionOptions NoPay -> (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    createDigitalMediaReleases' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: CreateDigitalMediaReleasesFn)

--------------------------------------------------------------------------------
-- | CreatorRegistryStoreFn
--------------------------------------------------------------------------------


type CreatorRegistryStoreFn = Tagged (SProxy "creatorRegistryStore()") (Tuple0 )

creatorRegistryStore :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
creatorRegistryStore x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: CreatorRegistryStoreFn)

--------------------------------------------------------------------------------
-- | CurrentDigitalMediaStoreFn
--------------------------------------------------------------------------------


type CurrentDigitalMediaStoreFn = Tagged (SProxy "currentDigitalMediaStore()") (Tuple0 )

currentDigitalMediaStore :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
currentDigitalMediaStore x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: CurrentDigitalMediaStoreFn)

--------------------------------------------------------------------------------
-- | CurrentStartingDigitalMediaIdFn
--------------------------------------------------------------------------------


type CurrentStartingDigitalMediaIdFn = Tagged (SProxy "currentStartingDigitalMediaId()") (Tuple0 )

currentStartingDigitalMediaId :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
currentStartingDigitalMediaId x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: CurrentStartingDigitalMediaIdFn)

--------------------------------------------------------------------------------
-- | DisableOboAddressFn
--------------------------------------------------------------------------------


type DisableOboAddressFn = Tagged (SProxy "disableOboAddress(address)") (Tuple1 (Tagged (SProxy "_oboAddress") Address))

disableOboAddress :: TransactionOptions NoPay -> { _oboAddress :: Address } -> Web3 HexString
disableOboAddress x0 r = uncurryFields  r $ disableOboAddress' x0
   where
    disableOboAddress' :: TransactionOptions NoPay -> (Tagged (SProxy "_oboAddress") Address) -> Web3 HexString
    disableOboAddress' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: DisableOboAddressFn)

--------------------------------------------------------------------------------
-- | DisabledOboOperatorsFn
--------------------------------------------------------------------------------


type DisabledOboOperatorsFn = Tagged (SProxy "disabledOboOperators(address)") (Tuple1 Address)

disabledOboOperators :: TransactionOptions NoPay -> ChainCursor -> Address -> Web3 (Either CallError Boolean)
disabledOboOperators x0 cm x2 = map unTuple1 <$> call x0 cm ((tagged $ Tuple1 x2) :: DisabledOboOperatorsFn)

--------------------------------------------------------------------------------
-- | ExistsFn
--------------------------------------------------------------------------------


type ExistsFn = Tagged (SProxy "exists(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

exists :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Boolean)
exists x0 cm r = uncurryFields  r $ exists' x0 cm
   where
    exists' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Boolean)
    exists' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: ExistsFn)

--------------------------------------------------------------------------------
-- | GetApprovedFn
--------------------------------------------------------------------------------


type GetApprovedFn = Tagged (SProxy "getApproved(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

getApproved :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Address)
getApproved x0 cm r = uncurryFields  r $ getApproved' x0 cm
   where
    getApproved' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Address)
    getApproved' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: GetApprovedFn)

--------------------------------------------------------------------------------
-- | GetCollectionFn
--------------------------------------------------------------------------------


type GetCollectionFn = Tagged (SProxy "getCollection(uint256)") (Tuple1 (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))))

getCollection :: TransactionOptions NoPay -> ChainCursor -> { _id :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple3 (UIntN (D2 :& D5 :& DOne D6)) Address String))
getCollection x0 cm r = uncurryFields  r $ getCollection' x0 cm
   where
    getCollection' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple3 (UIntN (D2 :& D5 :& DOne D6)) Address String))
    getCollection' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: GetCollectionFn)

--------------------------------------------------------------------------------
-- | GetDigitalMediaFn
--------------------------------------------------------------------------------


type GetDigitalMediaFn = Tagged (SProxy "getDigitalMedia(uint256)") (Tuple1 (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))))

getDigitalMedia :: TransactionOptions NoPay -> ChainCursor -> { _id :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple6 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D3 :& DOne D2)) (UIntN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6)) Address String))
getDigitalMedia x0 cm r = uncurryFields  r $ getDigitalMedia' x0 cm
   where
    getDigitalMedia' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple6 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D3 :& DOne D2)) (UIntN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6)) Address String))
    getDigitalMedia' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: GetDigitalMediaFn)

--------------------------------------------------------------------------------
-- | GetDigitalMediaReleaseFn
--------------------------------------------------------------------------------


type GetDigitalMediaReleaseFn = Tagged (SProxy "getDigitalMediaRelease(uint256)") (Tuple1 (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))))

getDigitalMediaRelease :: TransactionOptions NoPay -> ChainCursor -> { _id :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple3 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6))))
getDigitalMediaRelease x0 cm r = uncurryFields  r $ getDigitalMediaRelease' x0 cm
   where
    getDigitalMediaRelease' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_id") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple3 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6))))
    getDigitalMediaRelease' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: GetDigitalMediaReleaseFn)

--------------------------------------------------------------------------------
-- | IsApprovedForAllFn
--------------------------------------------------------------------------------


type IsApprovedForAllFn = Tagged (SProxy "isApprovedForAll(address,address)") (Tuple2 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_operator") Address))

isApprovedForAll :: TransactionOptions NoPay -> ChainCursor -> { _owner :: Address, _operator :: Address } -> Web3 (Either CallError Boolean)
isApprovedForAll x0 cm r = uncurryFields  r $ isApprovedForAll' x0 cm
   where
    isApprovedForAll' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_owner") Address) -> (Tagged (SProxy "_operator") Address) -> Web3 (Either CallError Boolean)
    isApprovedForAll' y0 cm' y2 y3 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple2 y2 y3) :: IsApprovedForAllFn)

--------------------------------------------------------------------------------
-- | NameFn
--------------------------------------------------------------------------------


type NameFn = Tagged (SProxy "name()") (Tuple0 )

name :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
name x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: NameFn)

--------------------------------------------------------------------------------
-- | OboCreateDigitalMediaAndReleasesFn
--------------------------------------------------------------------------------


type OboCreateDigitalMediaAndReleasesFn = Tagged (SProxy "oboCreateDigitalMediaAndReleases(address,uint32,uint256,string,uint32)") (Tuple5 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_metadataPath") String) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

oboCreateDigitalMediaAndReleases :: TransactionOptions NoPay -> { _owner :: Address, _totalSupply :: (UIntN (D3 :& DOne D2)), _collectionId :: (UIntN (D2 :& D5 :& DOne D6)), _metadataPath :: String, _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
oboCreateDigitalMediaAndReleases x0 r = uncurryFields  r $ oboCreateDigitalMediaAndReleases' x0
   where
    oboCreateDigitalMediaAndReleases' :: TransactionOptions NoPay -> (Tagged (SProxy "_owner") Address) -> (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) -> (Tagged (SProxy "_collectionId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_metadataPath") String) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    oboCreateDigitalMediaAndReleases' y0 y1 y2 y3 y4 y5 = sendTx y0 ((tagged $ Tuple5 y1 y2 y3 y4 y5) :: OboCreateDigitalMediaAndReleasesFn)

--------------------------------------------------------------------------------
-- | OboCreateDigitalMediaAndReleasesInNewCollectionFn
--------------------------------------------------------------------------------


type OboCreateDigitalMediaAndReleasesInNewCollectionFn = Tagged (SProxy "oboCreateDigitalMediaAndReleasesInNewCollection(address,uint32,string,string,uint32)") (Tuple5 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) (Tagged (SProxy "_digitalMediaMetadataPath") String) (Tagged (SProxy "_collectionMetadataPath") String) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

oboCreateDigitalMediaAndReleasesInNewCollection :: TransactionOptions NoPay -> { _owner :: Address, _totalSupply :: (UIntN (D3 :& DOne D2)), _digitalMediaMetadataPath :: String, _collectionMetadataPath :: String, _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
oboCreateDigitalMediaAndReleasesInNewCollection x0 r = uncurryFields  r $ oboCreateDigitalMediaAndReleasesInNewCollection' x0
   where
    oboCreateDigitalMediaAndReleasesInNewCollection' :: TransactionOptions NoPay -> (Tagged (SProxy "_owner") Address) -> (Tagged (SProxy "_totalSupply") (UIntN (D3 :& DOne D2))) -> (Tagged (SProxy "_digitalMediaMetadataPath") String) -> (Tagged (SProxy "_collectionMetadataPath") String) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    oboCreateDigitalMediaAndReleasesInNewCollection' y0 y1 y2 y3 y4 y5 = sendTx y0 ((tagged $ Tuple5 y1 y2 y3 y4 y5) :: OboCreateDigitalMediaAndReleasesInNewCollectionFn)

--------------------------------------------------------------------------------
-- | OboCreateDigitalMediaReleasesFn
--------------------------------------------------------------------------------


type OboCreateDigitalMediaReleasesFn = Tagged (SProxy "oboCreateDigitalMediaReleases(address,uint256,uint32)") (Tuple3 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))))

oboCreateDigitalMediaReleases :: TransactionOptions NoPay -> { _owner :: Address, _digitalMediaId :: (UIntN (D2 :& D5 :& DOne D6)), _numReleases :: (UIntN (D3 :& DOne D2)) } -> Web3 HexString
oboCreateDigitalMediaReleases x0 r = uncurryFields  r $ oboCreateDigitalMediaReleases' x0
   where
    oboCreateDigitalMediaReleases' :: TransactionOptions NoPay -> (Tagged (SProxy "_owner") Address) -> (Tagged (SProxy "_digitalMediaId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_numReleases") (UIntN (D3 :& DOne D2))) -> Web3 HexString
    oboCreateDigitalMediaReleases' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: OboCreateDigitalMediaReleasesFn)

--------------------------------------------------------------------------------
-- | OwnerFn
--------------------------------------------------------------------------------


type OwnerFn = Tagged (SProxy "owner()") (Tuple0 )

owner :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
owner x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: OwnerFn)

--------------------------------------------------------------------------------
-- | OwnerOfFn
--------------------------------------------------------------------------------


type OwnerOfFn = Tagged (SProxy "ownerOf(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

ownerOf :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Address)
ownerOf x0 cm r = uncurryFields  r $ ownerOf' x0 cm
   where
    ownerOf' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Address)
    ownerOf' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: OwnerOfFn)

--------------------------------------------------------------------------------
-- | PauseFn
--------------------------------------------------------------------------------


type PauseFn = Tagged (SProxy "pause()") (Tuple0 )

pause :: TransactionOptions NoPay -> Web3 HexString
pause x0 = sendTx x0 ((tagged $ Tuple0 ) :: PauseFn)

--------------------------------------------------------------------------------
-- | PausedFn
--------------------------------------------------------------------------------


type PausedFn = Tagged (SProxy "paused()") (Tuple0 )

paused :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Boolean)
paused x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: PausedFn)

--------------------------------------------------------------------------------
-- | RemoveApprovedTokenCreatorFn
--------------------------------------------------------------------------------


type RemoveApprovedTokenCreatorFn = Tagged (SProxy "removeApprovedTokenCreator(address)") (Tuple1 (Tagged (SProxy "_creatorAddress") Address))

removeApprovedTokenCreator :: TransactionOptions NoPay -> { _creatorAddress :: Address } -> Web3 HexString
removeApprovedTokenCreator x0 r = uncurryFields  r $ removeApprovedTokenCreator' x0
   where
    removeApprovedTokenCreator' :: TransactionOptions NoPay -> (Tagged (SProxy "_creatorAddress") Address) -> Web3 HexString
    removeApprovedTokenCreator' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: RemoveApprovedTokenCreatorFn)

--------------------------------------------------------------------------------
-- | ResetApprovalFn
--------------------------------------------------------------------------------


type ResetApprovalFn = Tagged (SProxy "resetApproval(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

resetApproval :: TransactionOptions NoPay -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
resetApproval x0 r = uncurryFields  r $ resetApproval' x0
   where
    resetApproval' :: TransactionOptions NoPay -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    resetApproval' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: ResetApprovalFn)

--------------------------------------------------------------------------------
-- | SafeTransferFrom4Fn
--------------------------------------------------------------------------------


type SafeTransferFrom4Fn = Tagged (SProxy "safeTransferFrom4(address,address,uint256,bytes)") (Tuple4 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_data") ByteString))

safeTransferFrom4 :: TransactionOptions NoPay -> { _from :: Address, _to :: Address, _tokenId :: (UIntN (D2 :& D5 :& DOne D6)), _data :: ByteString } -> Web3 HexString
safeTransferFrom4 x0 r = uncurryFields  r $ safeTransferFrom4' x0
   where
    safeTransferFrom4' :: TransactionOptions NoPay -> (Tagged (SProxy "_from") Address) -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_data") ByteString) -> Web3 HexString
    safeTransferFrom4' y0 y1 y2 y3 y4 = sendTx y0 ((tagged $ Tuple4 y1 y2 y3 y4) :: SafeTransferFrom4Fn)

--------------------------------------------------------------------------------
-- | SafeTransferFrom3Fn
--------------------------------------------------------------------------------


type SafeTransferFrom3Fn = Tagged (SProxy "safeTransferFrom3(address,address,uint256)") (Tuple3 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

safeTransferFrom3 :: TransactionOptions NoPay -> { _from :: Address, _to :: Address, _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
safeTransferFrom3 x0 r = uncurryFields  r $ safeTransferFrom3' x0
   where
    safeTransferFrom3' :: TransactionOptions NoPay -> (Tagged (SProxy "_from") Address) -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    safeTransferFrom3' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: SafeTransferFrom3Fn)

--------------------------------------------------------------------------------
-- | SetApprovalForAllFn
--------------------------------------------------------------------------------


type SetApprovalForAllFn = Tagged (SProxy "setApprovalForAll(address,bool)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_approved") Boolean))

setApprovalForAll :: TransactionOptions NoPay -> { _to :: Address, _approved :: Boolean } -> Web3 HexString
setApprovalForAll x0 r = uncurryFields  r $ setApprovalForAll' x0
   where
    setApprovalForAll' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_approved") Boolean) -> Web3 HexString
    setApprovalForAll' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: SetApprovalForAllFn)

--------------------------------------------------------------------------------
-- | SetOboApprovalForAllFn
--------------------------------------------------------------------------------


type SetOboApprovalForAllFn = Tagged (SProxy "setOboApprovalForAll(address,bool)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_approved") Boolean))

setOboApprovalForAll :: TransactionOptions NoPay -> { _to :: Address, _approved :: Boolean } -> Web3 HexString
setOboApprovalForAll x0 r = uncurryFields  r $ setOboApprovalForAll' x0
   where
    setOboApprovalForAll' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_approved") Boolean) -> Web3 HexString
    setOboApprovalForAll' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: SetOboApprovalForAllFn)

--------------------------------------------------------------------------------
-- | SetV1DigitalMediaStoreAddressFn
--------------------------------------------------------------------------------


type SetV1DigitalMediaStoreAddressFn = Tagged (SProxy "setV1DigitalMediaStoreAddress(address)") (Tuple1 (Tagged (SProxy "_dmsAddress") Address))

setV1DigitalMediaStoreAddress :: TransactionOptions NoPay -> { _dmsAddress :: Address } -> Web3 HexString
setV1DigitalMediaStoreAddress x0 r = uncurryFields  r $ setV1DigitalMediaStoreAddress' x0
   where
    setV1DigitalMediaStoreAddress' :: TransactionOptions NoPay -> (Tagged (SProxy "_dmsAddress") Address) -> Web3 HexString
    setV1DigitalMediaStoreAddress' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: SetV1DigitalMediaStoreAddressFn)

--------------------------------------------------------------------------------
-- | SingleCreatorAddressFn
--------------------------------------------------------------------------------


type SingleCreatorAddressFn = Tagged (SProxy "singleCreatorAddress()") (Tuple0 )

singleCreatorAddress :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
singleCreatorAddress x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: SingleCreatorAddressFn)

--------------------------------------------------------------------------------
-- | SupportsInterfaceFn
--------------------------------------------------------------------------------


type SupportsInterfaceFn = Tagged (SProxy "supportsInterface(bytes4)") (Tuple1 (Tagged (SProxy "_interfaceID") (BytesN (DOne D4))))

supportsInterface :: TransactionOptions NoPay -> ChainCursor -> { _interfaceID :: (BytesN (DOne D4)) } -> Web3 (Either CallError Boolean)
supportsInterface x0 cm r = uncurryFields  r $ supportsInterface' x0 cm
   where
    supportsInterface' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_interfaceID") (BytesN (DOne D4))) -> Web3 (Either CallError Boolean)
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


type TokenByIndexFn = Tagged (SProxy "tokenByIndex(uint256)") (Tuple1 (Tagged (SProxy "_index") (UIntN (D2 :& D5 :& DOne D6))))

tokenByIndex :: TransactionOptions NoPay -> ChainCursor -> { _index :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
tokenByIndex x0 cm r = uncurryFields  r $ tokenByIndex' x0 cm
   where
    tokenByIndex' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_index") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    tokenByIndex' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokenByIndexFn)

--------------------------------------------------------------------------------
-- | TokenIdToDigitalMediaReleaseFn
--------------------------------------------------------------------------------


type TokenIdToDigitalMediaReleaseFn = Tagged (SProxy "tokenIdToDigitalMediaRelease(uint256)") (Tuple1 (UIntN (D2 :& D5 :& DOne D6)))

tokenIdToDigitalMediaRelease :: TransactionOptions NoPay -> ChainCursor -> (UIntN (D2 :& D5 :& DOne D6)) -> Web3 (Either CallError (Tuple2 (UIntN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6))))
tokenIdToDigitalMediaRelease x0 cm x2 = call x0 cm ((tagged $ Tuple1 x2) :: TokenIdToDigitalMediaReleaseFn)

--------------------------------------------------------------------------------
-- | TokenOfOwnerByIndexFn
--------------------------------------------------------------------------------


type TokenOfOwnerByIndexFn = Tagged (SProxy "tokenOfOwnerByIndex(address,uint256)") (Tuple2 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_index") (UIntN (D2 :& D5 :& DOne D6))))

tokenOfOwnerByIndex :: TransactionOptions NoPay -> ChainCursor -> { _owner :: Address, _index :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
tokenOfOwnerByIndex x0 cm r = uncurryFields  r $ tokenOfOwnerByIndex' x0 cm
   where
    tokenOfOwnerByIndex' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_owner") Address) -> (Tagged (SProxy "_index") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    tokenOfOwnerByIndex' y0 cm' y2 y3 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple2 y2 y3) :: TokenOfOwnerByIndexFn)

--------------------------------------------------------------------------------
-- | TokenURIFn
--------------------------------------------------------------------------------


type TokenURIFn = Tagged (SProxy "tokenURI(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

tokenURI :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError String)
tokenURI x0 cm r = uncurryFields  r $ tokenURI' x0 cm
   where
    tokenURI' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError String)
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


type TransferFromFn = Tagged (SProxy "transferFrom(address,address,uint256)") (Tuple3 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

transferFrom :: TransactionOptions NoPay -> { _from :: Address, _to :: Address, _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
transferFrom x0 r = uncurryFields  r $ transferFrom' x0
   where
    transferFrom' :: TransactionOptions NoPay -> (Tagged (SProxy "_from") Address) -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    transferFrom' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: TransferFromFn)

--------------------------------------------------------------------------------
-- | TransferOwnershipFn
--------------------------------------------------------------------------------


type TransferOwnershipFn = Tagged (SProxy "transferOwnership(address)") (Tuple1 (Tagged (SProxy "newOwner") Address))

transferOwnership :: TransactionOptions NoPay -> { newOwner :: Address } -> Web3 HexString
transferOwnership x0 r = uncurryFields  r $ transferOwnership' x0
   where
    transferOwnership' :: TransactionOptions NoPay -> (Tagged (SProxy "newOwner") Address) -> Web3 HexString
    transferOwnership' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: TransferOwnershipFn)

--------------------------------------------------------------------------------
-- | UnpauseFn
--------------------------------------------------------------------------------


type UnpauseFn = Tagged (SProxy "unpause()") (Tuple0 )

unpause :: TransactionOptions NoPay -> Web3 HexString
unpause x0 = sendTx x0 ((tagged $ Tuple0 ) :: UnpauseFn)

--------------------------------------------------------------------------------
-- | V1DigitalMediaStoreFn
--------------------------------------------------------------------------------


type V1DigitalMediaStoreFn = Tagged (SProxy "v1DigitalMediaStore()") (Tuple0 )

v1DigitalMediaStore :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
v1DigitalMediaStore x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: V1DigitalMediaStoreFn)