--------------------------------------------------------------------------------
-- | KnownOriginDigitalAsset
--------------------------------------------------------------------------------

module Contracts.KnownOriginDigitalAsset where

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
import Network.Ethereum.Web3.Solidity (ByteString, BytesN, D2, D3, D4, D5, D6, D8, DOne, Tuple0(..), Tuple1(..), Tuple10(..), Tuple11(..), Tuple2(..), Tuple3(..), Tuple4(..), Tuple5, UIntN, class IndexedEvent, unTuple1)
import Network.Ethereum.Web3.Solidity.Size (type (:&))
import Network.Ethereum.Web3.Types (Address, CallError, ChainCursor, HexString, NoPay, TransactionOptions, Web3, defaultFilter, mkHexString)
import Network.Ethereum.Web3.Types.TokenUnit (MinorUnit)
import Partial.Unsafe (unsafePartial)
--------------------------------------------------------------------------------
-- | ConstructorFn
--------------------------------------------------------------------------------


type ConstructorFn = Tagged (SProxy "constructor()") (Tuple0 )

constructor :: TransactionOptions NoPay -> HexString -> Web3 HexString
constructor x0 bc = deployContract x0 bc ((tagged $ Tuple0 ) :: ConstructorFn)



--------------------------------------------------------------------------------
-- | Purchase
--------------------------------------------------------------------------------


newtype Purchase = Purchase {_tokenId :: (UIntN (D2 :& D5 :& DOne D6)),_editionNumber :: (UIntN (D2 :& D5 :& DOne D6)),_buyer :: Address,_priceInWei :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypePurchase :: Newtype Purchase _

instance eventFilterPurchase :: EventFilter Purchase where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "145e2ff612f82ecb64f13b28a0e2825f8fd3dba6d6fbbdec265aa58800014c3d"),Nothing,Nothing,Nothing]

instance indexedEventPurchase :: IndexedEvent (Tuple3 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_buyer") Address)) (Tuple1 (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6)))) Purchase where
  isAnonymous _ = false

derive instance genericPurchase :: Generic Purchase _

instance eventGenericPurchaseShow :: Show Purchase where
  show = genericShow

instance eventGenericPurchaseeq :: Eq Purchase where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Minted
--------------------------------------------------------------------------------


newtype Minted = Minted {_tokenId :: (UIntN (D2 :& D5 :& DOne D6)),_editionNumber :: (UIntN (D2 :& D5 :& DOne D6)),_buyer :: Address}

derive instance newtypeMinted :: Newtype Minted _

instance eventFilterMinted :: EventFilter Minted where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "259eb7b480b3d449f506927269e4665c83c69e4cd797143eaa8f84632dc7a02b"),Nothing,Nothing,Nothing]

instance indexedEventMinted :: IndexedEvent (Tuple3 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_buyer") Address)) (Tuple0 ) Minted where
  isAnonymous _ = false

derive instance genericMinted :: Generic Minted _

instance eventGenericMintedShow :: Show Minted where
  show = genericShow

instance eventGenericMintedeq :: Eq Minted where
  eq = genericEq

--------------------------------------------------------------------------------
-- | EditionCreated
--------------------------------------------------------------------------------


newtype EditionCreated = EditionCreated {_editionNumber :: (UIntN (D2 :& D5 :& DOne D6)),_editionData :: (BytesN (D3 :& DOne D2)),_editionType :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeEditionCreated :: Newtype EditionCreated _

instance eventFilterEditionCreated :: EventFilter EditionCreated where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "f702f09ce66e1a7f60e909cfb5b6400ce4967f4fd691158bd96066cb89c5c078"),Nothing,Nothing,Nothing]

instance indexedEventEditionCreated :: IndexedEvent (Tuple3 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6)))) (Tuple0 ) EditionCreated where
  isAnonymous _ = false

derive instance genericEditionCreated :: Generic EditionCreated _

instance eventGenericEditionCreatedShow :: Show EditionCreated where
  show = genericShow

instance eventGenericEditionCreatedeq :: Eq EditionCreated where
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
-- | OwnershipRenounced
--------------------------------------------------------------------------------


newtype OwnershipRenounced = OwnershipRenounced {previousOwner :: Address}

derive instance newtypeOwnershipRenounced :: Newtype OwnershipRenounced _

instance eventFilterOwnershipRenounced :: EventFilter OwnershipRenounced where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "f8df31144d9c2f0f6b59d69b8b98abd5459d07f2742c4df920b25aae33c64820"),Nothing]

instance indexedEventOwnershipRenounced :: IndexedEvent (Tuple1 (Tagged (SProxy "previousOwner") Address)) (Tuple0 ) OwnershipRenounced where
  isAnonymous _ = false

derive instance genericOwnershipRenounced :: Generic OwnershipRenounced _

instance eventGenericOwnershipRenouncedShow :: Show OwnershipRenounced where
  show = genericShow

instance eventGenericOwnershipRenouncedeq :: Eq OwnershipRenounced where
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
-- | RoleAdded
--------------------------------------------------------------------------------


newtype RoleAdded = RoleAdded {operator :: Address,role :: (UIntN (DOne D8))}

derive instance newtypeRoleAdded :: Newtype RoleAdded _

instance eventFilterRoleAdded :: EventFilter RoleAdded where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "0ed8a6a6a166243876472f7a8610b62c1a76c67911642d39ff34ead38105534f"),Nothing]

instance indexedEventRoleAdded :: IndexedEvent (Tuple1 (Tagged (SProxy "operator") Address)) (Tuple1 (Tagged (SProxy "role") (UIntN (DOne D8)))) RoleAdded where
  isAnonymous _ = false

