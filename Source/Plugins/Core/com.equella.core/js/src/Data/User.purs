module OEQ.Data.User where 

import Prelude

import Data.Argonaut (class DecodeJson, class EncodeJson, decodeJson, jsonEmptyObject, (.?), (.??), (:=), (~>))
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)

type UserDetailsR = {id:: String, username:: String, firstName:: String,
                           lastName:: String, email :: Maybe String }
                           
newtype UserDetails = UserDetails UserDetailsR
derive instance ntUD :: Newtype UserDetails _
derive instance eqUD :: Eq UserDetails

type IdName = {id:: String, name:: String }
newtype GroupDetails = GroupDetails IdName
derive instance ntGD :: Newtype GroupDetails _
derive instance eqGD :: Eq GroupDetails

newtype RoleDetails = RoleDetails IdName
derive instance ntRD :: Newtype RoleDetails _
derive instance eqRD :: Eq RoleDetails

newtype UserGroupRoles u g r = UserGroupRoles {users:: Array u, groups :: Array g, roles:: Array r}

userIds :: Array String -> UserGroupRoles String String String 
userIds users = UserGroupRoles {users,groups:[],roles:[]}

class ToUGRDetail a where 
  toUGR :: a -> UGRDetail

type UGRDetail = UserGroupRoles UserDetails GroupDetails RoleDetails 

instance semigroupUGR :: Semigroup (UserGroupRoles u g r) where 
  append (UserGroupRoles a) (UserGroupRoles b) = UserGroupRoles {users:a.users <> b.users, groups:a.groups <> b.groups, roles: a.roles <> b.roles }

instance monoidUGR :: Monoid (UserGroupRoles u g r) where 
  mempty = UserGroupRoles {users:[], groups:[], roles:[]}

instance encUserGroupRoles :: (EncodeJson u, EncodeJson g, EncodeJson r) => EncodeJson (UserGroupRoles u g r) where
  encodeJson (UserGroupRoles {users, groups, roles}) = 
    "users" := users ~>
    "groups" := groups ~> 
    "roles" := roles ~> jsonEmptyObject

instance decUserGroupRoles :: (DecodeJson u, DecodeJson g, DecodeJson r) => DecodeJson (UserGroupRoles u g r) where
  decodeJson v = do 
    o <- decodeJson v
    users <- o .? "users"
    groups <- o .? "groups"
    roles <- o .? "roles"
    pure $ UserGroupRoles {users,groups,roles}

instance decUserDetails :: DecodeJson UserDetails where 
  decodeJson v = do 
    o <- decodeJson v
    id <- o .? "id"
    username <- o .? "username"
    firstName <- o .? "firstName"
    lastName <- o .? "lastName"
    email <- o .?? "email"
    pure $ UserDetails {id,username,firstName,lastName, email}

instance decGroupDetails :: DecodeJson GroupDetails where 
  decodeJson v = do 
    o <- decodeJson v
    id <- o .? "id"
    name <- o .? "name"
    pure $ GroupDetails {id,name}
  
instance decRoleDetails :: DecodeJson RoleDetails where 
  decodeJson v = do 
    o <- decodeJson v
    id <- o .? "id"
    name <- o .? "name"
    pure $ RoleDetails {id,name}

instance uUGR :: ToUGRDetail UserDetails where 
  toUGR u = UserGroupRoles {users:[u], groups:[], roles:[]}

instance gUGR :: ToUGRDetail GroupDetails where 
  toUGR g = UserGroupRoles {users:[], groups:[g], roles:[]}

instance rUGR :: ToUGRDetail RoleDetails where 
  toUGR r = UserGroupRoles {users:[], groups:[], roles:[r]}