derive instance genericRoleAdded :: Generic RoleAdded _

instance eventGenericRoleAddedShow :: Show RoleAdded where
  show = genericShow

instance eventGenericRoleAddedeq :: Eq RoleAdded where
  eq = genericEq

--------------------------------------------------------------------------------
-- | RoleRemoved
--------------------------------------------------------------------------------


newtype RoleRemoved = RoleRemoved {operator :: Address,role :: (UIntN (DOne D8))}

derive instance newtypeRoleRemoved :: Newtype RoleRemoved _

instance eventFilterRoleRemoved :: EventFilter RoleRemoved where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "3824b64a1e23d936b458f4e31445c664d2bc9c14e842407917cbc100b0236a2f"),Nothing]

instance indexedEventRoleRemoved :: IndexedEvent (Tuple1 (Tagged (SProxy "operator") Address)) (Tuple1 (Tagged (SProxy "role") (UIntN (DOne D8)))) RoleRemoved where
  isAnonymous _ = false

derive instance genericRoleRemoved :: Generic RoleRemoved _

instance eventGenericRoleRemovedShow :: Show RoleRemoved where
  show = genericShow

instance eventGenericRoleRemovedeq :: Eq RoleRemoved where
  eq = genericEq

--------------------------------------------------------------------------------
-- | Transfer
--------------------------------------------------------------------------------


newtype Transfer = Transfer {_from :: Address,_to :: Address,_tokenId :: (UIntN (D2 :& D5 :& DOne D6))}

derive instance newtypeTransfer :: Newtype Transfer _

instance eventFilterTransfer :: EventFilter Transfer where
  eventFilter _ addr = defaultFilter
    # _address .~ Just addr
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"),Nothing,Nothing,Nothing]

instance indexedEventTransfer :: IndexedEvent (Tuple3 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6)))) (Tuple0 ) Transfer where
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
    # _topics .~ Just [Just ( unsafePartial $ fromJust $ mkHexString "8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925"),Nothing,Nothing,Nothing]

instance indexedEventApproval :: IndexedEvent (Tuple3 (Tagged (SProxy "_owner") Address) (Tagged (SProxy "_approved") Address) (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6)))) (Tuple0 ) Approval where
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
-- | InterfaceId_ERC165Fn
--------------------------------------------------------------------------------


type InterfaceId_ERC165Fn = Tagged (SProxy "InterfaceId_ERC165()") (Tuple0 )

interfaceId_ERC165 :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (BytesN (DOne D4)))
interfaceId_ERC165 x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: InterfaceId_ERC165Fn)

--------------------------------------------------------------------------------
-- | ROLE_KNOWN_ORIGINFn
--------------------------------------------------------------------------------


type ROLE_KNOWN_ORIGINFn = Tagged (SProxy "ROLE_KNOWN_ORIGIN()") (Tuple0 )

rOLE_KNOWN_ORIGIN :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (DOne D8)))
rOLE_KNOWN_ORIGIN x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: ROLE_KNOWN_ORIGINFn)

--------------------------------------------------------------------------------
-- | ROLE_MINTERFn
--------------------------------------------------------------------------------


type ROLE_MINTERFn = Tagged (SProxy "ROLE_MINTER()") (Tuple0 )

rOLE_MINTER :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (DOne D8)))
rOLE_MINTER x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: ROLE_MINTERFn)

--------------------------------------------------------------------------------
-- | ROLE_UNDER_MINTERFn
--------------------------------------------------------------------------------


type ROLE_UNDER_MINTERFn = Tagged (SProxy "ROLE_UNDER_MINTER()") (Tuple0 )

rOLE_UNDER_MINTER :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (DOne D8)))
rOLE_UNDER_MINTER x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: ROLE_UNDER_MINTERFn)

--------------------------------------------------------------------------------
-- | AddAddressToAccessControlFn
--------------------------------------------------------------------------------


type AddAddressToAccessControlFn = Tagged (SProxy "addAddressToAccessControl(address,uint8)") (Tuple2 (Tagged (SProxy "_operator") Address) (Tagged (SProxy "_role") (UIntN (DOne D8))))

addAddressToAccessControl :: TransactionOptions NoPay -> { _operator :: Address, _role :: (UIntN (DOne D8)) } -> Web3 HexString
addAddressToAccessControl x0 r = uncurryFields  r $ addAddressToAccessControl' x0
   where
    addAddressToAccessControl' :: TransactionOptions NoPay -> (Tagged (SProxy "_operator") Address) -> (Tagged (SProxy "_role") (UIntN (DOne D8))) -> Web3 HexString
    addAddressToAccessControl' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: AddAddressToAccessControlFn)

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
-- | ArtistCommissionFn
--------------------------------------------------------------------------------


type ArtistCommissionFn = Tagged (SProxy "artistCommission(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

artistCommission :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple2 Address (UIntN (D2 :& D5 :& DOne D6))))
artistCommission x0 cm r = uncurryFields  r $ artistCommission' x0 cm
   where
    artistCommission' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple2 Address (UIntN (D2 :& D5 :& DOne D6))))
    artistCommission' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: ArtistCommissionFn)

--------------------------------------------------------------------------------
-- | ArtistsEditionsFn
--------------------------------------------------------------------------------


type ArtistsEditionsFn = Tagged (SProxy "artistsEditions(address)") (Tuple1 (Tagged (SProxy "_artistsAccount") Address))

artistsEditions :: TransactionOptions NoPay -> ChainCursor -> { _artistsAccount :: Address } -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
artistsEditions x0 cm r = uncurryFields  r $ artistsEditions' x0 cm
   where
    artistsEditions' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_artistsAccount") Address) -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
    artistsEditions' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: ArtistsEditionsFn)

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
-- | BatchTransferFn
--------------------------------------------------------------------------------


type BatchTransferFn = Tagged (SProxy "batchTransfer(address,uint256[])") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenIds") (Array (UIntN (D2 :& D5 :& DOne D6)))))

batchTransfer :: TransactionOptions NoPay -> { _to :: Address, _tokenIds :: (Array (UIntN (D2 :& D5 :& DOne D6))) } -> Web3 HexString
batchTransfer x0 r = uncurryFields  r $ batchTransfer' x0
   where
    batchTransfer' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenIds") (Array (UIntN (D2 :& D5 :& DOne D6)))) -> Web3 HexString
    batchTransfer' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: BatchTransferFn)

--------------------------------------------------------------------------------
-- | BatchTransferFromFn
--------------------------------------------------------------------------------


type BatchTransferFromFn = Tagged (SProxy "batchTransferFrom(address,address,uint256[])") (Tuple3 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_to") Address) (Tagged (SProxy "_tokenIds") (Array (UIntN (D2 :& D5 :& DOne D6)))))

batchTransferFrom :: TransactionOptions NoPay -> { _from :: Address, _to :: Address, _tokenIds :: (Array (UIntN (D2 :& D5 :& DOne D6))) } -> Web3 HexString
batchTransferFrom x0 r = uncurryFields  r $ batchTransferFrom' x0
   where
    batchTransferFrom' :: TransactionOptions NoPay -> (Tagged (SProxy "_from") Address) -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_tokenIds") (Array (UIntN (D2 :& D5 :& DOne D6)))) -> Web3 HexString
    batchTransferFrom' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: BatchTransferFromFn)

--------------------------------------------------------------------------------
-- | BurnFn
--------------------------------------------------------------------------------


type BurnFn = Tagged (SProxy "burn(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

burn :: TransactionOptions NoPay -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
burn x0 r = uncurryFields  r $ burn' x0
   where
    burn' :: TransactionOptions NoPay -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    burn' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: BurnFn)

--------------------------------------------------------------------------------
-- | CreateActiveEditionFn
--------------------------------------------------------------------------------


type CreateActiveEditionFn = Tagged (SProxy "createActiveEdition(uint256,bytes32,uint256,uint256,uint256,address,uint256,uint256,string,uint256)") (Tuple10 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_artistAccount") Address) (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_tokenURI") String) (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))))

createActiveEdition :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _editionData :: (BytesN (D3 :& DOne D2)), _editionType :: (UIntN (D2 :& D5 :& DOne D6)), _startDate :: (UIntN (D2 :& D5 :& DOne D6)), _endDate :: (UIntN (D2 :& D5 :& DOne D6)), _artistAccount :: Address, _artistCommission :: (UIntN (D2 :& D5 :& DOne D6)), _priceInWei :: (UIntN (D2 :& D5 :& DOne D6)), _tokenURI :: String, _totalAvailable :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
createActiveEdition x0 r = uncurryFields  r $ createActiveEdition' x0
   where
    createActiveEdition' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) -> (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_artistAccount") Address) -> (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_tokenURI") String) -> (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    createActiveEdition' y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 = sendTx y0 ((tagged $ Tuple10 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10) :: CreateActiveEditionFn)

--------------------------------------------------------------------------------
-- | CreateActivePreMintedEditionFn
--------------------------------------------------------------------------------


type CreateActivePreMintedEditionFn = Tagged (SProxy "createActivePreMintedEdition(uint256,bytes32,uint256,uint256,uint256,address,uint256,uint256,string,uint256,uint256)") (Tuple11 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_artistAccount") Address) (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_tokenURI") String) (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))))

createActivePreMintedEdition :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _editionData :: (BytesN (D3 :& DOne D2)), _editionType :: (UIntN (D2 :& D5 :& DOne D6)), _startDate :: (UIntN (D2 :& D5 :& DOne D6)), _endDate :: (UIntN (D2 :& D5 :& DOne D6)), _artistAccount :: Address, _artistCommission :: (UIntN (D2 :& D5 :& DOne D6)), _priceInWei :: (UIntN (D2 :& D5 :& DOne D6)), _tokenURI :: String, _totalSupply :: (UIntN (D2 :& D5 :& DOne D6)), _totalAvailable :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
createActivePreMintedEdition x0 r = uncurryFields  r $ createActivePreMintedEdition' x0
   where
    createActivePreMintedEdition' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) -> (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_artistAccount") Address) -> (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_tokenURI") String) -> (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    createActivePreMintedEdition' y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 = sendTx y0 ((tagged $ Tuple11 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11) :: CreateActivePreMintedEditionFn)

--------------------------------------------------------------------------------
-- | CreateInactiveEditionFn
--------------------------------------------------------------------------------


type CreateInactiveEditionFn = Tagged (SProxy "createInactiveEdition(uint256,bytes32,uint256,uint256,uint256,address,uint256,uint256,string,uint256)") (Tuple10 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_artistAccount") Address) (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_tokenURI") String) (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))))

createInactiveEdition :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _editionData :: (BytesN (D3 :& DOne D2)), _editionType :: (UIntN (D2 :& D5 :& DOne D6)), _startDate :: (UIntN (D2 :& D5 :& DOne D6)), _endDate :: (UIntN (D2 :& D5 :& DOne D6)), _artistAccount :: Address, _artistCommission :: (UIntN (D2 :& D5 :& DOne D6)), _priceInWei :: (UIntN (D2 :& D5 :& DOne D6)), _tokenURI :: String, _totalAvailable :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
createInactiveEdition x0 r = uncurryFields  r $ createInactiveEdition' x0
   where
    createInactiveEdition' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) -> (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_artistAccount") Address) -> (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_tokenURI") String) -> (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    createInactiveEdition' y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 = sendTx y0 ((tagged $ Tuple10 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10) :: CreateInactiveEditionFn)

--------------------------------------------------------------------------------
-- | CreateInactivePreMintedEditionFn
--------------------------------------------------------------------------------


type CreateInactivePreMintedEditionFn = Tagged (SProxy "createInactivePreMintedEdition(uint256,bytes32,uint256,uint256,uint256,address,uint256,uint256,string,uint256,uint256)") (Tuple11 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_artistAccount") Address) (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_tokenURI") String) (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))))

createInactivePreMintedEdition :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _editionData :: (BytesN (D3 :& DOne D2)), _editionType :: (UIntN (D2 :& D5 :& DOne D6)), _startDate :: (UIntN (D2 :& D5 :& DOne D6)), _endDate :: (UIntN (D2 :& D5 :& DOne D6)), _artistAccount :: Address, _artistCommission :: (UIntN (D2 :& D5 :& DOne D6)), _priceInWei :: (UIntN (D2 :& D5 :& DOne D6)), _tokenURI :: String, _totalSupply :: (UIntN (D2 :& D5 :& DOne D6)), _totalAvailable :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
createInactivePreMintedEdition x0 r = uncurryFields  r $ createInactivePreMintedEdition' x0
   where
    createInactivePreMintedEdition' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_editionData") (BytesN (D3 :& DOne D2))) -> (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_artistAccount") Address) -> (Tagged (SProxy "_artistCommission") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_tokenURI") String) -> (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    createInactivePreMintedEdition' y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 = sendTx y0 ((tagged $ Tuple11 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11) :: CreateInactivePreMintedEditionFn)

--------------------------------------------------------------------------------
-- | DetailsOfEditionFn
--------------------------------------------------------------------------------


type DetailsOfEditionFn = Tagged (SProxy "detailsOfEdition(uint256)") (Tuple1 (Tagged (SProxy "editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

detailsOfEdition :: TransactionOptions NoPay -> ChainCursor -> { editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple11 (BytesN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) Address (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) String (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) Boolean))
detailsOfEdition x0 cm r = uncurryFields  r $ detailsOfEdition' x0 cm
   where
    detailsOfEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple11 (BytesN (D3 :& DOne D2)) (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) Address (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) String (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) Boolean))
    detailsOfEdition' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: DetailsOfEditionFn)

--------------------------------------------------------------------------------
-- | EditionActiveFn
--------------------------------------------------------------------------------


type EditionActiveFn = Tagged (SProxy "editionActive(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

editionActive :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Boolean)
editionActive x0 cm r = uncurryFields  r $ editionActive' x0 cm
   where
    editionActive' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Boolean)
    editionActive' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionActiveFn)

--------------------------------------------------------------------------------
-- | EditionDataFn
--------------------------------------------------------------------------------


type EditionDataFn = Tagged (SProxy "editionData(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

editionData :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (BytesN (D3 :& DOne D2)))
editionData x0 cm r = uncurryFields  r $ editionData' x0 cm
   where
    editionData' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (BytesN (D3 :& DOne D2)))
    editionData' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionDataFn)

--------------------------------------------------------------------------------
-- | EditionExistsFn
--------------------------------------------------------------------------------


type EditionExistsFn = Tagged (SProxy "editionExists(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

editionExists :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError Boolean)
editionExists x0 cm r = uncurryFields  r $ editionExists' x0 cm
   where
    editionExists' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError Boolean)
    editionExists' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionExistsFn)

--------------------------------------------------------------------------------
-- | EditionOfTokenIdFn
--------------------------------------------------------------------------------


type EditionOfTokenIdFn = Tagged (SProxy "editionOfTokenId(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

editionOfTokenId :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
editionOfTokenId x0 cm r = uncurryFields  r $ editionOfTokenId' x0 cm
   where
    editionOfTokenId' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    editionOfTokenId' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionOfTokenIdFn)

--------------------------------------------------------------------------------
-- | EditionOptionalCommissionFn
--------------------------------------------------------------------------------


type EditionOptionalCommissionFn = Tagged (SProxy "editionOptionalCommission(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

editionOptionalCommission :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) Address))
editionOptionalCommission x0 cm r = uncurryFields  r $ editionOptionalCommission' x0 cm
   where
    editionOptionalCommission' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) Address))
    editionOptionalCommission' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: EditionOptionalCommissionFn)

--------------------------------------------------------------------------------
-- | EditionTypeFn
--------------------------------------------------------------------------------


type EditionTypeFn = Tagged (SProxy "editionType(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

editionType :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
editionType x0 cm r = uncurryFields  r $ editionType' x0 cm
   where
    editionType' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    editionType' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionTypeFn)

--------------------------------------------------------------------------------
-- | EditionsOfTypeFn
--------------------------------------------------------------------------------


type EditionsOfTypeFn = Tagged (SProxy "editionsOfType(uint256)") (Tuple1 (Tagged (SProxy "_type") (UIntN (D2 :& D5 :& DOne D6))))

editionsOfType :: TransactionOptions NoPay -> ChainCursor -> { _type :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
editionsOfType x0 cm r = uncurryFields  r $ editionsOfType' x0 cm
   where
    editionsOfType' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_type") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
    editionsOfType' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: EditionsOfTypeFn)

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
-- | HasRoleFn
--------------------------------------------------------------------------------


type HasRoleFn = Tagged (SProxy "hasRole(address,uint8)") (Tuple2 (Tagged (SProxy "_operator") Address) (Tagged (SProxy "_role") (UIntN (DOne D8))))

hasRole :: TransactionOptions NoPay -> ChainCursor -> { _operator :: Address, _role :: (UIntN (DOne D8)) } -> Web3 (Either CallError Boolean)
hasRole x0 cm r = uncurryFields  r $ hasRole' x0 cm
   where
    hasRole' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_operator") Address) -> (Tagged (SProxy "_role") (UIntN (DOne D8))) -> Web3 (Either CallError Boolean)
    hasRole' y0 cm' y2 y3 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple2 y2 y3) :: HasRoleFn)

--------------------------------------------------------------------------------
-- | HighestEditionNumberFn
--------------------------------------------------------------------------------


type HighestEditionNumberFn = Tagged (SProxy "highestEditionNumber()") (Tuple0 )

highestEditionNumber :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
highestEditionNumber x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: HighestEditionNumberFn)

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
-- | KoCommissionAccountFn
--------------------------------------------------------------------------------


type KoCommissionAccountFn = Tagged (SProxy "koCommissionAccount()") (Tuple0 )

koCommissionAccount :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError Address)
koCommissionAccount x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: KoCommissionAccountFn)

--------------------------------------------------------------------------------
-- | MintFn
--------------------------------------------------------------------------------


type MintFn = Tagged (SProxy "mint(address,uint256)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

mint :: TransactionOptions NoPay -> { _to :: Address, _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
mint x0 r = uncurryFields  r $ mint' x0
   where
    mint' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    mint' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: MintFn)

--------------------------------------------------------------------------------
-- | NameFn
--------------------------------------------------------------------------------


type NameFn = Tagged (SProxy "name()") (Tuple0 )

name :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
name x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: NameFn)

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
-- | PriceInWeiEditionFn
--------------------------------------------------------------------------------


type PriceInWeiEditionFn = Tagged (SProxy "priceInWeiEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

priceInWeiEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
priceInWeiEdition x0 cm r = uncurryFields  r $ priceInWeiEdition' x0 cm
   where
    priceInWeiEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    priceInWeiEdition' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: PriceInWeiEditionFn)

--------------------------------------------------------------------------------
-- | PriceInWeiTokenFn
--------------------------------------------------------------------------------


type PriceInWeiTokenFn = Tagged (SProxy "priceInWeiToken(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

priceInWeiToken :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
priceInWeiToken x0 cm r = uncurryFields  r $ priceInWeiToken' x0 cm
   where
    priceInWeiToken' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    priceInWeiToken' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: PriceInWeiTokenFn)

--------------------------------------------------------------------------------
-- | PurchaseFn
--------------------------------------------------------------------------------


type PurchaseFn = Tagged (SProxy "purchase(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

purchase :: TransactionOptions MinorUnit -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
purchase x0 r = uncurryFields  r $ purchase' x0
   where
    purchase' :: TransactionOptions MinorUnit -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    purchase' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: PurchaseFn)

--------------------------------------------------------------------------------
-- | PurchaseDatesEditionFn
--------------------------------------------------------------------------------


type PurchaseDatesEditionFn = Tagged (SProxy "purchaseDatesEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

purchaseDatesEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6))))
purchaseDatesEdition x0 cm r = uncurryFields  r $ purchaseDatesEdition' x0 cm
   where
    purchaseDatesEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6))))
    purchaseDatesEdition' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: PurchaseDatesEditionFn)

--------------------------------------------------------------------------------
-- | PurchaseDatesTokenFn
--------------------------------------------------------------------------------


type PurchaseDatesTokenFn = Tagged (SProxy "purchaseDatesToken(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

purchaseDatesToken :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6))))
purchaseDatesToken x0 cm r = uncurryFields  r $ purchaseDatesToken' x0 cm
   where
    purchaseDatesToken' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple2 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6))))
    purchaseDatesToken' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: PurchaseDatesTokenFn)

--------------------------------------------------------------------------------
-- | PurchaseToFn
--------------------------------------------------------------------------------


type PurchaseToFn = Tagged (SProxy "purchaseTo(address,uint256)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

purchaseTo :: TransactionOptions MinorUnit -> { _to :: Address, _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
purchaseTo x0 r = uncurryFields  r $ purchaseTo' x0
   where
    purchaseTo' :: TransactionOptions MinorUnit -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    purchaseTo' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: PurchaseToFn)

--------------------------------------------------------------------------------
-- | ReclaimEtherFn
--------------------------------------------------------------------------------


type ReclaimEtherFn = Tagged (SProxy "reclaimEther()") (Tuple0 )

reclaimEther :: TransactionOptions NoPay -> Web3 HexString
reclaimEther x0 = sendTx x0 ((tagged $ Tuple0 ) :: ReclaimEtherFn)

--------------------------------------------------------------------------------
-- | RemoveAddressFromAccessControlFn
--------------------------------------------------------------------------------


type RemoveAddressFromAccessControlFn = Tagged (SProxy "removeAddressFromAccessControl(address,uint8)") (Tuple2 (Tagged (SProxy "_operator") Address) (Tagged (SProxy "_role") (UIntN (DOne D8))))

removeAddressFromAccessControl :: TransactionOptions NoPay -> { _operator :: Address, _role :: (UIntN (DOne D8)) } -> Web3 HexString
removeAddressFromAccessControl x0 r = uncurryFields  r $ removeAddressFromAccessControl' x0
   where
    removeAddressFromAccessControl' :: TransactionOptions NoPay -> (Tagged (SProxy "_operator") Address) -> (Tagged (SProxy "_role") (UIntN (DOne D8))) -> Web3 HexString
    removeAddressFromAccessControl' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: RemoveAddressFromAccessControlFn)

--------------------------------------------------------------------------------
-- | RenounceOwnershipFn
--------------------------------------------------------------------------------


type RenounceOwnershipFn = Tagged (SProxy "renounceOwnership()") (Tuple0 )

renounceOwnership :: TransactionOptions NoPay -> Web3 HexString
renounceOwnership x0 = sendTx x0 ((tagged $ Tuple0 ) :: RenounceOwnershipFn)

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
-- | SetTokenURIFn
--------------------------------------------------------------------------------


type SetTokenURIFn = Tagged (SProxy "setTokenURI(uint256,string)") (Tuple2 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_uri") String))

setTokenURI :: TransactionOptions NoPay -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)), _uri :: String } -> Web3 HexString
setTokenURI x0 r = uncurryFields  r $ setTokenURI' x0
   where
    setTokenURI' :: TransactionOptions NoPay -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_uri") String) -> Web3 HexString
    setTokenURI' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: SetTokenURIFn)

--------------------------------------------------------------------------------
-- | SupportsInterfaceFn
--------------------------------------------------------------------------------


type SupportsInterfaceFn = Tagged (SProxy "supportsInterface(bytes4)") (Tuple1 (Tagged (SProxy "_interfaceId") (BytesN (DOne D4))))

supportsInterface :: TransactionOptions NoPay -> ChainCursor -> { _interfaceId :: (BytesN (DOne D4)) } -> Web3 (Either CallError Boolean)
supportsInterface x0 cm r = uncurryFields  r $ supportsInterface' x0 cm
   where
    supportsInterface' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_interfaceId") (BytesN (DOne D4))) -> Web3 (Either CallError Boolean)
    supportsInterface' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: SupportsInterfaceFn)

--------------------------------------------------------------------------------
-- | SymbolFn
--------------------------------------------------------------------------------


type SymbolFn = Tagged (SProxy "symbol()") (Tuple0 )

symbol :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
symbol x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: SymbolFn)

--------------------------------------------------------------------------------
-- | TokenBaseURIFn
--------------------------------------------------------------------------------


type TokenBaseURIFn = Tagged (SProxy "tokenBaseURI()") (Tuple0 )

tokenBaseURI :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError String)
tokenBaseURI x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TokenBaseURIFn)

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
-- | TokenDataFn
--------------------------------------------------------------------------------


type TokenDataFn = Tagged (SProxy "tokenData(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

tokenData :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Tuple5 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) (BytesN (D3 :& DOne D2)) String Address))
tokenData x0 cm r = uncurryFields  r $ tokenData' x0 cm
   where
    tokenData' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Tuple5 (UIntN (D2 :& D5 :& DOne D6)) (UIntN (D2 :& D5 :& DOne D6)) (BytesN (D3 :& DOne D2)) String Address))
    tokenData' y0 cm' y2 = call y0 cm' ((tagged $ Tuple1 y2) :: TokenDataFn)

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
-- | TokenURIEditionFn
--------------------------------------------------------------------------------


type TokenURIEditionFn = Tagged (SProxy "tokenURIEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

tokenURIEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError String)
tokenURIEdition x0 cm r = uncurryFields  r $ tokenURIEdition' x0 cm
   where
    tokenURIEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError String)
    tokenURIEdition' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokenURIEditionFn)

--------------------------------------------------------------------------------
-- | TokenURISafeFn
--------------------------------------------------------------------------------


type TokenURISafeFn = Tagged (SProxy "tokenURISafe(uint256)") (Tuple1 (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))))

tokenURISafe :: TransactionOptions NoPay -> ChainCursor -> { _tokenId :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError String)
tokenURISafe x0 cm r = uncurryFields  r $ tokenURISafe' x0 cm
   where
    tokenURISafe' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_tokenId") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError String)
    tokenURISafe' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokenURISafeFn)

--------------------------------------------------------------------------------
-- | TokensOfFn
--------------------------------------------------------------------------------


type TokensOfFn = Tagged (SProxy "tokensOf(address)") (Tuple1 (Tagged (SProxy "_owner") Address))

tokensOf :: TransactionOptions NoPay -> ChainCursor -> { _owner :: Address } -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
tokensOf x0 cm r = uncurryFields  r $ tokensOf' x0 cm
   where
    tokensOf' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_owner") Address) -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
    tokensOf' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokensOfFn)

--------------------------------------------------------------------------------
-- | TokensOfEditionFn
--------------------------------------------------------------------------------


type TokensOfEditionFn = Tagged (SProxy "tokensOfEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

tokensOfEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
tokensOfEdition x0 cm r = uncurryFields  r $ tokensOfEdition' x0 cm
   where
    tokensOfEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (Array (UIntN (D2 :& D5 :& DOne D6))))
    tokensOfEdition' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TokensOfEditionFn)

--------------------------------------------------------------------------------
-- | TotalAvailableEditionFn
--------------------------------------------------------------------------------


type TotalAvailableEditionFn = Tagged (SProxy "totalAvailableEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

totalAvailableEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalAvailableEdition x0 cm r = uncurryFields  r $ totalAvailableEdition' x0 cm
   where
    totalAvailableEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    totalAvailableEdition' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TotalAvailableEditionFn)

--------------------------------------------------------------------------------
-- | TotalNumberAvailableFn
--------------------------------------------------------------------------------


type TotalNumberAvailableFn = Tagged (SProxy "totalNumberAvailable()") (Tuple0 )

totalNumberAvailable :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalNumberAvailable x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TotalNumberAvailableFn)

--------------------------------------------------------------------------------
-- | TotalNumberMintedFn
--------------------------------------------------------------------------------


type TotalNumberMintedFn = Tagged (SProxy "totalNumberMinted()") (Tuple0 )

totalNumberMinted :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalNumberMinted x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TotalNumberMintedFn)

--------------------------------------------------------------------------------
-- | TotalPurchaseValueInWeiFn
--------------------------------------------------------------------------------


type TotalPurchaseValueInWeiFn = Tagged (SProxy "totalPurchaseValueInWei()") (Tuple0 )

totalPurchaseValueInWei :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalPurchaseValueInWei x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TotalPurchaseValueInWeiFn)

--------------------------------------------------------------------------------
-- | TotalRemainingFn
--------------------------------------------------------------------------------


type TotalRemainingFn = Tagged (SProxy "totalRemaining(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

totalRemaining :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalRemaining x0 cm r = uncurryFields  r $ totalRemaining' x0 cm
   where
    totalRemaining' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    totalRemaining' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TotalRemainingFn)

--------------------------------------------------------------------------------
-- | TotalSupplyFn
--------------------------------------------------------------------------------


type TotalSupplyFn = Tagged (SProxy "totalSupply()") (Tuple0 )

totalSupply :: TransactionOptions NoPay -> ChainCursor -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalSupply x0 cm = map unTuple1 <$> call x0 cm ((tagged $ Tuple0 ) :: TotalSupplyFn)

--------------------------------------------------------------------------------
-- | TotalSupplyEditionFn
--------------------------------------------------------------------------------


type TotalSupplyEditionFn = Tagged (SProxy "totalSupplyEdition(uint256)") (Tuple1 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

totalSupplyEdition :: TransactionOptions NoPay -> ChainCursor -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
totalSupplyEdition x0 cm r = uncurryFields  r $ totalSupplyEdition' x0 cm
   where
    totalSupplyEdition' :: TransactionOptions NoPay -> ChainCursor -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 (Either CallError (UIntN (D2 :& D5 :& DOne D6)))
    totalSupplyEdition' y0 cm' y2 = map unTuple1 <$> call y0 cm' ((tagged $ Tuple1 y2) :: TotalSupplyEditionFn)

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


type TransferOwnershipFn = Tagged (SProxy "transferOwnership(address)") (Tuple1 (Tagged (SProxy "_newOwner") Address))

transferOwnership :: TransactionOptions NoPay -> { _newOwner :: Address } -> Web3 HexString
transferOwnership x0 r = uncurryFields  r $ transferOwnership' x0
   where
    transferOwnership' :: TransactionOptions NoPay -> (Tagged (SProxy "_newOwner") Address) -> Web3 HexString
    transferOwnership' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: TransferOwnershipFn)

--------------------------------------------------------------------------------
-- | UnderMintFn
--------------------------------------------------------------------------------


type UnderMintFn = Tagged (SProxy "underMint(address,uint256)") (Tuple2 (Tagged (SProxy "_to") Address) (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))))

underMint :: TransactionOptions NoPay -> { _to :: Address, _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
underMint x0 r = uncurryFields  r $ underMint' x0
   where
    underMint' :: TransactionOptions NoPay -> (Tagged (SProxy "_to") Address) -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    underMint' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UnderMintFn)

--------------------------------------------------------------------------------
-- | UnpauseFn
--------------------------------------------------------------------------------


type UnpauseFn = Tagged (SProxy "unpause()") (Tuple0 )

unpause :: TransactionOptions NoPay -> Web3 HexString
unpause x0 = sendTx x0 ((tagged $ Tuple0 ) :: UnpauseFn)

--------------------------------------------------------------------------------
-- | UpdateActiveFn
--------------------------------------------------------------------------------


type UpdateActiveFn = Tagged (SProxy "updateActive(uint256,bool)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_active") Boolean))

updateActive :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _active :: Boolean } -> Web3 HexString
updateActive x0 r = uncurryFields  r $ updateActive' x0
   where
    updateActive' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_active") Boolean) -> Web3 HexString
    updateActive' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateActiveFn)

--------------------------------------------------------------------------------
-- | UpdateArtistCommissionFn
--------------------------------------------------------------------------------


type UpdateArtistCommissionFn = Tagged (SProxy "updateArtistCommission(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_rate") (UIntN (D2 :& D5 :& DOne D6))))

updateArtistCommission :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _rate :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateArtistCommission x0 r = uncurryFields  r $ updateArtistCommission' x0
   where
    updateArtistCommission' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_rate") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateArtistCommission' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateArtistCommissionFn)

--------------------------------------------------------------------------------
-- | UpdateArtistsAccountFn
--------------------------------------------------------------------------------


type UpdateArtistsAccountFn = Tagged (SProxy "updateArtistsAccount(uint256,address)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_artistAccount") Address))

updateArtistsAccount :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _artistAccount :: Address } -> Web3 HexString
updateArtistsAccount x0 r = uncurryFields  r $ updateArtistsAccount' x0
   where
    updateArtistsAccount' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_artistAccount") Address) -> Web3 HexString
    updateArtistsAccount' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateArtistsAccountFn)

--------------------------------------------------------------------------------
-- | UpdateEditionTokenURIFn
--------------------------------------------------------------------------------


type UpdateEditionTokenURIFn = Tagged (SProxy "updateEditionTokenURI(uint256,string)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_uri") String))

updateEditionTokenURI :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _uri :: String } -> Web3 HexString
updateEditionTokenURI x0 r = uncurryFields  r $ updateEditionTokenURI' x0
   where
    updateEditionTokenURI' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_uri") String) -> Web3 HexString
    updateEditionTokenURI' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateEditionTokenURIFn)

--------------------------------------------------------------------------------
-- | UpdateEditionTypeFn
--------------------------------------------------------------------------------


type UpdateEditionTypeFn = Tagged (SProxy "updateEditionType(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))))

updateEditionType :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _editionType :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateEditionType x0 r = uncurryFields  r $ updateEditionType' x0
   where
    updateEditionType' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_editionType") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateEditionType' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateEditionTypeFn)

--------------------------------------------------------------------------------
-- | UpdateEndDateFn
--------------------------------------------------------------------------------


type UpdateEndDateFn = Tagged (SProxy "updateEndDate(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))))

updateEndDate :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _endDate :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateEndDate x0 r = uncurryFields  r $ updateEndDate' x0
   where
    updateEndDate' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_endDate") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateEndDate' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateEndDateFn)

--------------------------------------------------------------------------------
-- | UpdateKoCommissionAccountFn
--------------------------------------------------------------------------------


type UpdateKoCommissionAccountFn = Tagged (SProxy "updateKoCommissionAccount(address)") (Tuple1 (Tagged (SProxy "_koCommissionAccount") Address))

updateKoCommissionAccount :: TransactionOptions NoPay -> { _koCommissionAccount :: Address } -> Web3 HexString
updateKoCommissionAccount x0 r = uncurryFields  r $ updateKoCommissionAccount' x0
   where
    updateKoCommissionAccount' :: TransactionOptions NoPay -> (Tagged (SProxy "_koCommissionAccount") Address) -> Web3 HexString
    updateKoCommissionAccount' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: UpdateKoCommissionAccountFn)

--------------------------------------------------------------------------------
-- | UpdateOptionalCommissionFn
--------------------------------------------------------------------------------


type UpdateOptionalCommissionFn = Tagged (SProxy "updateOptionalCommission(uint256,uint256,address)") (Tuple3 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_rate") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_recipient") Address))

updateOptionalCommission :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _rate :: (UIntN (D2 :& D5 :& DOne D6)), _recipient :: Address } -> Web3 HexString
updateOptionalCommission x0 r = uncurryFields  r $ updateOptionalCommission' x0
   where
    updateOptionalCommission' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_rate") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_recipient") Address) -> Web3 HexString
    updateOptionalCommission' y0 y1 y2 y3 = sendTx y0 ((tagged $ Tuple3 y1 y2 y3) :: UpdateOptionalCommissionFn)

--------------------------------------------------------------------------------
-- | UpdatePriceInWeiFn
--------------------------------------------------------------------------------


type UpdatePriceInWeiFn = Tagged (SProxy "updatePriceInWei(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))))

updatePriceInWei :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _priceInWei :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updatePriceInWei x0 r = uncurryFields  r $ updatePriceInWei' x0
   where
    updatePriceInWei' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_priceInWei") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updatePriceInWei' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdatePriceInWeiFn)

--------------------------------------------------------------------------------
-- | UpdateStartDateFn
--------------------------------------------------------------------------------


type UpdateStartDateFn = Tagged (SProxy "updateStartDate(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))))

updateStartDate :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _startDate :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateStartDate x0 r = uncurryFields  r $ updateStartDate' x0
   where
    updateStartDate' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_startDate") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateStartDate' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateStartDateFn)

--------------------------------------------------------------------------------
-- | UpdateTokenBaseURIFn
--------------------------------------------------------------------------------


type UpdateTokenBaseURIFn = Tagged (SProxy "updateTokenBaseURI(string)") (Tuple1 (Tagged (SProxy "_newBaseURI") String))

updateTokenBaseURI :: TransactionOptions NoPay -> { _newBaseURI :: String } -> Web3 HexString
updateTokenBaseURI x0 r = uncurryFields  r $ updateTokenBaseURI' x0
   where
    updateTokenBaseURI' :: TransactionOptions NoPay -> (Tagged (SProxy "_newBaseURI") String) -> Web3 HexString
    updateTokenBaseURI' y0 y1 = sendTx y0 ((tagged $ Tuple1 y1) :: UpdateTokenBaseURIFn)

--------------------------------------------------------------------------------
-- | UpdateTotalAvailableFn
--------------------------------------------------------------------------------


type UpdateTotalAvailableFn = Tagged (SProxy "updateTotalAvailable(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))))

updateTotalAvailable :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _totalAvailable :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateTotalAvailable x0 r = uncurryFields  r $ updateTotalAvailable' x0
   where
    updateTotalAvailable' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_totalAvailable") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateTotalAvailable' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateTotalAvailableFn)

--------------------------------------------------------------------------------
-- | UpdateTotalSupplyFn
--------------------------------------------------------------------------------


type UpdateTotalSupplyFn = Tagged (SProxy "updateTotalSupply(uint256,uint256)") (Tuple2 (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))))

updateTotalSupply :: TransactionOptions NoPay -> { _editionNumber :: (UIntN (D2 :& D5 :& DOne D6)), _totalSupply :: (UIntN (D2 :& D5 :& DOne D6)) } -> Web3 HexString
updateTotalSupply x0 r = uncurryFields  r $ updateTotalSupply' x0
   where
    updateTotalSupply' :: TransactionOptions NoPay -> (Tagged (SProxy "_editionNumber") (UIntN (D2 :& D5 :& DOne D6))) -> (Tagged (SProxy "_totalSupply") (UIntN (D2 :& D5 :& DOne D6))) -> Web3 HexString
    updateTotalSupply' y0 y1 y2 = sendTx y0 ((tagged $ Tuple2 y1 y2) :: UpdateTotalSupplyFn)