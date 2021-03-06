{-# LANGUAGE DataKinds #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE RankNTypes #-}
module Stripe.Endpoints where
import GHC.Generics
import OpenAPI.Support
import Stripe.Types

{- | <p>Retrieves the token with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/tokens/{token}
-}
-- TODO request options as enum
data GetTokensToken = GetTokensToken
  { getTokensTokenParams :: GetTokensTokenParams
  , getTokensTokenBody :: Maybe GetTokensTokenBody
  } deriving (Show, Eq, Generic)

data GetTokensTokenParams = GetTokensTokenParams
  {  getTokensTokenExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTokensTokenToken :: (Text)
  {- ^ The ID of the desired token. -}
  } deriving (Show, Eq, Generic)

data GetTokensTokenBody
  = GetTokensTokenBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTokensToken = "GET"
type instance RequestPath GetTokensToken = "/v1/tokens/{token}"

instance RequestBuilder GetTokensToken where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTokensToken{..} =
    [ "v1"
    , "tokens"
    , pathSimple getTokensTokenToken
    ]
    where
      GetTokensTokenParams{..} = getTokensTokenParams
  endpointQuery GetTokensToken{..} =
    [ ("expand", queryDeepObjectExplode getTokensTokenExpand)
    ]
  endpointHeaders GetTokensToken{..} =
    [
    ]



{-
getTokensToken :: GetTokensToken
getTokensToken = GetTokensToken
-}
-- 
{- | <p>Creates a new tax rate.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/tax_rates
-}
-- TODO request options as enum
data PostTaxRates = PostTaxRates
  { postTaxRatesParams :: PostTaxRatesParams
  , postTaxRatesBody :: PostTaxRatesBody
  } deriving (Show, Eq, Generic)

data PostTaxRatesParams = PostTaxRatesParams
  {
  } deriving (Show, Eq, Generic)

data PostTaxRatesBody
  = PostTaxRatesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTaxRates = "POST"
type instance RequestPath PostTaxRates = "/v1/tax_rates"

instance RequestBuilder PostTaxRates where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTaxRates{..} =
    [ "v1"
    , "tax_rates"
    ]
    where
      PostTaxRatesParams = postTaxRatesParams
  endpointQuery PostTaxRates{..} =
    [
    ]
  endpointHeaders PostTaxRates{..} =
    [
    ]



{-
postTaxRates :: PostTaxRates
postTaxRates = PostTaxRates
-}
-- 
{- | <p>Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/tax_rates
-}
-- TODO request options as enum
data GetTaxRates = GetTaxRates
  { getTaxRatesParams :: GetTaxRatesParams
  , getTaxRatesBody :: Maybe GetTaxRatesBody
  } deriving (Show, Eq, Generic)

data GetTaxRatesParams = GetTaxRatesParams
  {  getTaxRatesActive :: Maybe (Bool)
  {- ^ Optional flag to filter by tax rates that are either active or not active (archived) -}
  ,  getTaxRatesCreated :: Maybe (Either (Object) (Int))
  {- ^ Optional range for filtering created date -}
  ,  getTaxRatesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTaxRatesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTaxRatesInclusive :: Maybe (Bool)
  {- ^ Optional flag to filter by tax rates that are inclusive (or those that are not inclusive) -}
  ,  getTaxRatesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTaxRatesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetTaxRatesBody
  = GetTaxRatesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTaxRates = "GET"
type instance RequestPath GetTaxRates = "/v1/tax_rates"

instance RequestBuilder GetTaxRates where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTaxRates{..} =
    [ "v1"
    , "tax_rates"
    ]
    where
      GetTaxRatesParams{..} = getTaxRatesParams
  endpointQuery GetTaxRates{..} =
    [ ("active", queryFormExplode getTaxRatesActive)
    , ("created", queryDeepObjectExplode getTaxRatesCreated)
    , ("ending_before", queryFormExplode getTaxRatesEndingBefore)
    , ("expand", queryDeepObjectExplode getTaxRatesExpand)
    , ("inclusive", queryFormExplode getTaxRatesInclusive)
    , ("limit", queryFormExplode getTaxRatesLimit)
    , ("starting_after", queryFormExplode getTaxRatesStartingAfter)
    ]
    where
      GetTaxRatesParams{..} = getTaxRatesParams
  endpointHeaders GetTaxRates{..} =
    [
    ]



{-
getTaxRates :: GetTaxRates
getTaxRates = GetTaxRates
-}
-- 
{- | <p>You can create coupons easily via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.</p>

<p>A coupon has either a <code>percent_off</code> or an <code>amount_off</code> and <code>currency</code>. If you set an <code>amount_off</code>, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of <currency>100</currency> will have a final total of <currency>0</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it and an invoice with a subtotal of <currency>300</currency> will have a final total of <currency>100</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/coupons
-}
-- TODO request options as enum
data PostCoupons = PostCoupons
  { postCouponsParams :: PostCouponsParams
  , postCouponsBody :: PostCouponsBody
  } deriving (Show, Eq, Generic)

data PostCouponsParams = PostCouponsParams
  {
  } deriving (Show, Eq, Generic)

data PostCouponsBody
  = PostCouponsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCoupons = "POST"
type instance RequestPath PostCoupons = "/v1/coupons"

instance RequestBuilder PostCoupons where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCoupons{..} =
    [ "v1"
    , "coupons"
    ]
    where
      PostCouponsParams = postCouponsParams
  endpointQuery PostCoupons{..} =
    [
    ]
  endpointHeaders PostCoupons{..} =
    [
    ]



{-
postCoupons :: PostCoupons
postCoupons = PostCoupons
-}
-- 
{- | <p>Returns a list of your coupons.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/coupons
-}
-- TODO request options as enum
data GetCoupons = GetCoupons
  { getCouponsParams :: GetCouponsParams
  , getCouponsBody :: Maybe GetCouponsBody
  } deriving (Show, Eq, Generic)

data GetCouponsParams = GetCouponsParams
  {  getCouponsCreated :: Maybe (Either (Object) (Int))
  {- ^ A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. -}
  ,  getCouponsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCouponsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCouponsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCouponsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCouponsBody
  = GetCouponsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCoupons = "GET"
type instance RequestPath GetCoupons = "/v1/coupons"

instance RequestBuilder GetCoupons where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCoupons{..} =
    [ "v1"
    , "coupons"
    ]
    where
      GetCouponsParams{..} = getCouponsParams
  endpointQuery GetCoupons{..} =
    [ ("created", queryDeepObjectExplode getCouponsCreated)
    , ("ending_before", queryFormExplode getCouponsEndingBefore)
    , ("expand", queryDeepObjectExplode getCouponsExpand)
    , ("limit", queryFormExplode getCouponsLimit)
    , ("starting_after", queryFormExplode getCouponsStartingAfter)
    ]
    where
      GetCouponsParams{..} = getCouponsParams
  endpointHeaders GetCoupons{..} =
    [
    ]



{-
getCoupons :: GetCoupons
getCoupons = GetCoupons
-}
-- 
{- | <p>Updates the webhook endpoint. You may edit the <code>url</code>, the list of <code>enabled_events</code>, and the status of your endpoint.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/webhook_endpoints/{webhook_endpoint}
-}
-- TODO request options as enum
data PostWebhookEndpointsWebhookEndpoint = PostWebhookEndpointsWebhookEndpoint
  { postWebhookEndpointsWebhookEndpointParams :: PostWebhookEndpointsWebhookEndpointParams
  , postWebhookEndpointsWebhookEndpointBody :: Maybe PostWebhookEndpointsWebhookEndpointBody
  } deriving (Show, Eq, Generic)

data PostWebhookEndpointsWebhookEndpointParams = PostWebhookEndpointsWebhookEndpointParams
  {  postWebhookEndpointsWebhookEndpointWebhookEndpoint :: (Text)
  {- ^ The ID of the desired webhook endpoint. -}
  } deriving (Show, Eq, Generic)

data PostWebhookEndpointsWebhookEndpointBody
  = PostWebhookEndpointsWebhookEndpointBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostWebhookEndpointsWebhookEndpoint = "POST"
type instance RequestPath PostWebhookEndpointsWebhookEndpoint = "/v1/webhook_endpoints/{webhook_endpoint}"

instance RequestBuilder PostWebhookEndpointsWebhookEndpoint where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostWebhookEndpointsWebhookEndpoint{..} =
    [ "v1"
    , "webhook_endpoints"
    , pathSimple postWebhookEndpointsWebhookEndpointWebhookEndpoint
    ]
    where
      PostWebhookEndpointsWebhookEndpointParams{..} = postWebhookEndpointsWebhookEndpointParams
  endpointQuery PostWebhookEndpointsWebhookEndpoint{..} =
    [
    ]
  endpointHeaders PostWebhookEndpointsWebhookEndpoint{..} =
    [
    ]



{-
postWebhookEndpointsWebhookEndpoint :: PostWebhookEndpointsWebhookEndpoint
postWebhookEndpointsWebhookEndpoint = PostWebhookEndpointsWebhookEndpoint
-}
-- 
{- | <p>Retrieves the webhook endpoint with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/webhook_endpoints/{webhook_endpoint}
-}
-- TODO request options as enum
data GetWebhookEndpointsWebhookEndpoint = GetWebhookEndpointsWebhookEndpoint
  { getWebhookEndpointsWebhookEndpointParams :: GetWebhookEndpointsWebhookEndpointParams
  , getWebhookEndpointsWebhookEndpointBody :: Maybe GetWebhookEndpointsWebhookEndpointBody
  } deriving (Show, Eq, Generic)

data GetWebhookEndpointsWebhookEndpointParams = GetWebhookEndpointsWebhookEndpointParams
  {  getWebhookEndpointsWebhookEndpointExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getWebhookEndpointsWebhookEndpointWebhookEndpoint :: (Text)
  {- ^ The ID of the desired webhook endpoint. -}
  } deriving (Show, Eq, Generic)

data GetWebhookEndpointsWebhookEndpointBody
  = GetWebhookEndpointsWebhookEndpointBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetWebhookEndpointsWebhookEndpoint = "GET"
type instance RequestPath GetWebhookEndpointsWebhookEndpoint = "/v1/webhook_endpoints/{webhook_endpoint}"

instance RequestBuilder GetWebhookEndpointsWebhookEndpoint where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetWebhookEndpointsWebhookEndpoint{..} =
    [ "v1"
    , "webhook_endpoints"
    , pathSimple getWebhookEndpointsWebhookEndpointWebhookEndpoint
    ]
    where
      GetWebhookEndpointsWebhookEndpointParams{..} = getWebhookEndpointsWebhookEndpointParams
  endpointQuery GetWebhookEndpointsWebhookEndpoint{..} =
    [ ("expand", queryDeepObjectExplode getWebhookEndpointsWebhookEndpointExpand)
    ]
  endpointHeaders GetWebhookEndpointsWebhookEndpoint{..} =
    [
    ]



{-
getWebhookEndpointsWebhookEndpoint :: GetWebhookEndpointsWebhookEndpoint
getWebhookEndpointsWebhookEndpoint = GetWebhookEndpointsWebhookEndpoint
-}
-- 
{- | <p>You can also delete webhook endpoints via the <a href="https://dashboard.stripe.com/account/webhooks">webhook endpoint management</a> page of the Stripe dashboard.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/webhook_endpoints/{webhook_endpoint}
-}
-- TODO request options as enum
data DeleteWebhookEndpointsWebhookEndpoint = DeleteWebhookEndpointsWebhookEndpoint
  { deleteWebhookEndpointsWebhookEndpointParams :: DeleteWebhookEndpointsWebhookEndpointParams
  , deleteWebhookEndpointsWebhookEndpointBody :: Maybe DeleteWebhookEndpointsWebhookEndpointBody
  } deriving (Show, Eq, Generic)

data DeleteWebhookEndpointsWebhookEndpointParams = DeleteWebhookEndpointsWebhookEndpointParams
  {  deleteWebhookEndpointsWebhookEndpointWebhookEndpoint :: (Text)
  {- ^ The ID of the webhook endpoint to delete. -}
  } deriving (Show, Eq, Generic)

data DeleteWebhookEndpointsWebhookEndpointBody
  = DeleteWebhookEndpointsWebhookEndpointBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteWebhookEndpointsWebhookEndpoint = "DELETE"
type instance RequestPath DeleteWebhookEndpointsWebhookEndpoint = "/v1/webhook_endpoints/{webhook_endpoint}"

instance RequestBuilder DeleteWebhookEndpointsWebhookEndpoint where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteWebhookEndpointsWebhookEndpoint{..} =
    [ "v1"
    , "webhook_endpoints"
    , pathSimple deleteWebhookEndpointsWebhookEndpointWebhookEndpoint
    ]
    where
      DeleteWebhookEndpointsWebhookEndpointParams{..} = deleteWebhookEndpointsWebhookEndpointParams
  endpointQuery DeleteWebhookEndpointsWebhookEndpoint{..} =
    [
    ]
  endpointHeaders DeleteWebhookEndpointsWebhookEndpoint{..} =
    [
    ]



{-
deleteWebhookEndpointsWebhookEndpoint :: DeleteWebhookEndpointsWebhookEndpoint
deleteWebhookEndpointsWebhookEndpoint = DeleteWebhookEndpointsWebhookEndpoint
-}
-- 
{- | <p>Returns a Country Spec for a given Country code.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/country_specs/{country}
-}
-- TODO request options as enum
data GetCountrySpecsCountry = GetCountrySpecsCountry
  { getCountrySpecsCountryParams :: GetCountrySpecsCountryParams
  , getCountrySpecsCountryBody :: Maybe GetCountrySpecsCountryBody
  } deriving (Show, Eq, Generic)

data GetCountrySpecsCountryParams = GetCountrySpecsCountryParams
  {  getCountrySpecsCountryCountry :: (Text)
  {- ^ An ISO 3166-1 alpha-2 country code. Available country codes can be listed with the [List Country Specs](https://stripe.com/docs/api#list_country_specs) endpoint. -}
  ,  getCountrySpecsCountryExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetCountrySpecsCountryBody
  = GetCountrySpecsCountryBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCountrySpecsCountry = "GET"
type instance RequestPath GetCountrySpecsCountry = "/v1/country_specs/{country}"

instance RequestBuilder GetCountrySpecsCountry where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCountrySpecsCountry{..} =
    [ "v1"
    , "country_specs"
    , pathSimple getCountrySpecsCountryCountry
    ]
    where
      GetCountrySpecsCountryParams{..} = getCountrySpecsCountryParams
  endpointQuery GetCountrySpecsCountry{..} =
    [ ("expand", queryDeepObjectExplode getCountrySpecsCountryExpand)
    ]
  endpointHeaders GetCountrySpecsCountry{..} =
    [
    ]



{-
getCountrySpecsCountry :: GetCountrySpecsCountry
getCountrySpecsCountry = GetCountrySpecsCountry
-}
-- 
{- | <p>When you create a new reversal, you must specify a transfer to create it on.</p>

<p>When reversing transfers, you can optionally reverse part of the transfer. You can do so as many times as you wish until the entire transfer has been reversed.</p>

<p>Once entirely reversed, a transfer can’t be reversed again. This method will return an error when called on an already-reversed transfer, or when trying to reverse more money than is left on a transfer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/transfers/{id}/reversals
-}
-- TODO request options as enum
data PostTransfersIdReversals = PostTransfersIdReversals
  { postTransfersIdReversalsParams :: PostTransfersIdReversalsParams
  , postTransfersIdReversalsBody :: Maybe PostTransfersIdReversalsBody
  } deriving (Show, Eq, Generic)

data PostTransfersIdReversalsParams = PostTransfersIdReversalsParams
  {  postTransfersIdReversalsId :: (Text)
  {- ^ The ID of the transfer to be reversed. -}
  } deriving (Show, Eq, Generic)

data PostTransfersIdReversalsBody
  = PostTransfersIdReversalsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTransfersIdReversals = "POST"
type instance RequestPath PostTransfersIdReversals = "/v1/transfers/{id}/reversals"

instance RequestBuilder PostTransfersIdReversals where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTransfersIdReversals{..} =
    [ "v1"
    , "transfers"
    , pathSimple postTransfersIdReversalsId
    , "reversals"
    ]
    where
      PostTransfersIdReversalsParams{..} = postTransfersIdReversalsParams
  endpointQuery PostTransfersIdReversals{..} =
    [
    ]
  endpointHeaders PostTransfersIdReversals{..} =
    [
    ]



{-
postTransfersIdReversals :: PostTransfersIdReversals
postTransfersIdReversals = PostTransfersIdReversals
-}
-- 
{- | <p>You can see a list of the reversals belonging to a specific transfer. Note that the 10 most recent reversals are always available by default on the transfer object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional reversals.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/transfers/{id}/reversals
-}
-- TODO request options as enum
data GetTransfersIdReversals = GetTransfersIdReversals
  { getTransfersIdReversalsParams :: GetTransfersIdReversalsParams
  , getTransfersIdReversalsBody :: Maybe GetTransfersIdReversalsBody
  } deriving (Show, Eq, Generic)

data GetTransfersIdReversalsParams = GetTransfersIdReversalsParams
  {  getTransfersIdReversalsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTransfersIdReversalsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTransfersIdReversalsId :: (Text)
  {- ^ The ID of the transfer whose reversals will be retrieved. -}
  ,  getTransfersIdReversalsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTransfersIdReversalsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetTransfersIdReversalsBody
  = GetTransfersIdReversalsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTransfersIdReversals = "GET"
type instance RequestPath GetTransfersIdReversals = "/v1/transfers/{id}/reversals"

instance RequestBuilder GetTransfersIdReversals where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTransfersIdReversals{..} =
    [ "v1"
    , "transfers"
    , pathSimple getTransfersIdReversalsId
    , "reversals"
    ]
    where
      GetTransfersIdReversalsParams{..} = getTransfersIdReversalsParams
  endpointQuery GetTransfersIdReversals{..} =
    [ ("ending_before", queryFormExplode getTransfersIdReversalsEndingBefore)
    , ("expand", queryDeepObjectExplode getTransfersIdReversalsExpand)
    , ("limit", queryFormExplode getTransfersIdReversalsLimit)
    , ("starting_after", queryFormExplode getTransfersIdReversalsStartingAfter)
    ]
    where
      GetTransfersIdReversalsParams{..} = getTransfersIdReversalsParams
  endpointHeaders GetTransfersIdReversals{..} =
    [
    ]



{-
getTransfersIdReversals :: GetTransfersIdReversals
getTransfersIdReversals = GetTransfersIdReversals
-}
-- 
{- | <p>Creates a new person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/people
-}
-- TODO request options as enum
data PostAccountPeople = PostAccountPeople
  { postAccountPeopleParams :: PostAccountPeopleParams
  , postAccountPeopleBody :: Maybe PostAccountPeopleBody
  } deriving (Show, Eq, Generic)

data PostAccountPeopleParams = PostAccountPeopleParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountPeopleBody
  = PostAccountPeopleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountPeople = "POST"
type instance RequestPath PostAccountPeople = "/v1/account/people"

instance RequestBuilder PostAccountPeople where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountPeople{..} =
    [ "v1"
    , "account"
    , "people"
    ]
    where
      PostAccountPeopleParams = postAccountPeopleParams
  endpointQuery PostAccountPeople{..} =
    [
    ]
  endpointHeaders PostAccountPeople{..} =
    [
    ]



{-
postAccountPeople :: PostAccountPeople
postAccountPeople = PostAccountPeople
-}
-- 
{- | <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/people
-}
-- TODO request options as enum
data GetAccountPeople = GetAccountPeople
  { getAccountPeopleParams :: GetAccountPeopleParams
  , getAccountPeopleBody :: Maybe GetAccountPeopleBody
  } deriving (Show, Eq, Generic)

data GetAccountPeopleParams = GetAccountPeopleParams
  {  getAccountPeopleEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountPeopleExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountPeopleLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountPeopleRelationship :: Maybe (Object)
  {- ^ Filters on the list of people returned based on the person's relationship to the account's company. -}
  ,  getAccountPeopleStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountPeopleBody
  = GetAccountPeopleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountPeople = "GET"
type instance RequestPath GetAccountPeople = "/v1/account/people"

instance RequestBuilder GetAccountPeople where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountPeople{..} =
    [ "v1"
    , "account"
    , "people"
    ]
    where
      GetAccountPeopleParams{..} = getAccountPeopleParams
  endpointQuery GetAccountPeople{..} =
    [ ("ending_before", queryFormExplode getAccountPeopleEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountPeopleExpand)
    , ("limit", queryFormExplode getAccountPeopleLimit)
    , ("relationship", queryDeepObjectExplode getAccountPeopleRelationship)
    , ("starting_after", queryFormExplode getAccountPeopleStartingAfter)
    ]
    where
      GetAccountPeopleParams{..} = getAccountPeopleParams
  endpointHeaders GetAccountPeople{..} =
    [
    ]



{-
getAccountPeople :: GetAccountPeople
getAccountPeople = GetAccountPeople
-}
-- 
{- | <p>Updates an existing subscription schedule.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_schedules/{schedule}
-}
-- TODO request options as enum
data PostSubscriptionSchedulesSchedule = PostSubscriptionSchedulesSchedule
  { postSubscriptionSchedulesScheduleParams :: PostSubscriptionSchedulesScheduleParams
  , postSubscriptionSchedulesScheduleBody :: Maybe PostSubscriptionSchedulesScheduleBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleParams = PostSubscriptionSchedulesScheduleParams
  {  postSubscriptionSchedulesScheduleSchedule :: (Text)
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleBody
  = PostSubscriptionSchedulesScheduleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionSchedulesSchedule = "POST"
type instance RequestPath PostSubscriptionSchedulesSchedule = "/v1/subscription_schedules/{schedule}"

instance RequestBuilder PostSubscriptionSchedulesSchedule where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionSchedulesSchedule{..} =
    [ "v1"
    , "subscription_schedules"
    , pathSimple postSubscriptionSchedulesScheduleSchedule
    ]
    where
      PostSubscriptionSchedulesScheduleParams{..} = postSubscriptionSchedulesScheduleParams
  endpointQuery PostSubscriptionSchedulesSchedule{..} =
    [
    ]
  endpointHeaders PostSubscriptionSchedulesSchedule{..} =
    [
    ]



{-
postSubscriptionSchedulesSchedule :: PostSubscriptionSchedulesSchedule
postSubscriptionSchedulesSchedule = PostSubscriptionSchedulesSchedule
-}
-- 
{- | <p>Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscription_schedules/{schedule}
-}
-- TODO request options as enum
data GetSubscriptionSchedulesSchedule = GetSubscriptionSchedulesSchedule
  { getSubscriptionSchedulesScheduleParams :: GetSubscriptionSchedulesScheduleParams
  , getSubscriptionSchedulesScheduleBody :: Maybe GetSubscriptionSchedulesScheduleBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionSchedulesScheduleParams = GetSubscriptionSchedulesScheduleParams
  {  getSubscriptionSchedulesScheduleExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionSchedulesScheduleSchedule :: (Text)
  {- ^ The identifier of the subscription schedule to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionSchedulesScheduleBody
  = GetSubscriptionSchedulesScheduleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionSchedulesSchedule = "GET"
type instance RequestPath GetSubscriptionSchedulesSchedule = "/v1/subscription_schedules/{schedule}"

instance RequestBuilder GetSubscriptionSchedulesSchedule where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionSchedulesSchedule{..} =
    [ "v1"
    , "subscription_schedules"
    , pathSimple getSubscriptionSchedulesScheduleSchedule
    ]
    where
      GetSubscriptionSchedulesScheduleParams{..} = getSubscriptionSchedulesScheduleParams
  endpointQuery GetSubscriptionSchedulesSchedule{..} =
    [ ("expand", queryDeepObjectExplode getSubscriptionSchedulesScheduleExpand)
    ]
  endpointHeaders GetSubscriptionSchedulesSchedule{..} =
    [
    ]



{-
getSubscriptionSchedulesSchedule :: GetSubscriptionSchedulesSchedule
getSubscriptionSchedulesSchedule = GetSubscriptionSchedulesSchedule
-}
-- 
{- | <p>Updates the plan or quantity of an item on a current subscription.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_items/{item}
-}
-- TODO request options as enum
data PostSubscriptionItemsItem = PostSubscriptionItemsItem
  { postSubscriptionItemsItemParams :: PostSubscriptionItemsItemParams
  , postSubscriptionItemsItemBody :: Maybe PostSubscriptionItemsItemBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsItemParams = PostSubscriptionItemsItemParams
  {  postSubscriptionItemsItemItem :: (Text)
  {- ^ The identifier of the subscription item to modify. -}
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsItemBody
  = PostSubscriptionItemsItemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionItemsItem = "POST"
type instance RequestPath PostSubscriptionItemsItem = "/v1/subscription_items/{item}"

instance RequestBuilder PostSubscriptionItemsItem where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionItemsItem{..} =
    [ "v1"
    , "subscription_items"
    , pathSimple postSubscriptionItemsItemItem
    ]
    where
      PostSubscriptionItemsItemParams{..} = postSubscriptionItemsItemParams
  endpointQuery PostSubscriptionItemsItem{..} =
    [
    ]
  endpointHeaders PostSubscriptionItemsItem{..} =
    [
    ]



{-
postSubscriptionItemsItem :: PostSubscriptionItemsItem
postSubscriptionItemsItem = PostSubscriptionItemsItem
-}
-- 
{- | <p>Retrieves the invoice item with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscription_items/{item}
-}
-- TODO request options as enum
data GetSubscriptionItemsItem = GetSubscriptionItemsItem
  { getSubscriptionItemsItemParams :: GetSubscriptionItemsItemParams
  , getSubscriptionItemsItemBody :: Maybe GetSubscriptionItemsItemBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsItemParams = GetSubscriptionItemsItemParams
  {  getSubscriptionItemsItemExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionItemsItemItem :: (Text)
  {- ^ The identifier of the subscription item to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsItemBody
  = GetSubscriptionItemsItemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionItemsItem = "GET"
type instance RequestPath GetSubscriptionItemsItem = "/v1/subscription_items/{item}"

instance RequestBuilder GetSubscriptionItemsItem where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionItemsItem{..} =
    [ "v1"
    , "subscription_items"
    , pathSimple getSubscriptionItemsItemItem
    ]
    where
      GetSubscriptionItemsItemParams{..} = getSubscriptionItemsItemParams
  endpointQuery GetSubscriptionItemsItem{..} =
    [ ("expand", queryDeepObjectExplode getSubscriptionItemsItemExpand)
    ]
  endpointHeaders GetSubscriptionItemsItem{..} =
    [
    ]



{-
getSubscriptionItemsItem :: GetSubscriptionItemsItem
getSubscriptionItemsItem = GetSubscriptionItemsItem
-}
-- 
{- | <p>Deletes an item from the subscription. Removing a subscription item from a subscription will not cancel the subscription.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/subscription_items/{item}
-}
-- TODO request options as enum
data DeleteSubscriptionItemsItem = DeleteSubscriptionItemsItem
  { deleteSubscriptionItemsItemParams :: DeleteSubscriptionItemsItemParams
  , deleteSubscriptionItemsItemBody :: Maybe DeleteSubscriptionItemsItemBody
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionItemsItemParams = DeleteSubscriptionItemsItemParams
  {  deleteSubscriptionItemsItemItem :: (Text)
  {- ^ The identifier of the subscription item to delete. -}
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionItemsItemBody
  = DeleteSubscriptionItemsItemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteSubscriptionItemsItem = "DELETE"
type instance RequestPath DeleteSubscriptionItemsItem = "/v1/subscription_items/{item}"

instance RequestBuilder DeleteSubscriptionItemsItem where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteSubscriptionItemsItem{..} =
    [ "v1"
    , "subscription_items"
    , pathSimple deleteSubscriptionItemsItemItem
    ]
    where
      DeleteSubscriptionItemsItemParams{..} = deleteSubscriptionItemsItemParams
  endpointQuery DeleteSubscriptionItemsItem{..} =
    [
    ]
  endpointHeaders DeleteSubscriptionItemsItem{..} =
    [
    ]



{-
deleteSubscriptionItemsItem :: DeleteSubscriptionItemsItem
deleteSubscriptionItemsItem = DeleteSubscriptionItemsItem
-}
-- 
{- | <p>Retrieves a new Source MandateNotification.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sources/{source}/mandate_notifications/{mandate_notification}
-}
-- TODO request options as enum
data GetSourcesSourceMandateNotificationsMandateNotification = GetSourcesSourceMandateNotificationsMandateNotification
  { getSourcesSourceMandateNotificationsMandateNotificationParams :: GetSourcesSourceMandateNotificationsMandateNotificationParams
  , getSourcesSourceMandateNotificationsMandateNotificationBody :: Maybe GetSourcesSourceMandateNotificationsMandateNotificationBody
  } deriving (Show, Eq, Generic)

data GetSourcesSourceMandateNotificationsMandateNotificationParams = GetSourcesSourceMandateNotificationsMandateNotificationParams
  {  getSourcesSourceMandateNotificationsMandateNotificationExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSourcesSourceMandateNotificationsMandateNotificationMandateNotification :: (Text)
  {- ^ The ID of the Source MandateNotification. -}
  ,  getSourcesSourceMandateNotificationsMandateNotificationSource :: (Text)
  {- ^ The ID of the Source that received a ManateNotification. -}
  } deriving (Show, Eq, Generic)

data GetSourcesSourceMandateNotificationsMandateNotificationBody
  = GetSourcesSourceMandateNotificationsMandateNotificationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSourcesSourceMandateNotificationsMandateNotification = "GET"
type instance RequestPath GetSourcesSourceMandateNotificationsMandateNotification = "/v1/sources/{source}/mandate_notifications/{mandate_notification}"

instance RequestBuilder GetSourcesSourceMandateNotificationsMandateNotification where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSourcesSourceMandateNotificationsMandateNotification{..} =
    [ "v1"
    , "sources"
    , pathSimple getSourcesSourceMandateNotificationsMandateNotificationSource
    , "mandate_notifications"
    , pathSimple getSourcesSourceMandateNotificationsMandateNotificationMandateNotification
    ]
    where
      GetSourcesSourceMandateNotificationsMandateNotificationParams{..} = getSourcesSourceMandateNotificationsMandateNotificationParams
  endpointQuery GetSourcesSourceMandateNotificationsMandateNotification{..} =
    [ ("expand", queryDeepObjectExplode getSourcesSourceMandateNotificationsMandateNotificationExpand)
    ]
  endpointHeaders GetSourcesSourceMandateNotificationsMandateNotification{..} =
    [
    ]



{-
getSourcesSourceMandateNotificationsMandateNotification :: GetSourcesSourceMandateNotificationsMandateNotification
getSourcesSourceMandateNotificationsMandateNotification = GetSourcesSourceMandateNotificationsMandateNotification
-}
-- 
{- | <p>Creates an immutable transaction that updates the customer’s <a href="/docs/api/customers/object#customer_object-balance"><code>balance</code></a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/balance_transactions
-}
-- TODO request options as enum
data PostCustomersCustomerBalanceTransactions = PostCustomersCustomerBalanceTransactions
  { postCustomersCustomerBalanceTransactionsParams :: PostCustomersCustomerBalanceTransactionsParams
  , postCustomersCustomerBalanceTransactionsBody :: PostCustomersCustomerBalanceTransactionsBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBalanceTransactionsParams = PostCustomersCustomerBalanceTransactionsParams
  {  postCustomersCustomerBalanceTransactionsCustomer :: (Text)
  {- ^ The customer the transaction belongs to. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBalanceTransactionsBody
  = PostCustomersCustomerBalanceTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerBalanceTransactions = "POST"
type instance RequestPath PostCustomersCustomerBalanceTransactions = "/v1/customers/{customer}/balance_transactions"

instance RequestBuilder PostCustomersCustomerBalanceTransactions where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerBalanceTransactions{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerBalanceTransactionsCustomer
    , "balance_transactions"
    ]
    where
      PostCustomersCustomerBalanceTransactionsParams{..} = postCustomersCustomerBalanceTransactionsParams
  endpointQuery PostCustomersCustomerBalanceTransactions{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerBalanceTransactions{..} =
    [
    ]



{-
postCustomersCustomerBalanceTransactions :: PostCustomersCustomerBalanceTransactions
postCustomersCustomerBalanceTransactions = PostCustomersCustomerBalanceTransactions
-}
-- 
{- | <p>Returns a list of transactions that updated the customer’s <a href="/docs/api/customers/object#customer_object-balance"><code>balance</code></a>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/balance_transactions
-}
-- TODO request options as enum
data GetCustomersCustomerBalanceTransactions = GetCustomersCustomerBalanceTransactions
  { getCustomersCustomerBalanceTransactionsParams :: GetCustomersCustomerBalanceTransactionsParams
  , getCustomersCustomerBalanceTransactionsBody :: Maybe GetCustomersCustomerBalanceTransactionsBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBalanceTransactionsParams = GetCustomersCustomerBalanceTransactionsParams
  {  getCustomersCustomerBalanceTransactionsCustomer :: (Text)
  {- ^ The customer to retrieve transactions for. -}
  ,  getCustomersCustomerBalanceTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerBalanceTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerBalanceTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerBalanceTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBalanceTransactionsBody
  = GetCustomersCustomerBalanceTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerBalanceTransactions = "GET"
type instance RequestPath GetCustomersCustomerBalanceTransactions = "/v1/customers/{customer}/balance_transactions"

instance RequestBuilder GetCustomersCustomerBalanceTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerBalanceTransactions{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerBalanceTransactionsCustomer
    , "balance_transactions"
    ]
    where
      GetCustomersCustomerBalanceTransactionsParams{..} = getCustomersCustomerBalanceTransactionsParams
  endpointQuery GetCustomersCustomerBalanceTransactions{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerBalanceTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerBalanceTransactionsExpand)
    , ("limit", queryFormExplode getCustomersCustomerBalanceTransactionsLimit)
    , ("starting_after", queryFormExplode getCustomersCustomerBalanceTransactionsStartingAfter)
    ]
    where
      GetCustomersCustomerBalanceTransactionsParams{..} = getCustomersCustomerBalanceTransactionsParams
  endpointHeaders GetCustomersCustomerBalanceTransactions{..} =
    [
    ]



{-
getCustomersCustomerBalanceTransactions :: GetCustomersCustomerBalanceTransactions
getCustomersCustomerBalanceTransactions = GetCustomersCustomerBalanceTransactions
-}
-- 
{- | <p>Updates a <code>Reader</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/terminal/readers/{reader}
-}
-- TODO request options as enum
data PostTerminalReadersReader = PostTerminalReadersReader
  { postTerminalReadersReaderParams :: PostTerminalReadersReaderParams
  , postTerminalReadersReaderBody :: Maybe PostTerminalReadersReaderBody
  } deriving (Show, Eq, Generic)

data PostTerminalReadersReaderParams = PostTerminalReadersReaderParams
  {  postTerminalReadersReaderReader :: (Text)
  {- ^ The identifier of the reader to be updated. -}
  } deriving (Show, Eq, Generic)

data PostTerminalReadersReaderBody
  = PostTerminalReadersReaderBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTerminalReadersReader = "POST"
type instance RequestPath PostTerminalReadersReader = "/v1/terminal/readers/{reader}"

instance RequestBuilder PostTerminalReadersReader where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTerminalReadersReader{..} =
    [ "v1"
    , "terminal"
    , "readers"
    , pathSimple postTerminalReadersReaderReader
    ]
    where
      PostTerminalReadersReaderParams{..} = postTerminalReadersReaderParams
  endpointQuery PostTerminalReadersReader{..} =
    [
    ]
  endpointHeaders PostTerminalReadersReader{..} =
    [
    ]



{-
postTerminalReadersReader :: PostTerminalReadersReader
postTerminalReadersReader = PostTerminalReadersReader
-}
-- 
{- | <p>Retrieves a <code>Reader</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/terminal/readers/{reader}
-}
-- TODO request options as enum
data GetTerminalReadersReader = GetTerminalReadersReader
  { getTerminalReadersReaderParams :: GetTerminalReadersReaderParams
  , getTerminalReadersReaderBody :: Maybe GetTerminalReadersReaderBody
  } deriving (Show, Eq, Generic)

data GetTerminalReadersReaderParams = GetTerminalReadersReaderParams
  {  getTerminalReadersReaderExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTerminalReadersReaderReader :: (Text)
  {- ^ The identifier of the reader to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetTerminalReadersReaderBody
  = GetTerminalReadersReaderBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTerminalReadersReader = "GET"
type instance RequestPath GetTerminalReadersReader = "/v1/terminal/readers/{reader}"

instance RequestBuilder GetTerminalReadersReader where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTerminalReadersReader{..} =
    [ "v1"
    , "terminal"
    , "readers"
    , pathSimple getTerminalReadersReaderReader
    ]
    where
      GetTerminalReadersReaderParams{..} = getTerminalReadersReaderParams
  endpointQuery GetTerminalReadersReader{..} =
    [ ("expand", queryDeepObjectExplode getTerminalReadersReaderExpand)
    ]
  endpointHeaders GetTerminalReadersReader{..} =
    [
    ]



{-
getTerminalReadersReader :: GetTerminalReadersReader
getTerminalReadersReader = GetTerminalReadersReader
-}
-- 
{- | <p>Deletes a <code>Reader</code> object.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/terminal/readers/{reader}
-}
-- TODO request options as enum
data DeleteTerminalReadersReader = DeleteTerminalReadersReader
  { deleteTerminalReadersReaderParams :: DeleteTerminalReadersReaderParams
  , deleteTerminalReadersReaderBody :: Maybe DeleteTerminalReadersReaderBody
  } deriving (Show, Eq, Generic)

data DeleteTerminalReadersReaderParams = DeleteTerminalReadersReaderParams
  {  deleteTerminalReadersReaderReader :: (Text)
  {- ^ The identifier of the reader to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteTerminalReadersReaderBody
  = DeleteTerminalReadersReaderBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteTerminalReadersReader = "DELETE"
type instance RequestPath DeleteTerminalReadersReader = "/v1/terminal/readers/{reader}"

instance RequestBuilder DeleteTerminalReadersReader where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteTerminalReadersReader{..} =
    [ "v1"
    , "terminal"
    , "readers"
    , pathSimple deleteTerminalReadersReaderReader
    ]
    where
      DeleteTerminalReadersReaderParams{..} = deleteTerminalReadersReaderParams
  endpointQuery DeleteTerminalReadersReader{..} =
    [
    ]
  endpointHeaders DeleteTerminalReadersReader{..} =
    [
    ]



{-
deleteTerminalReadersReader :: DeleteTerminalReadersReader
deleteTerminalReadersReader = DeleteTerminalReadersReader
-}
-- 
{- | <p>Updates a <code>Location</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/terminal/locations/{location}
-}
-- TODO request options as enum
data PostTerminalLocationsLocation = PostTerminalLocationsLocation
  { postTerminalLocationsLocationParams :: PostTerminalLocationsLocationParams
  , postTerminalLocationsLocationBody :: Maybe PostTerminalLocationsLocationBody
  } deriving (Show, Eq, Generic)

data PostTerminalLocationsLocationParams = PostTerminalLocationsLocationParams
  {  postTerminalLocationsLocationLocation :: (Text)
  {- ^ The identifier of the location to be updated. -}
  } deriving (Show, Eq, Generic)

data PostTerminalLocationsLocationBody
  = PostTerminalLocationsLocationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTerminalLocationsLocation = "POST"
type instance RequestPath PostTerminalLocationsLocation = "/v1/terminal/locations/{location}"

instance RequestBuilder PostTerminalLocationsLocation where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTerminalLocationsLocation{..} =
    [ "v1"
    , "terminal"
    , "locations"
    , pathSimple postTerminalLocationsLocationLocation
    ]
    where
      PostTerminalLocationsLocationParams{..} = postTerminalLocationsLocationParams
  endpointQuery PostTerminalLocationsLocation{..} =
    [
    ]
  endpointHeaders PostTerminalLocationsLocation{..} =
    [
    ]



{-
postTerminalLocationsLocation :: PostTerminalLocationsLocation
postTerminalLocationsLocation = PostTerminalLocationsLocation
-}
-- 
{- | <p>Retrieves a <code>Location</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/terminal/locations/{location}
-}
-- TODO request options as enum
data GetTerminalLocationsLocation = GetTerminalLocationsLocation
  { getTerminalLocationsLocationParams :: GetTerminalLocationsLocationParams
  , getTerminalLocationsLocationBody :: Maybe GetTerminalLocationsLocationBody
  } deriving (Show, Eq, Generic)

data GetTerminalLocationsLocationParams = GetTerminalLocationsLocationParams
  {  getTerminalLocationsLocationExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTerminalLocationsLocationLocation :: (Text)
  {- ^ The identifier of the location to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetTerminalLocationsLocationBody
  = GetTerminalLocationsLocationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTerminalLocationsLocation = "GET"
type instance RequestPath GetTerminalLocationsLocation = "/v1/terminal/locations/{location}"

instance RequestBuilder GetTerminalLocationsLocation where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTerminalLocationsLocation{..} =
    [ "v1"
    , "terminal"
    , "locations"
    , pathSimple getTerminalLocationsLocationLocation
    ]
    where
      GetTerminalLocationsLocationParams{..} = getTerminalLocationsLocationParams
  endpointQuery GetTerminalLocationsLocation{..} =
    [ ("expand", queryDeepObjectExplode getTerminalLocationsLocationExpand)
    ]
  endpointHeaders GetTerminalLocationsLocation{..} =
    [
    ]



{-
getTerminalLocationsLocation :: GetTerminalLocationsLocation
getTerminalLocationsLocation = GetTerminalLocationsLocation
-}
-- 
{- | <p>Deletes a <code>Location</code> object.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/terminal/locations/{location}
-}
-- TODO request options as enum
data DeleteTerminalLocationsLocation = DeleteTerminalLocationsLocation
  { deleteTerminalLocationsLocationParams :: DeleteTerminalLocationsLocationParams
  , deleteTerminalLocationsLocationBody :: Maybe DeleteTerminalLocationsLocationBody
  } deriving (Show, Eq, Generic)

data DeleteTerminalLocationsLocationParams = DeleteTerminalLocationsLocationParams
  {  deleteTerminalLocationsLocationLocation :: (Text)
  {- ^ The identifier of the location to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteTerminalLocationsLocationBody
  = DeleteTerminalLocationsLocationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteTerminalLocationsLocation = "DELETE"
type instance RequestPath DeleteTerminalLocationsLocation = "/v1/terminal/locations/{location}"

instance RequestBuilder DeleteTerminalLocationsLocation where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteTerminalLocationsLocation{..} =
    [ "v1"
    , "terminal"
    , "locations"
    , pathSimple deleteTerminalLocationsLocationLocation
    ]
    where
      DeleteTerminalLocationsLocationParams{..} = deleteTerminalLocationsLocationParams
  endpointQuery DeleteTerminalLocationsLocation{..} =
    [
    ]
  endpointHeaders DeleteTerminalLocationsLocation{..} =
    [
    ]



{-
deleteTerminalLocationsLocation :: DeleteTerminalLocationsLocation
deleteTerminalLocationsLocation = DeleteTerminalLocationsLocation
-}
-- 
{- | <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

<p>If the card’s owner has no default card, then the new card will become the default.
However, if the owner already has a default, then it will not change.
To change the default, you should either <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>,
or <a href="/docs/api#update_recipient">update the recipient</a> to have a new <code>default_card</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/sources
-}
-- TODO request options as enum
data PostCustomersCustomerSources = PostCustomersCustomerSources
  { postCustomersCustomerSourcesParams :: PostCustomersCustomerSourcesParams
  , postCustomersCustomerSourcesBody :: Maybe PostCustomersCustomerSourcesBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesParams = PostCustomersCustomerSourcesParams
  {  postCustomersCustomerSourcesCustomer :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesBody
  = PostCustomersCustomerSourcesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerSources = "POST"
type instance RequestPath PostCustomersCustomerSources = "/v1/customers/{customer}/sources"

instance RequestBuilder PostCustomersCustomerSources where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerSources{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerSourcesCustomer
    , "sources"
    ]
    where
      PostCustomersCustomerSourcesParams{..} = postCustomersCustomerSourcesParams
  endpointQuery PostCustomersCustomerSources{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerSources{..} =
    [
    ]



{-
postCustomersCustomerSources :: PostCustomersCustomerSources
postCustomersCustomerSources = PostCustomersCustomerSources
-}
-- 
{- | <p>List sources for a specified customer.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/sources
-}
-- TODO request options as enum
data GetCustomersCustomerSources = GetCustomersCustomerSources
  { getCustomersCustomerSourcesParams :: GetCustomersCustomerSourcesParams
  , getCustomersCustomerSourcesBody :: Maybe GetCustomersCustomerSourcesBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSourcesParams = GetCustomersCustomerSourcesParams
  {  getCustomersCustomerSourcesCustomer :: (Text)
  {- ^ The ID of the customer whose sources will be retrieved. -}
  ,  getCustomersCustomerSourcesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerSourcesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerSourcesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerSourcesObject :: Maybe (Text)
  {- ^ Filter sources according to a particular object type. -}
  ,  getCustomersCustomerSourcesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSourcesBody
  = GetCustomersCustomerSourcesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerSources = "GET"
type instance RequestPath GetCustomersCustomerSources = "/v1/customers/{customer}/sources"

instance RequestBuilder GetCustomersCustomerSources where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerSources{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerSourcesCustomer
    , "sources"
    ]
    where
      GetCustomersCustomerSourcesParams{..} = getCustomersCustomerSourcesParams
  endpointQuery GetCustomersCustomerSources{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerSourcesEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerSourcesExpand)
    , ("limit", queryFormExplode getCustomersCustomerSourcesLimit)
    , ("object", queryFormExplode getCustomersCustomerSourcesObject)
    , ("starting_after", queryFormExplode getCustomersCustomerSourcesStartingAfter)
    ]
    where
      GetCustomersCustomerSourcesParams{..} = getCustomersCustomerSourcesParams
  endpointHeaders GetCustomersCustomerSources{..} =
    [
    ]



{-
getCustomersCustomerSources :: GetCustomersCustomerSources
getCustomersCustomerSources = GetCustomersCustomerSources
-}
-- 
{- | <p>Creates a new subscription schedule object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_schedules
-}
-- TODO request options as enum
data PostSubscriptionSchedules = PostSubscriptionSchedules
  { postSubscriptionSchedulesParams :: PostSubscriptionSchedulesParams
  , postSubscriptionSchedulesBody :: Maybe PostSubscriptionSchedulesBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesParams = PostSubscriptionSchedulesParams
  {
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesBody
  = PostSubscriptionSchedulesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionSchedules = "POST"
type instance RequestPath PostSubscriptionSchedules = "/v1/subscription_schedules"

instance RequestBuilder PostSubscriptionSchedules where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionSchedules{..} =
    [ "v1"
    , "subscription_schedules"
    ]
    where
      PostSubscriptionSchedulesParams = postSubscriptionSchedulesParams
  endpointQuery PostSubscriptionSchedules{..} =
    [
    ]
  endpointHeaders PostSubscriptionSchedules{..} =
    [
    ]



{-
postSubscriptionSchedules :: PostSubscriptionSchedules
postSubscriptionSchedules = PostSubscriptionSchedules
-}
-- 
{- | <p>Retrieves the list of your subscription schedules.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscription_schedules
-}
-- TODO request options as enum
data GetSubscriptionSchedules = GetSubscriptionSchedules
  { getSubscriptionSchedulesParams :: GetSubscriptionSchedulesParams
  , getSubscriptionSchedulesBody :: Maybe GetSubscriptionSchedulesBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionSchedulesParams = GetSubscriptionSchedulesParams
  {  getSubscriptionSchedulesCanceledAt :: Maybe (Either (Object) (Int))
  {- ^ Only return subscription schedules that were created canceled the given date interval. -}
  ,  getSubscriptionSchedulesCompletedAt :: Maybe (Either (Object) (Int))
  {- ^ Only return subscription schedules that completed during the given date interval. -}
  ,  getSubscriptionSchedulesCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return subscription schedules that were created during the given date interval. -}
  ,  getSubscriptionSchedulesCustomer :: Maybe (Text)
  {- ^ Only return subscription schedules for the given customer. -}
  ,  getSubscriptionSchedulesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSubscriptionSchedulesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionSchedulesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSubscriptionSchedulesReleasedAt :: Maybe (Either (Object) (Int))
  {- ^ Only return subscription schedules that were released during the given date interval. -}
  ,  getSubscriptionSchedulesScheduled :: Maybe (Bool)
  {- ^ Only return subscription schedules that have not started yet. -}
  ,  getSubscriptionSchedulesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionSchedulesBody
  = GetSubscriptionSchedulesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionSchedules = "GET"
type instance RequestPath GetSubscriptionSchedules = "/v1/subscription_schedules"

instance RequestBuilder GetSubscriptionSchedules where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionSchedules{..} =
    [ "v1"
    , "subscription_schedules"
    ]
    where
      GetSubscriptionSchedulesParams{..} = getSubscriptionSchedulesParams
  endpointQuery GetSubscriptionSchedules{..} =
    [ ("canceled_at", queryDeepObjectExplode getSubscriptionSchedulesCanceledAt)
    , ("completed_at", queryDeepObjectExplode getSubscriptionSchedulesCompletedAt)
    , ("created", queryDeepObjectExplode getSubscriptionSchedulesCreated)
    , ("customer", queryFormExplode getSubscriptionSchedulesCustomer)
    , ("ending_before", queryFormExplode getSubscriptionSchedulesEndingBefore)
    , ("expand", queryDeepObjectExplode getSubscriptionSchedulesExpand)
    , ("limit", queryFormExplode getSubscriptionSchedulesLimit)
    , ("released_at", queryDeepObjectExplode getSubscriptionSchedulesReleasedAt)
    , ("scheduled", queryFormExplode getSubscriptionSchedulesScheduled)
    , ("starting_after", queryFormExplode getSubscriptionSchedulesStartingAfter)
    ]
    where
      GetSubscriptionSchedulesParams{..} = getSubscriptionSchedulesParams
  endpointHeaders GetSubscriptionSchedules{..} =
    [
    ]



{-
getSubscriptionSchedules :: GetSubscriptionSchedules
getSubscriptionSchedules = GetSubscriptionSchedules
-}
-- 
{- | <p>Closing the dispute for a charge indicates that you do not have any evidence to submit and are essentially dismissing the dispute, acknowledging it as lost.</p>

<p>The status of the dispute will change from <code>needs_response</code> to <code>lost</code>. <em>Closing a dispute is irreversible</em>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/disputes/{dispute}/close
-}
-- TODO request options as enum
data PostDisputesDisputeClose = PostDisputesDisputeClose
  { postDisputesDisputeCloseParams :: PostDisputesDisputeCloseParams
  , postDisputesDisputeCloseBody :: Maybe PostDisputesDisputeCloseBody
  } deriving (Show, Eq, Generic)

data PostDisputesDisputeCloseParams = PostDisputesDisputeCloseParams
  {  postDisputesDisputeCloseDispute :: (Text)
  {- ^ ID of the dispute to close. -}
  } deriving (Show, Eq, Generic)

data PostDisputesDisputeCloseBody
  = PostDisputesDisputeCloseBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostDisputesDisputeClose = "POST"
type instance RequestPath PostDisputesDisputeClose = "/v1/disputes/{dispute}/close"

instance RequestBuilder PostDisputesDisputeClose where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostDisputesDisputeClose{..} =
    [ "v1"
    , "disputes"
    , pathSimple postDisputesDisputeCloseDispute
    , "close"
    ]
    where
      PostDisputesDisputeCloseParams{..} = postDisputesDisputeCloseParams
  endpointQuery PostDisputesDisputeClose{..} =
    [
    ]
  endpointHeaders PostDisputesDisputeClose{..} =
    [
    ]



{-
postDisputesDisputeClose :: PostDisputesDisputeClose
postDisputesDisputeClose = PostDisputesDisputeClose
-}
-- 
{- | <p>Retrieves the details of an early fraud warning that has previously been created. </p>

<p>Please refer to the <a href="#early_fraud_warning_object">early fraud warning</a> object reference for more details.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/early_fraud_warnings/{early_fraud_warning}
-}
-- TODO request options as enum
data GetRadarEarlyFraudWarningsEarlyFraudWarning = GetRadarEarlyFraudWarningsEarlyFraudWarning
  { getRadarEarlyFraudWarningsEarlyFraudWarningParams :: GetRadarEarlyFraudWarningsEarlyFraudWarningParams
  , getRadarEarlyFraudWarningsEarlyFraudWarningBody :: Maybe GetRadarEarlyFraudWarningsEarlyFraudWarningBody
  } deriving (Show, Eq, Generic)

data GetRadarEarlyFraudWarningsEarlyFraudWarningParams = GetRadarEarlyFraudWarningsEarlyFraudWarningParams
  {  getRadarEarlyFraudWarningsEarlyFraudWarningEarlyFraudWarning :: (Text)
  {- ^ The identifier of the early fraud warning to be retrieved. -}
  ,  getRadarEarlyFraudWarningsEarlyFraudWarningExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetRadarEarlyFraudWarningsEarlyFraudWarningBody
  = GetRadarEarlyFraudWarningsEarlyFraudWarningBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarEarlyFraudWarningsEarlyFraudWarning = "GET"
type instance RequestPath GetRadarEarlyFraudWarningsEarlyFraudWarning = "/v1/radar/early_fraud_warnings/{early_fraud_warning}"

instance RequestBuilder GetRadarEarlyFraudWarningsEarlyFraudWarning where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarEarlyFraudWarningsEarlyFraudWarning{..} =
    [ "v1"
    , "radar"
    , "early_fraud_warnings"
    , pathSimple getRadarEarlyFraudWarningsEarlyFraudWarningEarlyFraudWarning
    ]
    where
      GetRadarEarlyFraudWarningsEarlyFraudWarningParams{..} = getRadarEarlyFraudWarningsEarlyFraudWarningParams
  endpointQuery GetRadarEarlyFraudWarningsEarlyFraudWarning{..} =
    [ ("expand", queryDeepObjectExplode getRadarEarlyFraudWarningsEarlyFraudWarningExpand)
    ]
  endpointHeaders GetRadarEarlyFraudWarningsEarlyFraudWarning{..} =
    [
    ]



{-
getRadarEarlyFraudWarningsEarlyFraudWarning :: GetRadarEarlyFraudWarningsEarlyFraudWarning
getRadarEarlyFraudWarningsEarlyFraudWarning = GetRadarEarlyFraudWarningsEarlyFraudWarning
-}
-- 
{- | <p>Creates a new file link object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/file_links
-}
-- TODO request options as enum
data PostFileLinks = PostFileLinks
  { postFileLinksParams :: PostFileLinksParams
  , postFileLinksBody :: PostFileLinksBody
  } deriving (Show, Eq, Generic)

data PostFileLinksParams = PostFileLinksParams
  {
  } deriving (Show, Eq, Generic)

data PostFileLinksBody
  = PostFileLinksBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostFileLinks = "POST"
type instance RequestPath PostFileLinks = "/v1/file_links"

instance RequestBuilder PostFileLinks where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostFileLinks{..} =
    [ "v1"
    , "file_links"
    ]
    where
      PostFileLinksParams = postFileLinksParams
  endpointQuery PostFileLinks{..} =
    [
    ]
  endpointHeaders PostFileLinks{..} =
    [
    ]



{-
postFileLinks :: PostFileLinks
postFileLinks = PostFileLinks
-}
-- 
{- | <p>Returns a list of file links.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/file_links
-}
-- TODO request options as enum
data GetFileLinks = GetFileLinks
  { getFileLinksParams :: GetFileLinksParams
  , getFileLinksBody :: Maybe GetFileLinksBody
  } deriving (Show, Eq, Generic)

data GetFileLinksParams = GetFileLinksParams
  {  getFileLinksCreated :: Maybe (Either (Object) (Int))
  ,  getFileLinksEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getFileLinksExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getFileLinksExpired :: Maybe (Bool)
  {- ^ Filter links by their expiration status. By default, all links are returned. -}
  ,  getFileLinksFile :: Maybe (Text)
  {- ^ Only return links for the given file. -}
  ,  getFileLinksLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getFileLinksStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetFileLinksBody
  = GetFileLinksBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetFileLinks = "GET"
type instance RequestPath GetFileLinks = "/v1/file_links"

instance RequestBuilder GetFileLinks where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetFileLinks{..} =
    [ "v1"
    , "file_links"
    ]
    where
      GetFileLinksParams{..} = getFileLinksParams
  endpointQuery GetFileLinks{..} =
    [ ("created", queryDeepObjectExplode getFileLinksCreated)
    , ("ending_before", queryFormExplode getFileLinksEndingBefore)
    , ("expand", queryDeepObjectExplode getFileLinksExpand)
    , ("expired", queryFormExplode getFileLinksExpired)
    , ("file", queryFormExplode getFileLinksFile)
    , ("limit", queryFormExplode getFileLinksLimit)
    , ("starting_after", queryFormExplode getFileLinksStartingAfter)
    ]
    where
      GetFileLinksParams{..} = getFileLinksParams
  endpointHeaders GetFileLinks{..} =
    [
    ]



{-
getFileLinks :: GetFileLinks
getFileLinks = GetFileLinks
-}
-- 
{- | <p>Updates the specified reversal by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>This request only accepts metadata and description as arguments.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/transfers/{transfer}/reversals/{id}
-}
-- TODO request options as enum
data PostTransfersTransferReversalsId = PostTransfersTransferReversalsId
  { postTransfersTransferReversalsIdParams :: PostTransfersTransferReversalsIdParams
  , postTransfersTransferReversalsIdBody :: Maybe PostTransfersTransferReversalsIdBody
  } deriving (Show, Eq, Generic)

data PostTransfersTransferReversalsIdParams = PostTransfersTransferReversalsIdParams
  {  postTransfersTransferReversalsIdId :: (Text)
  {- ^ ID of reversal to retrieve. -}
  ,  postTransfersTransferReversalsIdTransfer :: (Text)
  {- ^ ID of the transfer reversed. -}
  } deriving (Show, Eq, Generic)

data PostTransfersTransferReversalsIdBody
  = PostTransfersTransferReversalsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTransfersTransferReversalsId = "POST"
type instance RequestPath PostTransfersTransferReversalsId = "/v1/transfers/{transfer}/reversals/{id}"

instance RequestBuilder PostTransfersTransferReversalsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTransfersTransferReversalsId{..} =
    [ "v1"
    , "transfers"
    , pathSimple postTransfersTransferReversalsIdTransfer
    , "reversals"
    , pathSimple postTransfersTransferReversalsIdId
    ]
    where
      PostTransfersTransferReversalsIdParams{..} = postTransfersTransferReversalsIdParams
  endpointQuery PostTransfersTransferReversalsId{..} =
    [
    ]
  endpointHeaders PostTransfersTransferReversalsId{..} =
    [
    ]



{-
postTransfersTransferReversalsId :: PostTransfersTransferReversalsId
postTransfersTransferReversalsId = PostTransfersTransferReversalsId
-}
-- 
{- | <p>By default, you can see the 10 most recent reversals stored directly on the transfer object, but you can also retrieve details about a specific reversal stored on the transfer.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/transfers/{transfer}/reversals/{id}
-}
-- TODO request options as enum
data GetTransfersTransferReversalsId = GetTransfersTransferReversalsId
  { getTransfersTransferReversalsIdParams :: GetTransfersTransferReversalsIdParams
  , getTransfersTransferReversalsIdBody :: Maybe GetTransfersTransferReversalsIdBody
  } deriving (Show, Eq, Generic)

data GetTransfersTransferReversalsIdParams = GetTransfersTransferReversalsIdParams
  {  getTransfersTransferReversalsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTransfersTransferReversalsIdId :: (Text)
  {- ^ ID of reversal to retrieve. -}
  ,  getTransfersTransferReversalsIdTransfer :: (Text)
  {- ^ ID of the transfer reversed. -}
  } deriving (Show, Eq, Generic)

data GetTransfersTransferReversalsIdBody
  = GetTransfersTransferReversalsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTransfersTransferReversalsId = "GET"
type instance RequestPath GetTransfersTransferReversalsId = "/v1/transfers/{transfer}/reversals/{id}"

instance RequestBuilder GetTransfersTransferReversalsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTransfersTransferReversalsId{..} =
    [ "v1"
    , "transfers"
    , pathSimple getTransfersTransferReversalsIdTransfer
    , "reversals"
    , pathSimple getTransfersTransferReversalsIdId
    ]
    where
      GetTransfersTransferReversalsIdParams{..} = getTransfersTransferReversalsIdParams
  endpointQuery GetTransfersTransferReversalsId{..} =
    [ ("expand", queryDeepObjectExplode getTransfersTransferReversalsIdExpand)
    ]
  endpointHeaders GetTransfersTransferReversalsId{..} =
    [
    ]



{-
getTransfersTransferReversalsId :: GetTransfersTransferReversalsId
getTransfersTransferReversalsId = GetTransfersTransferReversalsId
-}
-- 
{- | <p>Retrieves the details of an existing Report Run. (Requires a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reporting/report_runs/{report_run}
-}
-- TODO request options as enum
data GetReportingReportRunsReportRun = GetReportingReportRunsReportRun
  { getReportingReportRunsReportRunParams :: GetReportingReportRunsReportRunParams
  , getReportingReportRunsReportRunBody :: Maybe GetReportingReportRunsReportRunBody
  } deriving (Show, Eq, Generic)

data GetReportingReportRunsReportRunParams = GetReportingReportRunsReportRunParams
  {  getReportingReportRunsReportRunExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getReportingReportRunsReportRunReportRun :: (Text)
  {- ^ The ID of the run to retrieve -}
  } deriving (Show, Eq, Generic)

data GetReportingReportRunsReportRunBody
  = GetReportingReportRunsReportRunBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReportingReportRunsReportRun = "GET"
type instance RequestPath GetReportingReportRunsReportRun = "/v1/reporting/report_runs/{report_run}"

instance RequestBuilder GetReportingReportRunsReportRun where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReportingReportRunsReportRun{..} =
    [ "v1"
    , "reporting"
    , "report_runs"
    , pathSimple getReportingReportRunsReportRunReportRun
    ]
    where
      GetReportingReportRunsReportRunParams{..} = getReportingReportRunsReportRunParams
  endpointQuery GetReportingReportRunsReportRun{..} =
    [ ("expand", queryDeepObjectExplode getReportingReportRunsReportRunExpand)
    ]
  endpointHeaders GetReportingReportRunsReportRun{..} =
    [
    ]



{-
getReportingReportRunsReportRun :: GetReportingReportRunsReportRun
getReportingReportRunsReportRun = GetReportingReportRunsReportRun
-}
-- 
{- | <p>Updates properties on a PaymentIntent object without confirming.</p>

<p>Depending on which properties you update, you may need to confirm the
PaymentIntent again. For example, updating the <code>payment_method</code> will
always require you to confirm the PaymentIntent again. If you prefer to
update and confirm at the same time, we recommend updating properties via
the <a href="/docs/api/payment_intents/confirm">confirm API</a> instead.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_intents/{intent}
-}
-- TODO request options as enum
data PostPaymentIntentsIntent = PostPaymentIntentsIntent
  { postPaymentIntentsIntentParams :: PostPaymentIntentsIntentParams
  , postPaymentIntentsIntentBody :: Maybe PostPaymentIntentsIntentBody
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentParams = PostPaymentIntentsIntentParams
  {  postPaymentIntentsIntentIntent :: (Text)
  {- ^ ID of the PaymentIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentBody
  = PostPaymentIntentsIntentBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentIntentsIntent = "POST"
type instance RequestPath PostPaymentIntentsIntent = "/v1/payment_intents/{intent}"

instance RequestBuilder PostPaymentIntentsIntent where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentIntentsIntent{..} =
    [ "v1"
    , "payment_intents"
    , pathSimple postPaymentIntentsIntentIntent
    ]
    where
      PostPaymentIntentsIntentParams{..} = postPaymentIntentsIntentParams
  endpointQuery PostPaymentIntentsIntent{..} =
    [
    ]
  endpointHeaders PostPaymentIntentsIntent{..} =
    [
    ]



{-
postPaymentIntentsIntent :: PostPaymentIntentsIntent
postPaymentIntentsIntent = PostPaymentIntentsIntent
-}
-- 
{- | <p>Retrieves the details of a PaymentIntent that has previously been created. </p>

<p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string. </p>

<p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#payment_intent_object">payment intent</a> object reference for more details.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payment_intents/{intent}
-}
-- TODO request options as enum
data GetPaymentIntentsIntent = GetPaymentIntentsIntent
  { getPaymentIntentsIntentParams :: GetPaymentIntentsIntentParams
  , getPaymentIntentsIntentBody :: Maybe GetPaymentIntentsIntentBody
  } deriving (Show, Eq, Generic)

data GetPaymentIntentsIntentParams = GetPaymentIntentsIntentParams
  {  getPaymentIntentsIntentClientSecret :: Maybe (Text)
  {- ^ The client secret of the PaymentIntent. Required if a publishable key is used to retrieve the source. -}
  ,  getPaymentIntentsIntentExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPaymentIntentsIntentIntent :: (Text)
  {- ^ ID of the PaymentIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetPaymentIntentsIntentBody
  = GetPaymentIntentsIntentBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPaymentIntentsIntent = "GET"
type instance RequestPath GetPaymentIntentsIntent = "/v1/payment_intents/{intent}"

instance RequestBuilder GetPaymentIntentsIntent where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPaymentIntentsIntent{..} =
    [ "v1"
    , "payment_intents"
    , pathSimple getPaymentIntentsIntentIntent
    ]
    where
      GetPaymentIntentsIntentParams{..} = getPaymentIntentsIntentParams
  endpointQuery GetPaymentIntentsIntent{..} =
    [ ("client_secret", queryFormExplode getPaymentIntentsIntentClientSecret)
    , ("expand", queryDeepObjectExplode getPaymentIntentsIntentExpand)
    ]
    where
      GetPaymentIntentsIntentParams{..} = getPaymentIntentsIntentParams
  endpointHeaders GetPaymentIntentsIntent{..} =
    [
    ]



{-
getPaymentIntentsIntent :: GetPaymentIntentsIntent
getPaymentIntentsIntent = GetPaymentIntentsIntent
-}
-- 
{- | <p>Creates a PaymentIntent object.</p>

<p>After the PaymentIntent is created, attach a payment method and <a href="/docs/api/payment_intents/confirm">confirm</a>
to continue the payment. You can read more about the different payment flows
available via the Payment Intents API <a href="/docs/payments/payment-intents">here</a>.</p>

<p>When <code>confirm=true</code> is used during creation, it is equivalent to creating
and confirming the PaymentIntent in the same call. You may use any parameters
available in the <a href="/docs/api/payment_intents/confirm">confirm API</a> when <code>confirm=true</code>
is supplied.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_intents
-}
-- TODO request options as enum
data PostPaymentIntents = PostPaymentIntents
  { postPaymentIntentsParams :: PostPaymentIntentsParams
  , postPaymentIntentsBody :: PostPaymentIntentsBody
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsParams = PostPaymentIntentsParams
  {
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsBody
  = PostPaymentIntentsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentIntents = "POST"
type instance RequestPath PostPaymentIntents = "/v1/payment_intents"

instance RequestBuilder PostPaymentIntents where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentIntents{..} =
    [ "v1"
    , "payment_intents"
    ]
    where
      PostPaymentIntentsParams = postPaymentIntentsParams
  endpointQuery PostPaymentIntents{..} =
    [
    ]
  endpointHeaders PostPaymentIntents{..} =
    [
    ]



{-
postPaymentIntents :: PostPaymentIntents
postPaymentIntents = PostPaymentIntents
-}
-- 
{- | <p>Returns a list of PaymentIntents.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payment_intents
-}
-- TODO request options as enum
data GetPaymentIntents = GetPaymentIntents
  { getPaymentIntentsParams :: GetPaymentIntentsParams
  , getPaymentIntentsBody :: Maybe GetPaymentIntentsBody
  } deriving (Show, Eq, Generic)

data GetPaymentIntentsParams = GetPaymentIntentsParams
  {  getPaymentIntentsCreated :: Maybe (Either (Object) (Int))
  {- ^ A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. -}
  ,  getPaymentIntentsCustomer :: Maybe (Text)
  {- ^ Only return PaymentIntents for the customer specified by this customer ID. -}
  ,  getPaymentIntentsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getPaymentIntentsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPaymentIntentsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getPaymentIntentsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetPaymentIntentsBody
  = GetPaymentIntentsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPaymentIntents = "GET"
type instance RequestPath GetPaymentIntents = "/v1/payment_intents"

instance RequestBuilder GetPaymentIntents where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPaymentIntents{..} =
    [ "v1"
    , "payment_intents"
    ]
    where
      GetPaymentIntentsParams{..} = getPaymentIntentsParams
  endpointQuery GetPaymentIntents{..} =
    [ ("created", queryDeepObjectExplode getPaymentIntentsCreated)
    , ("customer", queryFormExplode getPaymentIntentsCustomer)
    , ("ending_before", queryFormExplode getPaymentIntentsEndingBefore)
    , ("expand", queryDeepObjectExplode getPaymentIntentsExpand)
    , ("limit", queryFormExplode getPaymentIntentsLimit)
    , ("starting_after", queryFormExplode getPaymentIntentsStartingAfter)
    ]
    where
      GetPaymentIntentsParams{..} = getPaymentIntentsParams
  endpointHeaders GetPaymentIntents{..} =
    [
    ]



{-
getPaymentIntents :: GetPaymentIntents
getPaymentIntents = GetPaymentIntents
-}
-- 
{- | <p>Approves a pending Issuing <code>Authorization</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/authorizations/{authorization}/approve
-}
-- TODO request options as enum
data PostIssuingAuthorizationsAuthorizationApprove = PostIssuingAuthorizationsAuthorizationApprove
  { postIssuingAuthorizationsAuthorizationApproveParams :: PostIssuingAuthorizationsAuthorizationApproveParams
  , postIssuingAuthorizationsAuthorizationApproveBody :: Maybe PostIssuingAuthorizationsAuthorizationApproveBody
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationApproveParams = PostIssuingAuthorizationsAuthorizationApproveParams
  {  postIssuingAuthorizationsAuthorizationApproveAuthorization :: (Text)
  {- ^ The identifier of the authorization to approve. -}
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationApproveBody
  = PostIssuingAuthorizationsAuthorizationApproveBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingAuthorizationsAuthorizationApprove = "POST"
type instance RequestPath PostIssuingAuthorizationsAuthorizationApprove = "/v1/issuing/authorizations/{authorization}/approve"

instance RequestBuilder PostIssuingAuthorizationsAuthorizationApprove where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingAuthorizationsAuthorizationApprove{..} =
    [ "v1"
    , "issuing"
    , "authorizations"
    , pathSimple postIssuingAuthorizationsAuthorizationApproveAuthorization
    , "approve"
    ]
    where
      PostIssuingAuthorizationsAuthorizationApproveParams{..} = postIssuingAuthorizationsAuthorizationApproveParams
  endpointQuery PostIssuingAuthorizationsAuthorizationApprove{..} =
    [
    ]
  endpointHeaders PostIssuingAuthorizationsAuthorizationApprove{..} =
    [
    ]



{-
postIssuingAuthorizationsAuthorizationApprove :: PostIssuingAuthorizationsAuthorizationApprove
postIssuingAuthorizationsAuthorizationApprove = PostIssuingAuthorizationsAuthorizationApprove
-}
-- 
{- | <p>Creates a new <code>ValueList</code> object, which can then be referenced in rules.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/radar/value_lists
-}
-- TODO request options as enum
data PostRadarValueLists = PostRadarValueLists
  { postRadarValueListsParams :: PostRadarValueListsParams
  , postRadarValueListsBody :: PostRadarValueListsBody
  } deriving (Show, Eq, Generic)

data PostRadarValueListsParams = PostRadarValueListsParams
  {
  } deriving (Show, Eq, Generic)

data PostRadarValueListsBody
  = PostRadarValueListsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRadarValueLists = "POST"
type instance RequestPath PostRadarValueLists = "/v1/radar/value_lists"

instance RequestBuilder PostRadarValueLists where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRadarValueLists{..} =
    [ "v1"
    , "radar"
    , "value_lists"
    ]
    where
      PostRadarValueListsParams = postRadarValueListsParams
  endpointQuery PostRadarValueLists{..} =
    [
    ]
  endpointHeaders PostRadarValueLists{..} =
    [
    ]



{-
postRadarValueLists :: PostRadarValueLists
postRadarValueLists = PostRadarValueLists
-}
-- 
{- | <p>Returns a list of <code>ValueList</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/value_lists
-}
-- TODO request options as enum
data GetRadarValueLists = GetRadarValueLists
  { getRadarValueListsParams :: GetRadarValueListsParams
  , getRadarValueListsBody :: Maybe GetRadarValueListsBody
  } deriving (Show, Eq, Generic)

data GetRadarValueListsParams = GetRadarValueListsParams
  {  getRadarValueListsAlias :: Maybe (Text)
  {- ^ The alias used to reference the value list when writing rules. -}
  ,  getRadarValueListsContains :: Maybe (Text)
  {- ^ A value contained within a value list - returns all value lists containing this value. -}
  ,  getRadarValueListsCreated :: Maybe (Either (Object) (Int))
  ,  getRadarValueListsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getRadarValueListsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRadarValueListsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getRadarValueListsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetRadarValueListsBody
  = GetRadarValueListsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarValueLists = "GET"
type instance RequestPath GetRadarValueLists = "/v1/radar/value_lists"

instance RequestBuilder GetRadarValueLists where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarValueLists{..} =
    [ "v1"
    , "radar"
    , "value_lists"
    ]
    where
      GetRadarValueListsParams{..} = getRadarValueListsParams
  endpointQuery GetRadarValueLists{..} =
    [ ("alias", queryFormExplode getRadarValueListsAlias)
    , ("contains", queryFormExplode getRadarValueListsContains)
    , ("created", queryDeepObjectExplode getRadarValueListsCreated)
    , ("ending_before", queryFormExplode getRadarValueListsEndingBefore)
    , ("expand", queryDeepObjectExplode getRadarValueListsExpand)
    , ("limit", queryFormExplode getRadarValueListsLimit)
    , ("starting_after", queryFormExplode getRadarValueListsStartingAfter)
    ]
    where
      GetRadarValueListsParams{..} = getRadarValueListsParams
  endpointHeaders GetRadarValueLists{..} =
    [
    ]



{-
getRadarValueLists :: GetRadarValueLists
getRadarValueLists = GetRadarValueLists
-}
-- 
{- | <p>Updates the specified Issuing <code>Settlement</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/settlements/{settlement}
-}
-- TODO request options as enum
data PostIssuingSettlementsSettlement = PostIssuingSettlementsSettlement
  { postIssuingSettlementsSettlementParams :: PostIssuingSettlementsSettlementParams
  , postIssuingSettlementsSettlementBody :: Maybe PostIssuingSettlementsSettlementBody
  } deriving (Show, Eq, Generic)

data PostIssuingSettlementsSettlementParams = PostIssuingSettlementsSettlementParams
  {  postIssuingSettlementsSettlementSettlement :: (Text)
  {- ^ The ID of the settlement to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingSettlementsSettlementBody
  = PostIssuingSettlementsSettlementBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingSettlementsSettlement = "POST"
type instance RequestPath PostIssuingSettlementsSettlement = "/v1/issuing/settlements/{settlement}"

instance RequestBuilder PostIssuingSettlementsSettlement where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingSettlementsSettlement{..} =
    [ "v1"
    , "issuing"
    , "settlements"
    , pathSimple postIssuingSettlementsSettlementSettlement
    ]
    where
      PostIssuingSettlementsSettlementParams{..} = postIssuingSettlementsSettlementParams
  endpointQuery PostIssuingSettlementsSettlement{..} =
    [
    ]
  endpointHeaders PostIssuingSettlementsSettlement{..} =
    [
    ]



{-
postIssuingSettlementsSettlement :: PostIssuingSettlementsSettlement
postIssuingSettlementsSettlement = PostIssuingSettlementsSettlement
-}
-- 
{- | <p>Retrieves an Issuing <code>Settlement</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/settlements/{settlement}
-}
-- TODO request options as enum
data GetIssuingSettlementsSettlement = GetIssuingSettlementsSettlement
  { getIssuingSettlementsSettlementParams :: GetIssuingSettlementsSettlementParams
  , getIssuingSettlementsSettlementBody :: Maybe GetIssuingSettlementsSettlementBody
  } deriving (Show, Eq, Generic)

data GetIssuingSettlementsSettlementParams = GetIssuingSettlementsSettlementParams
  {  getIssuingSettlementsSettlementExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingSettlementsSettlementSettlement :: (Text)
  {- ^ The ID of the settlement to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetIssuingSettlementsSettlementBody
  = GetIssuingSettlementsSettlementBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingSettlementsSettlement = "GET"
type instance RequestPath GetIssuingSettlementsSettlement = "/v1/issuing/settlements/{settlement}"

instance RequestBuilder GetIssuingSettlementsSettlement where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingSettlementsSettlement{..} =
    [ "v1"
    , "issuing"
    , "settlements"
    , pathSimple getIssuingSettlementsSettlementSettlement
    ]
    where
      GetIssuingSettlementsSettlementParams{..} = getIssuingSettlementsSettlementParams
  endpointQuery GetIssuingSettlementsSettlement{..} =
    [ ("expand", queryDeepObjectExplode getIssuingSettlementsSettlementExpand)
    ]
  endpointHeaders GetIssuingSettlementsSettlement{..} =
    [
    ]



{-
getIssuingSettlementsSettlement :: GetIssuingSettlementsSettlement
getIssuingSettlementsSettlement = GetIssuingSettlementsSettlement
-}
-- 
{- | <p>A SetupIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_capture</code>, <code>requires_confirmation</code>, <code>requires_action</code>. </p>

<p>Once canceled, setup is abandoned and any operations on the SetupIntent will fail with an error.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/setup_intents/{intent}/cancel
-}
-- TODO request options as enum
data PostSetupIntentsIntentCancel = PostSetupIntentsIntentCancel
  { postSetupIntentsIntentCancelParams :: PostSetupIntentsIntentCancelParams
  , postSetupIntentsIntentCancelBody :: Maybe PostSetupIntentsIntentCancelBody
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentCancelParams = PostSetupIntentsIntentCancelParams
  {  postSetupIntentsIntentCancelIntent :: (Text)
  {- ^ ID of the SetupIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentCancelBody
  = PostSetupIntentsIntentCancelBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSetupIntentsIntentCancel = "POST"
type instance RequestPath PostSetupIntentsIntentCancel = "/v1/setup_intents/{intent}/cancel"

instance RequestBuilder PostSetupIntentsIntentCancel where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSetupIntentsIntentCancel{..} =
    [ "v1"
    , "setup_intents"
    , pathSimple postSetupIntentsIntentCancelIntent
    , "cancel"
    ]
    where
      PostSetupIntentsIntentCancelParams{..} = postSetupIntentsIntentCancelParams
  endpointQuery PostSetupIntentsIntentCancel{..} =
    [
    ]
  endpointHeaders PostSetupIntentsIntentCancel{..} =
    [
    ]



{-
postSetupIntentsIntentCancel :: PostSetupIntentsIntentCancel
postSetupIntentsIntentCancel = PostSetupIntentsIntentCancel
-}
-- 
{- | <p>Declines a pending Issuing <code>Authorization</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/authorizations/{authorization}/decline
-}
-- TODO request options as enum
data PostIssuingAuthorizationsAuthorizationDecline = PostIssuingAuthorizationsAuthorizationDecline
  { postIssuingAuthorizationsAuthorizationDeclineParams :: PostIssuingAuthorizationsAuthorizationDeclineParams
  , postIssuingAuthorizationsAuthorizationDeclineBody :: Maybe PostIssuingAuthorizationsAuthorizationDeclineBody
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationDeclineParams = PostIssuingAuthorizationsAuthorizationDeclineParams
  {  postIssuingAuthorizationsAuthorizationDeclineAuthorization :: (Text)
  {- ^ The identifier of the issuing authorization to decline. -}
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationDeclineBody
  = PostIssuingAuthorizationsAuthorizationDeclineBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingAuthorizationsAuthorizationDecline = "POST"
type instance RequestPath PostIssuingAuthorizationsAuthorizationDecline = "/v1/issuing/authorizations/{authorization}/decline"

instance RequestBuilder PostIssuingAuthorizationsAuthorizationDecline where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingAuthorizationsAuthorizationDecline{..} =
    [ "v1"
    , "issuing"
    , "authorizations"
    , pathSimple postIssuingAuthorizationsAuthorizationDeclineAuthorization
    , "decline"
    ]
    where
      PostIssuingAuthorizationsAuthorizationDeclineParams{..} = postIssuingAuthorizationsAuthorizationDeclineParams
  endpointQuery PostIssuingAuthorizationsAuthorizationDecline{..} =
    [
    ]
  endpointHeaders PostIssuingAuthorizationsAuthorizationDecline{..} =
    [
    ]



{-
postIssuingAuthorizationsAuthorizationDecline :: PostIssuingAuthorizationsAuthorizationDecline
postIssuingAuthorizationsAuthorizationDecline = PostIssuingAuthorizationsAuthorizationDecline
-}
-- 
{- | <p>Updates a connected <a href="/docs/connect/accounts">Express or Custom account</a> by setting the values of the parameters passed. Any parameters not provided are left unchanged. Most parameters can be changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.) Parameters marked <strong>Custom and Express</strong> are supported by both account types.</p>

<p>To update your own account, use the <a href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating accounts.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account
-}
-- TODO request options as enum
data PostAccount = PostAccount
  { postAccountParams :: PostAccountParams
  , postAccountBody :: Maybe PostAccountBody
  } deriving (Show, Eq, Generic)

data PostAccountParams = PostAccountParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountBody
  = PostAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccount = "POST"
type instance RequestPath PostAccount = "/v1/account"

instance RequestBuilder PostAccount where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccount{..} =
    [ "v1"
    , "account"
    ]
    where
      PostAccountParams = postAccountParams
  endpointQuery PostAccount{..} =
    [
    ]
  endpointHeaders PostAccount{..} =
    [
    ]



{-
postAccount :: PostAccount
postAccount = PostAccount
-}
-- 
{- | <p>Retrieves the details of an account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account
-}
-- TODO request options as enum
data GetAccount = GetAccount
  { getAccountParams :: GetAccountParams
  , getAccountBody :: Maybe GetAccountBody
  } deriving (Show, Eq, Generic)

data GetAccountParams = GetAccountParams
  {  getAccountExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountBody
  = GetAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccount = "GET"
type instance RequestPath GetAccount = "/v1/account"

instance RequestBuilder GetAccount where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccount{..} =
    [ "v1"
    , "account"
    ]
    where
      GetAccountParams{..} = getAccountParams
  endpointQuery GetAccount{..} =
    [ ("expand", queryDeepObjectExplode getAccountExpand)
    ]
  endpointHeaders GetAccount{..} =
    [
    ]



{-
getAccount :: GetAccount
getAccount = GetAccount
-}
-- 
{- | <p>With <a href="/docs/connect">Connect</a>, you may delete Custom accounts you manage.</p>

<p>Custom accounts created using test-mode keys can be deleted at any time. Custom accounts created using live-mode keys may only be deleted once all balances are zero.</p>

<p>If you are looking to close your own account, use the <a href="https://dashboard.stripe.com/account/data">data tab in your account settings</a> instead.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/account
-}
-- TODO request options as enum
data DeleteAccount = DeleteAccount
  { deleteAccountParams :: DeleteAccountParams
  , deleteAccountBody :: Maybe DeleteAccountBody
  } deriving (Show, Eq, Generic)

data DeleteAccountParams = DeleteAccountParams
  {
  } deriving (Show, Eq, Generic)

data DeleteAccountBody
  = DeleteAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccount = "DELETE"
type instance RequestPath DeleteAccount = "/v1/account"

instance RequestBuilder DeleteAccount where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccount{..} =
    [ "v1"
    , "account"
    ]
    where
      DeleteAccountParams = deleteAccountParams
  endpointQuery DeleteAccount{..} =
    [
    ]
  endpointHeaders DeleteAccount{..} =
    [
    ]



{-
deleteAccount :: DeleteAccount
deleteAccount = DeleteAccount
-}
-- 
{- | <p>For virtual cards only. Retrieves an Issuing <code>Card_details</code> object that contains <a href="/docs/issuing/cards/management#virtual-card-info">the sensitive details</a> of a virtual card.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cards/{card}/details
-}
-- TODO request options as enum
data GetIssuingCardsCardDetails = GetIssuingCardsCardDetails
  { getIssuingCardsCardDetailsParams :: GetIssuingCardsCardDetailsParams
  , getIssuingCardsCardDetailsBody :: Maybe GetIssuingCardsCardDetailsBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardDetailsParams = GetIssuingCardsCardDetailsParams
  {  getIssuingCardsCardDetailsCard :: (Text)
  {- ^ The identifier of the virtual card to be retrieved. -}
  ,  getIssuingCardsCardDetailsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardDetailsBody
  = GetIssuingCardsCardDetailsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCardsCardDetails = "GET"
type instance RequestPath GetIssuingCardsCardDetails = "/v1/issuing/cards/{card}/details"

instance RequestBuilder GetIssuingCardsCardDetails where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCardsCardDetails{..} =
    [ "v1"
    , "issuing"
    , "cards"
    , pathSimple getIssuingCardsCardDetailsCard
    , "details"
    ]
    where
      GetIssuingCardsCardDetailsParams{..} = getIssuingCardsCardDetailsParams
  endpointQuery GetIssuingCardsCardDetails{..} =
    [ ("expand", queryDeepObjectExplode getIssuingCardsCardDetailsExpand)
    ]
  endpointHeaders GetIssuingCardsCardDetails{..} =
    [
    ]



{-
getIssuingCardsCardDetails :: GetIssuingCardsCardDetails
getIssuingCardsCardDetails = GetIssuingCardsCardDetails
-}
-- 
{- | <p>When you get a dispute, contacting your customer is always the best first step. If that doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can do this in your <a href="https://dashboard.stripe.com/disputes">dashboard</a>, but if you prefer, you can use the API to submit evidence programmatically.</p>

<p>Depending on your dispute type, different evidence fields will give you a better chance of winning your dispute. To figure out which evidence fields to provide, see our <a href="/docs/disputes/categories">guide to dispute types</a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/disputes/{dispute}
-}
-- TODO request options as enum
data PostDisputesDispute = PostDisputesDispute
  { postDisputesDisputeParams :: PostDisputesDisputeParams
  , postDisputesDisputeBody :: Maybe PostDisputesDisputeBody
  } deriving (Show, Eq, Generic)

data PostDisputesDisputeParams = PostDisputesDisputeParams
  {  postDisputesDisputeDispute :: (Text)
  {- ^ ID of the dispute to update. -}
  } deriving (Show, Eq, Generic)

data PostDisputesDisputeBody
  = PostDisputesDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostDisputesDispute = "POST"
type instance RequestPath PostDisputesDispute = "/v1/disputes/{dispute}"

instance RequestBuilder PostDisputesDispute where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostDisputesDispute{..} =
    [ "v1"
    , "disputes"
    , pathSimple postDisputesDisputeDispute
    ]
    where
      PostDisputesDisputeParams{..} = postDisputesDisputeParams
  endpointQuery PostDisputesDispute{..} =
    [
    ]
  endpointHeaders PostDisputesDispute{..} =
    [
    ]



{-
postDisputesDispute :: PostDisputesDispute
postDisputesDispute = PostDisputesDispute
-}
-- 
{- | <p>Retrieves the dispute with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/disputes/{dispute}
-}
-- TODO request options as enum
data GetDisputesDispute = GetDisputesDispute
  { getDisputesDisputeParams :: GetDisputesDisputeParams
  , getDisputesDisputeBody :: Maybe GetDisputesDisputeBody
  } deriving (Show, Eq, Generic)

data GetDisputesDisputeParams = GetDisputesDisputeParams
  {  getDisputesDisputeDispute :: (Text)
  {- ^ ID of dispute to retrieve. -}
  ,  getDisputesDisputeExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetDisputesDisputeBody
  = GetDisputesDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetDisputesDispute = "GET"
type instance RequestPath GetDisputesDispute = "/v1/disputes/{dispute}"

instance RequestBuilder GetDisputesDispute where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetDisputesDispute{..} =
    [ "v1"
    , "disputes"
    , pathSimple getDisputesDisputeDispute
    ]
    where
      GetDisputesDisputeParams{..} = getDisputesDisputeParams
  endpointQuery GetDisputesDispute{..} =
    [ ("expand", queryDeepObjectExplode getDisputesDisputeExpand)
    ]
  endpointHeaders GetDisputesDispute{..} =
    [
    ]



{-
getDisputesDispute :: GetDisputesDispute
getDisputesDispute = GetDisputesDispute
-}
-- 
{- | <p>Returns a list of <code>Review</code> objects that have <code>open</code> set to <code>true</code>. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reviews
-}
-- TODO request options as enum
data GetReviews = GetReviews
  { getReviewsParams :: GetReviewsParams
  , getReviewsBody :: Maybe GetReviewsBody
  } deriving (Show, Eq, Generic)

data GetReviewsParams = GetReviewsParams
  {  getReviewsCreated :: Maybe (Either (Object) (Int))
  ,  getReviewsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getReviewsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getReviewsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getReviewsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetReviewsBody
  = GetReviewsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReviews = "GET"
type instance RequestPath GetReviews = "/v1/reviews"

instance RequestBuilder GetReviews where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReviews{..} =
    [ "v1"
    , "reviews"
    ]
    where
      GetReviewsParams{..} = getReviewsParams
  endpointQuery GetReviews{..} =
    [ ("created", queryDeepObjectExplode getReviewsCreated)
    , ("ending_before", queryFormExplode getReviewsEndingBefore)
    , ("expand", queryDeepObjectExplode getReviewsExpand)
    , ("limit", queryFormExplode getReviewsLimit)
    , ("starting_after", queryFormExplode getReviewsStartingAfter)
    ]
    where
      GetReviewsParams{..} = getReviewsParams
  endpointHeaders GetReviews{..} =
    [
    ]



{-
getReviews :: GetReviews
getReviews = GetReviews
-}
-- 
{- | <p>Create an external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/bank_accounts
-}
-- TODO request options as enum
data PostAccountsAccountBankAccounts = PostAccountsAccountBankAccounts
  { postAccountsAccountBankAccountsParams :: PostAccountsAccountBankAccountsParams
  , postAccountsAccountBankAccountsBody :: Maybe PostAccountsAccountBankAccountsBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountBankAccountsParams = PostAccountsAccountBankAccountsParams
  {  postAccountsAccountBankAccountsAccount :: (Text)
  } deriving (Show, Eq, Generic)

data PostAccountsAccountBankAccountsBody
  = PostAccountsAccountBankAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountBankAccounts = "POST"
type instance RequestPath PostAccountsAccountBankAccounts = "/v1/accounts/{account}/bank_accounts"

instance RequestBuilder PostAccountsAccountBankAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountBankAccounts{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountBankAccountsAccount
    , "bank_accounts"
    ]
    where
      PostAccountsAccountBankAccountsParams{..} = postAccountsAccountBankAccountsParams
  endpointQuery PostAccountsAccountBankAccounts{..} =
    [
    ]
  endpointHeaders PostAccountsAccountBankAccounts{..} =
    [
    ]



{-
postAccountsAccountBankAccounts :: PostAccountsAccountBankAccounts
postAccountsAccountBankAccounts = PostAccountsAccountBankAccounts
-}
-- 
{- | <p>Updates a SetupIntent object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/setup_intents/{intent}
-}
-- TODO request options as enum
data PostSetupIntentsIntent = PostSetupIntentsIntent
  { postSetupIntentsIntentParams :: PostSetupIntentsIntentParams
  , postSetupIntentsIntentBody :: Maybe PostSetupIntentsIntentBody
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentParams = PostSetupIntentsIntentParams
  {  postSetupIntentsIntentIntent :: (Text)
  {- ^ ID of the SetupIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentBody
  = PostSetupIntentsIntentBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSetupIntentsIntent = "POST"
type instance RequestPath PostSetupIntentsIntent = "/v1/setup_intents/{intent}"

instance RequestBuilder PostSetupIntentsIntent where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSetupIntentsIntent{..} =
    [ "v1"
    , "setup_intents"
    , pathSimple postSetupIntentsIntentIntent
    ]
    where
      PostSetupIntentsIntentParams{..} = postSetupIntentsIntentParams
  endpointQuery PostSetupIntentsIntent{..} =
    [
    ]
  endpointHeaders PostSetupIntentsIntent{..} =
    [
    ]



{-
postSetupIntentsIntent :: PostSetupIntentsIntent
postSetupIntentsIntent = PostSetupIntentsIntent
-}
-- 
{- | <p>Retrieves the details of a SetupIntent that has previously been created. </p>

<p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string. </p>

<p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#setup_intent_object">SetupIntent</a> object reference for more details.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/setup_intents/{intent}
-}
-- TODO request options as enum
data GetSetupIntentsIntent = GetSetupIntentsIntent
  { getSetupIntentsIntentParams :: GetSetupIntentsIntentParams
  , getSetupIntentsIntentBody :: Maybe GetSetupIntentsIntentBody
  } deriving (Show, Eq, Generic)

data GetSetupIntentsIntentParams = GetSetupIntentsIntentParams
  {  getSetupIntentsIntentClientSecret :: Maybe (Text)
  {- ^ The client secret of the SetupIntent. Required if a publishable key is used to retrieve the SetupIntent. -}
  ,  getSetupIntentsIntentExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSetupIntentsIntentIntent :: (Text)
  {- ^ ID of the SetupIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetSetupIntentsIntentBody
  = GetSetupIntentsIntentBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSetupIntentsIntent = "GET"
type instance RequestPath GetSetupIntentsIntent = "/v1/setup_intents/{intent}"

instance RequestBuilder GetSetupIntentsIntent where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSetupIntentsIntent{..} =
    [ "v1"
    , "setup_intents"
    , pathSimple getSetupIntentsIntentIntent
    ]
    where
      GetSetupIntentsIntentParams{..} = getSetupIntentsIntentParams
  endpointQuery GetSetupIntentsIntent{..} =
    [ ("client_secret", queryFormExplode getSetupIntentsIntentClientSecret)
    , ("expand", queryDeepObjectExplode getSetupIntentsIntentExpand)
    ]
    where
      GetSetupIntentsIntentParams{..} = getSetupIntentsIntentParams
  endpointHeaders GetSetupIntentsIntent{..} =
    [
    ]



{-
getSetupIntentsIntent :: GetSetupIntentsIntent
getSetupIntentsIntent = GetSetupIntentsIntent
-}
-- 
{- | <p>Retrieves a <code>Review</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reviews/{review}
-}
-- TODO request options as enum
data GetReviewsReview = GetReviewsReview
  { getReviewsReviewParams :: GetReviewsReviewParams
  , getReviewsReviewBody :: Maybe GetReviewsReviewBody
  } deriving (Show, Eq, Generic)

data GetReviewsReviewParams = GetReviewsReviewParams
  {  getReviewsReviewExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getReviewsReviewReview :: (Text)
  {- ^ The identifier of the review to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetReviewsReviewBody
  = GetReviewsReviewBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReviewsReview = "GET"
type instance RequestPath GetReviewsReview = "/v1/reviews/{review}"

instance RequestBuilder GetReviewsReview where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReviewsReview{..} =
    [ "v1"
    , "reviews"
    , pathSimple getReviewsReviewReview
    ]
    where
      GetReviewsReviewParams{..} = getReviewsReviewParams
  endpointQuery GetReviewsReview{..} =
    [ ("expand", queryDeepObjectExplode getReviewsReviewExpand)
    ]
  endpointHeaders GetReviewsReview{..} =
    [
    ]



{-
getReviewsReview :: GetReviewsReview
getReviewsReview = GetReviewsReview
-}
-- 
{- | <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_methods/{payment_method}
-}
-- TODO request options as enum
data PostPaymentMethodsPaymentMethod = PostPaymentMethodsPaymentMethod
  { postPaymentMethodsPaymentMethodParams :: PostPaymentMethodsPaymentMethodParams
  , postPaymentMethodsPaymentMethodBody :: Maybe PostPaymentMethodsPaymentMethodBody
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodParams = PostPaymentMethodsPaymentMethodParams
  {  postPaymentMethodsPaymentMethodPaymentMethod :: (Text)
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodBody
  = PostPaymentMethodsPaymentMethodBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentMethodsPaymentMethod = "POST"
type instance RequestPath PostPaymentMethodsPaymentMethod = "/v1/payment_methods/{payment_method}"

instance RequestBuilder PostPaymentMethodsPaymentMethod where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentMethodsPaymentMethod{..} =
    [ "v1"
    , "payment_methods"
    , pathSimple postPaymentMethodsPaymentMethodPaymentMethod
    ]
    where
      PostPaymentMethodsPaymentMethodParams{..} = postPaymentMethodsPaymentMethodParams
  endpointQuery PostPaymentMethodsPaymentMethod{..} =
    [
    ]
  endpointHeaders PostPaymentMethodsPaymentMethod{..} =
    [
    ]



{-
postPaymentMethodsPaymentMethod :: PostPaymentMethodsPaymentMethod
postPaymentMethodsPaymentMethod = PostPaymentMethodsPaymentMethod
-}
-- 
{- | <p>Retrieves a PaymentMethod object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payment_methods/{payment_method}
-}
-- TODO request options as enum
data GetPaymentMethodsPaymentMethod = GetPaymentMethodsPaymentMethod
  { getPaymentMethodsPaymentMethodParams :: GetPaymentMethodsPaymentMethodParams
  , getPaymentMethodsPaymentMethodBody :: Maybe GetPaymentMethodsPaymentMethodBody
  } deriving (Show, Eq, Generic)

data GetPaymentMethodsPaymentMethodParams = GetPaymentMethodsPaymentMethodParams
  {  getPaymentMethodsPaymentMethodExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPaymentMethodsPaymentMethodPaymentMethod :: (Text)
  {- ^ The ID of the PaymentMethod. -}
  } deriving (Show, Eq, Generic)

data GetPaymentMethodsPaymentMethodBody
  = GetPaymentMethodsPaymentMethodBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPaymentMethodsPaymentMethod = "GET"
type instance RequestPath GetPaymentMethodsPaymentMethod = "/v1/payment_methods/{payment_method}"

instance RequestBuilder GetPaymentMethodsPaymentMethod where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPaymentMethodsPaymentMethod{..} =
    [ "v1"
    , "payment_methods"
    , pathSimple getPaymentMethodsPaymentMethodPaymentMethod
    ]
    where
      GetPaymentMethodsPaymentMethodParams{..} = getPaymentMethodsPaymentMethodParams
  endpointQuery GetPaymentMethodsPaymentMethod{..} =
    [ ("expand", queryDeepObjectExplode getPaymentMethodsPaymentMethodExpand)
    ]
  endpointHeaders GetPaymentMethodsPaymentMethod{..} =
    [
    ]



{-
getPaymentMethodsPaymentMethod :: GetPaymentMethodsPaymentMethod
getPaymentMethodsPaymentMethod = GetPaymentMethodsPaymentMethod
-}
-- 
{- | <p>Updates the amount or description of an invoice item on an upcoming invoice. Updating an invoice item is only possible before the invoice it’s attached to is closed.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoiceitems/{invoiceitem}
-}
-- TODO request options as enum
data PostInvoiceitemsInvoiceitem = PostInvoiceitemsInvoiceitem
  { postInvoiceitemsInvoiceitemParams :: PostInvoiceitemsInvoiceitemParams
  , postInvoiceitemsInvoiceitemBody :: Maybe PostInvoiceitemsInvoiceitemBody
  } deriving (Show, Eq, Generic)

data PostInvoiceitemsInvoiceitemParams = PostInvoiceitemsInvoiceitemParams
  {  postInvoiceitemsInvoiceitemInvoiceitem :: (Text)
  } deriving (Show, Eq, Generic)

data PostInvoiceitemsInvoiceitemBody
  = PostInvoiceitemsInvoiceitemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoiceitemsInvoiceitem = "POST"
type instance RequestPath PostInvoiceitemsInvoiceitem = "/v1/invoiceitems/{invoiceitem}"

instance RequestBuilder PostInvoiceitemsInvoiceitem where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoiceitemsInvoiceitem{..} =
    [ "v1"
    , "invoiceitems"
    , pathSimple postInvoiceitemsInvoiceitemInvoiceitem
    ]
    where
      PostInvoiceitemsInvoiceitemParams{..} = postInvoiceitemsInvoiceitemParams
  endpointQuery PostInvoiceitemsInvoiceitem{..} =
    [
    ]
  endpointHeaders PostInvoiceitemsInvoiceitem{..} =
    [
    ]



{-
postInvoiceitemsInvoiceitem :: PostInvoiceitemsInvoiceitem
postInvoiceitemsInvoiceitem = PostInvoiceitemsInvoiceitem
-}
-- 
{- | <p>Retrieves the invoice item with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoiceitems/{invoiceitem}
-}
-- TODO request options as enum
data GetInvoiceitemsInvoiceitem = GetInvoiceitemsInvoiceitem
  { getInvoiceitemsInvoiceitemParams :: GetInvoiceitemsInvoiceitemParams
  , getInvoiceitemsInvoiceitemBody :: Maybe GetInvoiceitemsInvoiceitemBody
  } deriving (Show, Eq, Generic)

data GetInvoiceitemsInvoiceitemParams = GetInvoiceitemsInvoiceitemParams
  {  getInvoiceitemsInvoiceitemExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoiceitemsInvoiceitemInvoiceitem :: (Text)
  {- ^ The ID of the desired invoice item. -}
  } deriving (Show, Eq, Generic)

data GetInvoiceitemsInvoiceitemBody
  = GetInvoiceitemsInvoiceitemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoiceitemsInvoiceitem = "GET"
type instance RequestPath GetInvoiceitemsInvoiceitem = "/v1/invoiceitems/{invoiceitem}"

instance RequestBuilder GetInvoiceitemsInvoiceitem where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoiceitemsInvoiceitem{..} =
    [ "v1"
    , "invoiceitems"
    , pathSimple getInvoiceitemsInvoiceitemInvoiceitem
    ]
    where
      GetInvoiceitemsInvoiceitemParams{..} = getInvoiceitemsInvoiceitemParams
  endpointQuery GetInvoiceitemsInvoiceitem{..} =
    [ ("expand", queryDeepObjectExplode getInvoiceitemsInvoiceitemExpand)
    ]
  endpointHeaders GetInvoiceitemsInvoiceitem{..} =
    [
    ]



{-
getInvoiceitemsInvoiceitem :: GetInvoiceitemsInvoiceitem
getInvoiceitemsInvoiceitem = GetInvoiceitemsInvoiceitem
-}
-- 
{- | <p>Deletes an invoice item, removing it from an invoice. Deleting invoice items is only possible when they’re not attached to invoices, or if it’s attached to a draft invoice.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/invoiceitems/{invoiceitem}
-}
-- TODO request options as enum
data DeleteInvoiceitemsInvoiceitem = DeleteInvoiceitemsInvoiceitem
  { deleteInvoiceitemsInvoiceitemParams :: DeleteInvoiceitemsInvoiceitemParams
  , deleteInvoiceitemsInvoiceitemBody :: Maybe DeleteInvoiceitemsInvoiceitemBody
  } deriving (Show, Eq, Generic)

data DeleteInvoiceitemsInvoiceitemParams = DeleteInvoiceitemsInvoiceitemParams
  {  deleteInvoiceitemsInvoiceitemInvoiceitem :: (Text)
  {- ^ The identifier of the invoice item to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteInvoiceitemsInvoiceitemBody
  = DeleteInvoiceitemsInvoiceitemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteInvoiceitemsInvoiceitem = "DELETE"
type instance RequestPath DeleteInvoiceitemsInvoiceitem = "/v1/invoiceitems/{invoiceitem}"

instance RequestBuilder DeleteInvoiceitemsInvoiceitem where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteInvoiceitemsInvoiceitem{..} =
    [ "v1"
    , "invoiceitems"
    , pathSimple deleteInvoiceitemsInvoiceitemInvoiceitem
    ]
    where
      DeleteInvoiceitemsInvoiceitemParams{..} = deleteInvoiceitemsInvoiceitemParams
  endpointQuery DeleteInvoiceitemsInvoiceitem{..} =
    [
    ]
  endpointHeaders DeleteInvoiceitemsInvoiceitem{..} =
    [
    ]



{-
deleteInvoiceitemsInvoiceitem :: DeleteInvoiceitemsInvoiceitem
deleteInvoiceitemsInvoiceitem = DeleteInvoiceitemsInvoiceitem
-}
-- 
{- | <p>Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged. For example, if you pass the <strong>source</strong> parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the <strong>source</strong> parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the <code>past_due</code> state, then the latest open invoice for the subscription with automatic collection enabled will be retried. This retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice. Changing the <strong>default_source</strong> for a customer will not trigger this behavior.</p>

<p>This request accepts mostly the same arguments as the customer creation call.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}
-}
-- TODO request options as enum
data PostCustomersCustomer = PostCustomersCustomer
  { postCustomersCustomerParams :: PostCustomersCustomerParams
  , postCustomersCustomerBody :: Maybe PostCustomersCustomerBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerParams = PostCustomersCustomerParams
  {  postCustomersCustomerCustomer :: (Text)
  {- ^ The identifier of the customer to subscribe. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBody
  = PostCustomersCustomerBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomer = "POST"
type instance RequestPath PostCustomersCustomer = "/v1/customers/{customer}"

instance RequestBuilder PostCustomersCustomer where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomer{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerCustomer
    ]
    where
      PostCustomersCustomerParams{..} = postCustomersCustomerParams
  endpointQuery PostCustomersCustomer{..} =
    [
    ]
  endpointHeaders PostCustomersCustomer{..} =
    [
    ]



{-
postCustomersCustomer :: PostCustomersCustomer
postCustomersCustomer = PostCustomersCustomer
-}
-- 
{- | <p>Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}
-}
-- TODO request options as enum
data GetCustomersCustomer = GetCustomersCustomer
  { getCustomersCustomerParams :: GetCustomersCustomerParams
  , getCustomersCustomerBody :: Maybe GetCustomersCustomerBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerParams = GetCustomersCustomerParams
  {  getCustomersCustomerCustomer :: (Text)
  {- ^ The identifier of the customer to be retrieved. -}
  ,  getCustomersCustomerExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBody
  = GetCustomersCustomerBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomer = "GET"
type instance RequestPath GetCustomersCustomer = "/v1/customers/{customer}"

instance RequestBuilder GetCustomersCustomer where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomer{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerCustomer
    ]
    where
      GetCustomersCustomerParams{..} = getCustomersCustomerParams
  endpointQuery GetCustomersCustomer{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerExpand)
    ]
  endpointHeaders GetCustomersCustomer{..} =
    [
    ]



{-
getCustomersCustomer :: GetCustomersCustomer
getCustomersCustomer = GetCustomersCustomer
-}
-- 
{- | <p>Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}
-}
-- TODO request options as enum
data DeleteCustomersCustomer = DeleteCustomersCustomer
  { deleteCustomersCustomerParams :: DeleteCustomersCustomerParams
  , deleteCustomersCustomerBody :: Maybe DeleteCustomersCustomerBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerParams = DeleteCustomersCustomerParams
  {  deleteCustomersCustomerCustomer :: (Text)
  {- ^ The identifier of the customer to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerBody
  = DeleteCustomersCustomerBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomer = "DELETE"
type instance RequestPath DeleteCustomersCustomer = "/v1/customers/{customer}"

instance RequestBuilder DeleteCustomersCustomer where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomer{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerCustomer
    ]
    where
      DeleteCustomersCustomerParams{..} = deleteCustomersCustomerParams
  endpointQuery DeleteCustomersCustomer{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomer{..} =
    [
    ]



{-
deleteCustomersCustomer :: DeleteCustomersCustomer
deleteCustomersCustomer = DeleteCustomersCustomer
-}
-- 
{- | <p>To charge a credit card or other payment source, you create a <code>Charge</code> object. If your API key is in test mode, the supplied payment source (e.g., card) won’t actually be charged, although everything else will occur as if in live mode. (Stripe assumes that the charge would have completed successfully).</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges
-}
-- TODO request options as enum
data PostCharges = PostCharges
  { postChargesParams :: PostChargesParams
  , postChargesBody :: Maybe PostChargesBody
  } deriving (Show, Eq, Generic)

data PostChargesParams = PostChargesParams
  {
  } deriving (Show, Eq, Generic)

data PostChargesBody
  = PostChargesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCharges = "POST"
type instance RequestPath PostCharges = "/v1/charges"

instance RequestBuilder PostCharges where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCharges{..} =
    [ "v1"
    , "charges"
    ]
    where
      PostChargesParams = postChargesParams
  endpointQuery PostCharges{..} =
    [
    ]
  endpointHeaders PostCharges{..} =
    [
    ]



{-
postCharges :: PostCharges
postCharges = PostCharges
-}
-- 
{- | <p>Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/charges
-}
-- TODO request options as enum
data GetCharges = GetCharges
  { getChargesParams :: GetChargesParams
  , getChargesBody :: Maybe GetChargesBody
  } deriving (Show, Eq, Generic)

data GetChargesParams = GetChargesParams
  {  getChargesCreated :: Maybe (Either (Object) (Int))
  ,  getChargesCustomer :: Maybe (Text)
  {- ^ Only return charges for the customer specified by this customer ID. -}
  ,  getChargesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getChargesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getChargesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getChargesPaymentIntent :: Maybe (Text)
  {- ^ Only return charges that were created by the PaymentIntent specified by this PaymentIntent ID. -}
  ,  getChargesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getChargesTransferGroup :: Maybe (Text)
  {- ^ Only return charges for this transfer group. -}
  } deriving (Show, Eq, Generic)

data GetChargesBody
  = GetChargesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCharges = "GET"
type instance RequestPath GetCharges = "/v1/charges"

instance RequestBuilder GetCharges where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCharges{..} =
    [ "v1"
    , "charges"
    ]
    where
      GetChargesParams{..} = getChargesParams
  endpointQuery GetCharges{..} =
    [ ("created", queryDeepObjectExplode getChargesCreated)
    , ("customer", queryFormExplode getChargesCustomer)
    , ("ending_before", queryFormExplode getChargesEndingBefore)
    , ("expand", queryDeepObjectExplode getChargesExpand)
    , ("limit", queryFormExplode getChargesLimit)
    , ("payment_intent", queryFormExplode getChargesPaymentIntent)
    , ("starting_after", queryFormExplode getChargesStartingAfter)
    , ("transfer_group", queryFormExplode getChargesTransferGroup)
    ]
    where
      GetChargesParams{..} = getChargesParams
  endpointHeaders GetCharges{..} =
    [
    ]



{-
getCharges :: GetCharges
getCharges = GetCharges
-}
-- 
{- | <p>Retrieves the details of an issuer fraud record that has previously been created. </p>

<p>Please refer to the <a href="#issuer_fraud_record_object">issuer fraud record</a> object reference for more details.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuer_fraud_records/{issuer_fraud_record}
-}
-- TODO request options as enum
data GetIssuerFraudRecordsIssuerFraudRecord = GetIssuerFraudRecordsIssuerFraudRecord
  { getIssuerFraudRecordsIssuerFraudRecordParams :: GetIssuerFraudRecordsIssuerFraudRecordParams
  , getIssuerFraudRecordsIssuerFraudRecordBody :: Maybe GetIssuerFraudRecordsIssuerFraudRecordBody
  } deriving (Show, Eq, Generic)

data GetIssuerFraudRecordsIssuerFraudRecordParams = GetIssuerFraudRecordsIssuerFraudRecordParams
  {  getIssuerFraudRecordsIssuerFraudRecordExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuerFraudRecordsIssuerFraudRecordIssuerFraudRecord :: (Text)
  {- ^ The identifier of the issuer fraud record to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetIssuerFraudRecordsIssuerFraudRecordBody
  = GetIssuerFraudRecordsIssuerFraudRecordBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuerFraudRecordsIssuerFraudRecord = "GET"
type instance RequestPath GetIssuerFraudRecordsIssuerFraudRecord = "/v1/issuer_fraud_records/{issuer_fraud_record}"

instance RequestBuilder GetIssuerFraudRecordsIssuerFraudRecord where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuerFraudRecordsIssuerFraudRecord{..} =
    [ "v1"
    , "issuer_fraud_records"
    , pathSimple getIssuerFraudRecordsIssuerFraudRecordIssuerFraudRecord
    ]
    where
      GetIssuerFraudRecordsIssuerFraudRecordParams{..} = getIssuerFraudRecordsIssuerFraudRecordParams
  endpointQuery GetIssuerFraudRecordsIssuerFraudRecord{..} =
    [ ("expand", queryDeepObjectExplode getIssuerFraudRecordsIssuerFraudRecordExpand)
    ]
  endpointHeaders GetIssuerFraudRecordsIssuerFraudRecord{..} =
    [
    ]



{-
getIssuerFraudRecordsIssuerFraudRecord :: GetIssuerFraudRecordsIssuerFraudRecord
getIssuerFraudRecordsIssuerFraudRecord = GetIssuerFraudRecordsIssuerFraudRecord
-}
-- {-# DEPRECATED getIssuerFraudRecordsIssuerFraudRecord, GetIssuerFraudRecordsIssuerFraudRecord "This endpoint is deprecated by the API creator" #-}
{- | <p>Creates a new person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/people
-}
-- TODO request options as enum
data PostAccountsAccountPeople = PostAccountsAccountPeople
  { postAccountsAccountPeopleParams :: PostAccountsAccountPeopleParams
  , postAccountsAccountPeopleBody :: Maybe PostAccountsAccountPeopleBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPeopleParams = PostAccountsAccountPeopleParams
  {  postAccountsAccountPeopleAccount :: (Text)
  {- ^ The account that the person is associated with. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPeopleBody
  = PostAccountsAccountPeopleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountPeople = "POST"
type instance RequestPath PostAccountsAccountPeople = "/v1/accounts/{account}/people"

instance RequestBuilder PostAccountsAccountPeople where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountPeople{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountPeopleAccount
    , "people"
    ]
    where
      PostAccountsAccountPeopleParams{..} = postAccountsAccountPeopleParams
  endpointQuery PostAccountsAccountPeople{..} =
    [
    ]
  endpointHeaders PostAccountsAccountPeople{..} =
    [
    ]



{-
postAccountsAccountPeople :: PostAccountsAccountPeople
postAccountsAccountPeople = PostAccountsAccountPeople
-}
-- 
{- | <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/people
-}
-- TODO request options as enum
data GetAccountsAccountPeople = GetAccountsAccountPeople
  { getAccountsAccountPeopleParams :: GetAccountsAccountPeopleParams
  , getAccountsAccountPeopleBody :: Maybe GetAccountsAccountPeopleBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPeopleParams = GetAccountsAccountPeopleParams
  {  getAccountsAccountPeopleAccount :: (Text)
  ,  getAccountsAccountPeopleEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountsAccountPeopleExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountPeopleLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountsAccountPeopleRelationship :: Maybe (Object)
  {- ^ Filters on the list of people returned based on the person's relationship to the account's company. -}
  ,  getAccountsAccountPeopleStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPeopleBody
  = GetAccountsAccountPeopleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountPeople = "GET"
type instance RequestPath GetAccountsAccountPeople = "/v1/accounts/{account}/people"

instance RequestBuilder GetAccountsAccountPeople where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountPeople{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountPeopleAccount
    , "people"
    ]
    where
      GetAccountsAccountPeopleParams{..} = getAccountsAccountPeopleParams
  endpointQuery GetAccountsAccountPeople{..} =
    [ ("ending_before", queryFormExplode getAccountsAccountPeopleEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountsAccountPeopleExpand)
    , ("limit", queryFormExplode getAccountsAccountPeopleLimit)
    , ("relationship", queryDeepObjectExplode getAccountsAccountPeopleRelationship)
    , ("starting_after", queryFormExplode getAccountsAccountPeopleStartingAfter)
    ]
    where
      GetAccountsAccountPeopleParams{..} = getAccountsAccountPeopleParams
  endpointHeaders GetAccountsAccountPeople{..} =
    [
    ]



{-
getAccountsAccountPeople :: GetAccountsAccountPeople
getAccountsAccountPeople = GetAccountsAccountPeople
-}
-- 
{- | <p>Creates a new <code>Location</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/terminal/locations
-}
-- TODO request options as enum
data PostTerminalLocations = PostTerminalLocations
  { postTerminalLocationsParams :: PostTerminalLocationsParams
  , postTerminalLocationsBody :: PostTerminalLocationsBody
  } deriving (Show, Eq, Generic)

data PostTerminalLocationsParams = PostTerminalLocationsParams
  {
  } deriving (Show, Eq, Generic)

data PostTerminalLocationsBody
  = PostTerminalLocationsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTerminalLocations = "POST"
type instance RequestPath PostTerminalLocations = "/v1/terminal/locations"

instance RequestBuilder PostTerminalLocations where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTerminalLocations{..} =
    [ "v1"
    , "terminal"
    , "locations"
    ]
    where
      PostTerminalLocationsParams = postTerminalLocationsParams
  endpointQuery PostTerminalLocations{..} =
    [
    ]
  endpointHeaders PostTerminalLocations{..} =
    [
    ]



{-
postTerminalLocations :: PostTerminalLocations
postTerminalLocations = PostTerminalLocations
-}
-- 
{- | <p>Returns a list of <code>Location</code> objects.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/terminal/locations
-}
-- TODO request options as enum
data GetTerminalLocations = GetTerminalLocations
  { getTerminalLocationsParams :: GetTerminalLocationsParams
  , getTerminalLocationsBody :: Maybe GetTerminalLocationsBody
  } deriving (Show, Eq, Generic)

data GetTerminalLocationsParams = GetTerminalLocationsParams
  {  getTerminalLocationsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTerminalLocationsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTerminalLocationsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTerminalLocationsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetTerminalLocationsBody
  = GetTerminalLocationsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTerminalLocations = "GET"
type instance RequestPath GetTerminalLocations = "/v1/terminal/locations"

instance RequestBuilder GetTerminalLocations where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTerminalLocations{..} =
    [ "v1"
    , "terminal"
    , "locations"
    ]
    where
      GetTerminalLocationsParams{..} = getTerminalLocationsParams
  endpointQuery GetTerminalLocations{..} =
    [ ("ending_before", queryFormExplode getTerminalLocationsEndingBefore)
    , ("expand", queryDeepObjectExplode getTerminalLocationsExpand)
    , ("limit", queryFormExplode getTerminalLocationsLimit)
    , ("starting_after", queryFormExplode getTerminalLocationsStartingAfter)
    ]
    where
      GetTerminalLocationsParams{..} = getTerminalLocationsParams
  endpointHeaders GetTerminalLocations{..} =
    [
    ]



{-
getTerminalLocations :: GetTerminalLocations
getTerminalLocations = GetTerminalLocations
-}
-- 
{- | <p>Returns a list of Issuing <code>Settlement</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/settlements
-}
-- TODO request options as enum
data GetIssuingSettlements = GetIssuingSettlements
  { getIssuingSettlementsParams :: GetIssuingSettlementsParams
  , getIssuingSettlementsBody :: Maybe GetIssuingSettlementsBody
  } deriving (Show, Eq, Generic)

data GetIssuingSettlementsParams = GetIssuingSettlementsParams
  {  getIssuingSettlementsCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return issuing settlements that were created during the given date interval. -}
  ,  getIssuingSettlementsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingSettlementsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingSettlementsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingSettlementsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetIssuingSettlementsBody
  = GetIssuingSettlementsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingSettlements = "GET"
type instance RequestPath GetIssuingSettlements = "/v1/issuing/settlements"

instance RequestBuilder GetIssuingSettlements where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingSettlements{..} =
    [ "v1"
    , "issuing"
    , "settlements"
    ]
    where
      GetIssuingSettlementsParams{..} = getIssuingSettlementsParams
  endpointQuery GetIssuingSettlements{..} =
    [ ("created", queryDeepObjectExplode getIssuingSettlementsCreated)
    , ("ending_before", queryFormExplode getIssuingSettlementsEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuingSettlementsExpand)
    , ("limit", queryFormExplode getIssuingSettlementsLimit)
    , ("starting_after", queryFormExplode getIssuingSettlementsStartingAfter)
    ]
    where
      GetIssuingSettlementsParams{..} = getIssuingSettlementsParams
  endpointHeaders GetIssuingSettlements{..} =
    [
    ]



{-
getIssuingSettlements :: GetIssuingSettlements
getIssuingSettlements = GetIssuingSettlements
-}
-- 
{- | <p>Create an apple pay domain.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/apple_pay/domains
-}
-- TODO request options as enum
data PostApplePayDomains = PostApplePayDomains
  { postApplePayDomainsParams :: PostApplePayDomainsParams
  , postApplePayDomainsBody :: PostApplePayDomainsBody
  } deriving (Show, Eq, Generic)

data PostApplePayDomainsParams = PostApplePayDomainsParams
  {
  } deriving (Show, Eq, Generic)

data PostApplePayDomainsBody
  = PostApplePayDomainsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostApplePayDomains = "POST"
type instance RequestPath PostApplePayDomains = "/v1/apple_pay/domains"

instance RequestBuilder PostApplePayDomains where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostApplePayDomains{..} =
    [ "v1"
    , "apple_pay"
    , "domains"
    ]
    where
      PostApplePayDomainsParams = postApplePayDomainsParams
  endpointQuery PostApplePayDomains{..} =
    [
    ]
  endpointHeaders PostApplePayDomains{..} =
    [
    ]



{-
postApplePayDomains :: PostApplePayDomains
postApplePayDomains = PostApplePayDomains
-}
-- 
{- | <p>List apple pay domains.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/apple_pay/domains
-}
-- TODO request options as enum
data GetApplePayDomains = GetApplePayDomains
  { getApplePayDomainsParams :: GetApplePayDomainsParams
  , getApplePayDomainsBody :: Maybe GetApplePayDomainsBody
  } deriving (Show, Eq, Generic)

data GetApplePayDomainsParams = GetApplePayDomainsParams
  {  getApplePayDomainsDomainName :: Maybe (Text)
  ,  getApplePayDomainsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getApplePayDomainsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getApplePayDomainsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getApplePayDomainsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetApplePayDomainsBody
  = GetApplePayDomainsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplePayDomains = "GET"
type instance RequestPath GetApplePayDomains = "/v1/apple_pay/domains"

instance RequestBuilder GetApplePayDomains where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplePayDomains{..} =
    [ "v1"
    , "apple_pay"
    , "domains"
    ]
    where
      GetApplePayDomainsParams{..} = getApplePayDomainsParams
  endpointQuery GetApplePayDomains{..} =
    [ ("domain_name", queryFormExplode getApplePayDomainsDomainName)
    , ("ending_before", queryFormExplode getApplePayDomainsEndingBefore)
    , ("expand", queryDeepObjectExplode getApplePayDomainsExpand)
    , ("limit", queryFormExplode getApplePayDomainsLimit)
    , ("starting_after", queryFormExplode getApplePayDomainsStartingAfter)
    ]
    where
      GetApplePayDomainsParams{..} = getApplePayDomainsParams
  endpointHeaders GetApplePayDomains{..} =
    [
    ]



{-
getApplePayDomains :: GetApplePayDomains
getApplePayDomains = GetApplePayDomains
-}
-- 
{- | 

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/discount
-}
-- TODO request options as enum
data GetCustomersCustomerDiscount = GetCustomersCustomerDiscount
  { getCustomersCustomerDiscountParams :: GetCustomersCustomerDiscountParams
  , getCustomersCustomerDiscountBody :: Maybe GetCustomersCustomerDiscountBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerDiscountParams = GetCustomersCustomerDiscountParams
  {  getCustomersCustomerDiscountCustomer :: (Text)
  ,  getCustomersCustomerDiscountExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerDiscountBody
  = GetCustomersCustomerDiscountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerDiscount = "GET"
type instance RequestPath GetCustomersCustomerDiscount = "/v1/customers/{customer}/discount"

instance RequestBuilder GetCustomersCustomerDiscount where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerDiscount{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerDiscountCustomer
    , "discount"
    ]
    where
      GetCustomersCustomerDiscountParams{..} = getCustomersCustomerDiscountParams
  endpointQuery GetCustomersCustomerDiscount{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerDiscountExpand)
    ]
  endpointHeaders GetCustomersCustomerDiscount{..} =
    [
    ]



{-
getCustomersCustomerDiscount :: GetCustomersCustomerDiscount
getCustomersCustomerDiscount = GetCustomersCustomerDiscount
-}
-- 
{- | <p>Removes the currently applied discount on a customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/discount
-}
-- TODO request options as enum
data DeleteCustomersCustomerDiscount = DeleteCustomersCustomerDiscount
  { deleteCustomersCustomerDiscountParams :: DeleteCustomersCustomerDiscountParams
  , deleteCustomersCustomerDiscountBody :: Maybe DeleteCustomersCustomerDiscountBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerDiscountParams = DeleteCustomersCustomerDiscountParams
  {  deleteCustomersCustomerDiscountCustomer :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerDiscountBody
  = DeleteCustomersCustomerDiscountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerDiscount = "DELETE"
type instance RequestPath DeleteCustomersCustomerDiscount = "/v1/customers/{customer}/discount"

instance RequestBuilder DeleteCustomersCustomerDiscount where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerDiscount{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerDiscountCustomer
    , "discount"
    ]
    where
      DeleteCustomersCustomerDiscountParams{..} = deleteCustomersCustomerDiscountParams
  endpointQuery DeleteCustomersCustomerDiscount{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerDiscount{..} =
    [
    ]



{-
deleteCustomersCustomerDiscount :: DeleteCustomersCustomerDiscount
deleteCustomersCustomerDiscount = DeleteCustomersCustomerDiscount
-}
-- 
{- | <p>Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}
-}
-- TODO request options as enum
data PostChargesCharge = PostChargesCharge
  { postChargesChargeParams :: PostChargesChargeParams
  , postChargesChargeBody :: Maybe PostChargesChargeBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeParams = PostChargesChargeParams
  {  postChargesChargeCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeBody
  = PostChargesChargeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesCharge = "POST"
type instance RequestPath PostChargesCharge = "/v1/charges/{charge}"

instance RequestBuilder PostChargesCharge where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesCharge{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeCharge
    ]
    where
      PostChargesChargeParams{..} = postChargesChargeParams
  endpointQuery PostChargesCharge{..} =
    [
    ]
  endpointHeaders PostChargesCharge{..} =
    [
    ]



{-
postChargesCharge :: PostChargesCharge
postChargesCharge = PostChargesCharge
-}
-- 
{- | <p>Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/charges/{charge}
-}
-- TODO request options as enum
data GetChargesCharge = GetChargesCharge
  { getChargesChargeParams :: GetChargesChargeParams
  , getChargesChargeBody :: Maybe GetChargesChargeBody
  } deriving (Show, Eq, Generic)

data GetChargesChargeParams = GetChargesChargeParams
  {  getChargesChargeCharge :: (Text)
  {- ^ The identifier of the charge to be retrieved. -}
  ,  getChargesChargeExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetChargesChargeBody
  = GetChargesChargeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetChargesCharge = "GET"
type instance RequestPath GetChargesCharge = "/v1/charges/{charge}"

instance RequestBuilder GetChargesCharge where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetChargesCharge{..} =
    [ "v1"
    , "charges"
    , pathSimple getChargesChargeCharge
    ]
    where
      GetChargesChargeParams{..} = getChargesChargeParams
  endpointQuery GetChargesCharge{..} =
    [ ("expand", queryDeepObjectExplode getChargesChargeExpand)
    ]
  endpointHeaders GetChargesCharge{..} =
    [
    ]



{-
getChargesCharge :: GetChargesCharge
getChargesCharge = GetChargesCharge
-}
-- 
{- | <p>To send funds from your Stripe account to a connected account, you create a new transfer object. Your <a href="#balance">Stripe balance</a> must be able to cover the transfer amount, or you’ll receive an “Insufficient Funds” error.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/transfers
-}
-- TODO request options as enum
data PostTransfers = PostTransfers
  { postTransfersParams :: PostTransfersParams
  , postTransfersBody :: PostTransfersBody
  } deriving (Show, Eq, Generic)

data PostTransfersParams = PostTransfersParams
  {
  } deriving (Show, Eq, Generic)

data PostTransfersBody
  = PostTransfersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTransfers = "POST"
type instance RequestPath PostTransfers = "/v1/transfers"

instance RequestBuilder PostTransfers where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTransfers{..} =
    [ "v1"
    , "transfers"
    ]
    where
      PostTransfersParams = postTransfersParams
  endpointQuery PostTransfers{..} =
    [
    ]
  endpointHeaders PostTransfers{..} =
    [
    ]



{-
postTransfers :: PostTransfers
postTransfers = PostTransfers
-}
-- 
{- | <p>Returns a list of existing transfers sent to connected accounts. The transfers are returned in sorted order, with the most recently created transfers appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/transfers
-}
-- TODO request options as enum
data GetTransfers = GetTransfers
  { getTransfersParams :: GetTransfersParams
  , getTransfersBody :: Maybe GetTransfersBody
  } deriving (Show, Eq, Generic)

data GetTransfersParams = GetTransfersParams
  {  getTransfersCreated :: Maybe (Either (Object) (Int))
  ,  getTransfersDestination :: Maybe (Text)
  {- ^ Only return transfers for the destination specified by this account ID. -}
  ,  getTransfersEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTransfersExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTransfersLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTransfersStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getTransfersTransferGroup :: Maybe (Text)
  {- ^ Only return transfers with the specified transfer group. -}
  } deriving (Show, Eq, Generic)

data GetTransfersBody
  = GetTransfersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTransfers = "GET"
type instance RequestPath GetTransfers = "/v1/transfers"

instance RequestBuilder GetTransfers where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTransfers{..} =
    [ "v1"
    , "transfers"
    ]
    where
      GetTransfersParams{..} = getTransfersParams
  endpointQuery GetTransfers{..} =
    [ ("created", queryDeepObjectExplode getTransfersCreated)
    , ("destination", queryFormExplode getTransfersDestination)
    , ("ending_before", queryFormExplode getTransfersEndingBefore)
    , ("expand", queryDeepObjectExplode getTransfersExpand)
    , ("limit", queryFormExplode getTransfersLimit)
    , ("starting_after", queryFormExplode getTransfersStartingAfter)
    , ("transfer_group", queryFormExplode getTransfersTransferGroup)
    ]
    where
      GetTransfersParams{..} = getTransfersParams
  endpointHeaders GetTransfers{..} =
    [
    ]



{-
getTransfers :: GetTransfers
getTransfers = GetTransfers
-}
-- 
{- | <p>Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you <a href="#create_charge">created a charge</a> with the capture option set to false.</p>

<p>Uncaptured payments expire exactly seven days after they are created. If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/capture
-}
-- TODO request options as enum
data PostChargesChargeCapture = PostChargesChargeCapture
  { postChargesChargeCaptureParams :: PostChargesChargeCaptureParams
  , postChargesChargeCaptureBody :: Maybe PostChargesChargeCaptureBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeCaptureParams = PostChargesChargeCaptureParams
  {  postChargesChargeCaptureCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeCaptureBody
  = PostChargesChargeCaptureBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeCapture = "POST"
type instance RequestPath PostChargesChargeCapture = "/v1/charges/{charge}/capture"

instance RequestBuilder PostChargesChargeCapture where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeCapture{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeCaptureCharge
    , "capture"
    ]
    where
      PostChargesChargeCaptureParams{..} = postChargesChargeCaptureParams
  endpointQuery PostChargesChargeCapture{..} =
    [
    ]
  endpointHeaders PostChargesChargeCapture{..} =
    [
    ]



{-
postChargesChargeCapture :: PostChargesChargeCapture
postChargesChargeCapture = PostChargesChargeCapture
-}
-- 
{- | <p>Creates a new <code>ValueListItem</code> object, which is added to the specified parent value list.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/radar/value_list_items
-}
-- TODO request options as enum
data PostRadarValueListItems = PostRadarValueListItems
  { postRadarValueListItemsParams :: PostRadarValueListItemsParams
  , postRadarValueListItemsBody :: PostRadarValueListItemsBody
  } deriving (Show, Eq, Generic)

data PostRadarValueListItemsParams = PostRadarValueListItemsParams
  {
  } deriving (Show, Eq, Generic)

data PostRadarValueListItemsBody
  = PostRadarValueListItemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRadarValueListItems = "POST"
type instance RequestPath PostRadarValueListItems = "/v1/radar/value_list_items"

instance RequestBuilder PostRadarValueListItems where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRadarValueListItems{..} =
    [ "v1"
    , "radar"
    , "value_list_items"
    ]
    where
      PostRadarValueListItemsParams = postRadarValueListItemsParams
  endpointQuery PostRadarValueListItems{..} =
    [
    ]
  endpointHeaders PostRadarValueListItems{..} =
    [
    ]



{-
postRadarValueListItems :: PostRadarValueListItems
postRadarValueListItems = PostRadarValueListItems
-}
-- 
{- | <p>Returns a list of <code>ValueListItem</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/value_list_items
-}
-- TODO request options as enum
data GetRadarValueListItems = GetRadarValueListItems
  { getRadarValueListItemsParams :: GetRadarValueListItemsParams
  , getRadarValueListItemsBody :: Maybe GetRadarValueListItemsBody
  } deriving (Show, Eq, Generic)

data GetRadarValueListItemsParams = GetRadarValueListItemsParams
  {  getRadarValueListItemsCreated :: Maybe (Either (Object) (Int))
  ,  getRadarValueListItemsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getRadarValueListItemsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRadarValueListItemsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getRadarValueListItemsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getRadarValueListItemsValue :: Maybe (Text)
  {- ^ Return items belonging to the parent list whose value matches the specified value (using an "is like" match). -}
  ,  getRadarValueListItemsValueList :: (Text)
  {- ^ Identifier for the parent value list this item belongs to. -}
  } deriving (Show, Eq, Generic)

data GetRadarValueListItemsBody
  = GetRadarValueListItemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarValueListItems = "GET"
type instance RequestPath GetRadarValueListItems = "/v1/radar/value_list_items"

instance RequestBuilder GetRadarValueListItems where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarValueListItems{..} =
    [ "v1"
    , "radar"
    , "value_list_items"
    ]
    where
      GetRadarValueListItemsParams{..} = getRadarValueListItemsParams
  endpointQuery GetRadarValueListItems{..} =
    [ ("created", queryDeepObjectExplode getRadarValueListItemsCreated)
    , ("ending_before", queryFormExplode getRadarValueListItemsEndingBefore)
    , ("expand", queryDeepObjectExplode getRadarValueListItemsExpand)
    , ("limit", queryFormExplode getRadarValueListItemsLimit)
    , ("starting_after", queryFormExplode getRadarValueListItemsStartingAfter)
    , ("value", queryFormExplode getRadarValueListItemsValue)
    , ("value_list", queryFormExplode getRadarValueListItemsValueList)
    ]
    where
      GetRadarValueListItemsParams{..} = getRadarValueListItemsParams
  endpointHeaders GetRadarValueListItems{..} =
    [
    ]



{-
getRadarValueListItems :: GetRadarValueListItems
getRadarValueListItems = GetRadarValueListItems
-}
-- 
{- | <p>List bitcoin transacitons for a given receiver.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/bitcoin/transactions
-}
-- TODO request options as enum
data GetBitcoinTransactions = GetBitcoinTransactions
  { getBitcoinTransactionsParams :: GetBitcoinTransactionsParams
  , getBitcoinTransactionsBody :: Maybe GetBitcoinTransactionsBody
  } deriving (Show, Eq, Generic)

data GetBitcoinTransactionsParams = GetBitcoinTransactionsParams
  {  getBitcoinTransactionsCustomer :: Maybe (Text)
  {- ^ Only return transactions for the customer specified by this customer ID. -}
  ,  getBitcoinTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getBitcoinTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBitcoinTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getBitcoinTransactionsReceiver :: Maybe (Text)
  {- ^ Only return transactions for the receiver specified by this receiver ID. -}
  ,  getBitcoinTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetBitcoinTransactionsBody
  = GetBitcoinTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBitcoinTransactions = "GET"
type instance RequestPath GetBitcoinTransactions = "/v1/bitcoin/transactions"

instance RequestBuilder GetBitcoinTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBitcoinTransactions{..} =
    [ "v1"
    , "bitcoin"
    , "transactions"
    ]
    where
      GetBitcoinTransactionsParams{..} = getBitcoinTransactionsParams
  endpointQuery GetBitcoinTransactions{..} =
    [ ("customer", queryFormExplode getBitcoinTransactionsCustomer)
    , ("ending_before", queryFormExplode getBitcoinTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getBitcoinTransactionsExpand)
    , ("limit", queryFormExplode getBitcoinTransactionsLimit)
    , ("receiver", queryFormExplode getBitcoinTransactionsReceiver)
    , ("starting_after", queryFormExplode getBitcoinTransactionsStartingAfter)
    ]
    where
      GetBitcoinTransactionsParams{..} = getBitcoinTransactionsParams
  endpointHeaders GetBitcoinTransactions{..} =
    [
    ]



{-
getBitcoinTransactions :: GetBitcoinTransactions
getBitcoinTransactions = GetBitcoinTransactions
-}
-- {-# DEPRECATED getBitcoinTransactions, GetBitcoinTransactions "This endpoint is deprecated by the API creator" #-}
{- | <p>Creates a single-use token that represents a bank account’s details.
This token can be used with any API method in place of a bank account dictionary. This token can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/tokens
-}
-- TODO request options as enum
data PostTokens = PostTokens
  { postTokensParams :: PostTokensParams
  , postTokensBody :: Maybe PostTokensBody
  } deriving (Show, Eq, Generic)

data PostTokensParams = PostTokensParams
  {
  } deriving (Show, Eq, Generic)

data PostTokensBody
  = PostTokensBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTokens = "POST"
type instance RequestPath PostTokens = "/v1/tokens"

instance RequestBuilder PostTokens where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTokens{..} =
    [ "v1"
    , "tokens"
    ]
    where
      PostTokensParams = postTokensParams
  endpointQuery PostTokens{..} =
    [
    ]
  endpointHeaders PostTokens{..} =
    [
    ]



{-
postTokens :: PostTokens
postTokens = PostTokens
-}
-- 
{- | <p>Creates a new <code>TaxID</code> object for a customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/tax_ids
-}
-- TODO request options as enum
data PostCustomersCustomerTaxIds = PostCustomersCustomerTaxIds
  { postCustomersCustomerTaxIdsParams :: PostCustomersCustomerTaxIdsParams
  , postCustomersCustomerTaxIdsBody :: PostCustomersCustomerTaxIdsBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerTaxIdsParams = PostCustomersCustomerTaxIdsParams
  {  postCustomersCustomerTaxIdsCustomer :: (Text)
  {- ^ ID of the customer. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerTaxIdsBody
  = PostCustomersCustomerTaxIdsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerTaxIds = "POST"
type instance RequestPath PostCustomersCustomerTaxIds = "/v1/customers/{customer}/tax_ids"

instance RequestBuilder PostCustomersCustomerTaxIds where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerTaxIds{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerTaxIdsCustomer
    , "tax_ids"
    ]
    where
      PostCustomersCustomerTaxIdsParams{..} = postCustomersCustomerTaxIdsParams
  endpointQuery PostCustomersCustomerTaxIds{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerTaxIds{..} =
    [
    ]



{-
postCustomersCustomerTaxIds :: PostCustomersCustomerTaxIds
postCustomersCustomerTaxIds = PostCustomersCustomerTaxIds
-}
-- 
{- | <p>Returns a list of tax IDs for a customer.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/tax_ids
-}
-- TODO request options as enum
data GetCustomersCustomerTaxIds = GetCustomersCustomerTaxIds
  { getCustomersCustomerTaxIdsParams :: GetCustomersCustomerTaxIdsParams
  , getCustomersCustomerTaxIdsBody :: Maybe GetCustomersCustomerTaxIdsBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerTaxIdsParams = GetCustomersCustomerTaxIdsParams
  {  getCustomersCustomerTaxIdsCustomer :: (Text)
  {- ^ ID of the customer whose tax IDs will be retrieved. -}
  ,  getCustomersCustomerTaxIdsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerTaxIdsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerTaxIdsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerTaxIdsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerTaxIdsBody
  = GetCustomersCustomerTaxIdsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerTaxIds = "GET"
type instance RequestPath GetCustomersCustomerTaxIds = "/v1/customers/{customer}/tax_ids"

instance RequestBuilder GetCustomersCustomerTaxIds where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerTaxIds{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerTaxIdsCustomer
    , "tax_ids"
    ]
    where
      GetCustomersCustomerTaxIdsParams{..} = getCustomersCustomerTaxIdsParams
  endpointQuery GetCustomersCustomerTaxIds{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerTaxIdsEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerTaxIdsExpand)
    , ("limit", queryFormExplode getCustomersCustomerTaxIdsLimit)
    , ("starting_after", queryFormExplode getCustomersCustomerTaxIdsStartingAfter)
    ]
    where
      GetCustomersCustomerTaxIdsParams{..} = getCustomersCustomerTaxIdsParams
  endpointHeaders GetCustomersCustomerTaxIds{..} =
    [
    ]



{-
getCustomersCustomerTaxIds :: GetCustomersCustomerTaxIds
getCustomersCustomerTaxIds = GetCustomersCustomerTaxIds
-}
-- 
{- | <p>Retrieves a 3D Secure object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/3d_secure/{three_d_secure}
-}
-- TODO request options as enum
data Get3dSecureThreeDSecure = Get3dSecureThreeDSecure
  { get3dSecureThreeDSecureParams :: Get3dSecureThreeDSecureParams
  , get3dSecureThreeDSecureBody :: Maybe Get3dSecureThreeDSecureBody
  } deriving (Show, Eq, Generic)

data Get3dSecureThreeDSecureParams = Get3dSecureThreeDSecureParams
  {  get3dSecureThreeDSecureExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  get3dSecureThreeDSecureThreeDSecure :: (Text)
  {- ^ The identifier of the 3D Secure object to be retrieved. -}
  } deriving (Show, Eq, Generic)

data Get3dSecureThreeDSecureBody
  = Get3dSecureThreeDSecureBody
  deriving (Show, Eq, Generic)

type instance RequestMethod Get3dSecureThreeDSecure = "GET"
type instance RequestPath Get3dSecureThreeDSecure = "/v1/3d_secure/{three_d_secure}"

instance RequestBuilder Get3dSecureThreeDSecure where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath Get3dSecureThreeDSecure{..} =
    [ "v1"
    , "3d_secure"
    , pathSimple get3dSecureThreeDSecureThreeDSecure
    ]
    where
      Get3dSecureThreeDSecureParams{..} = get3dSecureThreeDSecureParams
  endpointQuery Get3dSecureThreeDSecure{..} =
    [ ("expand", queryDeepObjectExplode get3dSecureThreeDSecureExpand)
    ]
  endpointHeaders Get3dSecureThreeDSecure{..} =
    [
    ]



{-
get3dSecureThreeDSecure :: Get3dSecureThreeDSecure
get3dSecureThreeDSecure = Get3dSecureThreeDSecure
-}
-- 
{- | <p>Create an external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/external_accounts
-}
-- TODO request options as enum
data PostAccountExternalAccounts = PostAccountExternalAccounts
  { postAccountExternalAccountsParams :: PostAccountExternalAccountsParams
  , postAccountExternalAccountsBody :: Maybe PostAccountExternalAccountsBody
  } deriving (Show, Eq, Generic)

data PostAccountExternalAccountsParams = PostAccountExternalAccountsParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountExternalAccountsBody
  = PostAccountExternalAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountExternalAccounts = "POST"
type instance RequestPath PostAccountExternalAccounts = "/v1/account/external_accounts"

instance RequestBuilder PostAccountExternalAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountExternalAccounts{..} =
    [ "v1"
    , "account"
    , "external_accounts"
    ]
    where
      PostAccountExternalAccountsParams = postAccountExternalAccountsParams
  endpointQuery PostAccountExternalAccounts{..} =
    [
    ]
  endpointHeaders PostAccountExternalAccounts{..} =
    [
    ]



{-
postAccountExternalAccounts :: PostAccountExternalAccounts
postAccountExternalAccounts = PostAccountExternalAccounts
-}
-- 
{- | <p>List external accounts for an account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/external_accounts
-}
-- TODO request options as enum
data GetAccountExternalAccounts = GetAccountExternalAccounts
  { getAccountExternalAccountsParams :: GetAccountExternalAccountsParams
  , getAccountExternalAccountsBody :: Maybe GetAccountExternalAccountsBody
  } deriving (Show, Eq, Generic)

data GetAccountExternalAccountsParams = GetAccountExternalAccountsParams
  {  getAccountExternalAccountsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountExternalAccountsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountExternalAccountsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountExternalAccountsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountExternalAccountsBody
  = GetAccountExternalAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountExternalAccounts = "GET"
type instance RequestPath GetAccountExternalAccounts = "/v1/account/external_accounts"

instance RequestBuilder GetAccountExternalAccounts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountExternalAccounts{..} =
    [ "v1"
    , "account"
    , "external_accounts"
    ]
    where
      GetAccountExternalAccountsParams{..} = getAccountExternalAccountsParams
  endpointQuery GetAccountExternalAccounts{..} =
    [ ("ending_before", queryFormExplode getAccountExternalAccountsEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountExternalAccountsExpand)
    , ("limit", queryFormExplode getAccountExternalAccountsLimit)
    , ("starting_after", queryFormExplode getAccountExternalAccountsStartingAfter)
    ]
    where
      GetAccountExternalAccountsParams{..} = getAccountExternalAccountsParams
  endpointHeaders GetAccountExternalAccounts{..} =
    [
    ]



{-
getAccountExternalAccounts :: GetAccountExternalAccounts
getAccountExternalAccounts = GetAccountExternalAccounts
-}
-- 
{- | <p>Returns a list of Issuing <code>Transaction</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/transactions
-}
-- TODO request options as enum
data GetIssuingTransactions = GetIssuingTransactions
  { getIssuingTransactionsParams :: GetIssuingTransactionsParams
  , getIssuingTransactionsBody :: Maybe GetIssuingTransactionsBody
  } deriving (Show, Eq, Generic)

data GetIssuingTransactionsParams = GetIssuingTransactionsParams
  {  getIssuingTransactionsCard :: Maybe (Text)
  {- ^ Only return issuing transactions that belong to the given card. -}
  ,  getIssuingTransactionsCardholder :: Maybe (Text)
  {- ^ Only return authorizations belonging to the given cardholder. -}
  ,  getIssuingTransactionsCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return transactions that were created during the given date interval. -}
  ,  getIssuingTransactionsDispute :: Maybe (Text)
  {- ^ Only return transactions that originate from a given dispute. -}
  ,  getIssuingTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingTransactionsSettlement :: Maybe (Text)
  {- ^ Only return transactions that are associated with the given settlement. -}
  ,  getIssuingTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetIssuingTransactionsBody
  = GetIssuingTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingTransactions = "GET"
type instance RequestPath GetIssuingTransactions = "/v1/issuing/transactions"

instance RequestBuilder GetIssuingTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingTransactions{..} =
    [ "v1"
    , "issuing"
    , "transactions"
    ]
    where
      GetIssuingTransactionsParams{..} = getIssuingTransactionsParams
  endpointQuery GetIssuingTransactions{..} =
    [ ("card", queryFormExplode getIssuingTransactionsCard)
    , ("cardholder", queryFormExplode getIssuingTransactionsCardholder)
    , ("created", queryDeepObjectExplode getIssuingTransactionsCreated)
    , ("dispute", queryFormExplode getIssuingTransactionsDispute)
    , ("ending_before", queryFormExplode getIssuingTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuingTransactionsExpand)
    , ("limit", queryFormExplode getIssuingTransactionsLimit)
    , ("settlement", queryFormExplode getIssuingTransactionsSettlement)
    , ("starting_after", queryFormExplode getIssuingTransactionsStartingAfter)
    ]
    where
      GetIssuingTransactionsParams{..} = getIssuingTransactionsParams
  endpointHeaders GetIssuingTransactions{..} =
    [
    ]



{-
getIssuingTransactions :: GetIssuingTransactions
getIssuingTransactions = GetIssuingTransactions
-}
-- 
{- | <p>Verify a specified bank account for a given customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/bank_accounts/{id}/verify
-}
-- TODO request options as enum
data PostCustomersCustomerBankAccountsIdVerify = PostCustomersCustomerBankAccountsIdVerify
  { postCustomersCustomerBankAccountsIdVerifyParams :: PostCustomersCustomerBankAccountsIdVerifyParams
  , postCustomersCustomerBankAccountsIdVerifyBody :: Maybe PostCustomersCustomerBankAccountsIdVerifyBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsIdVerifyParams = PostCustomersCustomerBankAccountsIdVerifyParams
  {  postCustomersCustomerBankAccountsIdVerifyCustomer :: (Text)
  ,  postCustomersCustomerBankAccountsIdVerifyId :: (Text)
  {- ^ The ID of the source to be verified. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsIdVerifyBody
  = PostCustomersCustomerBankAccountsIdVerifyBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerBankAccountsIdVerify = "POST"
type instance RequestPath PostCustomersCustomerBankAccountsIdVerify = "/v1/customers/{customer}/bank_accounts/{id}/verify"

instance RequestBuilder PostCustomersCustomerBankAccountsIdVerify where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerBankAccountsIdVerify{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerBankAccountsIdVerifyCustomer
    , "bank_accounts"
    , pathSimple postCustomersCustomerBankAccountsIdVerifyId
    , "verify"
    ]
    where
      PostCustomersCustomerBankAccountsIdVerifyParams{..} = postCustomersCustomerBankAccountsIdVerifyParams
  endpointQuery PostCustomersCustomerBankAccountsIdVerify{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerBankAccountsIdVerify{..} =
    [
    ]



{-
postCustomersCustomerBankAccountsIdVerify :: PostCustomersCustomerBankAccountsIdVerify
postCustomersCustomerBankAccountsIdVerify = PostCustomersCustomerBankAccountsIdVerify
-}
-- 
{- | <p>Creates a new subscription on an existing customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscriptions
-}
-- TODO request options as enum
data PostSubscriptions = PostSubscriptions
  { postSubscriptionsParams :: PostSubscriptionsParams
  , postSubscriptionsBody :: PostSubscriptionsBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionsParams = PostSubscriptionsParams
  {
  } deriving (Show, Eq, Generic)

data PostSubscriptionsBody
  = PostSubscriptionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptions = "POST"
type instance RequestPath PostSubscriptions = "/v1/subscriptions"

instance RequestBuilder PostSubscriptions where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptions{..} =
    [ "v1"
    , "subscriptions"
    ]
    where
      PostSubscriptionsParams = postSubscriptionsParams
  endpointQuery PostSubscriptions{..} =
    [
    ]
  endpointHeaders PostSubscriptions{..} =
    [
    ]



{-
postSubscriptions :: PostSubscriptions
postSubscriptions = PostSubscriptions
-}
-- 
{- | <p>By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify <code>status=canceled</code>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscriptions
-}
-- TODO request options as enum
data GetSubscriptions = GetSubscriptions
  { getSubscriptionsParams :: GetSubscriptionsParams
  , getSubscriptionsBody :: Maybe GetSubscriptionsBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionsParams = GetSubscriptionsParams
  {  getSubscriptionsBilling :: Maybe (Billing)
  {- ^ This field has been renamed to `collection_method` and will be removed in a future API version. -}
  ,  getSubscriptionsCollectionMethod :: Maybe (CollectionMethod)
  {- ^ The collection method of the subscriptions to retrieve. Either `charge_automatically` or `send_invoice`. -}
  ,  getSubscriptionsCreated :: Maybe (Either (Object) (Int))
  ,  getSubscriptionsCurrentPeriodEnd :: Maybe (Either (Object) (Int))
  ,  getSubscriptionsCurrentPeriodStart :: Maybe (Either (Object) (Int))
  ,  getSubscriptionsCustomer :: Maybe (Text)
  {- ^ The ID of the customer whose subscriptions will be retrieved. -}
  ,  getSubscriptionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSubscriptionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSubscriptionsPlan :: Maybe (Text)
  {- ^ The ID of the plan whose subscriptions will be retrieved. -}
  ,  getSubscriptionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getSubscriptionsStatus :: Maybe (Status)
  {- ^ The status of the subscriptions to retrieve. One of: `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `unpaid`, `canceled`, or `all`. Passing in a value of `canceled` will return all canceled subscriptions, including those belonging to deleted customers. Passing in a value of `all` will return subscriptions of all statuses. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionsBody
  = GetSubscriptionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptions = "GET"
type instance RequestPath GetSubscriptions = "/v1/subscriptions"

instance RequestBuilder GetSubscriptions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptions{..} =
    [ "v1"
    , "subscriptions"
    ]
    where
      GetSubscriptionsParams{..} = getSubscriptionsParams
  endpointQuery GetSubscriptions{..} =
    [ ("billing", queryFormExplode getSubscriptionsBilling)
    , ("collection_method", queryFormExplode getSubscriptionsCollectionMethod)
    , ("created", queryDeepObjectExplode getSubscriptionsCreated)
    , ("current_period_end", queryDeepObjectExplode getSubscriptionsCurrentPeriodEnd)
    , ("current_period_start", queryDeepObjectExplode getSubscriptionsCurrentPeriodStart)
    , ("customer", queryFormExplode getSubscriptionsCustomer)
    , ("ending_before", queryFormExplode getSubscriptionsEndingBefore)
    , ("expand", queryDeepObjectExplode getSubscriptionsExpand)
    , ("limit", queryFormExplode getSubscriptionsLimit)
    , ("plan", queryFormExplode getSubscriptionsPlan)
    , ("starting_after", queryFormExplode getSubscriptionsStartingAfter)
    , ("status", queryFormExplode getSubscriptionsStatus)
    ]
    where
      GetSubscriptionsParams{..} = getSubscriptionsParams
  endpointHeaders GetSubscriptions{..} =
    [
    ]



{-
getSubscriptions :: GetSubscriptions
getSubscriptions = GetSubscriptions
-}
-- 
{- | <p>Creates a new Issuing <code>Cardholder</code> object that can be issued cards.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/cardholders
-}
-- TODO request options as enum
data PostIssuingCardholders = PostIssuingCardholders
  { postIssuingCardholdersParams :: PostIssuingCardholdersParams
  , postIssuingCardholdersBody :: PostIssuingCardholdersBody
  } deriving (Show, Eq, Generic)

data PostIssuingCardholdersParams = PostIssuingCardholdersParams
  {
  } deriving (Show, Eq, Generic)

data PostIssuingCardholdersBody
  = PostIssuingCardholdersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingCardholders = "POST"
type instance RequestPath PostIssuingCardholders = "/v1/issuing/cardholders"

instance RequestBuilder PostIssuingCardholders where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingCardholders{..} =
    [ "v1"
    , "issuing"
    , "cardholders"
    ]
    where
      PostIssuingCardholdersParams = postIssuingCardholdersParams
  endpointQuery PostIssuingCardholders{..} =
    [
    ]
  endpointHeaders PostIssuingCardholders{..} =
    [
    ]



{-
postIssuingCardholders :: PostIssuingCardholders
postIssuingCardholders = PostIssuingCardholders
-}
-- 
{- | <p>Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cardholders
-}
-- TODO request options as enum
data GetIssuingCardholders = GetIssuingCardholders
  { getIssuingCardholdersParams :: GetIssuingCardholdersParams
  , getIssuingCardholdersBody :: Maybe GetIssuingCardholdersBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardholdersParams = GetIssuingCardholdersParams
  {  getIssuingCardholdersCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return cardholders that were created during the given date interval. -}
  ,  getIssuingCardholdersEmail :: Maybe (Text)
  {- ^ Only return cardholders that have the given email address. -}
  ,  getIssuingCardholdersEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingCardholdersExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingCardholdersIsDefault :: Maybe (Bool)
  {- ^ Only return the default cardholder. -}
  ,  getIssuingCardholdersLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingCardholdersPhoneNumber :: Maybe (Text)
  {- ^ Only return cardholders that have the given phone number. -}
  ,  getIssuingCardholdersStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getIssuingCardholdersStatus :: Maybe (Status)
  {- ^ Only return cardholders that have the given status. One of `active`, `inactive`, or `blocked`. -}
  ,  getIssuingCardholdersType :: Maybe (Type)
  {- ^ Only return cardholders that have the given type. One of `individual` or `business_entity`. -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardholdersBody
  = GetIssuingCardholdersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCardholders = "GET"
type instance RequestPath GetIssuingCardholders = "/v1/issuing/cardholders"

instance RequestBuilder GetIssuingCardholders where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCardholders{..} =
    [ "v1"
    , "issuing"
    , "cardholders"
    ]
    where
      GetIssuingCardholdersParams{..} = getIssuingCardholdersParams
  endpointQuery GetIssuingCardholders{..} =
    [ ("created", queryDeepObjectExplode getIssuingCardholdersCreated)
    , ("email", queryFormExplode getIssuingCardholdersEmail)
    , ("ending_before", queryFormExplode getIssuingCardholdersEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuingCardholdersExpand)
    , ("is_default", queryFormExplode getIssuingCardholdersIsDefault)
    , ("limit", queryFormExplode getIssuingCardholdersLimit)
    , ("phone_number", queryFormExplode getIssuingCardholdersPhoneNumber)
    , ("starting_after", queryFormExplode getIssuingCardholdersStartingAfter)
    , ("status", queryFormExplode getIssuingCardholdersStatus)
    , ("type", queryFormExplode getIssuingCardholdersType)
    ]
    where
      GetIssuingCardholdersParams{..} = getIssuingCardholdersParams
  endpointHeaders GetIssuingCardholders{..} =
    [
    ]



{-
getIssuingCardholders :: GetIssuingCardholders
getIssuingCardholders = GetIssuingCardholders
-}
-- 
{- | <p>For the specified subscription item, returns a list of summary objects. Each object in the list provides usage information that’s been summarized from multiple usage records and over a subscription billing period (e.g., 15 usage records in the billing plan’s month of September).</p>

<p>The list is sorted in reverse-chronological order (newest first). The first list item represents the most current usage period that hasn’t ended yet. Since new usage records can still be added, the returned summary information for the subscription item’s ID should be seen as unstable until the subscription billing period ends.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscription_items/{subscription_item}/usage_record_summaries
-}
-- TODO request options as enum
data GetSubscriptionItemsSubscriptionItemUsageRecordSummaries = GetSubscriptionItemsSubscriptionItemUsageRecordSummaries
  { getSubscriptionItemsSubscriptionItemUsageRecordSummariesParams :: GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams
  , getSubscriptionItemsSubscriptionItemUsageRecordSummariesBody :: Maybe GetSubscriptionItemsSubscriptionItemUsageRecordSummariesBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams = GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams
  {  getSubscriptionItemsSubscriptionItemUsageRecordSummariesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSubscriptionItemsSubscriptionItemUsageRecordSummariesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionItemsSubscriptionItemUsageRecordSummariesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSubscriptionItemsSubscriptionItemUsageRecordSummariesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getSubscriptionItemsSubscriptionItemUsageRecordSummariesSubscriptionItem :: (Text)
  {- ^ Only summary items for the given subscription item. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsSubscriptionItemUsageRecordSummariesBody
  = GetSubscriptionItemsSubscriptionItemUsageRecordSummariesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionItemsSubscriptionItemUsageRecordSummaries = "GET"
type instance RequestPath GetSubscriptionItemsSubscriptionItemUsageRecordSummaries = "/v1/subscription_items/{subscription_item}/usage_record_summaries"

instance RequestBuilder GetSubscriptionItemsSubscriptionItemUsageRecordSummaries where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionItemsSubscriptionItemUsageRecordSummaries{..} =
    [ "v1"
    , "subscription_items"
    , pathSimple getSubscriptionItemsSubscriptionItemUsageRecordSummariesSubscriptionItem
    , "usage_record_summaries"
    ]
    where
      GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams{..} = getSubscriptionItemsSubscriptionItemUsageRecordSummariesParams
  endpointQuery GetSubscriptionItemsSubscriptionItemUsageRecordSummaries{..} =
    [ ("ending_before", queryFormExplode getSubscriptionItemsSubscriptionItemUsageRecordSummariesEndingBefore)
    , ("expand", queryDeepObjectExplode getSubscriptionItemsSubscriptionItemUsageRecordSummariesExpand)
    , ("limit", queryFormExplode getSubscriptionItemsSubscriptionItemUsageRecordSummariesLimit)
    , ("starting_after", queryFormExplode getSubscriptionItemsSubscriptionItemUsageRecordSummariesStartingAfter)
    ]
    where
      GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams{..} = getSubscriptionItemsSubscriptionItemUsageRecordSummariesParams
  endpointHeaders GetSubscriptionItemsSubscriptionItemUsageRecordSummaries{..} =
    [
    ]



{-
getSubscriptionItemsSubscriptionItemUsageRecordSummaries :: GetSubscriptionItemsSubscriptionItemUsageRecordSummaries
getSubscriptionItemsSubscriptionItemUsageRecordSummaries = GetSubscriptionItemsSubscriptionItemUsageRecordSummaries
-}
-- 
{- | <p>Returns a list of your order returns. The returns are returned sorted by creation date, with the most recently created return appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/order_returns
-}
-- TODO request options as enum
data GetOrderReturns = GetOrderReturns
  { getOrderReturnsParams :: GetOrderReturnsParams
  , getOrderReturnsBody :: Maybe GetOrderReturnsBody
  } deriving (Show, Eq, Generic)

data GetOrderReturnsParams = GetOrderReturnsParams
  {  getOrderReturnsCreated :: Maybe (Either (Object) (Int))
  {- ^ Date this return was created. -}
  ,  getOrderReturnsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getOrderReturnsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getOrderReturnsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getOrderReturnsOrder :: Maybe (Text)
  {- ^ The order to retrieve returns for. -}
  ,  getOrderReturnsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetOrderReturnsBody
  = GetOrderReturnsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetOrderReturns = "GET"
type instance RequestPath GetOrderReturns = "/v1/order_returns"

instance RequestBuilder GetOrderReturns where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetOrderReturns{..} =
    [ "v1"
    , "order_returns"
    ]
    where
      GetOrderReturnsParams{..} = getOrderReturnsParams
  endpointQuery GetOrderReturns{..} =
    [ ("created", queryDeepObjectExplode getOrderReturnsCreated)
    , ("ending_before", queryFormExplode getOrderReturnsEndingBefore)
    , ("expand", queryDeepObjectExplode getOrderReturnsExpand)
    , ("limit", queryFormExplode getOrderReturnsLimit)
    , ("order", queryFormExplode getOrderReturnsOrder)
    , ("starting_after", queryFormExplode getOrderReturnsStartingAfter)
    ]
    where
      GetOrderReturnsParams{..} = getOrderReturnsParams
  endpointHeaders GetOrderReturns{..} =
    [
    ]



{-
getOrderReturns :: GetOrderReturns
getOrderReturns = GetOrderReturns
-}
-- 
{- | <p>Creates an Issuing <code>Card</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/cards
-}
-- TODO request options as enum
data PostIssuingCards = PostIssuingCards
  { postIssuingCardsParams :: PostIssuingCardsParams
  , postIssuingCardsBody :: PostIssuingCardsBody
  } deriving (Show, Eq, Generic)

data PostIssuingCardsParams = PostIssuingCardsParams
  {
  } deriving (Show, Eq, Generic)

data PostIssuingCardsBody
  = PostIssuingCardsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingCards = "POST"
type instance RequestPath PostIssuingCards = "/v1/issuing/cards"

instance RequestBuilder PostIssuingCards where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingCards{..} =
    [ "v1"
    , "issuing"
    , "cards"
    ]
    where
      PostIssuingCardsParams = postIssuingCardsParams
  endpointQuery PostIssuingCards{..} =
    [
    ]
  endpointHeaders PostIssuingCards{..} =
    [
    ]



{-
postIssuingCards :: PostIssuingCards
postIssuingCards = PostIssuingCards
-}
-- 
{- | <p>Returns a list of Issuing <code>Card</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cards
-}
-- TODO request options as enum
data GetIssuingCards = GetIssuingCards
  { getIssuingCardsParams :: GetIssuingCardsParams
  , getIssuingCardsBody :: Maybe GetIssuingCardsBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardsParams = GetIssuingCardsParams
  {  getIssuingCardsCardholder :: Maybe (Text)
  {- ^ Only return cards belonging to the Cardholder with the provided ID. -}
  ,  getIssuingCardsCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return cards that were issued during the given date interval. -}
  ,  getIssuingCardsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingCardsExpMonth :: Maybe (Int)
  {- ^ Only return cards that have the given expiration month. -}
  ,  getIssuingCardsExpYear :: Maybe (Int)
  {- ^ Only return cards that have the given expiration year. -}
  ,  getIssuingCardsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingCardsLast4 :: Maybe (Text)
  {- ^ Only return cards that have the given last four digits. -}
  ,  getIssuingCardsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingCardsName :: Maybe (Text)
  {- ^ Only return cards that have the given name. -}
  ,  getIssuingCardsSource :: Maybe (Text)
  {- ^ Only return cards whose full card number matches that of this card source ID. -}
  ,  getIssuingCardsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getIssuingCardsStatus :: Maybe (Status)
  {- ^ Only return cards that have the given status. One of `active`, `inactive`, `canceled`, `lost`, or `stolen`. -}
  ,  getIssuingCardsType :: Maybe (Type)
  {- ^ Only return cards that have the given type. One of `virtual` or `physical`. -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardsBody
  = GetIssuingCardsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCards = "GET"
type instance RequestPath GetIssuingCards = "/v1/issuing/cards"

instance RequestBuilder GetIssuingCards where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCards{..} =
    [ "v1"
    , "issuing"
    , "cards"
    ]
    where
      GetIssuingCardsParams{..} = getIssuingCardsParams
  endpointQuery GetIssuingCards{..} =
    [ ("cardholder", queryFormExplode getIssuingCardsCardholder)
    , ("created", queryDeepObjectExplode getIssuingCardsCreated)
    , ("ending_before", queryFormExplode getIssuingCardsEndingBefore)
    , ("exp_month", queryFormExplode getIssuingCardsExpMonth)
    , ("exp_year", queryFormExplode getIssuingCardsExpYear)
    , ("expand", queryDeepObjectExplode getIssuingCardsExpand)
    , ("last4", queryFormExplode getIssuingCardsLast4)
    , ("limit", queryFormExplode getIssuingCardsLimit)
    , ("name", queryFormExplode getIssuingCardsName)
    , ("source", queryFormExplode getIssuingCardsSource)
    , ("starting_after", queryFormExplode getIssuingCardsStartingAfter)
    , ("status", queryFormExplode getIssuingCardsStatus)
    , ("type", queryFormExplode getIssuingCardsType)
    ]
    where
      GetIssuingCardsParams{..} = getIssuingCardsParams
  endpointHeaders GetIssuingCards{..} =
    [
    ]



{-
getIssuingCards :: GetIssuingCards
getIssuingCards = GetIssuingCards
-}
-- 
{- | <p>Updates the specific SKU by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>Note that a SKU’s <code>attributes</code> are not editable. Instead, you would need to deactivate the existing SKU and create a new one with the new attribute values.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/skus/{id}
-}
-- TODO request options as enum
data PostSkusId = PostSkusId
  { postSkusIdParams :: PostSkusIdParams
  , postSkusIdBody :: Maybe PostSkusIdBody
  } deriving (Show, Eq, Generic)

data PostSkusIdParams = PostSkusIdParams
  {  postSkusIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostSkusIdBody
  = PostSkusIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSkusId = "POST"
type instance RequestPath PostSkusId = "/v1/skus/{id}"

instance RequestBuilder PostSkusId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSkusId{..} =
    [ "v1"
    , "skus"
    , pathSimple postSkusIdId
    ]
    where
      PostSkusIdParams{..} = postSkusIdParams
  endpointQuery PostSkusId{..} =
    [
    ]
  endpointHeaders PostSkusId{..} =
    [
    ]



{-
postSkusId :: PostSkusId
postSkusId = PostSkusId
-}
-- 
{- | <p>Retrieves the details of an existing SKU. Supply the unique SKU identifier from either a SKU creation request or from the product, and Stripe will return the corresponding SKU information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/skus/{id}
-}
-- TODO request options as enum
data GetSkusId = GetSkusId
  { getSkusIdParams :: GetSkusIdParams
  , getSkusIdBody :: Maybe GetSkusIdBody
  } deriving (Show, Eq, Generic)

data GetSkusIdParams = GetSkusIdParams
  {  getSkusIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSkusIdId :: (Text)
  {- ^ The identifier of the SKU to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetSkusIdBody
  = GetSkusIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSkusId = "GET"
type instance RequestPath GetSkusId = "/v1/skus/{id}"

instance RequestBuilder GetSkusId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSkusId{..} =
    [ "v1"
    , "skus"
    , pathSimple getSkusIdId
    ]
    where
      GetSkusIdParams{..} = getSkusIdParams
  endpointQuery GetSkusId{..} =
    [ ("expand", queryDeepObjectExplode getSkusIdExpand)
    ]
  endpointHeaders GetSkusId{..} =
    [
    ]



{-
getSkusId :: GetSkusId
getSkusId = GetSkusId
-}
-- 
{- | <p>Delete a SKU. Deleting a SKU is only possible until it has been used in an order.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/skus/{id}
-}
-- TODO request options as enum
data DeleteSkusId = DeleteSkusId
  { deleteSkusIdParams :: DeleteSkusIdParams
  , deleteSkusIdBody :: Maybe DeleteSkusIdBody
  } deriving (Show, Eq, Generic)

data DeleteSkusIdParams = DeleteSkusIdParams
  {  deleteSkusIdId :: (Text)
  {- ^ The identifier of the SKU to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteSkusIdBody
  = DeleteSkusIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteSkusId = "DELETE"
type instance RequestPath DeleteSkusId = "/v1/skus/{id}"

instance RequestBuilder DeleteSkusId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteSkusId{..} =
    [ "v1"
    , "skus"
    , pathSimple deleteSkusIdId
    ]
    where
      DeleteSkusIdParams{..} = deleteSkusIdParams
  endpointQuery DeleteSkusId{..} =
    [
    ]
  endpointHeaders DeleteSkusId{..} =
    [
    ]



{-
deleteSkusId :: DeleteSkusId
deleteSkusId = DeleteSkusId
-}
-- 
{- | <p>Updates an existing person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/persons/{person}
-}
-- TODO request options as enum
data PostAccountPersonsPerson = PostAccountPersonsPerson
  { postAccountPersonsPersonParams :: PostAccountPersonsPersonParams
  , postAccountPersonsPersonBody :: Maybe PostAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data PostAccountPersonsPersonParams = PostAccountPersonsPersonParams
  {  postAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of a person to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountPersonsPersonBody
  = PostAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountPersonsPerson = "POST"
type instance RequestPath PostAccountPersonsPerson = "/v1/account/persons/{person}"

instance RequestBuilder PostAccountPersonsPerson where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountPersonsPerson{..} =
    [ "v1"
    , "account"
    , "persons"
    , pathSimple postAccountPersonsPersonPerson
    ]
    where
      PostAccountPersonsPersonParams{..} = postAccountPersonsPersonParams
  endpointQuery PostAccountPersonsPerson{..} =
    [
    ]
  endpointHeaders PostAccountPersonsPerson{..} =
    [
    ]



{-
postAccountPersonsPerson :: PostAccountPersonsPerson
postAccountPersonsPerson = PostAccountPersonsPerson
-}
-- 
{- | <p>Retrieves an existing person.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/persons/{person}
-}
-- TODO request options as enum
data GetAccountPersonsPerson = GetAccountPersonsPerson
  { getAccountPersonsPersonParams :: GetAccountPersonsPersonParams
  , getAccountPersonsPersonBody :: Maybe GetAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data GetAccountPersonsPersonParams = GetAccountPersonsPersonParams
  {  getAccountPersonsPersonExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of a person to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetAccountPersonsPersonBody
  = GetAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountPersonsPerson = "GET"
type instance RequestPath GetAccountPersonsPerson = "/v1/account/persons/{person}"

instance RequestBuilder GetAccountPersonsPerson where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountPersonsPerson{..} =
    [ "v1"
    , "account"
    , "persons"
    , pathSimple getAccountPersonsPersonPerson
    ]
    where
      GetAccountPersonsPersonParams{..} = getAccountPersonsPersonParams
  endpointQuery GetAccountPersonsPerson{..} =
    [ ("expand", queryDeepObjectExplode getAccountPersonsPersonExpand)
    ]
  endpointHeaders GetAccountPersonsPerson{..} =
    [
    ]



{-
getAccountPersonsPerson :: GetAccountPersonsPerson
getAccountPersonsPerson = GetAccountPersonsPerson
-}
-- 
{- | <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/account/persons/{person}
-}
-- TODO request options as enum
data DeleteAccountPersonsPerson = DeleteAccountPersonsPerson
  { deleteAccountPersonsPersonParams :: DeleteAccountPersonsPersonParams
  , deleteAccountPersonsPersonBody :: Maybe DeleteAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data DeleteAccountPersonsPersonParams = DeleteAccountPersonsPersonParams
  {  deleteAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of the person to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountPersonsPersonBody
  = DeleteAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountPersonsPerson = "DELETE"
type instance RequestPath DeleteAccountPersonsPerson = "/v1/account/persons/{person}"

instance RequestBuilder DeleteAccountPersonsPerson where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountPersonsPerson{..} =
    [ "v1"
    , "account"
    , "persons"
    , pathSimple deleteAccountPersonsPersonPerson
    ]
    where
      DeleteAccountPersonsPersonParams{..} = deleteAccountPersonsPersonParams
  endpointQuery DeleteAccountPersonsPerson{..} =
    [
    ]
  endpointHeaders DeleteAccountPersonsPerson{..} =
    [
    ]



{-
deleteAccountPersonsPerson :: DeleteAccountPersonsPerson
deleteAccountPersonsPerson = DeleteAccountPersonsPerson
-}
-- 
{- | <p>Creates a SetupIntent object.</p>

<p>After the SetupIntent is created, attach a payment method and <a href="/docs/api/setup_intents/confirm">confirm</a>
to collect any required permissions to charge the payment method later.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/setup_intents
-}
-- TODO request options as enum
data PostSetupIntents = PostSetupIntents
  { postSetupIntentsParams :: PostSetupIntentsParams
  , postSetupIntentsBody :: Maybe PostSetupIntentsBody
  } deriving (Show, Eq, Generic)

data PostSetupIntentsParams = PostSetupIntentsParams
  {
  } deriving (Show, Eq, Generic)

data PostSetupIntentsBody
  = PostSetupIntentsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSetupIntents = "POST"
type instance RequestPath PostSetupIntents = "/v1/setup_intents"

instance RequestBuilder PostSetupIntents where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSetupIntents{..} =
    [ "v1"
    , "setup_intents"
    ]
    where
      PostSetupIntentsParams = postSetupIntentsParams
  endpointQuery PostSetupIntents{..} =
    [
    ]
  endpointHeaders PostSetupIntents{..} =
    [
    ]



{-
postSetupIntents :: PostSetupIntents
postSetupIntents = PostSetupIntents
-}
-- 
{- | <p>Returns a list of SetupIntents.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/setup_intents
-}
-- TODO request options as enum
data GetSetupIntents = GetSetupIntents
  { getSetupIntentsParams :: GetSetupIntentsParams
  , getSetupIntentsBody :: Maybe GetSetupIntentsBody
  } deriving (Show, Eq, Generic)

data GetSetupIntentsParams = GetSetupIntentsParams
  {  getSetupIntentsCreated :: Maybe (Either (Object) (Int))
  {- ^ A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. -}
  ,  getSetupIntentsCustomer :: Maybe (Text)
  {- ^ Only return SetupIntents for the customer specified by this customer ID. -}
  ,  getSetupIntentsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSetupIntentsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSetupIntentsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSetupIntentsPaymentMethod :: Maybe (Text)
  {- ^ Only return SetupIntents associated with the specified payment method. -}
  ,  getSetupIntentsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetSetupIntentsBody
  = GetSetupIntentsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSetupIntents = "GET"
type instance RequestPath GetSetupIntents = "/v1/setup_intents"

instance RequestBuilder GetSetupIntents where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSetupIntents{..} =
    [ "v1"
    , "setup_intents"
    ]
    where
      GetSetupIntentsParams{..} = getSetupIntentsParams
  endpointQuery GetSetupIntents{..} =
    [ ("created", queryDeepObjectExplode getSetupIntentsCreated)
    , ("customer", queryFormExplode getSetupIntentsCustomer)
    , ("ending_before", queryFormExplode getSetupIntentsEndingBefore)
    , ("expand", queryDeepObjectExplode getSetupIntentsExpand)
    , ("limit", queryFormExplode getSetupIntentsLimit)
    , ("payment_method", queryFormExplode getSetupIntentsPaymentMethod)
    , ("starting_after", queryFormExplode getSetupIntentsStartingAfter)
    ]
    where
      GetSetupIntentsParams{..} = getSetupIntentsParams
  endpointHeaders GetSetupIntents{..} =
    [
    ]



{-
getSetupIntents :: GetSetupIntents
getSetupIntents = GetSetupIntents
-}
-- 
{- | <p>Updates a connected <a href="/docs/connect/accounts">Express or Custom account</a> by setting the values of the parameters passed. Any parameters not provided are left unchanged. Most parameters can be changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.) Parameters marked <strong>Custom and Express</strong> are supported by both account types.</p>

<p>To update your own account, use the <a href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating accounts.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}
-}
-- TODO request options as enum
data PostAccountsAccount = PostAccountsAccount
  { postAccountsAccountParams :: PostAccountsAccountParams
  , postAccountsAccountBody :: Maybe PostAccountsAccountBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountParams = PostAccountsAccountParams
  {  postAccountsAccountAccount :: (Text)
  } deriving (Show, Eq, Generic)

data PostAccountsAccountBody
  = PostAccountsAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccount = "POST"
type instance RequestPath PostAccountsAccount = "/v1/accounts/{account}"

instance RequestBuilder PostAccountsAccount where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccount{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountAccount
    ]
    where
      PostAccountsAccountParams{..} = postAccountsAccountParams
  endpointQuery PostAccountsAccount{..} =
    [
    ]
  endpointHeaders PostAccountsAccount{..} =
    [
    ]



{-
postAccountsAccount :: PostAccountsAccount
postAccountsAccount = PostAccountsAccount
-}
-- 
{- | <p>Retrieves the details of an account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}
-}
-- TODO request options as enum
data GetAccountsAccount = GetAccountsAccount
  { getAccountsAccountParams :: GetAccountsAccountParams
  , getAccountsAccountBody :: Maybe GetAccountsAccountBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountParams = GetAccountsAccountParams
  {  getAccountsAccountAccount :: (Text)
  {- ^ The identifier of the account to retrieve. If none is provided, the account associated with the API key is returned. -}
  ,  getAccountsAccountExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountBody
  = GetAccountsAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccount = "GET"
type instance RequestPath GetAccountsAccount = "/v1/accounts/{account}"

instance RequestBuilder GetAccountsAccount where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccount{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountAccount
    ]
    where
      GetAccountsAccountParams{..} = getAccountsAccountParams
  endpointQuery GetAccountsAccount{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountExpand)
    ]
  endpointHeaders GetAccountsAccount{..} =
    [
    ]



{-
getAccountsAccount :: GetAccountsAccount
getAccountsAccount = GetAccountsAccount
-}
-- 
{- | <p>With <a href="/docs/connect">Connect</a>, you may delete Custom accounts you manage.</p>

<p>Custom accounts created using test-mode keys can be deleted at any time. Custom accounts created using live-mode keys may only be deleted once all balances are zero.</p>

<p>If you are looking to close your own account, use the <a href="https://dashboard.stripe.com/account/data">data tab in your account settings</a> instead.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/accounts/{account}
-}
-- TODO request options as enum
data DeleteAccountsAccount = DeleteAccountsAccount
  { deleteAccountsAccountParams :: DeleteAccountsAccountParams
  , deleteAccountsAccountBody :: Maybe DeleteAccountsAccountBody
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountParams = DeleteAccountsAccountParams
  {  deleteAccountsAccountAccount :: (Text)
  {- ^ The identifier of the account to be deleted. If none is provided, will default to the account of the API key. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountBody
  = DeleteAccountsAccountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountsAccount = "DELETE"
type instance RequestPath DeleteAccountsAccount = "/v1/accounts/{account}"

instance RequestBuilder DeleteAccountsAccount where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountsAccount{..} =
    [ "v1"
    , "accounts"
    , pathSimple deleteAccountsAccountAccount
    ]
    where
      DeleteAccountsAccountParams{..} = deleteAccountsAccountParams
  endpointQuery DeleteAccountsAccount{..} =
    [
    ]
  endpointHeaders DeleteAccountsAccount{..} =
    [
    ]



{-
deleteAccountsAccount :: DeleteAccountsAccount
deleteAccountsAccount = DeleteAccountsAccount
-}
-- 
{- | <p>List events, going back up to 30 days. Each event data is rendered according to Stripe API version at its creation time, specified in <a href="/docs/api/events/object">event object</a> <code>api_version</code> attribute (not according to your current Stripe API version or <code>Stripe-Version</code> header).</p>

> -- Equivalent to the following API endpoint:
> GET /v1/events
-}
-- TODO request options as enum
data GetEvents = GetEvents
  { getEventsParams :: GetEventsParams
  , getEventsBody :: Maybe GetEventsBody
  } deriving (Show, Eq, Generic)

data GetEventsParams = GetEventsParams
  {  getEventsCreated :: Maybe (Either (Object) (Int))
  ,  getEventsDeliverySuccess :: Maybe (Bool)
  {- ^ Filter events by whether all webhooks were successfully delivered. If false, events which are still pending or have failed all delivery attempts to a webhook endpoint will be returned. -}
  ,  getEventsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getEventsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getEventsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getEventsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getEventsType :: Maybe (Text)
  {- ^ A string containing a specific event name, or group of events using * as a wildcard. The list will be filtered to include only events with a matching event property. -}
  ,  getEventsTypes :: Maybe (Vector (Text))
  {- ^ An array of up to 20 strings containing specific event names. The list will be filtered to include only events with a matching event property. You may pass either `type` or `types`, but not both. -}
  } deriving (Show, Eq, Generic)

data GetEventsBody
  = GetEventsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetEvents = "GET"
type instance RequestPath GetEvents = "/v1/events"

instance RequestBuilder GetEvents where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetEvents{..} =
    [ "v1"
    , "events"
    ]
    where
      GetEventsParams{..} = getEventsParams
  endpointQuery GetEvents{..} =
    [ ("created", queryDeepObjectExplode getEventsCreated)
    , ("delivery_success", queryFormExplode getEventsDeliverySuccess)
    , ("ending_before", queryFormExplode getEventsEndingBefore)
    , ("expand", queryDeepObjectExplode getEventsExpand)
    , ("limit", queryFormExplode getEventsLimit)
    , ("starting_after", queryFormExplode getEventsStartingAfter)
    , ("type", queryFormExplode getEventsType)
    , ("types", queryDeepObjectExplode getEventsTypes)
    ]
    where
      GetEventsParams{..} = getEventsParams
  endpointHeaders GetEvents{..} =
    [
    ]



{-
getEvents :: GetEvents
getEvents = GetEvents
-}
-- 
{- | <p>Attaches a PaymentMethod object to a Customer.</p>

<p>To use this PaymentMethod as the default for invoice or subscription payments,
set <a href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code>invoice_settings.default_payment_method</code></a>,
on the Customer to the PaymentMethod’s ID.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_methods/{payment_method}/attach
-}
-- TODO request options as enum
data PostPaymentMethodsPaymentMethodAttach = PostPaymentMethodsPaymentMethodAttach
  { postPaymentMethodsPaymentMethodAttachParams :: PostPaymentMethodsPaymentMethodAttachParams
  , postPaymentMethodsPaymentMethodAttachBody :: PostPaymentMethodsPaymentMethodAttachBody
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodAttachParams = PostPaymentMethodsPaymentMethodAttachParams
  {  postPaymentMethodsPaymentMethodAttachPaymentMethod :: (Text)
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodAttachBody
  = PostPaymentMethodsPaymentMethodAttachBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentMethodsPaymentMethodAttach = "POST"
type instance RequestPath PostPaymentMethodsPaymentMethodAttach = "/v1/payment_methods/{payment_method}/attach"

instance RequestBuilder PostPaymentMethodsPaymentMethodAttach where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentMethodsPaymentMethodAttach{..} =
    [ "v1"
    , "payment_methods"
    , pathSimple postPaymentMethodsPaymentMethodAttachPaymentMethod
    , "attach"
    ]
    where
      PostPaymentMethodsPaymentMethodAttachParams{..} = postPaymentMethodsPaymentMethodAttachParams
  endpointQuery PostPaymentMethodsPaymentMethodAttach{..} =
    [
    ]
  endpointHeaders PostPaymentMethodsPaymentMethodAttach{..} =
    [
    ]



{-
postPaymentMethodsPaymentMethodAttach :: PostPaymentMethodsPaymentMethodAttach
postPaymentMethodsPaymentMethodAttach = PostPaymentMethodsPaymentMethodAttach
-}
-- 
{- | <p>Draft invoices are fully editable. Once an invoice is <a href="/docs/billing/invoices/workflow#finalized">finalized</a>,
monetary values, as well as <code>collection_method</code>, become uneditable.</p>

<p>If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on,
sending reminders for, or <a href="/docs/billing/invoices/reconciliation">automatically reconciling</a> invoices, pass
<code>auto_advance=false</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}
-}
-- TODO request options as enum
data PostInvoicesInvoice = PostInvoicesInvoice
  { postInvoicesInvoiceParams :: PostInvoicesInvoiceParams
  , postInvoicesInvoiceBody :: Maybe PostInvoicesInvoiceBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceParams = PostInvoicesInvoiceParams
  {  postInvoicesInvoiceInvoice :: (Text)
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceBody
  = PostInvoicesInvoiceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoice = "POST"
type instance RequestPath PostInvoicesInvoice = "/v1/invoices/{invoice}"

instance RequestBuilder PostInvoicesInvoice where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoice{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoiceInvoice
    ]
    where
      PostInvoicesInvoiceParams{..} = postInvoicesInvoiceParams
  endpointQuery PostInvoicesInvoice{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoice{..} =
    [
    ]



{-
postInvoicesInvoice :: PostInvoicesInvoice
postInvoicesInvoice = PostInvoicesInvoice
-}
-- 
{- | <p>Retrieves the invoice with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoices/{invoice}
-}
-- TODO request options as enum
data GetInvoicesInvoice = GetInvoicesInvoice
  { getInvoicesInvoiceParams :: GetInvoicesInvoiceParams
  , getInvoicesInvoiceBody :: Maybe GetInvoicesInvoiceBody
  } deriving (Show, Eq, Generic)

data GetInvoicesInvoiceParams = GetInvoicesInvoiceParams
  {  getInvoicesInvoiceExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoicesInvoiceInvoice :: (Text)
  {- ^ The identifier of the desired invoice. -}
  } deriving (Show, Eq, Generic)

data GetInvoicesInvoiceBody
  = GetInvoicesInvoiceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoicesInvoice = "GET"
type instance RequestPath GetInvoicesInvoice = "/v1/invoices/{invoice}"

instance RequestBuilder GetInvoicesInvoice where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoicesInvoice{..} =
    [ "v1"
    , "invoices"
    , pathSimple getInvoicesInvoiceInvoice
    ]
    where
      GetInvoicesInvoiceParams{..} = getInvoicesInvoiceParams
  endpointQuery GetInvoicesInvoice{..} =
    [ ("expand", queryDeepObjectExplode getInvoicesInvoiceExpand)
    ]
  endpointHeaders GetInvoicesInvoice{..} =
    [
    ]



{-
getInvoicesInvoice :: GetInvoicesInvoice
getInvoicesInvoice = GetInvoicesInvoice
-}
-- 
{- | <p>Permanently deletes a draft invoice. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized, it must be <a href="#void_invoice">voided</a>.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/invoices/{invoice}
-}
-- TODO request options as enum
data DeleteInvoicesInvoice = DeleteInvoicesInvoice
  { deleteInvoicesInvoiceParams :: DeleteInvoicesInvoiceParams
  , deleteInvoicesInvoiceBody :: Maybe DeleteInvoicesInvoiceBody
  } deriving (Show, Eq, Generic)

data DeleteInvoicesInvoiceParams = DeleteInvoicesInvoiceParams
  {  deleteInvoicesInvoiceInvoice :: (Text)
  {- ^ The identifier of the invoice to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteInvoicesInvoiceBody
  = DeleteInvoicesInvoiceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteInvoicesInvoice = "DELETE"
type instance RequestPath DeleteInvoicesInvoice = "/v1/invoices/{invoice}"

instance RequestBuilder DeleteInvoicesInvoice where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteInvoicesInvoice{..} =
    [ "v1"
    , "invoices"
    , pathSimple deleteInvoicesInvoiceInvoice
    ]
    where
      DeleteInvoicesInvoiceParams{..} = deleteInvoicesInvoiceParams
  endpointQuery DeleteInvoicesInvoice{..} =
    [
    ]
  endpointHeaders DeleteInvoicesInvoice{..} =
    [
    ]



{-
deleteInvoicesInvoice :: DeleteInvoicesInvoice
deleteInvoicesInvoice = DeleteInvoicesInvoice
-}
-- 
{- | <p>Retrieve an apple pay domain.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/apple_pay/domains/{domain}
-}
-- TODO request options as enum
data GetApplePayDomainsDomain = GetApplePayDomainsDomain
  { getApplePayDomainsDomainParams :: GetApplePayDomainsDomainParams
  , getApplePayDomainsDomainBody :: Maybe GetApplePayDomainsDomainBody
  } deriving (Show, Eq, Generic)

data GetApplePayDomainsDomainParams = GetApplePayDomainsDomainParams
  {  getApplePayDomainsDomainDomain :: (Text)
  ,  getApplePayDomainsDomainExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetApplePayDomainsDomainBody
  = GetApplePayDomainsDomainBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplePayDomainsDomain = "GET"
type instance RequestPath GetApplePayDomainsDomain = "/v1/apple_pay/domains/{domain}"

instance RequestBuilder GetApplePayDomainsDomain where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplePayDomainsDomain{..} =
    [ "v1"
    , "apple_pay"
    , "domains"
    , pathSimple getApplePayDomainsDomainDomain
    ]
    where
      GetApplePayDomainsDomainParams{..} = getApplePayDomainsDomainParams
  endpointQuery GetApplePayDomainsDomain{..} =
    [ ("expand", queryDeepObjectExplode getApplePayDomainsDomainExpand)
    ]
  endpointHeaders GetApplePayDomainsDomain{..} =
    [
    ]



{-
getApplePayDomainsDomain :: GetApplePayDomainsDomain
getApplePayDomainsDomain = GetApplePayDomainsDomain
-}
-- 
{- | <p>Delete an apple pay domain.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/apple_pay/domains/{domain}
-}
-- TODO request options as enum
data DeleteApplePayDomainsDomain = DeleteApplePayDomainsDomain
  { deleteApplePayDomainsDomainParams :: DeleteApplePayDomainsDomainParams
  , deleteApplePayDomainsDomainBody :: Maybe DeleteApplePayDomainsDomainBody
  } deriving (Show, Eq, Generic)

data DeleteApplePayDomainsDomainParams = DeleteApplePayDomainsDomainParams
  {  deleteApplePayDomainsDomainDomain :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteApplePayDomainsDomainBody
  = DeleteApplePayDomainsDomainBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteApplePayDomainsDomain = "DELETE"
type instance RequestPath DeleteApplePayDomainsDomain = "/v1/apple_pay/domains/{domain}"

instance RequestBuilder DeleteApplePayDomainsDomain where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteApplePayDomainsDomain{..} =
    [ "v1"
    , "apple_pay"
    , "domains"
    , pathSimple deleteApplePayDomainsDomainDomain
    ]
    where
      DeleteApplePayDomainsDomainParams{..} = deleteApplePayDomainsDomainParams
  endpointQuery DeleteApplePayDomainsDomain{..} =
    [
    ]
  endpointHeaders DeleteApplePayDomainsDomain{..} =
    [
    ]



{-
deleteApplePayDomainsDomain :: DeleteApplePayDomainsDomain
deleteApplePayDomainsDomain = DeleteApplePayDomainsDomain
-}
-- 
{- | <p>Creates a new customer object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers
-}
-- TODO request options as enum
data PostCustomers = PostCustomers
  { postCustomersParams :: PostCustomersParams
  , postCustomersBody :: Maybe PostCustomersBody
  } deriving (Show, Eq, Generic)

data PostCustomersParams = PostCustomersParams
  {
  } deriving (Show, Eq, Generic)

data PostCustomersBody
  = PostCustomersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomers = "POST"
type instance RequestPath PostCustomers = "/v1/customers"

instance RequestBuilder PostCustomers where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomers{..} =
    [ "v1"
    , "customers"
    ]
    where
      PostCustomersParams = postCustomersParams
  endpointQuery PostCustomers{..} =
    [
    ]
  endpointHeaders PostCustomers{..} =
    [
    ]



{-
postCustomers :: PostCustomers
postCustomers = PostCustomers
-}
-- 
{- | <p>Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers
-}
-- TODO request options as enum
data GetCustomers = GetCustomers
  { getCustomersParams :: GetCustomersParams
  , getCustomersBody :: Maybe GetCustomersBody
  } deriving (Show, Eq, Generic)

data GetCustomersParams = GetCustomersParams
  {  getCustomersCreated :: Maybe (Either (Object) (Int))
  ,  getCustomersEmail :: Maybe (Text)
  {- ^ A filter on the list based on the customer's `email` field. The value must be a string. -}
  ,  getCustomersEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersBody
  = GetCustomersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomers = "GET"
type instance RequestPath GetCustomers = "/v1/customers"

instance RequestBuilder GetCustomers where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomers{..} =
    [ "v1"
    , "customers"
    ]
    where
      GetCustomersParams{..} = getCustomersParams
  endpointQuery GetCustomers{..} =
    [ ("created", queryDeepObjectExplode getCustomersCreated)
    , ("email", queryFormExplode getCustomersEmail)
    , ("ending_before", queryFormExplode getCustomersEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersExpand)
    , ("limit", queryFormExplode getCustomersLimit)
    , ("starting_after", queryFormExplode getCustomersStartingAfter)
    ]
    where
      GetCustomersParams{..} = getCustomersParams
  endpointHeaders GetCustomers{..} =
    [
    ]



{-
getCustomers :: GetCustomers
getCustomers = GetCustomers
-}
-- 
{- | <p>Update a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/sources/{id}
-}
-- TODO request options as enum
data PostCustomersCustomerSourcesId = PostCustomersCustomerSourcesId
  { postCustomersCustomerSourcesIdParams :: PostCustomersCustomerSourcesIdParams
  , postCustomersCustomerSourcesIdBody :: Maybe PostCustomersCustomerSourcesIdBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesIdParams = PostCustomersCustomerSourcesIdParams
  {  postCustomersCustomerSourcesIdCustomer :: (Text)
  ,  postCustomersCustomerSourcesIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesIdBody
  = PostCustomersCustomerSourcesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerSourcesId = "POST"
type instance RequestPath PostCustomersCustomerSourcesId = "/v1/customers/{customer}/sources/{id}"

instance RequestBuilder PostCustomersCustomerSourcesId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerSourcesId{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerSourcesIdCustomer
    , "sources"
    , pathSimple postCustomersCustomerSourcesIdId
    ]
    where
      PostCustomersCustomerSourcesIdParams{..} = postCustomersCustomerSourcesIdParams
  endpointQuery PostCustomersCustomerSourcesId{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerSourcesId{..} =
    [
    ]



{-
postCustomersCustomerSourcesId :: PostCustomersCustomerSourcesId
postCustomersCustomerSourcesId = PostCustomersCustomerSourcesId
-}
-- 
{- | <p>Retrieve a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/sources/{id}
-}
-- TODO request options as enum
data GetCustomersCustomerSourcesId = GetCustomersCustomerSourcesId
  { getCustomersCustomerSourcesIdParams :: GetCustomersCustomerSourcesIdParams
  , getCustomersCustomerSourcesIdBody :: Maybe GetCustomersCustomerSourcesIdBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSourcesIdParams = GetCustomersCustomerSourcesIdParams
  {  getCustomersCustomerSourcesIdCustomer :: (Text)
  ,  getCustomersCustomerSourcesIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerSourcesIdId :: (Text)
  {- ^ The ID of the source to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSourcesIdBody
  = GetCustomersCustomerSourcesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerSourcesId = "GET"
type instance RequestPath GetCustomersCustomerSourcesId = "/v1/customers/{customer}/sources/{id}"

instance RequestBuilder GetCustomersCustomerSourcesId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerSourcesId{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerSourcesIdCustomer
    , "sources"
    , pathSimple getCustomersCustomerSourcesIdId
    ]
    where
      GetCustomersCustomerSourcesIdParams{..} = getCustomersCustomerSourcesIdParams
  endpointQuery GetCustomersCustomerSourcesId{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerSourcesIdExpand)
    ]
  endpointHeaders GetCustomersCustomerSourcesId{..} =
    [
    ]



{-
getCustomersCustomerSourcesId :: GetCustomersCustomerSourcesId
getCustomersCustomerSourcesId = GetCustomersCustomerSourcesId
-}
-- 
{- | <p>Delete a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/sources/{id}
-}
-- TODO request options as enum
data DeleteCustomersCustomerSourcesId = DeleteCustomersCustomerSourcesId
  { deleteCustomersCustomerSourcesIdParams :: DeleteCustomersCustomerSourcesIdParams
  , deleteCustomersCustomerSourcesIdBody :: Maybe DeleteCustomersCustomerSourcesIdBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSourcesIdParams = DeleteCustomersCustomerSourcesIdParams
  {  deleteCustomersCustomerSourcesIdCustomer :: (Text)
  ,  deleteCustomersCustomerSourcesIdId :: (Text)
  {- ^ The ID of the source to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSourcesIdBody
  = DeleteCustomersCustomerSourcesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerSourcesId = "DELETE"
type instance RequestPath DeleteCustomersCustomerSourcesId = "/v1/customers/{customer}/sources/{id}"

instance RequestBuilder DeleteCustomersCustomerSourcesId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerSourcesId{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerSourcesIdCustomer
    , "sources"
    , pathSimple deleteCustomersCustomerSourcesIdId
    ]
    where
      DeleteCustomersCustomerSourcesIdParams{..} = deleteCustomersCustomerSourcesIdParams
  endpointQuery DeleteCustomersCustomerSourcesId{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerSourcesId{..} =
    [
    ]



{-
deleteCustomersCustomerSourcesId :: DeleteCustomersCustomerSourcesId
deleteCustomersCustomerSourcesId = DeleteCustomersCustomerSourcesId
-}
-- 
{- | <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

<p>If the card’s owner has no default card, then the new card will become the default.
However, if the owner already has a default, then it will not change.
To change the default, you should either <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>,
or <a href="/docs/api#update_recipient">update the recipient</a> to have a new <code>default_card</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/bank_accounts
-}
-- TODO request options as enum
data PostCustomersCustomerBankAccounts = PostCustomersCustomerBankAccounts
  { postCustomersCustomerBankAccountsParams :: PostCustomersCustomerBankAccountsParams
  , postCustomersCustomerBankAccountsBody :: Maybe PostCustomersCustomerBankAccountsBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsParams = PostCustomersCustomerBankAccountsParams
  {  postCustomersCustomerBankAccountsCustomer :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsBody
  = PostCustomersCustomerBankAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerBankAccounts = "POST"
type instance RequestPath PostCustomersCustomerBankAccounts = "/v1/customers/{customer}/bank_accounts"

instance RequestBuilder PostCustomersCustomerBankAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerBankAccounts{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerBankAccountsCustomer
    , "bank_accounts"
    ]
    where
      PostCustomersCustomerBankAccountsParams{..} = postCustomersCustomerBankAccountsParams
  endpointQuery PostCustomersCustomerBankAccounts{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerBankAccounts{..} =
    [
    ]



{-
postCustomersCustomerBankAccounts :: PostCustomersCustomerBankAccounts
postCustomersCustomerBankAccounts = PostCustomersCustomerBankAccounts
-}
-- 
{- | <p>You can see a list of the bank accounts belonging to a Customer. Note that the 10 most recent sources are always available by default on the Customer. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional bank accounts.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/bank_accounts
-}
-- TODO request options as enum
data GetCustomersCustomerBankAccounts = GetCustomersCustomerBankAccounts
  { getCustomersCustomerBankAccountsParams :: GetCustomersCustomerBankAccountsParams
  , getCustomersCustomerBankAccountsBody :: Maybe GetCustomersCustomerBankAccountsBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBankAccountsParams = GetCustomersCustomerBankAccountsParams
  {  getCustomersCustomerBankAccountsCustomer :: (Text)
  {- ^ The ID of the customer whose bank accounts will be retrieved. -}
  ,  getCustomersCustomerBankAccountsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerBankAccountsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerBankAccountsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerBankAccountsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBankAccountsBody
  = GetCustomersCustomerBankAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerBankAccounts = "GET"
type instance RequestPath GetCustomersCustomerBankAccounts = "/v1/customers/{customer}/bank_accounts"

instance RequestBuilder GetCustomersCustomerBankAccounts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerBankAccounts{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerBankAccountsCustomer
    , "bank_accounts"
    ]
    where
      GetCustomersCustomerBankAccountsParams{..} = getCustomersCustomerBankAccountsParams
  endpointQuery GetCustomersCustomerBankAccounts{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerBankAccountsEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerBankAccountsExpand)
    , ("limit", queryFormExplode getCustomersCustomerBankAccountsLimit)
    , ("starting_after", queryFormExplode getCustomersCustomerBankAccountsStartingAfter)
    ]
    where
      GetCustomersCustomerBankAccountsParams{..} = getCustomersCustomerBankAccountsParams
  endpointHeaders GetCustomersCustomerBankAccounts{..} =
    [
    ]



{-
getCustomersCustomerBankAccounts :: GetCustomersCustomerBankAccounts
getCustomersCustomerBankAccounts = GetCustomersCustomerBankAccounts
-}
-- {-# DEPRECATED getCustomersCustomerBankAccounts, GetCustomersCustomerBankAccounts "This endpoint is deprecated by the API creator" #-}
{- | <p>Returns a full list of Report Types. (Requires a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reporting/report_types
-}
-- TODO request options as enum
data GetReportingReportTypes = GetReportingReportTypes
  { getReportingReportTypesParams :: GetReportingReportTypesParams
  , getReportingReportTypesBody :: Maybe GetReportingReportTypesBody
  } deriving (Show, Eq, Generic)

data GetReportingReportTypesParams = GetReportingReportTypesParams
  {  getReportingReportTypesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetReportingReportTypesBody
  = GetReportingReportTypesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReportingReportTypes = "GET"
type instance RequestPath GetReportingReportTypes = "/v1/reporting/report_types"

instance RequestBuilder GetReportingReportTypes where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReportingReportTypes{..} =
    [ "v1"
    , "reporting"
    , "report_types"
    ]
    where
      GetReportingReportTypesParams{..} = getReportingReportTypesParams
  endpointQuery GetReportingReportTypes{..} =
    [ ("expand", queryDeepObjectExplode getReportingReportTypesExpand)
    ]
  endpointHeaders GetReportingReportTypes{..} =
    [
    ]



{-
getReportingReportTypes :: GetReportingReportTypes
getReportingReportTypes = GetReportingReportTypes
-}
-- 
{- | <p>A PaymentIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_capture</code>, <code>requires_confirmation</code>, <code>requires_action</code>. </p>

<p>Once canceled, no additional charges will be made by the PaymentIntent and any operations on the PaymentIntent will fail with an error. For PaymentIntents with <code>status='requires_capture'</code>, the remaining <code>amount_capturable</code> will automatically be refunded.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_intents/{intent}/cancel
-}
-- TODO request options as enum
data PostPaymentIntentsIntentCancel = PostPaymentIntentsIntentCancel
  { postPaymentIntentsIntentCancelParams :: PostPaymentIntentsIntentCancelParams
  , postPaymentIntentsIntentCancelBody :: Maybe PostPaymentIntentsIntentCancelBody
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentCancelParams = PostPaymentIntentsIntentCancelParams
  {  postPaymentIntentsIntentCancelIntent :: (Text)
  {- ^ ID of the PaymentIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentCancelBody
  = PostPaymentIntentsIntentCancelBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentIntentsIntentCancel = "POST"
type instance RequestPath PostPaymentIntentsIntentCancel = "/v1/payment_intents/{intent}/cancel"

instance RequestBuilder PostPaymentIntentsIntentCancel where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentIntentsIntentCancel{..} =
    [ "v1"
    , "payment_intents"
    , pathSimple postPaymentIntentsIntentCancelIntent
    , "cancel"
    ]
    where
      PostPaymentIntentsIntentCancelParams{..} = postPaymentIntentsIntentCancelParams
  endpointQuery PostPaymentIntentsIntentCancel{..} =
    [
    ]
  endpointHeaders PostPaymentIntentsIntentCancel{..} =
    [
    ]



{-
postPaymentIntentsIntentCancel :: PostPaymentIntentsIntentCancel
postPaymentIntentsIntentCancel = PostPaymentIntentsIntentCancel
-}
-- 
{- | <p>Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.</p>

<p>Note that this endpoint was previously called “Balance history” and used the path <code>/v1/balance/history</code>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/balance/history
-}
-- TODO request options as enum
data GetBalanceHistory = GetBalanceHistory
  { getBalanceHistoryParams :: GetBalanceHistoryParams
  , getBalanceHistoryBody :: Maybe GetBalanceHistoryBody
  } deriving (Show, Eq, Generic)

data GetBalanceHistoryParams = GetBalanceHistoryParams
  {  getBalanceHistoryAvailableOn :: Maybe (Either (Object) (Int))
  ,  getBalanceHistoryCreated :: Maybe (Either (Object) (Int))
  ,  getBalanceHistoryCurrency :: Maybe (Text)
  ,  getBalanceHistoryEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getBalanceHistoryExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBalanceHistoryLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getBalanceHistoryPayout :: Maybe (Text)
  {- ^ For automatic Stripe payouts only, only returns transactions that were paid out on the specified payout ID. -}
  ,  getBalanceHistorySource :: Maybe (Text)
  {- ^ Only returns the original transaction. -}
  ,  getBalanceHistoryStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getBalanceHistoryType :: Maybe (Text)
  {- ^ Only returns transactions of the given type. One of: `charge`, `refund`, `adjustment`, `application_fee`, `application_fee_refund`, `transfer`, `payment`, `payout`, `payout_failure`, `stripe_fee`, or `network_cost`. -}
  } deriving (Show, Eq, Generic)

data GetBalanceHistoryBody
  = GetBalanceHistoryBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBalanceHistory = "GET"
type instance RequestPath GetBalanceHistory = "/v1/balance/history"

instance RequestBuilder GetBalanceHistory where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBalanceHistory{..} =
    [ "v1"
    , "balance"
    , "history"
    ]
    where
      GetBalanceHistoryParams{..} = getBalanceHistoryParams
  endpointQuery GetBalanceHistory{..} =
    [ ("available_on", queryDeepObjectExplode getBalanceHistoryAvailableOn)
    , ("created", queryDeepObjectExplode getBalanceHistoryCreated)
    , ("currency", queryFormExplode getBalanceHistoryCurrency)
    , ("ending_before", queryFormExplode getBalanceHistoryEndingBefore)
    , ("expand", queryDeepObjectExplode getBalanceHistoryExpand)
    , ("limit", queryFormExplode getBalanceHistoryLimit)
    , ("payout", queryFormExplode getBalanceHistoryPayout)
    , ("source", queryFormExplode getBalanceHistorySource)
    , ("starting_after", queryFormExplode getBalanceHistoryStartingAfter)
    , ("type", queryFormExplode getBalanceHistoryType)
    ]
    where
      GetBalanceHistoryParams{..} = getBalanceHistoryParams
  endpointHeaders GetBalanceHistory{..} =
    [
    ]



{-
getBalanceHistory :: GetBalanceHistory
getBalanceHistory = GetBalanceHistory
-}
-- 
{- | <p>Creates a Session object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/checkout/sessions
-}
-- TODO request options as enum
data PostCheckoutSessions = PostCheckoutSessions
  { postCheckoutSessionsParams :: PostCheckoutSessionsParams
  , postCheckoutSessionsBody :: PostCheckoutSessionsBody
  } deriving (Show, Eq, Generic)

data PostCheckoutSessionsParams = PostCheckoutSessionsParams
  {
  } deriving (Show, Eq, Generic)

data PostCheckoutSessionsBody
  = PostCheckoutSessionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCheckoutSessions = "POST"
type instance RequestPath PostCheckoutSessions = "/v1/checkout/sessions"

instance RequestBuilder PostCheckoutSessions where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCheckoutSessions{..} =
    [ "v1"
    , "checkout"
    , "sessions"
    ]
    where
      PostCheckoutSessionsParams = postCheckoutSessionsParams
  endpointQuery PostCheckoutSessions{..} =
    [
    ]
  endpointHeaders PostCheckoutSessions{..} =
    [
    ]



{-
postCheckoutSessions :: PostCheckoutSessions
postCheckoutSessions = PostCheckoutSessions
-}
-- 
{- | <p>Confirm that your customer intends to set up the current or
provided payment method. For example, you would confirm a SetupIntent
when a customer hits the “Save” button on a payment method management
page on your website.</p>

<p>If the selected payment method does not require any additional
steps from the customer, the SetupIntent will transition to the
<code>succeeded</code> status.</p>

<p>Otherwise, it will transition to the <code>requires_action</code> status and
suggest additional actions via <code>next_action</code>. If setup fails,
the SetupIntent will transition to the
<code>requires_payment_method</code> status.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/setup_intents/{intent}/confirm
-}
-- TODO request options as enum
data PostSetupIntentsIntentConfirm = PostSetupIntentsIntentConfirm
  { postSetupIntentsIntentConfirmParams :: PostSetupIntentsIntentConfirmParams
  , postSetupIntentsIntentConfirmBody :: Maybe PostSetupIntentsIntentConfirmBody
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentConfirmParams = PostSetupIntentsIntentConfirmParams
  {  postSetupIntentsIntentConfirmIntent :: (Text)
  {- ^ ID of the SetupIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostSetupIntentsIntentConfirmBody
  = PostSetupIntentsIntentConfirmBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSetupIntentsIntentConfirm = "POST"
type instance RequestPath PostSetupIntentsIntentConfirm = "/v1/setup_intents/{intent}/confirm"

instance RequestBuilder PostSetupIntentsIntentConfirm where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSetupIntentsIntentConfirm{..} =
    [ "v1"
    , "setup_intents"
    , pathSimple postSetupIntentsIntentConfirmIntent
    , "confirm"
    ]
    where
      PostSetupIntentsIntentConfirmParams{..} = postSetupIntentsIntentConfirmParams
  endpointQuery PostSetupIntentsIntentConfirm{..} =
    [
    ]
  endpointHeaders PostSetupIntentsIntentConfirm{..} =
    [
    ]



{-
postSetupIntentsIntentConfirm :: PostSetupIntentsIntentConfirm
postSetupIntentsIntentConfirm = PostSetupIntentsIntentConfirm
-}
-- 
{- | <p>Creates a new person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/persons
-}
-- TODO request options as enum
data PostAccountPersons = PostAccountPersons
  { postAccountPersonsParams :: PostAccountPersonsParams
  , postAccountPersonsBody :: Maybe PostAccountPersonsBody
  } deriving (Show, Eq, Generic)

data PostAccountPersonsParams = PostAccountPersonsParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountPersonsBody
  = PostAccountPersonsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountPersons = "POST"
type instance RequestPath PostAccountPersons = "/v1/account/persons"

instance RequestBuilder PostAccountPersons where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountPersons{..} =
    [ "v1"
    , "account"
    , "persons"
    ]
    where
      PostAccountPersonsParams = postAccountPersonsParams
  endpointQuery PostAccountPersons{..} =
    [
    ]
  endpointHeaders PostAccountPersons{..} =
    [
    ]



{-
postAccountPersons :: PostAccountPersons
postAccountPersons = PostAccountPersons
-}
-- 
{- | <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/persons
-}
-- TODO request options as enum
data GetAccountPersons = GetAccountPersons
  { getAccountPersonsParams :: GetAccountPersonsParams
  , getAccountPersonsBody :: Maybe GetAccountPersonsBody
  } deriving (Show, Eq, Generic)

data GetAccountPersonsParams = GetAccountPersonsParams
  {  getAccountPersonsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountPersonsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountPersonsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountPersonsRelationship :: Maybe (Object)
  {- ^ Filters on the list of people returned based on the person's relationship to the account's company. -}
  ,  getAccountPersonsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountPersonsBody
  = GetAccountPersonsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountPersons = "GET"
type instance RequestPath GetAccountPersons = "/v1/account/persons"

instance RequestBuilder GetAccountPersons where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountPersons{..} =
    [ "v1"
    , "account"
    , "persons"
    ]
    where
      GetAccountPersonsParams{..} = getAccountPersonsParams
  endpointQuery GetAccountPersons{..} =
    [ ("ending_before", queryFormExplode getAccountPersonsEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountPersonsExpand)
    , ("limit", queryFormExplode getAccountPersonsLimit)
    , ("relationship", queryDeepObjectExplode getAccountPersonsRelationship)
    , ("starting_after", queryFormExplode getAccountPersonsStartingAfter)
    ]
    where
      GetAccountPersonsParams{..} = getAccountPersonsParams
  endpointHeaders GetAccountPersons{..} =
    [
    ]



{-
getAccountPersons :: GetAccountPersons
getAccountPersons = GetAccountPersons
-}
-- 
{- | <p>Creates a usage record for a specified subscription item and date, and fills it with a quantity.</p>

<p>Usage records provide <code>quantity</code> information that Stripe uses to track how much a customer is using your service. With usage information and the pricing model set up by the <a href="https://stripe.com/docs/billing/subscriptions/metered-billing">metered billing</a> plan, Stripe helps you send accurate invoices to your customers.</p>

<p>The default calculation for usage is to add up all the <code>quantity</code> values of the usage records within a billing period. You can change this default behavior with the billing plan’s <code>aggregate_usage</code> <a href="https://stripe.com/docs/api/plans/create#create_plan-aggregate_usage">parameter</a>. When there is more than one usage record with the same timestamp, Stripe adds the <code>quantity</code> values together. In most cases, this is the desired resolution, however, you can change this behavior with the <code>action</code> parameter.</p>

<p>The default pricing model for metered billing is <a href="https://stripe.com/docs/api/plans/object#plan_object-billing_scheme">per-unit pricing</a>. For finer granularity, you can configure metered billing to have a <a href="https://stripe.com/docs/billing/subscriptions/tiers">tiered pricing</a> model.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_items/{subscription_item}/usage_records
-}
-- TODO request options as enum
data PostSubscriptionItemsSubscriptionItemUsageRecords = PostSubscriptionItemsSubscriptionItemUsageRecords
  { postSubscriptionItemsSubscriptionItemUsageRecordsParams :: PostSubscriptionItemsSubscriptionItemUsageRecordsParams
  , postSubscriptionItemsSubscriptionItemUsageRecordsBody :: PostSubscriptionItemsSubscriptionItemUsageRecordsBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsSubscriptionItemUsageRecordsParams = PostSubscriptionItemsSubscriptionItemUsageRecordsParams
  {  postSubscriptionItemsSubscriptionItemUsageRecordsSubscriptionItem :: (Text)
  {- ^ The ID of the subscription item for this usage record. -}
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsSubscriptionItemUsageRecordsBody
  = PostSubscriptionItemsSubscriptionItemUsageRecordsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionItemsSubscriptionItemUsageRecords = "POST"
type instance RequestPath PostSubscriptionItemsSubscriptionItemUsageRecords = "/v1/subscription_items/{subscription_item}/usage_records"

instance RequestBuilder PostSubscriptionItemsSubscriptionItemUsageRecords where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionItemsSubscriptionItemUsageRecords{..} =
    [ "v1"
    , "subscription_items"
    , pathSimple postSubscriptionItemsSubscriptionItemUsageRecordsSubscriptionItem
    , "usage_records"
    ]
    where
      PostSubscriptionItemsSubscriptionItemUsageRecordsParams{..} = postSubscriptionItemsSubscriptionItemUsageRecordsParams
  endpointQuery PostSubscriptionItemsSubscriptionItemUsageRecords{..} =
    [
    ]
  endpointHeaders PostSubscriptionItemsSubscriptionItemUsageRecords{..} =
    [
    ]



{-
postSubscriptionItemsSubscriptionItemUsageRecords :: PostSubscriptionItemsSubscriptionItemUsageRecords
postSubscriptionItemsSubscriptionItemUsageRecords = PostSubscriptionItemsSubscriptionItemUsageRecords
-}
-- 
{- | <p>Creates a new source object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/sources
-}
-- TODO request options as enum
data PostSources = PostSources
  { postSourcesParams :: PostSourcesParams
  , postSourcesBody :: Maybe PostSourcesBody
  } deriving (Show, Eq, Generic)

data PostSourcesParams = PostSourcesParams
  {
  } deriving (Show, Eq, Generic)

data PostSourcesBody
  = PostSourcesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSources = "POST"
type instance RequestPath PostSources = "/v1/sources"

instance RequestBuilder PostSources where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSources{..} =
    [ "v1"
    , "sources"
    ]
    where
      PostSourcesParams = postSourcesParams
  endpointQuery PostSources{..} =
    [
    ]
  endpointHeaders PostSources{..} =
    [
    ]



{-
postSources :: PostSources
postSources = PostSources
-}
-- 
{- | 

> -- Equivalent to the following API endpoint:
> POST /v1/application_fees/{id}/refund
-}
-- TODO request options as enum
data PostApplicationFeesIdRefund = PostApplicationFeesIdRefund
  { postApplicationFeesIdRefundParams :: PostApplicationFeesIdRefundParams
  , postApplicationFeesIdRefundBody :: Maybe PostApplicationFeesIdRefundBody
  } deriving (Show, Eq, Generic)

data PostApplicationFeesIdRefundParams = PostApplicationFeesIdRefundParams
  {  postApplicationFeesIdRefundId :: (Text)
  } deriving (Show, Eq, Generic)

data PostApplicationFeesIdRefundBody
  = PostApplicationFeesIdRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostApplicationFeesIdRefund = "POST"
type instance RequestPath PostApplicationFeesIdRefund = "/v1/application_fees/{id}/refund"

instance RequestBuilder PostApplicationFeesIdRefund where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostApplicationFeesIdRefund{..} =
    [ "v1"
    , "application_fees"
    , pathSimple postApplicationFeesIdRefundId
    , "refund"
    ]
    where
      PostApplicationFeesIdRefundParams{..} = postApplicationFeesIdRefundParams
  endpointQuery PostApplicationFeesIdRefund{..} =
    [
    ]
  endpointHeaders PostApplicationFeesIdRefund{..} =
    [
    ]



{-
postApplicationFeesIdRefund :: PostApplicationFeesIdRefund
postApplicationFeesIdRefund = PostApplicationFeesIdRefund
-}
-- 
{- | <p>Retrieves the current account balance, based on the authentication that was used to make the request.
 For a sample request, see <a href="/docs/connect/account-balances#accounting-for-negative-balances">Accounting for negative balances</a>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/balance
-}
-- TODO request options as enum
data GetBalance = GetBalance
  { getBalanceParams :: GetBalanceParams
  , getBalanceBody :: Maybe GetBalanceBody
  } deriving (Show, Eq, Generic)

data GetBalanceParams = GetBalanceParams
  {  getBalanceExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetBalanceBody
  = GetBalanceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBalance = "GET"
type instance RequestPath GetBalance = "/v1/balance"

instance RequestBuilder GetBalance where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBalance{..} =
    [ "v1"
    , "balance"
    ]
    where
      GetBalanceParams{..} = getBalanceParams
  endpointQuery GetBalance{..} =
    [ ("expand", queryDeepObjectExplode getBalanceExpand)
    ]
  endpointHeaders GetBalance{..} =
    [
    ]



{-
getBalance :: GetBalance
getBalance = GetBalance
-}
-- 
{- | <p>Updates an existing credit note.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/credit_notes/{id}
-}
-- TODO request options as enum
data PostCreditNotesId = PostCreditNotesId
  { postCreditNotesIdParams :: PostCreditNotesIdParams
  , postCreditNotesIdBody :: Maybe PostCreditNotesIdBody
  } deriving (Show, Eq, Generic)

data PostCreditNotesIdParams = PostCreditNotesIdParams
  {  postCreditNotesIdId :: (Text)
  {- ^ ID of the credit note object to update. -}
  } deriving (Show, Eq, Generic)

data PostCreditNotesIdBody
  = PostCreditNotesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCreditNotesId = "POST"
type instance RequestPath PostCreditNotesId = "/v1/credit_notes/{id}"

instance RequestBuilder PostCreditNotesId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCreditNotesId{..} =
    [ "v1"
    , "credit_notes"
    , pathSimple postCreditNotesIdId
    ]
    where
      PostCreditNotesIdParams{..} = postCreditNotesIdParams
  endpointQuery PostCreditNotesId{..} =
    [
    ]
  endpointHeaders PostCreditNotesId{..} =
    [
    ]



{-
postCreditNotesId :: PostCreditNotesId
postCreditNotesId = PostCreditNotesId
-}
-- 
{- | <p>Retrieves the credit note object with the given identifier.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/credit_notes/{id}
-}
-- TODO request options as enum
data GetCreditNotesId = GetCreditNotesId
  { getCreditNotesIdParams :: GetCreditNotesIdParams
  , getCreditNotesIdBody :: Maybe GetCreditNotesIdBody
  } deriving (Show, Eq, Generic)

data GetCreditNotesIdParams = GetCreditNotesIdParams
  {  getCreditNotesIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCreditNotesIdId :: (Text)
  {- ^ ID of the credit note object to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetCreditNotesIdBody
  = GetCreditNotesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCreditNotesId = "GET"
type instance RequestPath GetCreditNotesId = "/v1/credit_notes/{id}"

instance RequestBuilder GetCreditNotesId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCreditNotesId{..} =
    [ "v1"
    , "credit_notes"
    , pathSimple getCreditNotesIdId
    ]
    where
      GetCreditNotesIdParams{..} = getCreditNotesIdParams
  endpointQuery GetCreditNotesId{..} =
    [ ("expand", queryDeepObjectExplode getCreditNotesIdExpand)
    ]
  endpointHeaders GetCreditNotesId{..} =
    [
    ]



{-
getCreditNotesId :: GetCreditNotesId
getCreditNotesId = GetCreditNotesId
-}
-- 
{- | <p>Stripe will automatically send invoices to customers according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.</p>

<p>Requests made in test-mode result in no emails being sent, despite sending an <code>invoice.sent</code> event.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}/send
-}
-- TODO request options as enum
data PostInvoicesInvoiceSend = PostInvoicesInvoiceSend
  { postInvoicesInvoiceSendParams :: PostInvoicesInvoiceSendParams
  , postInvoicesInvoiceSendBody :: Maybe PostInvoicesInvoiceSendBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceSendParams = PostInvoicesInvoiceSendParams
  {  postInvoicesInvoiceSendInvoice :: (Text)
  {- ^ The invoice you would like to send. The billing mode for this invoice must be `send_invoice`. -}
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceSendBody
  = PostInvoicesInvoiceSendBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoiceSend = "POST"
type instance RequestPath PostInvoicesInvoiceSend = "/v1/invoices/{invoice}/send"

instance RequestBuilder PostInvoicesInvoiceSend where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoiceSend{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoiceSendInvoice
    , "send"
    ]
    where
      PostInvoicesInvoiceSendParams{..} = postInvoicesInvoiceSendParams
  endpointQuery PostInvoicesInvoiceSend{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoiceSend{..} =
    [
    ]



{-
postInvoicesInvoiceSend :: PostInvoicesInvoiceSend
postInvoicesInvoiceSend = PostInvoicesInvoiceSend
-}
-- 
{- | <p>Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.</p>

<p>Note that this endpoint was previously called “Balance history” and used the path <code>/v1/balance/history</code>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/balance_transactions
-}
-- TODO request options as enum
data GetBalanceTransactions = GetBalanceTransactions
  { getBalanceTransactionsParams :: GetBalanceTransactionsParams
  , getBalanceTransactionsBody :: Maybe GetBalanceTransactionsBody
  } deriving (Show, Eq, Generic)

data GetBalanceTransactionsParams = GetBalanceTransactionsParams
  {  getBalanceTransactionsAvailableOn :: Maybe (Either (Object) (Int))
  ,  getBalanceTransactionsCreated :: Maybe (Either (Object) (Int))
  ,  getBalanceTransactionsCurrency :: Maybe (Text)
  ,  getBalanceTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getBalanceTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBalanceTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getBalanceTransactionsPayout :: Maybe (Text)
  {- ^ For automatic Stripe payouts only, only returns transactions that were paid out on the specified payout ID. -}
  ,  getBalanceTransactionsSource :: Maybe (Text)
  {- ^ Only returns the original transaction. -}
  ,  getBalanceTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getBalanceTransactionsType :: Maybe (Text)
  {- ^ Only returns transactions of the given type. One of: `charge`, `refund`, `adjustment`, `application_fee`, `application_fee_refund`, `transfer`, `payment`, `payout`, `payout_failure`, `stripe_fee`, or `network_cost`. -}
  } deriving (Show, Eq, Generic)

data GetBalanceTransactionsBody
  = GetBalanceTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBalanceTransactions = "GET"
type instance RequestPath GetBalanceTransactions = "/v1/balance_transactions"

instance RequestBuilder GetBalanceTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBalanceTransactions{..} =
    [ "v1"
    , "balance_transactions"
    ]
    where
      GetBalanceTransactionsParams{..} = getBalanceTransactionsParams
  endpointQuery GetBalanceTransactions{..} =
    [ ("available_on", queryDeepObjectExplode getBalanceTransactionsAvailableOn)
    , ("created", queryDeepObjectExplode getBalanceTransactionsCreated)
    , ("currency", queryFormExplode getBalanceTransactionsCurrency)
    , ("ending_before", queryFormExplode getBalanceTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getBalanceTransactionsExpand)
    , ("limit", queryFormExplode getBalanceTransactionsLimit)
    , ("payout", queryFormExplode getBalanceTransactionsPayout)
    , ("source", queryFormExplode getBalanceTransactionsSource)
    , ("starting_after", queryFormExplode getBalanceTransactionsStartingAfter)
    , ("type", queryFormExplode getBalanceTransactionsType)
    ]
    where
      GetBalanceTransactionsParams{..} = getBalanceTransactionsParams
  endpointHeaders GetBalanceTransactions{..} =
    [
    ]



{-
getBalanceTransactions :: GetBalanceTransactions
getBalanceTransactions = GetBalanceTransactions
-}
-- 
{- | <p>Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/capabilities
-}
-- TODO request options as enum
data GetAccountCapabilities = GetAccountCapabilities
  { getAccountCapabilitiesParams :: GetAccountCapabilitiesParams
  , getAccountCapabilitiesBody :: Maybe GetAccountCapabilitiesBody
  } deriving (Show, Eq, Generic)

data GetAccountCapabilitiesParams = GetAccountCapabilitiesParams
  {  getAccountCapabilitiesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountCapabilitiesBody
  = GetAccountCapabilitiesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountCapabilities = "GET"
type instance RequestPath GetAccountCapabilities = "/v1/account/capabilities"

instance RequestBuilder GetAccountCapabilities where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountCapabilities{..} =
    [ "v1"
    , "account"
    , "capabilities"
    ]
    where
      GetAccountCapabilitiesParams{..} = getAccountCapabilitiesParams
  endpointQuery GetAccountCapabilities{..} =
    [ ("expand", queryDeepObjectExplode getAccountCapabilitiesExpand)
    ]
  endpointHeaders GetAccountCapabilities{..} =
    [
    ]



{-
getAccountCapabilities :: GetAccountCapabilities
getAccountCapabilities = GetAccountCapabilities
-}
-- 
{- | <p>Updates an existing file link object. Expired links can no longer be updated.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/file_links/{link}
-}
-- TODO request options as enum
data PostFileLinksLink = PostFileLinksLink
  { postFileLinksLinkParams :: PostFileLinksLinkParams
  , postFileLinksLinkBody :: Maybe PostFileLinksLinkBody
  } deriving (Show, Eq, Generic)

data PostFileLinksLinkParams = PostFileLinksLinkParams
  {  postFileLinksLinkLink :: (Text)
  {- ^ The ID of the file link. -}
  } deriving (Show, Eq, Generic)

data PostFileLinksLinkBody
  = PostFileLinksLinkBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostFileLinksLink = "POST"
type instance RequestPath PostFileLinksLink = "/v1/file_links/{link}"

instance RequestBuilder PostFileLinksLink where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostFileLinksLink{..} =
    [ "v1"
    , "file_links"
    , pathSimple postFileLinksLinkLink
    ]
    where
      PostFileLinksLinkParams{..} = postFileLinksLinkParams
  endpointQuery PostFileLinksLink{..} =
    [
    ]
  endpointHeaders PostFileLinksLink{..} =
    [
    ]



{-
postFileLinksLink :: PostFileLinksLink
postFileLinksLink = PostFileLinksLink
-}
-- 
{- | <p>Retrieves the file link with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/file_links/{link}
-}
-- TODO request options as enum
data GetFileLinksLink = GetFileLinksLink
  { getFileLinksLinkParams :: GetFileLinksLinkParams
  , getFileLinksLinkBody :: Maybe GetFileLinksLinkBody
  } deriving (Show, Eq, Generic)

data GetFileLinksLinkParams = GetFileLinksLinkParams
  {  getFileLinksLinkExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getFileLinksLinkLink :: (Text)
  {- ^ The identifier of the file link to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetFileLinksLinkBody
  = GetFileLinksLinkBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetFileLinksLink = "GET"
type instance RequestPath GetFileLinksLink = "/v1/file_links/{link}"

instance RequestBuilder GetFileLinksLink where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetFileLinksLink{..} =
    [ "v1"
    , "file_links"
    , pathSimple getFileLinksLinkLink
    ]
    where
      GetFileLinksLinkParams{..} = getFileLinksLinkParams
  endpointQuery GetFileLinksLink{..} =
    [ ("expand", queryDeepObjectExplode getFileLinksLinkExpand)
    ]
  endpointHeaders GetFileLinksLink{..} =
    [
    ]



{-
getFileLinksLink :: GetFileLinksLink
getFileLinksLink = GetFileLinksLink
-}
-- 
{- | <p>Creates an Issuing <code>Dispute</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/disputes
-}
-- TODO request options as enum
data PostIssuingDisputes = PostIssuingDisputes
  { postIssuingDisputesParams :: PostIssuingDisputesParams
  , postIssuingDisputesBody :: PostIssuingDisputesBody
  } deriving (Show, Eq, Generic)

data PostIssuingDisputesParams = PostIssuingDisputesParams
  {
  } deriving (Show, Eq, Generic)

data PostIssuingDisputesBody
  = PostIssuingDisputesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingDisputes = "POST"
type instance RequestPath PostIssuingDisputes = "/v1/issuing/disputes"

instance RequestBuilder PostIssuingDisputes where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingDisputes{..} =
    [ "v1"
    , "issuing"
    , "disputes"
    ]
    where
      PostIssuingDisputesParams = postIssuingDisputesParams
  endpointQuery PostIssuingDisputes{..} =
    [
    ]
  endpointHeaders PostIssuingDisputes{..} =
    [
    ]



{-
postIssuingDisputes :: PostIssuingDisputes
postIssuingDisputes = PostIssuingDisputes
-}
-- 
{- | <p>Returns a list of Issuing <code>Dispute</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/disputes
-}
-- TODO request options as enum
data GetIssuingDisputes = GetIssuingDisputes
  { getIssuingDisputesParams :: GetIssuingDisputesParams
  , getIssuingDisputesBody :: Maybe GetIssuingDisputesBody
  } deriving (Show, Eq, Generic)

data GetIssuingDisputesParams = GetIssuingDisputesParams
  {  getIssuingDisputesCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return issuing disputes that were created during the given date interval. -}
  ,  getIssuingDisputesDisputedTransaction :: Maybe (Text)
  {- ^ Only return issuing disputes for the given transaction. -}
  ,  getIssuingDisputesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingDisputesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingDisputesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingDisputesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetIssuingDisputesBody
  = GetIssuingDisputesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingDisputes = "GET"
type instance RequestPath GetIssuingDisputes = "/v1/issuing/disputes"

instance RequestBuilder GetIssuingDisputes where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingDisputes{..} =
    [ "v1"
    , "issuing"
    , "disputes"
    ]
    where
      GetIssuingDisputesParams{..} = getIssuingDisputesParams
  endpointQuery GetIssuingDisputes{..} =
    [ ("created", queryDeepObjectExplode getIssuingDisputesCreated)
    , ("disputed_transaction", queryFormExplode getIssuingDisputesDisputedTransaction)
    , ("ending_before", queryFormExplode getIssuingDisputesEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuingDisputesExpand)
    , ("limit", queryFormExplode getIssuingDisputesLimit)
    , ("starting_after", queryFormExplode getIssuingDisputesStartingAfter)
    ]
    where
      GetIssuingDisputesParams{..} = getIssuingDisputesParams
  endpointHeaders GetIssuingDisputes{..} =
    [
    ]



{-
getIssuingDisputes :: GetIssuingDisputes
getIssuingDisputes = GetIssuingDisputes
-}
-- 
{- | <p>Updates an existing person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/people/{person}
-}
-- TODO request options as enum
data PostAccountsAccountPeoplePerson = PostAccountsAccountPeoplePerson
  { postAccountsAccountPeoplePersonParams :: PostAccountsAccountPeoplePersonParams
  , postAccountsAccountPeoplePersonBody :: Maybe PostAccountsAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPeoplePersonParams = PostAccountsAccountPeoplePersonParams
  {  postAccountsAccountPeoplePersonAccount :: (Text)
  {- ^ The account that the person is associated with. -}
  ,  postAccountsAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of a person to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPeoplePersonBody
  = PostAccountsAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountPeoplePerson = "POST"
type instance RequestPath PostAccountsAccountPeoplePerson = "/v1/accounts/{account}/people/{person}"

instance RequestBuilder PostAccountsAccountPeoplePerson where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountPeoplePerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountPeoplePersonAccount
    , "people"
    , pathSimple postAccountsAccountPeoplePersonPerson
    ]
    where
      PostAccountsAccountPeoplePersonParams{..} = postAccountsAccountPeoplePersonParams
  endpointQuery PostAccountsAccountPeoplePerson{..} =
    [
    ]
  endpointHeaders PostAccountsAccountPeoplePerson{..} =
    [
    ]



{-
postAccountsAccountPeoplePerson :: PostAccountsAccountPeoplePerson
postAccountsAccountPeoplePerson = PostAccountsAccountPeoplePerson
-}
-- 
{- | <p>Retrieves an existing person.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/people/{person}
-}
-- TODO request options as enum
data GetAccountsAccountPeoplePerson = GetAccountsAccountPeoplePerson
  { getAccountsAccountPeoplePersonParams :: GetAccountsAccountPeoplePersonParams
  , getAccountsAccountPeoplePersonBody :: Maybe GetAccountsAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPeoplePersonParams = GetAccountsAccountPeoplePersonParams
  {  getAccountsAccountPeoplePersonAccount :: (Text)
  ,  getAccountsAccountPeoplePersonExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of a person to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPeoplePersonBody
  = GetAccountsAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountPeoplePerson = "GET"
type instance RequestPath GetAccountsAccountPeoplePerson = "/v1/accounts/{account}/people/{person}"

instance RequestBuilder GetAccountsAccountPeoplePerson where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountPeoplePerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountPeoplePersonAccount
    , "people"
    , pathSimple getAccountsAccountPeoplePersonPerson
    ]
    where
      GetAccountsAccountPeoplePersonParams{..} = getAccountsAccountPeoplePersonParams
  endpointQuery GetAccountsAccountPeoplePerson{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountPeoplePersonExpand)
    ]
  endpointHeaders GetAccountsAccountPeoplePerson{..} =
    [
    ]



{-
getAccountsAccountPeoplePerson :: GetAccountsAccountPeoplePerson
getAccountsAccountPeoplePerson = GetAccountsAccountPeoplePerson
-}
-- 
{- | <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/accounts/{account}/people/{person}
-}
-- TODO request options as enum
data DeleteAccountsAccountPeoplePerson = DeleteAccountsAccountPeoplePerson
  { deleteAccountsAccountPeoplePersonParams :: DeleteAccountsAccountPeoplePersonParams
  , deleteAccountsAccountPeoplePersonBody :: Maybe DeleteAccountsAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountPeoplePersonParams = DeleteAccountsAccountPeoplePersonParams
  {  deleteAccountsAccountPeoplePersonAccount :: (Text)
  ,  deleteAccountsAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of the person to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountPeoplePersonBody
  = DeleteAccountsAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountsAccountPeoplePerson = "DELETE"
type instance RequestPath DeleteAccountsAccountPeoplePerson = "/v1/accounts/{account}/people/{person}"

instance RequestBuilder DeleteAccountsAccountPeoplePerson where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountsAccountPeoplePerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple deleteAccountsAccountPeoplePersonAccount
    , "people"
    , pathSimple deleteAccountsAccountPeoplePersonPerson
    ]
    where
      DeleteAccountsAccountPeoplePersonParams{..} = deleteAccountsAccountPeoplePersonParams
  endpointQuery DeleteAccountsAccountPeoplePerson{..} =
    [
    ]
  endpointHeaders DeleteAccountsAccountPeoplePerson{..} =
    [
    ]



{-
deleteAccountsAccountPeoplePerson :: DeleteAccountsAccountPeoplePerson
deleteAccountsAccountPeoplePerson = DeleteAccountsAccountPeoplePerson
-}
-- 
{- | <p>Updates the specified recipient by setting the values of the parameters passed.
Any parameters not provided will be left unchanged.</p>

<p>If you update the name or tax ID, the identity verification will automatically be rerun.
If you update the bank account, the bank account validation will automatically be rerun.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/recipients/{id}
-}
-- TODO request options as enum
data PostRecipientsId = PostRecipientsId
  { postRecipientsIdParams :: PostRecipientsIdParams
  , postRecipientsIdBody :: Maybe PostRecipientsIdBody
  } deriving (Show, Eq, Generic)

data PostRecipientsIdParams = PostRecipientsIdParams
  {  postRecipientsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostRecipientsIdBody
  = PostRecipientsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRecipientsId = "POST"
type instance RequestPath PostRecipientsId = "/v1/recipients/{id}"

instance RequestBuilder PostRecipientsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRecipientsId{..} =
    [ "v1"
    , "recipients"
    , pathSimple postRecipientsIdId
    ]
    where
      PostRecipientsIdParams{..} = postRecipientsIdParams
  endpointQuery PostRecipientsId{..} =
    [
    ]
  endpointHeaders PostRecipientsId{..} =
    [
    ]



{-
postRecipientsId :: PostRecipientsId
postRecipientsId = PostRecipientsId
-}
-- {-# DEPRECATED postRecipientsId, PostRecipientsId "This endpoint is deprecated by the API creator" #-}
{- | <p>Retrieves the details of an existing recipient. You need only supply the unique recipient identifier that was returned upon recipient creation.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/recipients/{id}
-}
-- TODO request options as enum
data GetRecipientsId = GetRecipientsId
  { getRecipientsIdParams :: GetRecipientsIdParams
  , getRecipientsIdBody :: Maybe GetRecipientsIdBody
  } deriving (Show, Eq, Generic)

data GetRecipientsIdParams = GetRecipientsIdParams
  {  getRecipientsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRecipientsIdId :: (Text)
  {- ^ The identifier of the recipient to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetRecipientsIdBody
  = GetRecipientsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRecipientsId = "GET"
type instance RequestPath GetRecipientsId = "/v1/recipients/{id}"

instance RequestBuilder GetRecipientsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRecipientsId{..} =
    [ "v1"
    , "recipients"
    , pathSimple getRecipientsIdId
    ]
    where
      GetRecipientsIdParams{..} = getRecipientsIdParams
  endpointQuery GetRecipientsId{..} =
    [ ("expand", queryDeepObjectExplode getRecipientsIdExpand)
    ]
  endpointHeaders GetRecipientsId{..} =
    [
    ]



{-
getRecipientsId :: GetRecipientsId
getRecipientsId = GetRecipientsId
-}
-- {-# DEPRECATED getRecipientsId, GetRecipientsId "This endpoint is deprecated by the API creator" #-}
{- | <p>Permanently deletes a recipient. It cannot be undone.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/recipients/{id}
-}
-- TODO request options as enum
data DeleteRecipientsId = DeleteRecipientsId
  { deleteRecipientsIdParams :: DeleteRecipientsIdParams
  , deleteRecipientsIdBody :: Maybe DeleteRecipientsIdBody
  } deriving (Show, Eq, Generic)

data DeleteRecipientsIdParams = DeleteRecipientsIdParams
  {  deleteRecipientsIdId :: (Text)
  {- ^ The identifier of the recipient to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteRecipientsIdBody
  = DeleteRecipientsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteRecipientsId = "DELETE"
type instance RequestPath DeleteRecipientsId = "/v1/recipients/{id}"

instance RequestBuilder DeleteRecipientsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteRecipientsId{..} =
    [ "v1"
    , "recipients"
    , pathSimple deleteRecipientsIdId
    ]
    where
      DeleteRecipientsIdParams{..} = deleteRecipientsIdParams
  endpointQuery DeleteRecipientsId{..} =
    [
    ]
  endpointHeaders DeleteRecipientsId{..} =
    [
    ]



{-
deleteRecipientsId :: DeleteRecipientsId
deleteRecipientsId = DeleteRecipientsId
-}
-- {-# DEPRECATED deleteRecipientsId, DeleteRecipientsId "This endpoint is deprecated by the API creator" #-}
{- | <p>Verify a given source.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/sources/{source}/verify
-}
-- TODO request options as enum
data PostSourcesSourceVerify = PostSourcesSourceVerify
  { postSourcesSourceVerifyParams :: PostSourcesSourceVerifyParams
  , postSourcesSourceVerifyBody :: PostSourcesSourceVerifyBody
  } deriving (Show, Eq, Generic)

data PostSourcesSourceVerifyParams = PostSourcesSourceVerifyParams
  {  postSourcesSourceVerifySource :: (Text)
  {- ^ The ID of the desired source. -}
  } deriving (Show, Eq, Generic)

data PostSourcesSourceVerifyBody
  = PostSourcesSourceVerifyBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSourcesSourceVerify = "POST"
type instance RequestPath PostSourcesSourceVerify = "/v1/sources/{source}/verify"

instance RequestBuilder PostSourcesSourceVerify where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSourcesSourceVerify{..} =
    [ "v1"
    , "sources"
    , pathSimple postSourcesSourceVerifySource
    , "verify"
    ]
    where
      PostSourcesSourceVerifyParams{..} = postSourcesSourceVerifyParams
  endpointQuery PostSourcesSourceVerify{..} =
    [
    ]
  endpointHeaders PostSourcesSourceVerify{..} =
    [
    ]



{-
postSourcesSourceVerify :: PostSourcesSourceVerify
postSourcesSourceVerify = PostSourcesSourceVerify
-}
-- 
{- | <p>Top up the balance of an account</p>

> -- Equivalent to the following API endpoint:
> POST /v1/topups
-}
-- TODO request options as enum
data PostTopups = PostTopups
  { postTopupsParams :: PostTopupsParams
  , postTopupsBody :: PostTopupsBody
  } deriving (Show, Eq, Generic)

data PostTopupsParams = PostTopupsParams
  {
  } deriving (Show, Eq, Generic)

data PostTopupsBody
  = PostTopupsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTopups = "POST"
type instance RequestPath PostTopups = "/v1/topups"

instance RequestBuilder PostTopups where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTopups{..} =
    [ "v1"
    , "topups"
    ]
    where
      PostTopupsParams = postTopupsParams
  endpointQuery PostTopups{..} =
    [
    ]
  endpointHeaders PostTopups{..} =
    [
    ]



{-
postTopups :: PostTopups
postTopups = PostTopups
-}
-- 
{- | <p>Returns a list of top-ups.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/topups
-}
-- TODO request options as enum
data GetTopups = GetTopups
  { getTopupsParams :: GetTopupsParams
  , getTopupsBody :: Maybe GetTopupsBody
  } deriving (Show, Eq, Generic)

data GetTopupsParams = GetTopupsParams
  {  getTopupsAmount :: Maybe (Either (Object) (Int))
  {- ^ A positive integer representing how much to transfer. -}
  ,  getTopupsCreated :: Maybe (Either (Object) (Int))
  {- ^ A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. -}
  ,  getTopupsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTopupsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTopupsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTopupsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getTopupsStatus :: Maybe (Status)
  {- ^ Only return top-ups that have the given status. One of `canceled`, `failed`, `pending` or `succeeded`. -}
  } deriving (Show, Eq, Generic)

data GetTopupsBody
  = GetTopupsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTopups = "GET"
type instance RequestPath GetTopups = "/v1/topups"

instance RequestBuilder GetTopups where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTopups{..} =
    [ "v1"
    , "topups"
    ]
    where
      GetTopupsParams{..} = getTopupsParams
  endpointQuery GetTopups{..} =
    [ ("amount", queryDeepObjectExplode getTopupsAmount)
    , ("created", queryDeepObjectExplode getTopupsCreated)
    , ("ending_before", queryFormExplode getTopupsEndingBefore)
    , ("expand", queryDeepObjectExplode getTopupsExpand)
    , ("limit", queryFormExplode getTopupsLimit)
    , ("starting_after", queryFormExplode getTopupsStartingAfter)
    , ("status", queryFormExplode getTopupsStatus)
    ]
    where
      GetTopupsParams{..} = getTopupsParams
  endpointHeaders GetTopups{..} =
    [
    ]



{-
getTopups :: GetTopups
getTopups = GetTopups
-}
-- 
{- | <p>Some actions (eg: updating a PIN) need confirmation from the cardholder</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/verifications
-}
-- TODO request options as enum
data PostIssuingVerifications = PostIssuingVerifications
  { postIssuingVerificationsParams :: PostIssuingVerificationsParams
  , postIssuingVerificationsBody :: PostIssuingVerificationsBody
  } deriving (Show, Eq, Generic)

data PostIssuingVerificationsParams = PostIssuingVerificationsParams
  {
  } deriving (Show, Eq, Generic)

data PostIssuingVerificationsBody
  = PostIssuingVerificationsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingVerifications = "POST"
type instance RequestPath PostIssuingVerifications = "/v1/issuing/verifications"

instance RequestBuilder PostIssuingVerifications where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingVerifications{..} =
    [ "v1"
    , "issuing"
    , "verifications"
    ]
    where
      PostIssuingVerificationsParams = postIssuingVerificationsParams
  endpointQuery PostIssuingVerifications{..} =
    [
    ]
  endpointHeaders PostIssuingVerifications{..} =
    [
    ]



{-
postIssuingVerifications :: PostIssuingVerifications
postIssuingVerifications = PostIssuingVerifications
-}
-- 
{- | <p>Returns a list of objects that contain the rates at which foreign currencies are converted to one another. Only shows the currencies for which Stripe supports.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/exchange_rates
-}
-- TODO request options as enum
data GetExchangeRates = GetExchangeRates
  { getExchangeRatesParams :: GetExchangeRatesParams
  , getExchangeRatesBody :: Maybe GetExchangeRatesBody
  } deriving (Show, Eq, Generic)

data GetExchangeRatesParams = GetExchangeRatesParams
  {  getExchangeRatesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is the currency that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with the exchange rate for currency X your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getExchangeRatesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getExchangeRatesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and total number of supported payout currencies, and the default is the max. -}
  ,  getExchangeRatesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is the currency that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with the exchange rate for currency X, your subsequent call can include `starting_after=X` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetExchangeRatesBody
  = GetExchangeRatesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetExchangeRates = "GET"
type instance RequestPath GetExchangeRates = "/v1/exchange_rates"

instance RequestBuilder GetExchangeRates where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetExchangeRates{..} =
    [ "v1"
    , "exchange_rates"
    ]
    where
      GetExchangeRatesParams{..} = getExchangeRatesParams
  endpointQuery GetExchangeRates{..} =
    [ ("ending_before", queryFormExplode getExchangeRatesEndingBefore)
    , ("expand", queryDeepObjectExplode getExchangeRatesExpand)
    , ("limit", queryFormExplode getExchangeRatesLimit)
    , ("starting_after", queryFormExplode getExchangeRatesStartingAfter)
    ]
    where
      GetExchangeRatesParams{..} = getExchangeRatesParams
  endpointHeaders GetExchangeRates{..} =
    [
    ]



{-
getExchangeRates :: GetExchangeRates
getExchangeRates = GetExchangeRates
-}
-- 
{- | <p>Creates an AccountLink object that returns a Stripe URL that the user can redirect their user to in order to take them through the hosted onboarding flow.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account_links
-}
-- TODO request options as enum
data PostAccountLinks = PostAccountLinks
  { postAccountLinksParams :: PostAccountLinksParams
  , postAccountLinksBody :: PostAccountLinksBody
  } deriving (Show, Eq, Generic)

data PostAccountLinksParams = PostAccountLinksParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountLinksBody
  = PostAccountLinksBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountLinks = "POST"
type instance RequestPath PostAccountLinks = "/v1/account_links"

instance RequestBuilder PostAccountLinks where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountLinks{..} =
    [ "v1"
    , "account_links"
    ]
    where
      PostAccountLinksParams = postAccountLinksParams
  endpointQuery PostAccountLinks{..} =
    [
    ]
  endpointHeaders PostAccountLinks{..} =
    [
    ]



{-
postAccountLinks :: PostAccountLinks
postAccountLinks = PostAccountLinks
-}
-- 
{- | <p>Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>Note that a product’s <code>attributes</code> are not editable. Instead, you would need to deactivate the existing product and create a new one with the new attribute values.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/products/{id}
-}
-- TODO request options as enum
data PostProductsId = PostProductsId
  { postProductsIdParams :: PostProductsIdParams
  , postProductsIdBody :: Maybe PostProductsIdBody
  } deriving (Show, Eq, Generic)

data PostProductsIdParams = PostProductsIdParams
  {  postProductsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostProductsIdBody
  = PostProductsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostProductsId = "POST"
type instance RequestPath PostProductsId = "/v1/products/{id}"

instance RequestBuilder PostProductsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostProductsId{..} =
    [ "v1"
    , "products"
    , pathSimple postProductsIdId
    ]
    where
      PostProductsIdParams{..} = postProductsIdParams
  endpointQuery PostProductsId{..} =
    [
    ]
  endpointHeaders PostProductsId{..} =
    [
    ]



{-
postProductsId :: PostProductsId
postProductsId = PostProductsId
-}
-- 
{- | <p>Retrieves the details of an existing product. Supply the unique product ID from either a product creation request or the product list, and Stripe will return the corresponding product information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/products/{id}
-}
-- TODO request options as enum
data GetProductsId = GetProductsId
  { getProductsIdParams :: GetProductsIdParams
  , getProductsIdBody :: Maybe GetProductsIdBody
  } deriving (Show, Eq, Generic)

data GetProductsIdParams = GetProductsIdParams
  {  getProductsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getProductsIdId :: (Text)
  {- ^ The identifier of the product to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetProductsIdBody
  = GetProductsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetProductsId = "GET"
type instance RequestPath GetProductsId = "/v1/products/{id}"

instance RequestBuilder GetProductsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetProductsId{..} =
    [ "v1"
    , "products"
    , pathSimple getProductsIdId
    ]
    where
      GetProductsIdParams{..} = getProductsIdParams
  endpointQuery GetProductsId{..} =
    [ ("expand", queryDeepObjectExplode getProductsIdExpand)
    ]
  endpointHeaders GetProductsId{..} =
    [
    ]



{-
getProductsId :: GetProductsId
getProductsId = GetProductsId
-}
-- 
{- | <p>Delete a product. Deleting a product with type=<code>good</code> is only possible if it has no SKUs associated with it. Deleting a product with type=<code>service</code> is only possible if it has no plans associated with it.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/products/{id}
-}
-- TODO request options as enum
data DeleteProductsId = DeleteProductsId
  { deleteProductsIdParams :: DeleteProductsIdParams
  , deleteProductsIdBody :: Maybe DeleteProductsIdBody
  } deriving (Show, Eq, Generic)

data DeleteProductsIdParams = DeleteProductsIdParams
  {  deleteProductsIdId :: (Text)
  {- ^ The ID of the product to delete. -}
  } deriving (Show, Eq, Generic)

data DeleteProductsIdBody
  = DeleteProductsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteProductsId = "DELETE"
type instance RequestPath DeleteProductsId = "/v1/products/{id}"

instance RequestBuilder DeleteProductsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteProductsId{..} =
    [ "v1"
    , "products"
    , pathSimple deleteProductsIdId
    ]
    where
      DeleteProductsIdParams{..} = deleteProductsIdParams
  endpointQuery DeleteProductsId{..} =
    [
    ]
  endpointHeaders DeleteProductsId{..} =
    [
    ]



{-
deleteProductsId :: DeleteProductsId
deleteProductsId = DeleteProductsId
-}
-- 
{- | <p>Retrieves the details of an application fee that your account has collected. The same information is returned when refunding the application fee.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/application_fees/{id}
-}
-- TODO request options as enum
data GetApplicationFeesId = GetApplicationFeesId
  { getApplicationFeesIdParams :: GetApplicationFeesIdParams
  , getApplicationFeesIdBody :: Maybe GetApplicationFeesIdBody
  } deriving (Show, Eq, Generic)

data GetApplicationFeesIdParams = GetApplicationFeesIdParams
  {  getApplicationFeesIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getApplicationFeesIdId :: (Text)
  {- ^ The identifier of the fee to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetApplicationFeesIdBody
  = GetApplicationFeesIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplicationFeesId = "GET"
type instance RequestPath GetApplicationFeesId = "/v1/application_fees/{id}"

instance RequestBuilder GetApplicationFeesId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplicationFeesId{..} =
    [ "v1"
    , "application_fees"
    , pathSimple getApplicationFeesIdId
    ]
    where
      GetApplicationFeesIdParams{..} = getApplicationFeesIdParams
  endpointQuery GetApplicationFeesId{..} =
    [ ("expand", queryDeepObjectExplode getApplicationFeesIdExpand)
    ]
  endpointHeaders GetApplicationFeesId{..} =
    [
    ]



{-
getApplicationFeesId :: GetApplicationFeesId
getApplicationFeesId = GetApplicationFeesId
-}
-- 
{- | <p>Creates a single-use login link for an Express account to access their Stripe dashboard.</p>

<p><strong>You may only create login links for <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/login_links
-}
-- TODO request options as enum
data PostAccountsAccountLoginLinks = PostAccountsAccountLoginLinks
  { postAccountsAccountLoginLinksParams :: PostAccountsAccountLoginLinksParams
  , postAccountsAccountLoginLinksBody :: Maybe PostAccountsAccountLoginLinksBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountLoginLinksParams = PostAccountsAccountLoginLinksParams
  {  postAccountsAccountLoginLinksAccount :: (Text)
  {- ^ The identifier of the account to create a login link for. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountLoginLinksBody
  = PostAccountsAccountLoginLinksBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountLoginLinks = "POST"
type instance RequestPath PostAccountsAccountLoginLinks = "/v1/accounts/{account}/login_links"

instance RequestBuilder PostAccountsAccountLoginLinks where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountLoginLinks{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountLoginLinksAccount
    , "login_links"
    ]
    where
      PostAccountsAccountLoginLinksParams{..} = postAccountsAccountLoginLinksParams
  endpointQuery PostAccountsAccountLoginLinks{..} =
    [
    ]
  endpointHeaders PostAccountsAccountLoginLinks{..} =
    [
    ]



{-
postAccountsAccountLoginLinks :: PostAccountsAccountLoginLinks
postAccountsAccountLoginLinks = PostAccountsAccountLoginLinks
-}
-- 
{- | <p>Update a specified refund.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/refunds/{refund}
-}
-- TODO request options as enum
data PostChargesChargeRefundsRefund = PostChargesChargeRefundsRefund
  { postChargesChargeRefundsRefundParams :: PostChargesChargeRefundsRefundParams
  , postChargesChargeRefundsRefundBody :: Maybe PostChargesChargeRefundsRefundBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundsRefundParams = PostChargesChargeRefundsRefundParams
  {  postChargesChargeRefundsRefundCharge :: (Text)
  ,  postChargesChargeRefundsRefundRefund :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundsRefundBody
  = PostChargesChargeRefundsRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeRefundsRefund = "POST"
type instance RequestPath PostChargesChargeRefundsRefund = "/v1/charges/{charge}/refunds/{refund}"

instance RequestBuilder PostChargesChargeRefundsRefund where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeRefundsRefund{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeRefundsRefundCharge
    , "refunds"
    , pathSimple postChargesChargeRefundsRefundRefund
    ]
    where
      PostChargesChargeRefundsRefundParams{..} = postChargesChargeRefundsRefundParams
  endpointQuery PostChargesChargeRefundsRefund{..} =
    [
    ]
  endpointHeaders PostChargesChargeRefundsRefund{..} =
    [
    ]



{-
postChargesChargeRefundsRefund :: PostChargesChargeRefundsRefund
postChargesChargeRefundsRefund = PostChargesChargeRefundsRefund
-}
-- 
{- | <p>Retrieves the details of an existing refund.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/charges/{charge}/refunds/{refund}
-}
-- TODO request options as enum
data GetChargesChargeRefundsRefund = GetChargesChargeRefundsRefund
  { getChargesChargeRefundsRefundParams :: GetChargesChargeRefundsRefundParams
  , getChargesChargeRefundsRefundBody :: Maybe GetChargesChargeRefundsRefundBody
  } deriving (Show, Eq, Generic)

data GetChargesChargeRefundsRefundParams = GetChargesChargeRefundsRefundParams
  {  getChargesChargeRefundsRefundCharge :: (Text)
  ,  getChargesChargeRefundsRefundExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getChargesChargeRefundsRefundRefund :: (Text)
  } deriving (Show, Eq, Generic)

data GetChargesChargeRefundsRefundBody
  = GetChargesChargeRefundsRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetChargesChargeRefundsRefund = "GET"
type instance RequestPath GetChargesChargeRefundsRefund = "/v1/charges/{charge}/refunds/{refund}"

instance RequestBuilder GetChargesChargeRefundsRefund where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetChargesChargeRefundsRefund{..} =
    [ "v1"
    , "charges"
    , pathSimple getChargesChargeRefundsRefundCharge
    , "refunds"
    , pathSimple getChargesChargeRefundsRefundRefund
    ]
    where
      GetChargesChargeRefundsRefundParams{..} = getChargesChargeRefundsRefundParams
  endpointQuery GetChargesChargeRefundsRefund{..} =
    [ ("expand", queryDeepObjectExplode getChargesChargeRefundsRefundExpand)
    ]
  endpointHeaders GetChargesChargeRefundsRefund{..} =
    [
    ]



{-
getChargesChargeRefundsRefund :: GetChargesChargeRefundsRefund
getChargesChargeRefundsRefund = GetChargesChargeRefundsRefund
-}
-- 
{- | <p>To upload a file to Stripe, you’ll need to send a request of type <code>multipart/form-data</code>. The request should contain the file you would like to upload, as well as the parameters for creating a file.</p>

<p>All of Stripe’s officially supported Client libraries should have support for sending <code>multipart/form-data</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/files
-}
-- TODO request options as enum
data PostFiles = PostFiles
  { postFilesParams :: PostFilesParams
  , postFilesBody :: PostFilesBody
  } deriving (Show, Eq, Generic)

data PostFilesParams = PostFilesParams
  {
  } deriving (Show, Eq, Generic)

data PostFilesBody
  = PostFilesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostFiles = "POST"
type instance RequestPath PostFiles = "/v1/files"

instance RequestBuilder PostFiles where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostFiles{..} =
    [ "v1"
    , "files"
    ]
    where
      PostFilesParams = postFilesParams
  endpointQuery PostFiles{..} =
    [
    ]
  endpointHeaders PostFiles{..} =
    [
    ]



{-
postFiles :: PostFiles
postFiles = PostFiles
-}
-- 
{- | <p>Returns a list of the files that your account has access to. The files are returned sorted by creation date, with the most recently created files appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/files
-}
-- TODO request options as enum
data GetFiles = GetFiles
  { getFilesParams :: GetFilesParams
  , getFilesBody :: Maybe GetFilesBody
  } deriving (Show, Eq, Generic)

data GetFilesParams = GetFilesParams
  {  getFilesCreated :: Maybe (Either (Object) (Int))
  ,  getFilesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getFilesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getFilesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getFilesPurpose :: Maybe (Purpose)
  {- ^ The file purpose to filter queries by. If none is provided, files will not be filtered by purpose. -}
  ,  getFilesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetFilesBody
  = GetFilesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetFiles = "GET"
type instance RequestPath GetFiles = "/v1/files"

instance RequestBuilder GetFiles where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetFiles{..} =
    [ "v1"
    , "files"
    ]
    where
      GetFilesParams{..} = getFilesParams
  endpointQuery GetFiles{..} =
    [ ("created", queryDeepObjectExplode getFilesCreated)
    , ("ending_before", queryFormExplode getFilesEndingBefore)
    , ("expand", queryDeepObjectExplode getFilesExpand)
    , ("limit", queryFormExplode getFilesLimit)
    , ("purpose", queryFormExplode getFilesPurpose)
    , ("starting_after", queryFormExplode getFilesStartingAfter)
    ]
    where
      GetFilesParams{..} = getFilesParams
  endpointHeaders GetFiles{..} =
    [
    ]



{-
getFiles :: GetFiles
getFiles = GetFiles
-}
-- 
{- | <p>To send funds to your own bank account, you create a new payout object. Your <a href="#balance">Stripe balance</a> must be able to cover the payout amount, or you’ll receive an “Insufficient Funds” error.</p>

<p>If your API key is in test mode, money won’t actually be sent, though everything else will occur as if in live mode.</p>

<p>If you are creating a manual payout on a Stripe account that uses multiple payment source types, you’ll need to specify the source type balance that the payout should draw from. The <a href="#balance_object">balance object</a> details available and pending amounts by source type.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payouts
-}
-- TODO request options as enum
data PostPayouts = PostPayouts
  { postPayoutsParams :: PostPayoutsParams
  , postPayoutsBody :: PostPayoutsBody
  } deriving (Show, Eq, Generic)

data PostPayoutsParams = PostPayoutsParams
  {
  } deriving (Show, Eq, Generic)

data PostPayoutsBody
  = PostPayoutsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPayouts = "POST"
type instance RequestPath PostPayouts = "/v1/payouts"

instance RequestBuilder PostPayouts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPayouts{..} =
    [ "v1"
    , "payouts"
    ]
    where
      PostPayoutsParams = postPayoutsParams
  endpointQuery PostPayouts{..} =
    [
    ]
  endpointHeaders PostPayouts{..} =
    [
    ]



{-
postPayouts :: PostPayouts
postPayouts = PostPayouts
-}
-- 
{- | <p>Returns a list of existing payouts sent to third-party bank accounts or that Stripe has sent you. The payouts are returned in sorted order, with the most recently created payouts appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payouts
-}
-- TODO request options as enum
data GetPayouts = GetPayouts
  { getPayoutsParams :: GetPayoutsParams
  , getPayoutsBody :: Maybe GetPayoutsBody
  } deriving (Show, Eq, Generic)

data GetPayoutsParams = GetPayoutsParams
  {  getPayoutsArrivalDate :: Maybe (Either (Object) (Int))
  ,  getPayoutsCreated :: Maybe (Either (Object) (Int))
  ,  getPayoutsDestination :: Maybe (Text)
  {- ^ The ID of an external account - only return payouts sent to this external account. -}
  ,  getPayoutsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getPayoutsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPayoutsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getPayoutsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getPayoutsStatus :: Maybe (Text)
  {- ^ Only return payouts that have the given status: `pending`, `paid`, `failed`, or `canceled`. -}
  } deriving (Show, Eq, Generic)

data GetPayoutsBody
  = GetPayoutsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPayouts = "GET"
type instance RequestPath GetPayouts = "/v1/payouts"

instance RequestBuilder GetPayouts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPayouts{..} =
    [ "v1"
    , "payouts"
    ]
    where
      GetPayoutsParams{..} = getPayoutsParams
  endpointQuery GetPayouts{..} =
    [ ("arrival_date", queryDeepObjectExplode getPayoutsArrivalDate)
    , ("created", queryDeepObjectExplode getPayoutsCreated)
    , ("destination", queryFormExplode getPayoutsDestination)
    , ("ending_before", queryFormExplode getPayoutsEndingBefore)
    , ("expand", queryDeepObjectExplode getPayoutsExpand)
    , ("limit", queryFormExplode getPayoutsLimit)
    , ("starting_after", queryFormExplode getPayoutsStartingAfter)
    , ("status", queryFormExplode getPayoutsStatus)
    ]
    where
      GetPayoutsParams{..} = getPayoutsParams
  endpointHeaders GetPayouts{..} =
    [
    ]



{-
getPayouts :: GetPayouts
getPayouts = GetPayouts
-}
-- 
{- | <p>Refunds an application fee that has previously been collected but not yet refunded.
Funds will be refunded to the Stripe account from which the fee was originally collected.</p>

<p>You can optionally refund only part of an application fee.
You can do so multiple times, until the entire fee has been refunded.</p>

<p>Once entirely refunded, an application fee can’t be refunded again.
This method will raise an error when called on an already-refunded application fee,
or when trying to refund more money than is left on an application fee.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/application_fees/{id}/refunds
-}
-- TODO request options as enum
data PostApplicationFeesIdRefunds = PostApplicationFeesIdRefunds
  { postApplicationFeesIdRefundsParams :: PostApplicationFeesIdRefundsParams
  , postApplicationFeesIdRefundsBody :: Maybe PostApplicationFeesIdRefundsBody
  } deriving (Show, Eq, Generic)

data PostApplicationFeesIdRefundsParams = PostApplicationFeesIdRefundsParams
  {  postApplicationFeesIdRefundsId :: (Text)
  {- ^ The identifier of the application fee to be refunded. -}
  } deriving (Show, Eq, Generic)

data PostApplicationFeesIdRefundsBody
  = PostApplicationFeesIdRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostApplicationFeesIdRefunds = "POST"
type instance RequestPath PostApplicationFeesIdRefunds = "/v1/application_fees/{id}/refunds"

instance RequestBuilder PostApplicationFeesIdRefunds where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostApplicationFeesIdRefunds{..} =
    [ "v1"
    , "application_fees"
    , pathSimple postApplicationFeesIdRefundsId
    , "refunds"
    ]
    where
      PostApplicationFeesIdRefundsParams{..} = postApplicationFeesIdRefundsParams
  endpointQuery PostApplicationFeesIdRefunds{..} =
    [
    ]
  endpointHeaders PostApplicationFeesIdRefunds{..} =
    [
    ]



{-
postApplicationFeesIdRefunds :: PostApplicationFeesIdRefunds
postApplicationFeesIdRefunds = PostApplicationFeesIdRefunds
-}
-- 
{- | <p>You can see a list of the refunds belonging to a specific application fee. Note that the 10 most recent refunds are always available by default on the application fee object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/application_fees/{id}/refunds
-}
-- TODO request options as enum
data GetApplicationFeesIdRefunds = GetApplicationFeesIdRefunds
  { getApplicationFeesIdRefundsParams :: GetApplicationFeesIdRefundsParams
  , getApplicationFeesIdRefundsBody :: Maybe GetApplicationFeesIdRefundsBody
  } deriving (Show, Eq, Generic)

data GetApplicationFeesIdRefundsParams = GetApplicationFeesIdRefundsParams
  {  getApplicationFeesIdRefundsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getApplicationFeesIdRefundsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getApplicationFeesIdRefundsId :: (Text)
  {- ^ The ID of the application fee whose refunds will be retrieved. -}
  ,  getApplicationFeesIdRefundsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getApplicationFeesIdRefundsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetApplicationFeesIdRefundsBody
  = GetApplicationFeesIdRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplicationFeesIdRefunds = "GET"
type instance RequestPath GetApplicationFeesIdRefunds = "/v1/application_fees/{id}/refunds"

instance RequestBuilder GetApplicationFeesIdRefunds where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplicationFeesIdRefunds{..} =
    [ "v1"
    , "application_fees"
    , pathSimple getApplicationFeesIdRefundsId
    , "refunds"
    ]
    where
      GetApplicationFeesIdRefundsParams{..} = getApplicationFeesIdRefundsParams
  endpointQuery GetApplicationFeesIdRefunds{..} =
    [ ("ending_before", queryFormExplode getApplicationFeesIdRefundsEndingBefore)
    , ("expand", queryDeepObjectExplode getApplicationFeesIdRefundsExpand)
    , ("limit", queryFormExplode getApplicationFeesIdRefundsLimit)
    , ("starting_after", queryFormExplode getApplicationFeesIdRefundsStartingAfter)
    ]
    where
      GetApplicationFeesIdRefundsParams{..} = getApplicationFeesIdRefundsParams
  endpointHeaders GetApplicationFeesIdRefunds{..} =
    [
    ]



{-
getApplicationFeesIdRefunds :: GetApplicationFeesIdRefunds
getApplicationFeesIdRefunds = GetApplicationFeesIdRefunds
-}
-- 
{- | <p>Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>
<p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/bank_accounts/{id}
-}
-- TODO request options as enum
data PostAccountBankAccountsId = PostAccountBankAccountsId
  { postAccountBankAccountsIdParams :: PostAccountBankAccountsIdParams
  , postAccountBankAccountsIdBody :: Maybe PostAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data PostAccountBankAccountsIdParams = PostAccountBankAccountsIdParams
  {  postAccountBankAccountsIdId :: (Text)
  {- ^ The ID of the external account to update -}
  } deriving (Show, Eq, Generic)

data PostAccountBankAccountsIdBody
  = PostAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountBankAccountsId = "POST"
type instance RequestPath PostAccountBankAccountsId = "/v1/account/bank_accounts/{id}"

instance RequestBuilder PostAccountBankAccountsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountBankAccountsId{..} =
    [ "v1"
    , "account"
    , "bank_accounts"
    , pathSimple postAccountBankAccountsIdId
    ]
    where
      PostAccountBankAccountsIdParams{..} = postAccountBankAccountsIdParams
  endpointQuery PostAccountBankAccountsId{..} =
    [
    ]
  endpointHeaders PostAccountBankAccountsId{..} =
    [
    ]



{-
postAccountBankAccountsId :: PostAccountBankAccountsId
postAccountBankAccountsId = PostAccountBankAccountsId
-}
-- 
{- | <p>Retrieve a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/bank_accounts/{id}
-}
-- TODO request options as enum
data GetAccountBankAccountsId = GetAccountBankAccountsId
  { getAccountBankAccountsIdParams :: GetAccountBankAccountsIdParams
  , getAccountBankAccountsIdBody :: Maybe GetAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data GetAccountBankAccountsIdParams = GetAccountBankAccountsIdParams
  {  getAccountBankAccountsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountBankAccountsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data GetAccountBankAccountsIdBody
  = GetAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountBankAccountsId = "GET"
type instance RequestPath GetAccountBankAccountsId = "/v1/account/bank_accounts/{id}"

instance RequestBuilder GetAccountBankAccountsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountBankAccountsId{..} =
    [ "v1"
    , "account"
    , "bank_accounts"
    , pathSimple getAccountBankAccountsIdId
    ]
    where
      GetAccountBankAccountsIdParams{..} = getAccountBankAccountsIdParams
  endpointQuery GetAccountBankAccountsId{..} =
    [ ("expand", queryDeepObjectExplode getAccountBankAccountsIdExpand)
    ]
  endpointHeaders GetAccountBankAccountsId{..} =
    [
    ]



{-
getAccountBankAccountsId :: GetAccountBankAccountsId
getAccountBankAccountsId = GetAccountBankAccountsId
-}
-- 
{- | <p>Delete a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/account/bank_accounts/{id}
-}
-- TODO request options as enum
data DeleteAccountBankAccountsId = DeleteAccountBankAccountsId
  { deleteAccountBankAccountsIdParams :: DeleteAccountBankAccountsIdParams
  , deleteAccountBankAccountsIdBody :: Maybe DeleteAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data DeleteAccountBankAccountsIdParams = DeleteAccountBankAccountsIdParams
  {  deleteAccountBankAccountsIdId :: (Text)
  {- ^ The ID of the external account to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountBankAccountsIdBody
  = DeleteAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountBankAccountsId = "DELETE"
type instance RequestPath DeleteAccountBankAccountsId = "/v1/account/bank_accounts/{id}"

instance RequestBuilder DeleteAccountBankAccountsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountBankAccountsId{..} =
    [ "v1"
    , "account"
    , "bank_accounts"
    , pathSimple deleteAccountBankAccountsIdId
    ]
    where
      DeleteAccountBankAccountsIdParams{..} = deleteAccountBankAccountsIdParams
  endpointQuery DeleteAccountBankAccountsId{..} =
    [
    ]
  endpointHeaders DeleteAccountBankAccountsId{..} =
    [
    ]



{-
deleteAccountBankAccountsId :: DeleteAccountBankAccountsId
deleteAccountBankAccountsId = DeleteAccountBankAccountsId
-}
-- 
{- | <p>Creates a short-lived API key for a given resource.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/ephemeral_keys
-}
-- TODO request options as enum
data PostEphemeralKeys = PostEphemeralKeys
  { postEphemeralKeysParams :: PostEphemeralKeysParams
  , postEphemeralKeysBody :: Maybe PostEphemeralKeysBody
  } deriving (Show, Eq, Generic)

data PostEphemeralKeysParams = PostEphemeralKeysParams
  {
  } deriving (Show, Eq, Generic)

data PostEphemeralKeysBody
  = PostEphemeralKeysBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostEphemeralKeys = "POST"
type instance RequestPath PostEphemeralKeys = "/v1/ephemeral_keys"

instance RequestBuilder PostEphemeralKeys where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostEphemeralKeys{..} =
    [ "v1"
    , "ephemeral_keys"
    ]
    where
      PostEphemeralKeysParams = postEphemeralKeysParams
  endpointQuery PostEphemeralKeys{..} =
    [
    ]
  endpointHeaders PostEphemeralKeys{..} =
    [
    ]



{-
postEphemeralKeys :: PostEphemeralKeys
postEphemeralKeys = PostEphemeralKeys
-}
-- 
{- | <p>A webhook endpoint must have a <code>url</code> and a list of <code>enabled_events</code>. You may optionally specify the Boolean <code>connect</code> parameter. If set to true, then a Connect webhook endpoint that notifies the specified <code>url</code> about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified <code>url</code> only about events from your account is created. You can also create webhook endpoints in the <a href="https://dashboard.stripe.com/account/webhooks">webhooks settings</a> section of the Dashboard.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/webhook_endpoints
-}
-- TODO request options as enum
data PostWebhookEndpoints = PostWebhookEndpoints
  { postWebhookEndpointsParams :: PostWebhookEndpointsParams
  , postWebhookEndpointsBody :: PostWebhookEndpointsBody
  } deriving (Show, Eq, Generic)

data PostWebhookEndpointsParams = PostWebhookEndpointsParams
  {
  } deriving (Show, Eq, Generic)

data PostWebhookEndpointsBody
  = PostWebhookEndpointsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostWebhookEndpoints = "POST"
type instance RequestPath PostWebhookEndpoints = "/v1/webhook_endpoints"

instance RequestBuilder PostWebhookEndpoints where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostWebhookEndpoints{..} =
    [ "v1"
    , "webhook_endpoints"
    ]
    where
      PostWebhookEndpointsParams = postWebhookEndpointsParams
  endpointQuery PostWebhookEndpoints{..} =
    [
    ]
  endpointHeaders PostWebhookEndpoints{..} =
    [
    ]



{-
postWebhookEndpoints :: PostWebhookEndpoints
postWebhookEndpoints = PostWebhookEndpoints
-}
-- 
{- | <p>Returns a list of your webhook endpoints.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/webhook_endpoints
-}
-- TODO request options as enum
data GetWebhookEndpoints = GetWebhookEndpoints
  { getWebhookEndpointsParams :: GetWebhookEndpointsParams
  , getWebhookEndpointsBody :: Maybe GetWebhookEndpointsBody
  } deriving (Show, Eq, Generic)

data GetWebhookEndpointsParams = GetWebhookEndpointsParams
  {  getWebhookEndpointsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getWebhookEndpointsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getWebhookEndpointsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getWebhookEndpointsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetWebhookEndpointsBody
  = GetWebhookEndpointsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetWebhookEndpoints = "GET"
type instance RequestPath GetWebhookEndpoints = "/v1/webhook_endpoints"

instance RequestBuilder GetWebhookEndpoints where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetWebhookEndpoints{..} =
    [ "v1"
    , "webhook_endpoints"
    ]
    where
      GetWebhookEndpointsParams{..} = getWebhookEndpointsParams
  endpointQuery GetWebhookEndpoints{..} =
    [ ("ending_before", queryFormExplode getWebhookEndpointsEndingBefore)
    , ("expand", queryDeepObjectExplode getWebhookEndpointsExpand)
    , ("limit", queryFormExplode getWebhookEndpointsLimit)
    , ("starting_after", queryFormExplode getWebhookEndpointsStartingAfter)
    ]
    where
      GetWebhookEndpointsParams{..} = getWebhookEndpointsParams
  endpointHeaders GetWebhookEndpoints{..} =
    [
    ]



{-
getWebhookEndpoints :: GetWebhookEndpoints
getWebhookEndpoints = GetWebhookEndpoints
-}
-- 
{- | <p>Creates a new subscription on an existing customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/subscriptions
-}
-- TODO request options as enum
data PostCustomersCustomerSubscriptions = PostCustomersCustomerSubscriptions
  { postCustomersCustomerSubscriptionsParams :: PostCustomersCustomerSubscriptionsParams
  , postCustomersCustomerSubscriptionsBody :: Maybe PostCustomersCustomerSubscriptionsBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSubscriptionsParams = PostCustomersCustomerSubscriptionsParams
  {  postCustomersCustomerSubscriptionsCustomer :: (Text)
  {- ^ The identifier of the customer to subscribe. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSubscriptionsBody
  = PostCustomersCustomerSubscriptionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerSubscriptions = "POST"
type instance RequestPath PostCustomersCustomerSubscriptions = "/v1/customers/{customer}/subscriptions"

instance RequestBuilder PostCustomersCustomerSubscriptions where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerSubscriptions{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerSubscriptionsCustomer
    , "subscriptions"
    ]
    where
      PostCustomersCustomerSubscriptionsParams{..} = postCustomersCustomerSubscriptionsParams
  endpointQuery PostCustomersCustomerSubscriptions{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerSubscriptions{..} =
    [
    ]



{-
postCustomersCustomerSubscriptions :: PostCustomersCustomerSubscriptions
postCustomersCustomerSubscriptions = PostCustomersCustomerSubscriptions
-}
-- 
{- | <p>You can see a list of the customer’s active subscriptions. Note that the 10 most recent active subscriptions are always available by default on the customer object. If you need more than those 10, you can use the limit and starting_after parameters to page through additional subscriptions.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/subscriptions
-}
-- TODO request options as enum
data GetCustomersCustomerSubscriptions = GetCustomersCustomerSubscriptions
  { getCustomersCustomerSubscriptionsParams :: GetCustomersCustomerSubscriptionsParams
  , getCustomersCustomerSubscriptionsBody :: Maybe GetCustomersCustomerSubscriptionsBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsParams = GetCustomersCustomerSubscriptionsParams
  {  getCustomersCustomerSubscriptionsCustomer :: (Text)
  {- ^ The ID of the customer whose subscriptions will be retrieved. -}
  ,  getCustomersCustomerSubscriptionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerSubscriptionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerSubscriptionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerSubscriptionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsBody
  = GetCustomersCustomerSubscriptionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerSubscriptions = "GET"
type instance RequestPath GetCustomersCustomerSubscriptions = "/v1/customers/{customer}/subscriptions"

instance RequestBuilder GetCustomersCustomerSubscriptions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerSubscriptions{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerSubscriptionsCustomer
    , "subscriptions"
    ]
    where
      GetCustomersCustomerSubscriptionsParams{..} = getCustomersCustomerSubscriptionsParams
  endpointQuery GetCustomersCustomerSubscriptions{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerSubscriptionsEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerSubscriptionsExpand)
    , ("limit", queryFormExplode getCustomersCustomerSubscriptionsLimit)
    , ("starting_after", queryFormExplode getCustomersCustomerSubscriptionsStartingAfter)
    ]
    where
      GetCustomersCustomerSubscriptionsParams{..} = getCustomersCustomerSubscriptionsParams
  endpointHeaders GetCustomersCustomerSubscriptions{..} =
    [
    ]



{-
getCustomersCustomerSubscriptions :: GetCustomersCustomerSubscriptions
getCustomersCustomerSubscriptions = GetCustomersCustomerSubscriptions
-}
-- 
{- | <p>Updates an existing person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/people/{person}
-}
-- TODO request options as enum
data PostAccountPeoplePerson = PostAccountPeoplePerson
  { postAccountPeoplePersonParams :: PostAccountPeoplePersonParams
  , postAccountPeoplePersonBody :: Maybe PostAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data PostAccountPeoplePersonParams = PostAccountPeoplePersonParams
  {  postAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of a person to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountPeoplePersonBody
  = PostAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountPeoplePerson = "POST"
type instance RequestPath PostAccountPeoplePerson = "/v1/account/people/{person}"

instance RequestBuilder PostAccountPeoplePerson where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountPeoplePerson{..} =
    [ "v1"
    , "account"
    , "people"
    , pathSimple postAccountPeoplePersonPerson
    ]
    where
      PostAccountPeoplePersonParams{..} = postAccountPeoplePersonParams
  endpointQuery PostAccountPeoplePerson{..} =
    [
    ]
  endpointHeaders PostAccountPeoplePerson{..} =
    [
    ]



{-
postAccountPeoplePerson :: PostAccountPeoplePerson
postAccountPeoplePerson = PostAccountPeoplePerson
-}
-- 
{- | <p>Retrieves an existing person.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/people/{person}
-}
-- TODO request options as enum
data GetAccountPeoplePerson = GetAccountPeoplePerson
  { getAccountPeoplePersonParams :: GetAccountPeoplePersonParams
  , getAccountPeoplePersonBody :: Maybe GetAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data GetAccountPeoplePersonParams = GetAccountPeoplePersonParams
  {  getAccountPeoplePersonExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of a person to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetAccountPeoplePersonBody
  = GetAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountPeoplePerson = "GET"
type instance RequestPath GetAccountPeoplePerson = "/v1/account/people/{person}"

instance RequestBuilder GetAccountPeoplePerson where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountPeoplePerson{..} =
    [ "v1"
    , "account"
    , "people"
    , pathSimple getAccountPeoplePersonPerson
    ]
    where
      GetAccountPeoplePersonParams{..} = getAccountPeoplePersonParams
  endpointQuery GetAccountPeoplePerson{..} =
    [ ("expand", queryDeepObjectExplode getAccountPeoplePersonExpand)
    ]
  endpointHeaders GetAccountPeoplePerson{..} =
    [
    ]



{-
getAccountPeoplePerson :: GetAccountPeoplePerson
getAccountPeoplePerson = GetAccountPeoplePerson
-}
-- 
{- | <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/account/people/{person}
-}
-- TODO request options as enum
data DeleteAccountPeoplePerson = DeleteAccountPeoplePerson
  { deleteAccountPeoplePersonParams :: DeleteAccountPeoplePersonParams
  , deleteAccountPeoplePersonBody :: Maybe DeleteAccountPeoplePersonBody
  } deriving (Show, Eq, Generic)

data DeleteAccountPeoplePersonParams = DeleteAccountPeoplePersonParams
  {  deleteAccountPeoplePersonPerson :: (Text)
  {- ^ The ID of the person to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountPeoplePersonBody
  = DeleteAccountPeoplePersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountPeoplePerson = "DELETE"
type instance RequestPath DeleteAccountPeoplePerson = "/v1/account/people/{person}"

instance RequestBuilder DeleteAccountPeoplePerson where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountPeoplePerson{..} =
    [ "v1"
    , "account"
    , "people"
    , pathSimple deleteAccountPeoplePersonPerson
    ]
    where
      DeleteAccountPeoplePersonParams{..} = deleteAccountPeoplePersonParams
  endpointQuery DeleteAccountPeoplePerson{..} =
    [
    ]
  endpointHeaders DeleteAccountPeoplePerson{..} =
    [
    ]



{-
deleteAccountPeoplePerson :: DeleteAccountPeoplePerson
deleteAccountPeoplePerson = DeleteAccountPeoplePerson
-}
-- 
{- | <p>Updates the PIN for a card, subject to cardholder verification. See <a href="/docs/issuing/pin_management">Retrieve and update cardholder PIN</a></p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/cards/{card}/pin
-}
-- TODO request options as enum
data PostIssuingCardsCardPin = PostIssuingCardsCardPin
  { postIssuingCardsCardPinParams :: PostIssuingCardsCardPinParams
  , postIssuingCardsCardPinBody :: PostIssuingCardsCardPinBody
  } deriving (Show, Eq, Generic)

data PostIssuingCardsCardPinParams = PostIssuingCardsCardPinParams
  {  postIssuingCardsCardPinCard :: (Text)
  {- ^ The id of the `Card` that the PIN belongs to -}
  } deriving (Show, Eq, Generic)

data PostIssuingCardsCardPinBody
  = PostIssuingCardsCardPinBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingCardsCardPin = "POST"
type instance RequestPath PostIssuingCardsCardPin = "/v1/issuing/cards/{card}/pin"

instance RequestBuilder PostIssuingCardsCardPin where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingCardsCardPin{..} =
    [ "v1"
    , "issuing"
    , "cards"
    , pathSimple postIssuingCardsCardPinCard
    , "pin"
    ]
    where
      PostIssuingCardsCardPinParams{..} = postIssuingCardsCardPinParams
  endpointQuery PostIssuingCardsCardPin{..} =
    [
    ]
  endpointHeaders PostIssuingCardsCardPin{..} =
    [
    ]



{-
postIssuingCardsCardPin :: PostIssuingCardsCardPin
postIssuingCardsCardPin = PostIssuingCardsCardPin
-}
-- 
{- | <p>Retrieves the PIN for a card object, subject to cardholder verification, see <a href="/docs/issuing/pin_management">Retrieve and update cardholder PIN</a></p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cards/{card}/pin
-}
-- TODO request options as enum
data GetIssuingCardsCardPin = GetIssuingCardsCardPin
  { getIssuingCardsCardPinParams :: GetIssuingCardsCardPinParams
  , getIssuingCardsCardPinBody :: Maybe GetIssuingCardsCardPinBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardPinParams = GetIssuingCardsCardPinParams
  {  getIssuingCardsCardPinCard :: (Text)
  {- ^ The id of the `Card` that the PIN belongs to -}
  ,  getIssuingCardsCardPinExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingCardsCardPinVerification :: (Object)
  {- ^ The id of the `Verification` that was sent and the code entered by the cardholder -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardPinBody
  = GetIssuingCardsCardPinBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCardsCardPin = "GET"
type instance RequestPath GetIssuingCardsCardPin = "/v1/issuing/cards/{card}/pin"

instance RequestBuilder GetIssuingCardsCardPin where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCardsCardPin{..} =
    [ "v1"
    , "issuing"
    , "cards"
    , pathSimple getIssuingCardsCardPinCard
    , "pin"
    ]
    where
      GetIssuingCardsCardPinParams{..} = getIssuingCardsCardPinParams
  endpointQuery GetIssuingCardsCardPin{..} =
    [ ("expand", queryDeepObjectExplode getIssuingCardsCardPinExpand)
    , ("verification", queryDeepObjectExplode getIssuingCardsCardPinVerification)
    ]
    where
      GetIssuingCardsCardPinParams{..} = getIssuingCardsCardPinParams
  endpointHeaders GetIssuingCardsCardPin{..} =
    [
    ]



{-
getIssuingCardsCardPin :: GetIssuingCardsCardPin
getIssuingCardsCardPin = GetIssuingCardsCardPin
-}
-- 
{- | <p>Retrieves the details of a Report Type. (Requires a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reporting/report_types/{report_type}
-}
-- TODO request options as enum
data GetReportingReportTypesReportType = GetReportingReportTypesReportType
  { getReportingReportTypesReportTypeParams :: GetReportingReportTypesReportTypeParams
  , getReportingReportTypesReportTypeBody :: Maybe GetReportingReportTypesReportTypeBody
  } deriving (Show, Eq, Generic)

data GetReportingReportTypesReportTypeParams = GetReportingReportTypesReportTypeParams
  {  getReportingReportTypesReportTypeExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getReportingReportTypesReportTypeReportType :: (Text)
  {- ^ The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types) to retrieve, such as `balance.summary.1`. -}
  } deriving (Show, Eq, Generic)

data GetReportingReportTypesReportTypeBody
  = GetReportingReportTypesReportTypeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReportingReportTypesReportType = "GET"
type instance RequestPath GetReportingReportTypesReportType = "/v1/reporting/report_types/{report_type}"

instance RequestBuilder GetReportingReportTypesReportType where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReportingReportTypesReportType{..} =
    [ "v1"
    , "reporting"
    , "report_types"
    , pathSimple getReportingReportTypesReportTypeReportType
    ]
    where
      GetReportingReportTypesReportTypeParams{..} = getReportingReportTypesReportTypeParams
  endpointQuery GetReportingReportTypesReportType{..} =
    [ ("expand", queryDeepObjectExplode getReportingReportTypesReportTypeExpand)
    ]
  endpointHeaders GetReportingReportTypesReportType{..} =
    [
    ]



{-
getReportingReportTypesReportType :: GetReportingReportTypesReportType
getReportingReportTypesReportType = GetReportingReportTypesReportType
-}
-- 
{- | <p>Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/capabilities
-}
-- TODO request options as enum
data GetAccountsAccountCapabilities = GetAccountsAccountCapabilities
  { getAccountsAccountCapabilitiesParams :: GetAccountsAccountCapabilitiesParams
  , getAccountsAccountCapabilitiesBody :: Maybe GetAccountsAccountCapabilitiesBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountCapabilitiesParams = GetAccountsAccountCapabilitiesParams
  {  getAccountsAccountCapabilitiesAccount :: (Text)
  ,  getAccountsAccountCapabilitiesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountCapabilitiesBody
  = GetAccountsAccountCapabilitiesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountCapabilities = "GET"
type instance RequestPath GetAccountsAccountCapabilities = "/v1/accounts/{account}/capabilities"

instance RequestBuilder GetAccountsAccountCapabilities where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountCapabilities{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountCapabilitiesAccount
    , "capabilities"
    ]
    where
      GetAccountsAccountCapabilitiesParams{..} = getAccountsAccountCapabilitiesParams
  endpointQuery GetAccountsAccountCapabilities{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountCapabilitiesExpand)
    ]
  endpointHeaders GetAccountsAccountCapabilities{..} =
    [
    ]



{-
getAccountsAccountCapabilities :: GetAccountsAccountCapabilities
getAccountsAccountCapabilities = GetAccountsAccountCapabilities
-}
-- 
{- | <p>Invalidates a short-lived API key for a given resource.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/ephemeral_keys/{key}
-}
-- TODO request options as enum
data DeleteEphemeralKeysKey = DeleteEphemeralKeysKey
  { deleteEphemeralKeysKeyParams :: DeleteEphemeralKeysKeyParams
  , deleteEphemeralKeysKeyBody :: Maybe DeleteEphemeralKeysKeyBody
  } deriving (Show, Eq, Generic)

data DeleteEphemeralKeysKeyParams = DeleteEphemeralKeysKeyParams
  {  deleteEphemeralKeysKeyKey :: (Text)
  {- ^ The ID of the key you'd like to invalidate. -}
  } deriving (Show, Eq, Generic)

data DeleteEphemeralKeysKeyBody
  = DeleteEphemeralKeysKeyBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteEphemeralKeysKey = "DELETE"
type instance RequestPath DeleteEphemeralKeysKey = "/v1/ephemeral_keys/{key}"

instance RequestBuilder DeleteEphemeralKeysKey where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteEphemeralKeysKey{..} =
    [ "v1"
    , "ephemeral_keys"
    , pathSimple deleteEphemeralKeysKeyKey
    ]
    where
      DeleteEphemeralKeysKeyParams{..} = deleteEphemeralKeysKeyParams
  endpointQuery DeleteEphemeralKeysKey{..} =
    [
    ]
  endpointHeaders DeleteEphemeralKeysKey{..} =
    [
    ]



{-
deleteEphemeralKeysKey :: DeleteEphemeralKeysKey
deleteEphemeralKeysKey = DeleteEphemeralKeysKey
-}
-- 
{- | <p>Updates the specified transfer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>This request accepts only metadata as an argument.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/transfers/{transfer}
-}
-- TODO request options as enum
data PostTransfersTransfer = PostTransfersTransfer
  { postTransfersTransferParams :: PostTransfersTransferParams
  , postTransfersTransferBody :: Maybe PostTransfersTransferBody
  } deriving (Show, Eq, Generic)

data PostTransfersTransferParams = PostTransfersTransferParams
  {  postTransfersTransferTransfer :: (Text)
  {- ^ The ID of the transfer to be updated. -}
  } deriving (Show, Eq, Generic)

data PostTransfersTransferBody
  = PostTransfersTransferBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTransfersTransfer = "POST"
type instance RequestPath PostTransfersTransfer = "/v1/transfers/{transfer}"

instance RequestBuilder PostTransfersTransfer where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTransfersTransfer{..} =
    [ "v1"
    , "transfers"
    , pathSimple postTransfersTransferTransfer
    ]
    where
      PostTransfersTransferParams{..} = postTransfersTransferParams
  endpointQuery PostTransfersTransfer{..} =
    [
    ]
  endpointHeaders PostTransfersTransfer{..} =
    [
    ]



{-
postTransfersTransfer :: PostTransfersTransfer
postTransfersTransfer = PostTransfersTransfer
-}
-- 
{- | <p>Retrieves the details of an existing transfer. Supply the unique transfer ID from either a transfer creation request or the transfer list, and Stripe will return the corresponding transfer information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/transfers/{transfer}
-}
-- TODO request options as enum
data GetTransfersTransfer = GetTransfersTransfer
  { getTransfersTransferParams :: GetTransfersTransferParams
  , getTransfersTransferBody :: Maybe GetTransfersTransferBody
  } deriving (Show, Eq, Generic)

data GetTransfersTransferParams = GetTransfersTransferParams
  {  getTransfersTransferExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTransfersTransferTransfer :: (Text)
  {- ^ The identifier of the transfer to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetTransfersTransferBody
  = GetTransfersTransferBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTransfersTransfer = "GET"
type instance RequestPath GetTransfersTransfer = "/v1/transfers/{transfer}"

instance RequestBuilder GetTransfersTransfer where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTransfersTransfer{..} =
    [ "v1"
    , "transfers"
    , pathSimple getTransfersTransferTransfer
    ]
    where
      GetTransfersTransferParams{..} = getTransfersTransferParams
  endpointQuery GetTransfersTransfer{..} =
    [ ("expand", queryDeepObjectExplode getTransfersTransferExpand)
    ]
  endpointHeaders GetTransfersTransfer{..} =
    [
    ]



{-
getTransfersTransfer :: GetTransfersTransfer
getTransfersTransfer = GetTransfersTransfer
-}
-- 
{- | 

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/dispute/close
-}
-- TODO request options as enum
data PostChargesChargeDisputeClose = PostChargesChargeDisputeClose
  { postChargesChargeDisputeCloseParams :: PostChargesChargeDisputeCloseParams
  , postChargesChargeDisputeCloseBody :: Maybe PostChargesChargeDisputeCloseBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeDisputeCloseParams = PostChargesChargeDisputeCloseParams
  {  postChargesChargeDisputeCloseCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeDisputeCloseBody
  = PostChargesChargeDisputeCloseBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeDisputeClose = "POST"
type instance RequestPath PostChargesChargeDisputeClose = "/v1/charges/{charge}/dispute/close"

instance RequestBuilder PostChargesChargeDisputeClose where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeDisputeClose{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeDisputeCloseCharge
    , "dispute"
    , "close"
    ]
    where
      PostChargesChargeDisputeCloseParams{..} = postChargesChargeDisputeCloseParams
  endpointQuery PostChargesChargeDisputeClose{..} =
    [
    ]
  endpointHeaders PostChargesChargeDisputeClose{..} =
    [
    ]



{-
postChargesChargeDisputeClose :: PostChargesChargeDisputeClose
postChargesChargeDisputeClose = PostChargesChargeDisputeClose
-}
-- 
{- | <p>Retrieve an existing source transaction object. Supply the unique source ID from a source creation request and the source transaction ID and Stripe will return the corresponding up-to-date source object information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sources/{source}/source_transactions/{source_transaction}
-}
-- TODO request options as enum
data GetSourcesSourceSourceTransactionsSourceTransaction = GetSourcesSourceSourceTransactionsSourceTransaction
  { getSourcesSourceSourceTransactionsSourceTransactionParams :: GetSourcesSourceSourceTransactionsSourceTransactionParams
  , getSourcesSourceSourceTransactionsSourceTransactionBody :: Maybe GetSourcesSourceSourceTransactionsSourceTransactionBody
  } deriving (Show, Eq, Generic)

data GetSourcesSourceSourceTransactionsSourceTransactionParams = GetSourcesSourceSourceTransactionsSourceTransactionParams
  {  getSourcesSourceSourceTransactionsSourceTransactionExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSourcesSourceSourceTransactionsSourceTransactionSource :: (Text)
  {- ^ The ID of the source whose source transaction will be retrieved. -}
  ,  getSourcesSourceSourceTransactionsSourceTransactionSourceTransaction :: (Text)
  {- ^ The ID of the source transaction that will be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetSourcesSourceSourceTransactionsSourceTransactionBody
  = GetSourcesSourceSourceTransactionsSourceTransactionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSourcesSourceSourceTransactionsSourceTransaction = "GET"
type instance RequestPath GetSourcesSourceSourceTransactionsSourceTransaction = "/v1/sources/{source}/source_transactions/{source_transaction}"

instance RequestBuilder GetSourcesSourceSourceTransactionsSourceTransaction where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSourcesSourceSourceTransactionsSourceTransaction{..} =
    [ "v1"
    , "sources"
    , pathSimple getSourcesSourceSourceTransactionsSourceTransactionSource
    , "source_transactions"
    , pathSimple getSourcesSourceSourceTransactionsSourceTransactionSourceTransaction
    ]
    where
      GetSourcesSourceSourceTransactionsSourceTransactionParams{..} = getSourcesSourceSourceTransactionsSourceTransactionParams
  endpointQuery GetSourcesSourceSourceTransactionsSourceTransaction{..} =
    [ ("expand", queryDeepObjectExplode getSourcesSourceSourceTransactionsSourceTransactionExpand)
    ]
  endpointHeaders GetSourcesSourceSourceTransactionsSourceTransaction{..} =
    [
    ]



{-
getSourcesSourceSourceTransactionsSourceTransaction :: GetSourcesSourceSourceTransactionsSourceTransaction
getSourcesSourceSourceTransactionsSourceTransaction = GetSourcesSourceSourceTransactionsSourceTransaction
-}
-- 
{- | <p>Updates the specified plan by setting the values of the parameters passed. Any parameters not provided are left unchanged. By design, you cannot change a plan’s ID, amount, currency, or billing cycle.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/plans/{plan}
-}
-- TODO request options as enum
data PostPlansPlan = PostPlansPlan
  { postPlansPlanParams :: PostPlansPlanParams
  , postPlansPlanBody :: Maybe PostPlansPlanBody
  } deriving (Show, Eq, Generic)

data PostPlansPlanParams = PostPlansPlanParams
  {  postPlansPlanPlan :: (Text)
  {- ^ The identifier of the plan to be updated. -}
  } deriving (Show, Eq, Generic)

data PostPlansPlanBody
  = PostPlansPlanBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPlansPlan = "POST"
type instance RequestPath PostPlansPlan = "/v1/plans/{plan}"

instance RequestBuilder PostPlansPlan where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPlansPlan{..} =
    [ "v1"
    , "plans"
    , pathSimple postPlansPlanPlan
    ]
    where
      PostPlansPlanParams{..} = postPlansPlanParams
  endpointQuery PostPlansPlan{..} =
    [
    ]
  endpointHeaders PostPlansPlan{..} =
    [
    ]



{-
postPlansPlan :: PostPlansPlan
postPlansPlan = PostPlansPlan
-}
-- 
{- | <p>Retrieves the plan with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/plans/{plan}
-}
-- TODO request options as enum
data GetPlansPlan = GetPlansPlan
  { getPlansPlanParams :: GetPlansPlanParams
  , getPlansPlanBody :: Maybe GetPlansPlanBody
  } deriving (Show, Eq, Generic)

data GetPlansPlanParams = GetPlansPlanParams
  {  getPlansPlanExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPlansPlanPlan :: (Text)
  {- ^ The ID of the desired plan. -}
  } deriving (Show, Eq, Generic)

data GetPlansPlanBody
  = GetPlansPlanBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPlansPlan = "GET"
type instance RequestPath GetPlansPlan = "/v1/plans/{plan}"

instance RequestBuilder GetPlansPlan where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPlansPlan{..} =
    [ "v1"
    , "plans"
    , pathSimple getPlansPlanPlan
    ]
    where
      GetPlansPlanParams{..} = getPlansPlanParams
  endpointQuery GetPlansPlan{..} =
    [ ("expand", queryDeepObjectExplode getPlansPlanExpand)
    ]
  endpointHeaders GetPlansPlan{..} =
    [
    ]



{-
getPlansPlan :: GetPlansPlan
getPlansPlan = GetPlansPlan
-}
-- 
{- | <p>Deleting plans means new subscribers can’t be added. Existing subscribers aren’t affected.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/plans/{plan}
-}
-- TODO request options as enum
data DeletePlansPlan = DeletePlansPlan
  { deletePlansPlanParams :: DeletePlansPlanParams
  , deletePlansPlanBody :: Maybe DeletePlansPlanBody
  } deriving (Show, Eq, Generic)

data DeletePlansPlanParams = DeletePlansPlanParams
  {  deletePlansPlanPlan :: (Text)
  {- ^ The identifier of the plan to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeletePlansPlanBody
  = DeletePlansPlanBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeletePlansPlan = "DELETE"
type instance RequestPath DeletePlansPlan = "/v1/plans/{plan}"

instance RequestBuilder DeletePlansPlan where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeletePlansPlan{..} =
    [ "v1"
    , "plans"
    , pathSimple deletePlansPlanPlan
    ]
    where
      DeletePlansPlanParams{..} = deletePlansPlanParams
  endpointQuery DeletePlansPlan{..} =
    [
    ]
  endpointHeaders DeletePlansPlan{..} =
    [
    ]



{-
deletePlansPlan :: DeletePlansPlan
deletePlansPlan = DeletePlansPlan
-}
-- 
{- | <p>Create an external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/bank_accounts
-}
-- TODO request options as enum
data PostAccountBankAccounts = PostAccountBankAccounts
  { postAccountBankAccountsParams :: PostAccountBankAccountsParams
  , postAccountBankAccountsBody :: Maybe PostAccountBankAccountsBody
  } deriving (Show, Eq, Generic)

data PostAccountBankAccountsParams = PostAccountBankAccountsParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountBankAccountsBody
  = PostAccountBankAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountBankAccounts = "POST"
type instance RequestPath PostAccountBankAccounts = "/v1/account/bank_accounts"

instance RequestBuilder PostAccountBankAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountBankAccounts{..} =
    [ "v1"
    , "account"
    , "bank_accounts"
    ]
    where
      PostAccountBankAccountsParams = postAccountBankAccountsParams
  endpointQuery PostAccountBankAccounts{..} =
    [
    ]
  endpointHeaders PostAccountBankAccounts{..} =
    [
    ]



{-
postAccountBankAccounts :: PostAccountBankAccounts
postAccountBankAccounts = PostAccountBankAccounts
-}
-- 
{- | <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

<p>If the card’s owner has no default card, then the new card will become the default.
However, if the owner already has a default, then it will not change.
To change the default, you should either <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>,
or <a href="/docs/api#update_recipient">update the recipient</a> to have a new <code>default_card</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/cards
-}
-- TODO request options as enum
data PostCustomersCustomerCards = PostCustomersCustomerCards
  { postCustomersCustomerCardsParams :: PostCustomersCustomerCardsParams
  , postCustomersCustomerCardsBody :: Maybe PostCustomersCustomerCardsBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerCardsParams = PostCustomersCustomerCardsParams
  {  postCustomersCustomerCardsCustomer :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerCardsBody
  = PostCustomersCustomerCardsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerCards = "POST"
type instance RequestPath PostCustomersCustomerCards = "/v1/customers/{customer}/cards"

instance RequestBuilder PostCustomersCustomerCards where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerCards{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerCardsCustomer
    , "cards"
    ]
    where
      PostCustomersCustomerCardsParams{..} = postCustomersCustomerCardsParams
  endpointQuery PostCustomersCustomerCards{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerCards{..} =
    [
    ]



{-
postCustomersCustomerCards :: PostCustomersCustomerCards
postCustomersCustomerCards = PostCustomersCustomerCards
-}
-- 
{- | <p>You can see a list of the cards belonging to a customer.
Note that the 10 most recent sources are always available on the <code>Customer</code> object.
If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional cards.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/cards
-}
-- TODO request options as enum
data GetCustomersCustomerCards = GetCustomersCustomerCards
  { getCustomersCustomerCardsParams :: GetCustomersCustomerCardsParams
  , getCustomersCustomerCardsBody :: Maybe GetCustomersCustomerCardsBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerCardsParams = GetCustomersCustomerCardsParams
  {  getCustomersCustomerCardsCustomer :: (Text)
  {- ^ The ID of the customer whose cards will be retrieved. -}
  ,  getCustomersCustomerCardsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCustomersCustomerCardsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerCardsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCustomersCustomerCardsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerCardsBody
  = GetCustomersCustomerCardsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerCards = "GET"
type instance RequestPath GetCustomersCustomerCards = "/v1/customers/{customer}/cards"

instance RequestBuilder GetCustomersCustomerCards where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerCards{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerCardsCustomer
    , "cards"
    ]
    where
      GetCustomersCustomerCardsParams{..} = getCustomersCustomerCardsParams
  endpointQuery GetCustomersCustomerCards{..} =
    [ ("ending_before", queryFormExplode getCustomersCustomerCardsEndingBefore)
    , ("expand", queryDeepObjectExplode getCustomersCustomerCardsExpand)
    , ("limit", queryFormExplode getCustomersCustomerCardsLimit)
    , ("starting_after", queryFormExplode getCustomersCustomerCardsStartingAfter)
    ]
    where
      GetCustomersCustomerCardsParams{..} = getCustomersCustomerCardsParams
  endpointHeaders GetCustomersCustomerCards{..} =
    [
    ]



{-
getCustomersCustomerCards :: GetCustomersCustomerCards
getCustomersCustomerCards = GetCustomersCustomerCards
-}
-- {-# DEPRECATED getCustomersCustomerCards, GetCustomersCustomerCards "This endpoint is deprecated by the API creator" #-}
{- | <p>Approves a <code>Review</code> object, closing it and removing it from the list of reviews.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/reviews/{review}/approve
-}
-- TODO request options as enum
data PostReviewsReviewApprove = PostReviewsReviewApprove
  { postReviewsReviewApproveParams :: PostReviewsReviewApproveParams
  , postReviewsReviewApproveBody :: Maybe PostReviewsReviewApproveBody
  } deriving (Show, Eq, Generic)

data PostReviewsReviewApproveParams = PostReviewsReviewApproveParams
  {  postReviewsReviewApproveReview :: (Text)
  {- ^ The identifier of the review to be approved. -}
  } deriving (Show, Eq, Generic)

data PostReviewsReviewApproveBody
  = PostReviewsReviewApproveBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostReviewsReviewApprove = "POST"
type instance RequestPath PostReviewsReviewApprove = "/v1/reviews/{review}/approve"

instance RequestBuilder PostReviewsReviewApprove where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostReviewsReviewApprove{..} =
    [ "v1"
    , "reviews"
    , pathSimple postReviewsReviewApproveReview
    , "approve"
    ]
    where
      PostReviewsReviewApproveParams{..} = postReviewsReviewApproveParams
  endpointQuery PostReviewsReviewApprove{..} =
    [
    ]
  endpointHeaders PostReviewsReviewApprove{..} =
    [
    ]



{-
postReviewsReviewApprove :: PostReviewsReviewApprove
postReviewsReviewApprove = PostReviewsReviewApprove
-}
-- 
{- | <p>Confirm that your customer intends to pay with current or provided
payment method. Upon confirmation, the PaymentIntent will attempt to initiate
a payment.</p>

<p>If the selected payment method requires additional authentication steps, the
PaymentIntent will transition to the <code>requires_action</code> status and
suggest additional actions via <code>next_action</code>. If payment fails,
the PaymentIntent will transition to the <code>requires_payment_method</code> status. If
payment succeeds, the PaymentIntent will transition to the <code>succeeded</code>
status (or <code>requires_capture</code>, if <code>capture_method</code> is set to <code>manual</code>).</p>

<p>If the <code>confirmation_method</code> is <code>automatic</code>, payment may be attempted
using our <a href="/docs/stripe-js/reference#stripe-handle-card-payment">client SDKs</a>
and the PaymentIntent’s <a href="#payment_intent_object-client_secret">client_secret</a>.
After <code>next_action</code>s are handled by the client, no additional
confirmation is required to complete the payment.</p>

<p>If the <code>confirmation_method</code> is <code>manual</code>, all payment attempts must be
initiated using a secret key.
If any actions are required for the payment, the PaymentIntent will
return to the <code>requires_confirmation</code> state
after those actions are completed. Your server needs to then
explicitly re-confirm the PaymentIntent to initiate the next payment
attempt. Read the <a href="/docs/payments/payment-intents/web-manual">expanded documentation</a>
to learn more about manual confirmation.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_intents/{intent}/confirm
-}
-- TODO request options as enum
data PostPaymentIntentsIntentConfirm = PostPaymentIntentsIntentConfirm
  { postPaymentIntentsIntentConfirmParams :: PostPaymentIntentsIntentConfirmParams
  , postPaymentIntentsIntentConfirmBody :: Maybe PostPaymentIntentsIntentConfirmBody
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentConfirmParams = PostPaymentIntentsIntentConfirmParams
  {  postPaymentIntentsIntentConfirmIntent :: (Text)
  {- ^ ID of the PaymentIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentConfirmBody
  = PostPaymentIntentsIntentConfirmBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentIntentsIntentConfirm = "POST"
type instance RequestPath PostPaymentIntentsIntentConfirm = "/v1/payment_intents/{intent}/confirm"

instance RequestBuilder PostPaymentIntentsIntentConfirm where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentIntentsIntentConfirm{..} =
    [ "v1"
    , "payment_intents"
    , pathSimple postPaymentIntentsIntentConfirmIntent
    , "confirm"
    ]
    where
      PostPaymentIntentsIntentConfirmParams{..} = postPaymentIntentsIntentConfirmParams
  endpointQuery PostPaymentIntentsIntentConfirm{..} =
    [
    ]
  endpointHeaders PostPaymentIntentsIntentConfirm{..} =
    [
    ]



{-
postPaymentIntentsIntentConfirm :: PostPaymentIntentsIntentConfirm
postPaymentIntentsIntentConfirm = PostPaymentIntentsIntentConfirm
-}
-- 
{- | <p>Detaches a PaymentMethod object from a Customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_methods/{payment_method}/detach
-}
-- TODO request options as enum
data PostPaymentMethodsPaymentMethodDetach = PostPaymentMethodsPaymentMethodDetach
  { postPaymentMethodsPaymentMethodDetachParams :: PostPaymentMethodsPaymentMethodDetachParams
  , postPaymentMethodsPaymentMethodDetachBody :: Maybe PostPaymentMethodsPaymentMethodDetachBody
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodDetachParams = PostPaymentMethodsPaymentMethodDetachParams
  {  postPaymentMethodsPaymentMethodDetachPaymentMethod :: (Text)
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsPaymentMethodDetachBody
  = PostPaymentMethodsPaymentMethodDetachBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentMethodsPaymentMethodDetach = "POST"
type instance RequestPath PostPaymentMethodsPaymentMethodDetach = "/v1/payment_methods/{payment_method}/detach"

instance RequestBuilder PostPaymentMethodsPaymentMethodDetach where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentMethodsPaymentMethodDetach{..} =
    [ "v1"
    , "payment_methods"
    , pathSimple postPaymentMethodsPaymentMethodDetachPaymentMethod
    , "detach"
    ]
    where
      PostPaymentMethodsPaymentMethodDetachParams{..} = postPaymentMethodsPaymentMethodDetachParams
  endpointQuery PostPaymentMethodsPaymentMethodDetach{..} =
    [
    ]
  endpointHeaders PostPaymentMethodsPaymentMethodDetach{..} =
    [
    ]



{-
postPaymentMethodsPaymentMethodDetach :: PostPaymentMethodsPaymentMethodDetach
postPaymentMethodsPaymentMethodDetach = PostPaymentMethodsPaymentMethodDetach
-}
-- 
{- | <p>A previously created payout can be canceled if it has not yet been paid out. Funds will be refunded to your available balance. You may not cancel automatic Stripe payouts.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payouts/{payout}/cancel
-}
-- TODO request options as enum
data PostPayoutsPayoutCancel = PostPayoutsPayoutCancel
  { postPayoutsPayoutCancelParams :: PostPayoutsPayoutCancelParams
  , postPayoutsPayoutCancelBody :: Maybe PostPayoutsPayoutCancelBody
  } deriving (Show, Eq, Generic)

data PostPayoutsPayoutCancelParams = PostPayoutsPayoutCancelParams
  {  postPayoutsPayoutCancelPayout :: (Text)
  {- ^ The identifier of the payout to be canceled. -}
  } deriving (Show, Eq, Generic)

data PostPayoutsPayoutCancelBody
  = PostPayoutsPayoutCancelBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPayoutsPayoutCancel = "POST"
type instance RequestPath PostPayoutsPayoutCancel = "/v1/payouts/{payout}/cancel"

instance RequestBuilder PostPayoutsPayoutCancel where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPayoutsPayoutCancel{..} =
    [ "v1"
    , "payouts"
    , pathSimple postPayoutsPayoutCancelPayout
    , "cancel"
    ]
    where
      PostPayoutsPayoutCancelParams{..} = postPayoutsPayoutCancelParams
  endpointQuery PostPayoutsPayoutCancel{..} =
    [
    ]
  endpointHeaders PostPayoutsPayoutCancel{..} =
    [
    ]



{-
postPayoutsPayoutCancel :: PostPayoutsPayoutCancel
postPayoutsPayoutCancel = PostPayoutsPayoutCancel
-}
-- 
{- | <p>With <a href="/docs/connect">Connect</a>, you can create Stripe accounts for your users.
To do this, you’ll first need to <a href="https://dashboard.stripe.com/account/applications/settings">register your platform</a>.</p>

<p>For Standard accounts, parameters other than <code>country</code>, <code>email</code>, and <code>type</code>
are used to prefill the account application that we ask the account holder to complete.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts
-}
-- TODO request options as enum
data PostAccounts = PostAccounts
  { postAccountsParams :: PostAccountsParams
  , postAccountsBody :: Maybe PostAccountsBody
  } deriving (Show, Eq, Generic)

data PostAccountsParams = PostAccountsParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountsBody
  = PostAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccounts = "POST"
type instance RequestPath PostAccounts = "/v1/accounts"

instance RequestBuilder PostAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccounts{..} =
    [ "v1"
    , "accounts"
    ]
    where
      PostAccountsParams = postAccountsParams
  endpointQuery PostAccounts{..} =
    [
    ]
  endpointHeaders PostAccounts{..} =
    [
    ]



{-
postAccounts :: PostAccounts
postAccounts = PostAccounts
-}
-- 
{- | <p>Returns a list of accounts connected to your platform via <a href="/docs/connect">Connect</a>. If you’re not a platform, the list is empty.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts
-}
-- TODO request options as enum
data GetAccounts = GetAccounts
  { getAccountsParams :: GetAccountsParams
  , getAccountsBody :: Maybe GetAccountsBody
  } deriving (Show, Eq, Generic)

data GetAccountsParams = GetAccountsParams
  {  getAccountsCreated :: Maybe (Either (Object) (Int))
  ,  getAccountsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountsBody
  = GetAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccounts = "GET"
type instance RequestPath GetAccounts = "/v1/accounts"

instance RequestBuilder GetAccounts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccounts{..} =
    [ "v1"
    , "accounts"
    ]
    where
      GetAccountsParams{..} = getAccountsParams
  endpointQuery GetAccounts{..} =
    [ ("created", queryDeepObjectExplode getAccountsCreated)
    , ("ending_before", queryFormExplode getAccountsEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountsExpand)
    , ("limit", queryFormExplode getAccountsLimit)
    , ("starting_after", queryFormExplode getAccountsStartingAfter)
    ]
    where
      GetAccountsParams{..} = getAccountsParams
  endpointHeaders GetAccounts{..} =
    [
    ]



{-
getAccounts :: GetAccounts
getAccounts = GetAccounts
-}
-- 
{- | <p>Cancels a top-up. Only pending top-ups can be canceled.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/topups/{topup}/cancel
-}
-- TODO request options as enum
data PostTopupsTopupCancel = PostTopupsTopupCancel
  { postTopupsTopupCancelParams :: PostTopupsTopupCancelParams
  , postTopupsTopupCancelBody :: Maybe PostTopupsTopupCancelBody
  } deriving (Show, Eq, Generic)

data PostTopupsTopupCancelParams = PostTopupsTopupCancelParams
  {  postTopupsTopupCancelTopup :: (Text)
  {- ^ The ID of the top-up to cancel. -}
  } deriving (Show, Eq, Generic)

data PostTopupsTopupCancelBody
  = PostTopupsTopupCancelBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTopupsTopupCancel = "POST"
type instance RequestPath PostTopupsTopupCancel = "/v1/topups/{topup}/cancel"

instance RequestBuilder PostTopupsTopupCancel where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTopupsTopupCancel{..} =
    [ "v1"
    , "topups"
    , pathSimple postTopupsTopupCancelTopup
    , "cancel"
    ]
    where
      PostTopupsTopupCancelParams{..} = postTopupsTopupCancelParams
  endpointQuery PostTopupsTopupCancel{..} =
    [
    ]
  endpointHeaders PostTopupsTopupCancel{..} =
    [
    ]



{-
postTopupsTopupCancel :: PostTopupsTopupCancel
postTopupsTopupCancel = PostTopupsTopupCancel
-}
-- 
{- | <p>Adds a new item to an existing subscription. No existing items will be changed or replaced.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_items
-}
-- TODO request options as enum
data PostSubscriptionItems = PostSubscriptionItems
  { postSubscriptionItemsParams :: PostSubscriptionItemsParams
  , postSubscriptionItemsBody :: PostSubscriptionItemsBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsParams = PostSubscriptionItemsParams
  {
  } deriving (Show, Eq, Generic)

data PostSubscriptionItemsBody
  = PostSubscriptionItemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionItems = "POST"
type instance RequestPath PostSubscriptionItems = "/v1/subscription_items"

instance RequestBuilder PostSubscriptionItems where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionItems{..} =
    [ "v1"
    , "subscription_items"
    ]
    where
      PostSubscriptionItemsParams = postSubscriptionItemsParams
  endpointQuery PostSubscriptionItems{..} =
    [
    ]
  endpointHeaders PostSubscriptionItems{..} =
    [
    ]



{-
postSubscriptionItems :: PostSubscriptionItems
postSubscriptionItems = PostSubscriptionItems
-}
-- 
{- | <p>Returns a list of your subscription items for a given subscription.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscription_items
-}
-- TODO request options as enum
data GetSubscriptionItems = GetSubscriptionItems
  { getSubscriptionItemsParams :: GetSubscriptionItemsParams
  , getSubscriptionItemsBody :: Maybe GetSubscriptionItemsBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsParams = GetSubscriptionItemsParams
  {  getSubscriptionItemsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSubscriptionItemsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionItemsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSubscriptionItemsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getSubscriptionItemsSubscription :: (Text)
  {- ^ The ID of the subscription whose items will be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetSubscriptionItemsBody
  = GetSubscriptionItemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionItems = "GET"
type instance RequestPath GetSubscriptionItems = "/v1/subscription_items"

instance RequestBuilder GetSubscriptionItems where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionItems{..} =
    [ "v1"
    , "subscription_items"
    ]
    where
      GetSubscriptionItemsParams{..} = getSubscriptionItemsParams
  endpointQuery GetSubscriptionItems{..} =
    [ ("ending_before", queryFormExplode getSubscriptionItemsEndingBefore)
    , ("expand", queryDeepObjectExplode getSubscriptionItemsExpand)
    , ("limit", queryFormExplode getSubscriptionItemsLimit)
    , ("starting_after", queryFormExplode getSubscriptionItemsStartingAfter)
    , ("subscription", queryFormExplode getSubscriptionItemsSubscription)
    ]
    where
      GetSubscriptionItemsParams{..} = getSubscriptionItemsParams
  endpointHeaders GetSubscriptionItems{..} =
    [
    ]



{-
getSubscriptionItems :: GetSubscriptionItems
getSubscriptionItems = GetSubscriptionItems
-}
-- 
{- | <p>Invalidates all sessions for a light account, for a platform to use during platform logout.</p>

<p><strong>You may only log out <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

> -- Equivalent to the following API endpoint:
> PUT /v1/account/logout
-}
-- TODO request options as enum
data PutAccountLogout = PutAccountLogout
  { putAccountLogoutParams :: PutAccountLogoutParams
  , putAccountLogoutBody :: PutAccountLogoutBody
  } deriving (Show, Eq, Generic)

data PutAccountLogoutParams = PutAccountLogoutParams
  {
  } deriving (Show, Eq, Generic)

data PutAccountLogoutBody
  = PutAccountLogoutBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PutAccountLogout = "PUT"
type instance RequestPath PutAccountLogout = "/v1/account/logout"

instance RequestBuilder PutAccountLogout where
  endpointMethod _ = "PUT"
  -- TODO figure out allowReserved parameter option
  endpointPath PutAccountLogout{..} =
    [ "v1"
    , "account"
    , "logout"
    ]
    where
      PutAccountLogoutParams = putAccountLogoutParams
  endpointQuery PutAccountLogout{..} =
    [
    ]
  endpointHeaders PutAccountLogout{..} =
    [
    ]



{-
putAccountLogout :: PutAccountLogout
putAccountLogout = PutAccountLogout
-}
-- 
{- | <p>This endpoint creates a draft invoice for a given customer. The draft invoice created pulls in all pending invoice items on that customer, including prorations.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices
-}
-- TODO request options as enum
data PostInvoices = PostInvoices
  { postInvoicesParams :: PostInvoicesParams
  , postInvoicesBody :: PostInvoicesBody
  } deriving (Show, Eq, Generic)

data PostInvoicesParams = PostInvoicesParams
  {
  } deriving (Show, Eq, Generic)

data PostInvoicesBody
  = PostInvoicesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoices = "POST"
type instance RequestPath PostInvoices = "/v1/invoices"

instance RequestBuilder PostInvoices where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoices{..} =
    [ "v1"
    , "invoices"
    ]
    where
      PostInvoicesParams = postInvoicesParams
  endpointQuery PostInvoices{..} =
    [
    ]
  endpointHeaders PostInvoices{..} =
    [
    ]



{-
postInvoices :: PostInvoices
postInvoices = PostInvoices
-}
-- 
{- | <p>You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoices
-}
-- TODO request options as enum
data GetInvoices = GetInvoices
  { getInvoicesParams :: GetInvoicesParams
  , getInvoicesBody :: Maybe GetInvoicesBody
  } deriving (Show, Eq, Generic)

data GetInvoicesParams = GetInvoicesParams
  {  getInvoicesBilling :: Maybe (Billing)
  {- ^ This field has been renamed to `collection_method` and will be removed in a future API version. -}
  ,  getInvoicesCollectionMethod :: Maybe (CollectionMethod)
  {- ^ The collection method of the invoice to retrieve. Either `charge_automatically` or `send_invoice`. -}
  ,  getInvoicesCreated :: Maybe (Either (Object) (Int))
  ,  getInvoicesCustomer :: Maybe (Text)
  {- ^ Only return invoices for the customer specified by this customer ID. -}
  ,  getInvoicesDueDate :: Maybe (Either (Object) (Int))
  ,  getInvoicesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getInvoicesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoicesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getInvoicesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getInvoicesStatus :: Maybe (Status)
  {- ^ The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview) -}
  ,  getInvoicesSubscription :: Maybe (Text)
  {- ^ Only return invoices for the subscription specified by this subscription ID. -}
  } deriving (Show, Eq, Generic)

data GetInvoicesBody
  = GetInvoicesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoices = "GET"
type instance RequestPath GetInvoices = "/v1/invoices"

instance RequestBuilder GetInvoices where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoices{..} =
    [ "v1"
    , "invoices"
    ]
    where
      GetInvoicesParams{..} = getInvoicesParams
  endpointQuery GetInvoices{..} =
    [ ("billing", queryFormExplode getInvoicesBilling)
    , ("collection_method", queryFormExplode getInvoicesCollectionMethod)
    , ("created", queryDeepObjectExplode getInvoicesCreated)
    , ("customer", queryFormExplode getInvoicesCustomer)
    , ("due_date", queryDeepObjectExplode getInvoicesDueDate)
    , ("ending_before", queryFormExplode getInvoicesEndingBefore)
    , ("expand", queryDeepObjectExplode getInvoicesExpand)
    , ("limit", queryFormExplode getInvoicesLimit)
    , ("starting_after", queryFormExplode getInvoicesStartingAfter)
    , ("status", queryFormExplode getInvoicesStatus)
    , ("subscription", queryFormExplode getInvoicesSubscription)
    ]
    where
      GetInvoicesParams{..} = getInvoicesParams
  endpointHeaders GetInvoices{..} =
    [
    ]



{-
getInvoices :: GetInvoices
getInvoices = GetInvoices
-}
-- 
{- | <p>Updates the specific order by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/orders/{id}
-}
-- TODO request options as enum
data PostOrdersId = PostOrdersId
  { postOrdersIdParams :: PostOrdersIdParams
  , postOrdersIdBody :: Maybe PostOrdersIdBody
  } deriving (Show, Eq, Generic)

data PostOrdersIdParams = PostOrdersIdParams
  {  postOrdersIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostOrdersIdBody
  = PostOrdersIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostOrdersId = "POST"
type instance RequestPath PostOrdersId = "/v1/orders/{id}"

instance RequestBuilder PostOrdersId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostOrdersId{..} =
    [ "v1"
    , "orders"
    , pathSimple postOrdersIdId
    ]
    where
      PostOrdersIdParams{..} = postOrdersIdParams
  endpointQuery PostOrdersId{..} =
    [
    ]
  endpointHeaders PostOrdersId{..} =
    [
    ]



{-
postOrdersId :: PostOrdersId
postOrdersId = PostOrdersId
-}
-- 
{- | <p>Retrieves the details of an existing order. Supply the unique order ID from either an order creation request or the order list, and Stripe will return the corresponding order information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/orders/{id}
-}
-- TODO request options as enum
data GetOrdersId = GetOrdersId
  { getOrdersIdParams :: GetOrdersIdParams
  , getOrdersIdBody :: Maybe GetOrdersIdBody
  } deriving (Show, Eq, Generic)

data GetOrdersIdParams = GetOrdersIdParams
  {  getOrdersIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getOrdersIdId :: (Text)
  {- ^ The identifier of the order to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetOrdersIdBody
  = GetOrdersIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetOrdersId = "GET"
type instance RequestPath GetOrdersId = "/v1/orders/{id}"

instance RequestBuilder GetOrdersId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetOrdersId{..} =
    [ "v1"
    , "orders"
    , pathSimple getOrdersIdId
    ]
    where
      GetOrdersIdParams{..} = getOrdersIdParams
  endpointQuery GetOrdersId{..} =
    [ ("expand", queryDeepObjectExplode getOrdersIdExpand)
    ]
  endpointHeaders GetOrdersId{..} =
    [
    ]



{-
getOrdersId :: GetOrdersId
getOrdersId = GetOrdersId
-}
-- 
{- | <p>Updates an existing Account Capability.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/capabilities/{capability}
-}
-- TODO request options as enum
data PostAccountCapabilitiesCapability = PostAccountCapabilitiesCapability
  { postAccountCapabilitiesCapabilityParams :: PostAccountCapabilitiesCapabilityParams
  , postAccountCapabilitiesCapabilityBody :: Maybe PostAccountCapabilitiesCapabilityBody
  } deriving (Show, Eq, Generic)

data PostAccountCapabilitiesCapabilityParams = PostAccountCapabilitiesCapabilityParams
  {  postAccountCapabilitiesCapabilityCapability :: (Text)
  {- ^ The ID of an account capability to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountCapabilitiesCapabilityBody
  = PostAccountCapabilitiesCapabilityBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountCapabilitiesCapability = "POST"
type instance RequestPath PostAccountCapabilitiesCapability = "/v1/account/capabilities/{capability}"

instance RequestBuilder PostAccountCapabilitiesCapability where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountCapabilitiesCapability{..} =
    [ "v1"
    , "account"
    , "capabilities"
    , pathSimple postAccountCapabilitiesCapabilityCapability
    ]
    where
      PostAccountCapabilitiesCapabilityParams{..} = postAccountCapabilitiesCapabilityParams
  endpointQuery PostAccountCapabilitiesCapability{..} =
    [
    ]
  endpointHeaders PostAccountCapabilitiesCapability{..} =
    [
    ]



{-
postAccountCapabilitiesCapability :: PostAccountCapabilitiesCapability
postAccountCapabilitiesCapability = PostAccountCapabilitiesCapability
-}
-- 
{- | <p>Retrieves information about the specified Account Capability.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/capabilities/{capability}
-}
-- TODO request options as enum
data GetAccountCapabilitiesCapability = GetAccountCapabilitiesCapability
  { getAccountCapabilitiesCapabilityParams :: GetAccountCapabilitiesCapabilityParams
  , getAccountCapabilitiesCapabilityBody :: Maybe GetAccountCapabilitiesCapabilityBody
  } deriving (Show, Eq, Generic)

data GetAccountCapabilitiesCapabilityParams = GetAccountCapabilitiesCapabilityParams
  {  getAccountCapabilitiesCapabilityCapability :: (Text)
  {- ^ The ID of an account capability to retrieve. -}
  ,  getAccountCapabilitiesCapabilityExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountCapabilitiesCapabilityBody
  = GetAccountCapabilitiesCapabilityBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountCapabilitiesCapability = "GET"
type instance RequestPath GetAccountCapabilitiesCapability = "/v1/account/capabilities/{capability}"

instance RequestBuilder GetAccountCapabilitiesCapability where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountCapabilitiesCapability{..} =
    [ "v1"
    , "account"
    , "capabilities"
    , pathSimple getAccountCapabilitiesCapabilityCapability
    ]
    where
      GetAccountCapabilitiesCapabilityParams{..} = getAccountCapabilitiesCapabilityParams
  endpointQuery GetAccountCapabilitiesCapability{..} =
    [ ("expand", queryDeepObjectExplode getAccountCapabilitiesCapabilityExpand)
    ]
  endpointHeaders GetAccountCapabilitiesCapability{..} =
    [
    ]



{-
getAccountCapabilitiesCapability :: GetAccountCapabilitiesCapability
getAccountCapabilitiesCapability = GetAccountCapabilitiesCapability
-}
-- 
{- | <p>Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}/pay
-}
-- TODO request options as enum
data PostInvoicesInvoicePay = PostInvoicesInvoicePay
  { postInvoicesInvoicePayParams :: PostInvoicesInvoicePayParams
  , postInvoicesInvoicePayBody :: Maybe PostInvoicesInvoicePayBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoicePayParams = PostInvoicesInvoicePayParams
  {  postInvoicesInvoicePayInvoice :: (Text)
  {- ^ ID of invoice to pay. -}
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoicePayBody
  = PostInvoicesInvoicePayBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoicePay = "POST"
type instance RequestPath PostInvoicesInvoicePay = "/v1/invoices/{invoice}/pay"

instance RequestBuilder PostInvoicesInvoicePay where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoicePay{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoicePayInvoice
    , "pay"
    ]
    where
      PostInvoicesInvoicePayParams{..} = postInvoicesInvoicePayParams
  endpointQuery PostInvoicesInvoicePay{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoicePay{..} =
    [
    ]



{-
postInvoicesInvoicePay :: PostInvoicesInvoicePay
postInvoicesInvoicePay = PostInvoicesInvoicePay
-}
-- 
{- | <p>When you create a new refund, you must specify a charge on which to create it.</p>

<p>Creating a new refund will refund a charge that has previously been created but not yet refunded.
Funds will be refunded to the credit or debit card that was originally charged.</p>

<p>You can optionally refund only part of a charge.
You can do so multiple times, until the entire charge has been refunded.</p>

<p>Once entirely refunded, a charge can’t be refunded again.
This method will raise an error when called on an already-refunded charge,
or when trying to refund more money than is left on a charge.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/refund
-}
-- TODO request options as enum
data PostChargesChargeRefund = PostChargesChargeRefund
  { postChargesChargeRefundParams :: PostChargesChargeRefundParams
  , postChargesChargeRefundBody :: Maybe PostChargesChargeRefundBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundParams = PostChargesChargeRefundParams
  {  postChargesChargeRefundCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundBody
  = PostChargesChargeRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeRefund = "POST"
type instance RequestPath PostChargesChargeRefund = "/v1/charges/{charge}/refund"

instance RequestBuilder PostChargesChargeRefund where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeRefund{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeRefundCharge
    , "refund"
    ]
    where
      PostChargesChargeRefundParams{..} = postChargesChargeRefundParams
  endpointQuery PostChargesChargeRefund{..} =
    [
    ]
  endpointHeaders PostChargesChargeRefund{..} =
    [
    ]



{-
postChargesChargeRefund :: PostChargesChargeRefund
postChargesChargeRefund = PostChargesChargeRefund
-}
-- 
{- | <p>Create an external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/external_accounts
-}
-- TODO request options as enum
data PostAccountsAccountExternalAccounts = PostAccountsAccountExternalAccounts
  { postAccountsAccountExternalAccountsParams :: PostAccountsAccountExternalAccountsParams
  , postAccountsAccountExternalAccountsBody :: Maybe PostAccountsAccountExternalAccountsBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountExternalAccountsParams = PostAccountsAccountExternalAccountsParams
  {  postAccountsAccountExternalAccountsAccount :: (Text)
  } deriving (Show, Eq, Generic)

data PostAccountsAccountExternalAccountsBody
  = PostAccountsAccountExternalAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountExternalAccounts = "POST"
type instance RequestPath PostAccountsAccountExternalAccounts = "/v1/accounts/{account}/external_accounts"

instance RequestBuilder PostAccountsAccountExternalAccounts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountExternalAccounts{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountExternalAccountsAccount
    , "external_accounts"
    ]
    where
      PostAccountsAccountExternalAccountsParams{..} = postAccountsAccountExternalAccountsParams
  endpointQuery PostAccountsAccountExternalAccounts{..} =
    [
    ]
  endpointHeaders PostAccountsAccountExternalAccounts{..} =
    [
    ]



{-
postAccountsAccountExternalAccounts :: PostAccountsAccountExternalAccounts
postAccountsAccountExternalAccounts = PostAccountsAccountExternalAccounts
-}
-- 
{- | <p>List external accounts for an account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/external_accounts
-}
-- TODO request options as enum
data GetAccountsAccountExternalAccounts = GetAccountsAccountExternalAccounts
  { getAccountsAccountExternalAccountsParams :: GetAccountsAccountExternalAccountsParams
  , getAccountsAccountExternalAccountsBody :: Maybe GetAccountsAccountExternalAccountsBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountExternalAccountsParams = GetAccountsAccountExternalAccountsParams
  {  getAccountsAccountExternalAccountsAccount :: (Text)
  ,  getAccountsAccountExternalAccountsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountsAccountExternalAccountsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountExternalAccountsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountsAccountExternalAccountsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountExternalAccountsBody
  = GetAccountsAccountExternalAccountsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountExternalAccounts = "GET"
type instance RequestPath GetAccountsAccountExternalAccounts = "/v1/accounts/{account}/external_accounts"

instance RequestBuilder GetAccountsAccountExternalAccounts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountExternalAccounts{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountExternalAccountsAccount
    , "external_accounts"
    ]
    where
      GetAccountsAccountExternalAccountsParams{..} = getAccountsAccountExternalAccountsParams
  endpointQuery GetAccountsAccountExternalAccounts{..} =
    [ ("ending_before", queryFormExplode getAccountsAccountExternalAccountsEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountsAccountExternalAccountsExpand)
    , ("limit", queryFormExplode getAccountsAccountExternalAccountsLimit)
    , ("starting_after", queryFormExplode getAccountsAccountExternalAccountsStartingAfter)
    ]
    where
      GetAccountsAccountExternalAccountsParams{..} = getAccountsAccountExternalAccountsParams
  endpointHeaders GetAccountsAccountExternalAccounts{..} =
    [
    ]



{-
getAccountsAccountExternalAccounts :: GetAccountsAccountExternalAccounts
getAccountsAccountExternalAccounts = GetAccountsAccountExternalAccounts
-}
-- 
{- | <p>Create a refund.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/refunds
-}
-- TODO request options as enum
data PostChargesChargeRefunds = PostChargesChargeRefunds
  { postChargesChargeRefundsParams :: PostChargesChargeRefundsParams
  , postChargesChargeRefundsBody :: Maybe PostChargesChargeRefundsBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundsParams = PostChargesChargeRefundsParams
  {  postChargesChargeRefundsCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeRefundsBody
  = PostChargesChargeRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeRefunds = "POST"
type instance RequestPath PostChargesChargeRefunds = "/v1/charges/{charge}/refunds"

instance RequestBuilder PostChargesChargeRefunds where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeRefunds{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeRefundsCharge
    , "refunds"
    ]
    where
      PostChargesChargeRefundsParams{..} = postChargesChargeRefundsParams
  endpointQuery PostChargesChargeRefunds{..} =
    [
    ]
  endpointHeaders PostChargesChargeRefunds{..} =
    [
    ]



{-
postChargesChargeRefunds :: PostChargesChargeRefunds
postChargesChargeRefunds = PostChargesChargeRefunds
-}
-- 
{- | <p>You can see a list of the refunds belonging to a specific charge. Note that the 10 most recent refunds are always available by default on the charge object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/charges/{charge}/refunds
-}
-- TODO request options as enum
data GetChargesChargeRefunds = GetChargesChargeRefunds
  { getChargesChargeRefundsParams :: GetChargesChargeRefundsParams
  , getChargesChargeRefundsBody :: Maybe GetChargesChargeRefundsBody
  } deriving (Show, Eq, Generic)

data GetChargesChargeRefundsParams = GetChargesChargeRefundsParams
  {  getChargesChargeRefundsCharge :: (Text)
  {- ^ The ID of the charge whose refunds will be retrieved. -}
  ,  getChargesChargeRefundsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getChargesChargeRefundsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getChargesChargeRefundsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getChargesChargeRefundsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetChargesChargeRefundsBody
  = GetChargesChargeRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetChargesChargeRefunds = "GET"
type instance RequestPath GetChargesChargeRefunds = "/v1/charges/{charge}/refunds"

instance RequestBuilder GetChargesChargeRefunds where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetChargesChargeRefunds{..} =
    [ "v1"
    , "charges"
    , pathSimple getChargesChargeRefundsCharge
    , "refunds"
    ]
    where
      GetChargesChargeRefundsParams{..} = getChargesChargeRefundsParams
  endpointQuery GetChargesChargeRefunds{..} =
    [ ("ending_before", queryFormExplode getChargesChargeRefundsEndingBefore)
    , ("expand", queryDeepObjectExplode getChargesChargeRefundsExpand)
    , ("limit", queryFormExplode getChargesChargeRefundsLimit)
    , ("starting_after", queryFormExplode getChargesChargeRefundsStartingAfter)
    ]
    where
      GetChargesChargeRefundsParams{..} = getChargesChargeRefundsParams
  endpointHeaders GetChargesChargeRefunds{..} =
    [
    ]



{-
getChargesChargeRefunds :: GetChargesChargeRefunds
getChargesChargeRefunds = GetChargesChargeRefunds
-}
-- 
{- | <p>Marks a credit note as void. Learn more about <a href="/docs/billing/invoices/credit-notes#voiding">voiding credit notes</a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/credit_notes/{id}/void
-}
-- TODO request options as enum
data PostCreditNotesIdVoid = PostCreditNotesIdVoid
  { postCreditNotesIdVoidParams :: PostCreditNotesIdVoidParams
  , postCreditNotesIdVoidBody :: Maybe PostCreditNotesIdVoidBody
  } deriving (Show, Eq, Generic)

data PostCreditNotesIdVoidParams = PostCreditNotesIdVoidParams
  {  postCreditNotesIdVoidId :: (Text)
  {- ^ ID of the credit note object to void. -}
  } deriving (Show, Eq, Generic)

data PostCreditNotesIdVoidBody
  = PostCreditNotesIdVoidBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCreditNotesIdVoid = "POST"
type instance RequestPath PostCreditNotesIdVoid = "/v1/credit_notes/{id}/void"

instance RequestBuilder PostCreditNotesIdVoid where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCreditNotesIdVoid{..} =
    [ "v1"
    , "credit_notes"
    , pathSimple postCreditNotesIdVoidId
    , "void"
    ]
    where
      PostCreditNotesIdVoidParams{..} = postCreditNotesIdVoidParams
  endpointQuery PostCreditNotesIdVoid{..} =
    [
    ]
  endpointHeaders PostCreditNotesIdVoid{..} =
    [
    ]



{-
postCreditNotesIdVoid :: PostCreditNotesIdVoid
postCreditNotesIdVoid = PostCreditNotesIdVoid
-}
-- 
{- | <p>Updates an existing tax rate.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/tax_rates/{tax_rate}
-}
-- TODO request options as enum
data PostTaxRatesTaxRate = PostTaxRatesTaxRate
  { postTaxRatesTaxRateParams :: PostTaxRatesTaxRateParams
  , postTaxRatesTaxRateBody :: Maybe PostTaxRatesTaxRateBody
  } deriving (Show, Eq, Generic)

data PostTaxRatesTaxRateParams = PostTaxRatesTaxRateParams
  {  postTaxRatesTaxRateTaxRate :: (Text)
  {- ^ ID of the tax rate to update. -}
  } deriving (Show, Eq, Generic)

data PostTaxRatesTaxRateBody
  = PostTaxRatesTaxRateBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTaxRatesTaxRate = "POST"
type instance RequestPath PostTaxRatesTaxRate = "/v1/tax_rates/{tax_rate}"

instance RequestBuilder PostTaxRatesTaxRate where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTaxRatesTaxRate{..} =
    [ "v1"
    , "tax_rates"
    , pathSimple postTaxRatesTaxRateTaxRate
    ]
    where
      PostTaxRatesTaxRateParams{..} = postTaxRatesTaxRateParams
  endpointQuery PostTaxRatesTaxRate{..} =
    [
    ]
  endpointHeaders PostTaxRatesTaxRate{..} =
    [
    ]



{-
postTaxRatesTaxRate :: PostTaxRatesTaxRate
postTaxRatesTaxRate = PostTaxRatesTaxRate
-}
-- 
{- | <p>Retrieves a tax rate with the given ID</p>

> -- Equivalent to the following API endpoint:
> GET /v1/tax_rates/{tax_rate}
-}
-- TODO request options as enum
data GetTaxRatesTaxRate = GetTaxRatesTaxRate
  { getTaxRatesTaxRateParams :: GetTaxRatesTaxRateParams
  , getTaxRatesTaxRateBody :: Maybe GetTaxRatesTaxRateBody
  } deriving (Show, Eq, Generic)

data GetTaxRatesTaxRateParams = GetTaxRatesTaxRateParams
  {  getTaxRatesTaxRateExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTaxRatesTaxRateTaxRate :: (Text)
  {- ^ The ID of the desired tax rate. -}
  } deriving (Show, Eq, Generic)

data GetTaxRatesTaxRateBody
  = GetTaxRatesTaxRateBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTaxRatesTaxRate = "GET"
type instance RequestPath GetTaxRatesTaxRate = "/v1/tax_rates/{tax_rate}"

instance RequestBuilder GetTaxRatesTaxRate where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTaxRatesTaxRate{..} =
    [ "v1"
    , "tax_rates"
    , pathSimple getTaxRatesTaxRateTaxRate
    ]
    where
      GetTaxRatesTaxRateParams{..} = getTaxRatesTaxRateParams
  endpointQuery GetTaxRatesTaxRate{..} =
    [ ("expand", queryDeepObjectExplode getTaxRatesTaxRateExpand)
    ]
  endpointHeaders GetTaxRatesTaxRate{..} =
    [
    ]



{-
getTaxRatesTaxRate :: GetTaxRatesTaxRate
getTaxRatesTaxRate = GetTaxRatesTaxRate
-}
-- 
{- | <p>Returns a list of your disputes.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/disputes
-}
-- TODO request options as enum
data GetDisputes = GetDisputes
  { getDisputesParams :: GetDisputesParams
  , getDisputesBody :: Maybe GetDisputesBody
  } deriving (Show, Eq, Generic)

data GetDisputesParams = GetDisputesParams
  {  getDisputesCreated :: Maybe (Either (Object) (Int))
  ,  getDisputesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getDisputesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getDisputesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getDisputesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetDisputesBody
  = GetDisputesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetDisputes = "GET"
type instance RequestPath GetDisputes = "/v1/disputes"

instance RequestBuilder GetDisputes where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetDisputes{..} =
    [ "v1"
    , "disputes"
    ]
    where
      GetDisputesParams{..} = getDisputesParams
  endpointQuery GetDisputes{..} =
    [ ("created", queryDeepObjectExplode getDisputesCreated)
    , ("ending_before", queryFormExplode getDisputesEndingBefore)
    , ("expand", queryDeepObjectExplode getDisputesExpand)
    , ("limit", queryFormExplode getDisputesLimit)
    , ("starting_after", queryFormExplode getDisputesStartingAfter)
    ]
    where
      GetDisputesParams{..} = getDisputesParams
  endpointHeaders GetDisputes{..} =
    [
    ]



{-
getDisputes :: GetDisputes
getDisputes = GetDisputes
-}
-- 
{- | <p>Creates a new <code>Reader</code> object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/terminal/readers
-}
-- TODO request options as enum
data PostTerminalReaders = PostTerminalReaders
  { postTerminalReadersParams :: PostTerminalReadersParams
  , postTerminalReadersBody :: PostTerminalReadersBody
  } deriving (Show, Eq, Generic)

data PostTerminalReadersParams = PostTerminalReadersParams
  {
  } deriving (Show, Eq, Generic)

data PostTerminalReadersBody
  = PostTerminalReadersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTerminalReaders = "POST"
type instance RequestPath PostTerminalReaders = "/v1/terminal/readers"

instance RequestBuilder PostTerminalReaders where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTerminalReaders{..} =
    [ "v1"
    , "terminal"
    , "readers"
    ]
    where
      PostTerminalReadersParams = postTerminalReadersParams
  endpointQuery PostTerminalReaders{..} =
    [
    ]
  endpointHeaders PostTerminalReaders{..} =
    [
    ]



{-
postTerminalReaders :: PostTerminalReaders
postTerminalReaders = PostTerminalReaders
-}
-- 
{- | <p>Returns a list of <code>Reader</code> objects.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/terminal/readers
-}
-- TODO request options as enum
data GetTerminalReaders = GetTerminalReaders
  { getTerminalReadersParams :: GetTerminalReadersParams
  , getTerminalReadersBody :: Maybe GetTerminalReadersBody
  } deriving (Show, Eq, Generic)

data GetTerminalReadersParams = GetTerminalReadersParams
  {  getTerminalReadersEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getTerminalReadersExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTerminalReadersLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getTerminalReadersLocation :: Maybe (Text)
  {- ^ A location ID to filter the response list to only readers at the specific location -}
  ,  getTerminalReadersStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getTerminalReadersStatus :: Maybe (Either (Status) (Text))
  {- ^ A status filter to filter readers to only offline or online readers -}
  } deriving (Show, Eq, Generic)

data GetTerminalReadersBody
  = GetTerminalReadersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTerminalReaders = "GET"
type instance RequestPath GetTerminalReaders = "/v1/terminal/readers"

instance RequestBuilder GetTerminalReaders where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTerminalReaders{..} =
    [ "v1"
    , "terminal"
    , "readers"
    ]
    where
      GetTerminalReadersParams{..} = getTerminalReadersParams
  endpointQuery GetTerminalReaders{..} =
    [ ("ending_before", queryFormExplode getTerminalReadersEndingBefore)
    , ("expand", queryDeepObjectExplode getTerminalReadersExpand)
    , ("limit", queryFormExplode getTerminalReadersLimit)
    , ("location", queryFormExplode getTerminalReadersLocation)
    , ("starting_after", queryFormExplode getTerminalReadersStartingAfter)
    , ("status", queryDeepObjectExplode getTerminalReadersStatus)
    ]
    where
      GetTerminalReadersParams{..} = getTerminalReadersParams
  endpointHeaders GetTerminalReaders{..} =
    [
    ]



{-
getTerminalReaders :: GetTerminalReaders
getTerminalReaders = GetTerminalReaders
-}
-- 
{- | <p>Updates the metadata of a top-up. Other top-up details are not editable by design.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/topups/{topup}
-}
-- TODO request options as enum
data PostTopupsTopup = PostTopupsTopup
  { postTopupsTopupParams :: PostTopupsTopupParams
  , postTopupsTopupBody :: Maybe PostTopupsTopupBody
  } deriving (Show, Eq, Generic)

data PostTopupsTopupParams = PostTopupsTopupParams
  {  postTopupsTopupTopup :: (Text)
  {- ^ The ID of the top-up to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostTopupsTopupBody
  = PostTopupsTopupBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTopupsTopup = "POST"
type instance RequestPath PostTopupsTopup = "/v1/topups/{topup}"

instance RequestBuilder PostTopupsTopup where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTopupsTopup{..} =
    [ "v1"
    , "topups"
    , pathSimple postTopupsTopupTopup
    ]
    where
      PostTopupsTopupParams{..} = postTopupsTopupParams
  endpointQuery PostTopupsTopup{..} =
    [
    ]
  endpointHeaders PostTopupsTopup{..} =
    [
    ]



{-
postTopupsTopup :: PostTopupsTopup
postTopupsTopup = PostTopupsTopup
-}
-- 
{- | <p>Retrieves the details of a top-up that has previously been created. Supply the unique top-up ID that was returned from your previous request, and Stripe will return the corresponding top-up information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/topups/{topup}
-}
-- TODO request options as enum
data GetTopupsTopup = GetTopupsTopup
  { getTopupsTopupParams :: GetTopupsTopupParams
  , getTopupsTopupBody :: Maybe GetTopupsTopupBody
  } deriving (Show, Eq, Generic)

data GetTopupsTopupParams = GetTopupsTopupParams
  {  getTopupsTopupExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getTopupsTopupTopup :: (Text)
  {- ^ The ID of the top-up to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetTopupsTopupBody
  = GetTopupsTopupBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetTopupsTopup = "GET"
type instance RequestPath GetTopupsTopup = "/v1/topups/{topup}"

instance RequestBuilder GetTopupsTopup where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetTopupsTopup{..} =
    [ "v1"
    , "topups"
    , pathSimple getTopupsTopupTopup
    ]
    where
      GetTopupsTopupParams{..} = getTopupsTopupParams
  endpointQuery GetTopupsTopup{..} =
    [ ("expand", queryDeepObjectExplode getTopupsTopupExpand)
    ]
  endpointHeaders GetTopupsTopup{..} =
    [
    ]



{-
getTopupsTopup :: GetTopupsTopup
getTopupsTopup = GetTopupsTopup
-}
-- 
{- | <p>Issue a credit note to adjust the amount of a finalized invoice. For a <code>status=open</code> invoice, a credit note reduces
its <code>amount_due</code>. For a <code>status=paid</code> invoice, a credit note does not affect its <code>amount_due</code>. Instead, it can result
in any combination of the following:</p>

<ul>
 <li>Refund: create a new refund (using <code>refund_amount</code>) or link an existing refund (using <code>refund</code>).</li>
 <li>Customer balance credit: credit the customer’s balance (using <code>credit_amount</code>) which will be automatically applied to their next invoice when it’s finalized.</li>
 <li>Outside of Stripe credit: any positive value from the result of <code>amount - refund_amount - credit_amount</code> is represented as an “outside of Stripe” credit.</li>
</ul>

<p>You may issue multiple credit notes for an invoice. Each credit note will increment the invoice’s <code>pre_payment_credit_notes_amount</code>
or <code>post_payment_credit_notes_amount</code> depending on its <code>status</code> at the time of credit note creation.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/credit_notes
-}
-- TODO request options as enum
data PostCreditNotes = PostCreditNotes
  { postCreditNotesParams :: PostCreditNotesParams
  , postCreditNotesBody :: PostCreditNotesBody
  } deriving (Show, Eq, Generic)

data PostCreditNotesParams = PostCreditNotesParams
  {
  } deriving (Show, Eq, Generic)

data PostCreditNotesBody
  = PostCreditNotesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCreditNotes = "POST"
type instance RequestPath PostCreditNotes = "/v1/credit_notes"

instance RequestBuilder PostCreditNotes where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCreditNotes{..} =
    [ "v1"
    , "credit_notes"
    ]
    where
      PostCreditNotesParams = postCreditNotesParams
  endpointQuery PostCreditNotes{..} =
    [
    ]
  endpointHeaders PostCreditNotes{..} =
    [
    ]



{-
postCreditNotes :: PostCreditNotes
postCreditNotes = PostCreditNotes
-}
-- 
{- | <p>Returns a list of credit notes.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/credit_notes
-}
-- TODO request options as enum
data GetCreditNotes = GetCreditNotes
  { getCreditNotesParams :: GetCreditNotesParams
  , getCreditNotesBody :: Maybe GetCreditNotesBody
  } deriving (Show, Eq, Generic)

data GetCreditNotesParams = GetCreditNotesParams
  {  getCreditNotesCustomer :: Maybe (Text)
  {- ^ Only return credit notes for the customer specified by this customer ID. -}
  ,  getCreditNotesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCreditNotesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCreditNotesInvoice :: Maybe (Text)
  {- ^ Only return credit notes for the invoice specified by this invoice ID. -}
  ,  getCreditNotesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCreditNotesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCreditNotesBody
  = GetCreditNotesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCreditNotes = "GET"
type instance RequestPath GetCreditNotes = "/v1/credit_notes"

instance RequestBuilder GetCreditNotes where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCreditNotes{..} =
    [ "v1"
    , "credit_notes"
    ]
    where
      GetCreditNotesParams{..} = getCreditNotesParams
  endpointQuery GetCreditNotes{..} =
    [ ("customer", queryFormExplode getCreditNotesCustomer)
    , ("ending_before", queryFormExplode getCreditNotesEndingBefore)
    , ("expand", queryDeepObjectExplode getCreditNotesExpand)
    , ("invoice", queryFormExplode getCreditNotesInvoice)
    , ("limit", queryFormExplode getCreditNotesLimit)
    , ("starting_after", queryFormExplode getCreditNotesStartingAfter)
    ]
    where
      GetCreditNotesParams{..} = getCreditNotesParams
  endpointHeaders GetCreditNotes{..} =
    [
    ]



{-
getCreditNotes :: GetCreditNotes
getCreditNotes = GetCreditNotes
-}
-- 
{- | <p>Updates the specified payout by setting the values of the parameters passed. Any parameters not provided will be left unchanged. This request accepts only the metadata as arguments.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payouts/{payout}
-}
-- TODO request options as enum
data PostPayoutsPayout = PostPayoutsPayout
  { postPayoutsPayoutParams :: PostPayoutsPayoutParams
  , postPayoutsPayoutBody :: Maybe PostPayoutsPayoutBody
  } deriving (Show, Eq, Generic)

data PostPayoutsPayoutParams = PostPayoutsPayoutParams
  {  postPayoutsPayoutPayout :: (Text)
  {- ^ The identifier of the payout to be updated. -}
  } deriving (Show, Eq, Generic)

data PostPayoutsPayoutBody
  = PostPayoutsPayoutBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPayoutsPayout = "POST"
type instance RequestPath PostPayoutsPayout = "/v1/payouts/{payout}"

instance RequestBuilder PostPayoutsPayout where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPayoutsPayout{..} =
    [ "v1"
    , "payouts"
    , pathSimple postPayoutsPayoutPayout
    ]
    where
      PostPayoutsPayoutParams{..} = postPayoutsPayoutParams
  endpointQuery PostPayoutsPayout{..} =
    [
    ]
  endpointHeaders PostPayoutsPayout{..} =
    [
    ]



{-
postPayoutsPayout :: PostPayoutsPayout
postPayoutsPayout = PostPayoutsPayout
-}
-- 
{- | <p>Retrieves the details of an existing payout. Supply the unique payout ID from either a payout creation request or the payout list, and Stripe will return the corresponding payout information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payouts/{payout}
-}
-- TODO request options as enum
data GetPayoutsPayout = GetPayoutsPayout
  { getPayoutsPayoutParams :: GetPayoutsPayoutParams
  , getPayoutsPayoutBody :: Maybe GetPayoutsPayoutBody
  } deriving (Show, Eq, Generic)

data GetPayoutsPayoutParams = GetPayoutsPayoutParams
  {  getPayoutsPayoutExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPayoutsPayoutPayout :: (Text)
  {- ^ The identifier of the payout to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetPayoutsPayoutBody
  = GetPayoutsPayoutBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPayoutsPayout = "GET"
type instance RequestPath GetPayoutsPayout = "/v1/payouts/{payout}"

instance RequestBuilder GetPayoutsPayout where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPayoutsPayout{..} =
    [ "v1"
    , "payouts"
    , pathSimple getPayoutsPayoutPayout
    ]
    where
      GetPayoutsPayoutParams{..} = getPayoutsPayoutParams
  endpointQuery GetPayoutsPayout{..} =
    [ ("expand", queryDeepObjectExplode getPayoutsPayoutExpand)
    ]
  endpointHeaders GetPayoutsPayout{..} =
    [
    ]



{-
getPayoutsPayout :: GetPayoutsPayout
getPayoutsPayout = GetPayoutsPayout
-}
-- 
{- | <p>Verify a specified bank account for a given customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/sources/{id}/verify
-}
-- TODO request options as enum
data PostCustomersCustomerSourcesIdVerify = PostCustomersCustomerSourcesIdVerify
  { postCustomersCustomerSourcesIdVerifyParams :: PostCustomersCustomerSourcesIdVerifyParams
  , postCustomersCustomerSourcesIdVerifyBody :: Maybe PostCustomersCustomerSourcesIdVerifyBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesIdVerifyParams = PostCustomersCustomerSourcesIdVerifyParams
  {  postCustomersCustomerSourcesIdVerifyCustomer :: (Text)
  ,  postCustomersCustomerSourcesIdVerifyId :: (Text)
  {- ^ The ID of the source to be verified. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSourcesIdVerifyBody
  = PostCustomersCustomerSourcesIdVerifyBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerSourcesIdVerify = "POST"
type instance RequestPath PostCustomersCustomerSourcesIdVerify = "/v1/customers/{customer}/sources/{id}/verify"

instance RequestBuilder PostCustomersCustomerSourcesIdVerify where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerSourcesIdVerify{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerSourcesIdVerifyCustomer
    , "sources"
    , pathSimple postCustomersCustomerSourcesIdVerifyId
    , "verify"
    ]
    where
      PostCustomersCustomerSourcesIdVerifyParams{..} = postCustomersCustomerSourcesIdVerifyParams
  endpointQuery PostCustomersCustomerSourcesIdVerify{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerSourcesIdVerify{..} =
    [
    ]



{-
postCustomersCustomerSourcesIdVerify :: PostCustomersCustomerSourcesIdVerify
postCustomersCustomerSourcesIdVerify = PostCustomersCustomerSourcesIdVerify
-}
-- 
{- | <p>Updates the specified application fee refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>This request only accepts metadata as an argument.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/application_fees/{fee}/refunds/{id}
-}
-- TODO request options as enum
data PostApplicationFeesFeeRefundsId = PostApplicationFeesFeeRefundsId
  { postApplicationFeesFeeRefundsIdParams :: PostApplicationFeesFeeRefundsIdParams
  , postApplicationFeesFeeRefundsIdBody :: Maybe PostApplicationFeesFeeRefundsIdBody
  } deriving (Show, Eq, Generic)

data PostApplicationFeesFeeRefundsIdParams = PostApplicationFeesFeeRefundsIdParams
  {  postApplicationFeesFeeRefundsIdFee :: (Text)
  {- ^ ID of the application fee refunded. -}
  ,  postApplicationFeesFeeRefundsIdId :: (Text)
  {- ^ ID of refund to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostApplicationFeesFeeRefundsIdBody
  = PostApplicationFeesFeeRefundsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostApplicationFeesFeeRefundsId = "POST"
type instance RequestPath PostApplicationFeesFeeRefundsId = "/v1/application_fees/{fee}/refunds/{id}"

instance RequestBuilder PostApplicationFeesFeeRefundsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostApplicationFeesFeeRefundsId{..} =
    [ "v1"
    , "application_fees"
    , pathSimple postApplicationFeesFeeRefundsIdFee
    , "refunds"
    , pathSimple postApplicationFeesFeeRefundsIdId
    ]
    where
      PostApplicationFeesFeeRefundsIdParams{..} = postApplicationFeesFeeRefundsIdParams
  endpointQuery PostApplicationFeesFeeRefundsId{..} =
    [
    ]
  endpointHeaders PostApplicationFeesFeeRefundsId{..} =
    [
    ]



{-
postApplicationFeesFeeRefundsId :: PostApplicationFeesFeeRefundsId
postApplicationFeesFeeRefundsId = PostApplicationFeesFeeRefundsId
-}
-- 
{- | <p>By default, you can see the 10 most recent refunds stored directly on the application fee object, but you can also retrieve details about a specific refund stored on the application fee.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/application_fees/{fee}/refunds/{id}
-}
-- TODO request options as enum
data GetApplicationFeesFeeRefundsId = GetApplicationFeesFeeRefundsId
  { getApplicationFeesFeeRefundsIdParams :: GetApplicationFeesFeeRefundsIdParams
  , getApplicationFeesFeeRefundsIdBody :: Maybe GetApplicationFeesFeeRefundsIdBody
  } deriving (Show, Eq, Generic)

data GetApplicationFeesFeeRefundsIdParams = GetApplicationFeesFeeRefundsIdParams
  {  getApplicationFeesFeeRefundsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getApplicationFeesFeeRefundsIdFee :: (Text)
  {- ^ ID of the application fee refunded. -}
  ,  getApplicationFeesFeeRefundsIdId :: (Text)
  {- ^ ID of refund to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetApplicationFeesFeeRefundsIdBody
  = GetApplicationFeesFeeRefundsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplicationFeesFeeRefundsId = "GET"
type instance RequestPath GetApplicationFeesFeeRefundsId = "/v1/application_fees/{fee}/refunds/{id}"

instance RequestBuilder GetApplicationFeesFeeRefundsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplicationFeesFeeRefundsId{..} =
    [ "v1"
    , "application_fees"
    , pathSimple getApplicationFeesFeeRefundsIdFee
    , "refunds"
    , pathSimple getApplicationFeesFeeRefundsIdId
    ]
    where
      GetApplicationFeesFeeRefundsIdParams{..} = getApplicationFeesFeeRefundsIdParams
  endpointQuery GetApplicationFeesFeeRefundsId{..} =
    [ ("expand", queryDeepObjectExplode getApplicationFeesFeeRefundsIdExpand)
    ]
  endpointHeaders GetApplicationFeesFeeRefundsId{..} =
    [
    ]



{-
getApplicationFeesFeeRefundsId :: GetApplicationFeesFeeRefundsId
getApplicationFeesFeeRefundsId = GetApplicationFeesFeeRefundsId
-}
-- 
{- | <p>Retrieves the <code>TaxID</code> object with the given identifier.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/tax_ids/{id}
-}
-- TODO request options as enum
data GetCustomersCustomerTaxIdsId = GetCustomersCustomerTaxIdsId
  { getCustomersCustomerTaxIdsIdParams :: GetCustomersCustomerTaxIdsIdParams
  , getCustomersCustomerTaxIdsIdBody :: Maybe GetCustomersCustomerTaxIdsIdBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerTaxIdsIdParams = GetCustomersCustomerTaxIdsIdParams
  {  getCustomersCustomerTaxIdsIdCustomer :: (Text)
  {- ^ ID of the customer. -}
  ,  getCustomersCustomerTaxIdsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerTaxIdsIdId :: (Text)
  {- ^ Unique identifier of the `TaxID` object to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerTaxIdsIdBody
  = GetCustomersCustomerTaxIdsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerTaxIdsId = "GET"
type instance RequestPath GetCustomersCustomerTaxIdsId = "/v1/customers/{customer}/tax_ids/{id}"

instance RequestBuilder GetCustomersCustomerTaxIdsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerTaxIdsId{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerTaxIdsIdCustomer
    , "tax_ids"
    , pathSimple getCustomersCustomerTaxIdsIdId
    ]
    where
      GetCustomersCustomerTaxIdsIdParams{..} = getCustomersCustomerTaxIdsIdParams
  endpointQuery GetCustomersCustomerTaxIdsId{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerTaxIdsIdExpand)
    ]
  endpointHeaders GetCustomersCustomerTaxIdsId{..} =
    [
    ]



{-
getCustomersCustomerTaxIdsId :: GetCustomersCustomerTaxIdsId
getCustomersCustomerTaxIdsId = GetCustomersCustomerTaxIdsId
-}
-- 
{- | <p>Deletes an existing <code>TaxID</code> object.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/tax_ids/{id}
-}
-- TODO request options as enum
data DeleteCustomersCustomerTaxIdsId = DeleteCustomersCustomerTaxIdsId
  { deleteCustomersCustomerTaxIdsIdParams :: DeleteCustomersCustomerTaxIdsIdParams
  , deleteCustomersCustomerTaxIdsIdBody :: Maybe DeleteCustomersCustomerTaxIdsIdBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerTaxIdsIdParams = DeleteCustomersCustomerTaxIdsIdParams
  {  deleteCustomersCustomerTaxIdsIdCustomer :: (Text)
  {- ^ ID of the customer. -}
  ,  deleteCustomersCustomerTaxIdsIdId :: (Text)
  {- ^ Unique identifier of the `TaxID` object to delete. -}
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerTaxIdsIdBody
  = DeleteCustomersCustomerTaxIdsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerTaxIdsId = "DELETE"
type instance RequestPath DeleteCustomersCustomerTaxIdsId = "/v1/customers/{customer}/tax_ids/{id}"

instance RequestBuilder DeleteCustomersCustomerTaxIdsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerTaxIdsId{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerTaxIdsIdCustomer
    , "tax_ids"
    , pathSimple deleteCustomersCustomerTaxIdsIdId
    ]
    where
      DeleteCustomersCustomerTaxIdsIdParams{..} = deleteCustomersCustomerTaxIdsIdParams
  endpointQuery DeleteCustomersCustomerTaxIdsId{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerTaxIdsId{..} =
    [
    ]



{-
deleteCustomersCustomerTaxIdsId :: DeleteCustomersCustomerTaxIdsId
deleteCustomersCustomerTaxIdsId = DeleteCustomersCustomerTaxIdsId
-}
-- 
{- | <p>Retrieves a <code>ValueListItem</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/value_list_items/{item}
-}
-- TODO request options as enum
data GetRadarValueListItemsItem = GetRadarValueListItemsItem
  { getRadarValueListItemsItemParams :: GetRadarValueListItemsItemParams
  , getRadarValueListItemsItemBody :: Maybe GetRadarValueListItemsItemBody
  } deriving (Show, Eq, Generic)

data GetRadarValueListItemsItemParams = GetRadarValueListItemsItemParams
  {  getRadarValueListItemsItemExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRadarValueListItemsItemItem :: (Text)
  {- ^ The identifier of the value list item to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetRadarValueListItemsItemBody
  = GetRadarValueListItemsItemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarValueListItemsItem = "GET"
type instance RequestPath GetRadarValueListItemsItem = "/v1/radar/value_list_items/{item}"

instance RequestBuilder GetRadarValueListItemsItem where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarValueListItemsItem{..} =
    [ "v1"
    , "radar"
    , "value_list_items"
    , pathSimple getRadarValueListItemsItemItem
    ]
    where
      GetRadarValueListItemsItemParams{..} = getRadarValueListItemsItemParams
  endpointQuery GetRadarValueListItemsItem{..} =
    [ ("expand", queryDeepObjectExplode getRadarValueListItemsItemExpand)
    ]
  endpointHeaders GetRadarValueListItemsItem{..} =
    [
    ]



{-
getRadarValueListItemsItem :: GetRadarValueListItemsItem
getRadarValueListItemsItem = GetRadarValueListItemsItem
-}
-- 
{- | <p>Deletes a <code>ValueListItem</code> object, removing it from its parent value list.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/radar/value_list_items/{item}
-}
-- TODO request options as enum
data DeleteRadarValueListItemsItem = DeleteRadarValueListItemsItem
  { deleteRadarValueListItemsItemParams :: DeleteRadarValueListItemsItemParams
  , deleteRadarValueListItemsItemBody :: Maybe DeleteRadarValueListItemsItemBody
  } deriving (Show, Eq, Generic)

data DeleteRadarValueListItemsItemParams = DeleteRadarValueListItemsItemParams
  {  deleteRadarValueListItemsItemItem :: (Text)
  {- ^ The identifier of the value list item to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteRadarValueListItemsItemBody
  = DeleteRadarValueListItemsItemBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteRadarValueListItemsItem = "DELETE"
type instance RequestPath DeleteRadarValueListItemsItem = "/v1/radar/value_list_items/{item}"

instance RequestBuilder DeleteRadarValueListItemsItem where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteRadarValueListItemsItem{..} =
    [ "v1"
    , "radar"
    , "value_list_items"
    , pathSimple deleteRadarValueListItemsItemItem
    ]
    where
      DeleteRadarValueListItemsItemParams{..} = deleteRadarValueListItemsItemParams
  endpointQuery DeleteRadarValueListItemsItem{..} =
    [
    ]
  endpointHeaders DeleteRadarValueListItemsItem{..} =
    [
    ]



{-
deleteRadarValueListItemsItem :: DeleteRadarValueListItemsItem
deleteRadarValueListItemsItem = DeleteRadarValueListItemsItem
-}
-- 
{- | <p>Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>
<p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/external_accounts/{id}
-}
-- TODO request options as enum
data PostAccountExternalAccountsId = PostAccountExternalAccountsId
  { postAccountExternalAccountsIdParams :: PostAccountExternalAccountsIdParams
  , postAccountExternalAccountsIdBody :: Maybe PostAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data PostAccountExternalAccountsIdParams = PostAccountExternalAccountsIdParams
  {  postAccountExternalAccountsIdId :: (Text)
  {- ^ The ID of the external account to update -}
  } deriving (Show, Eq, Generic)

data PostAccountExternalAccountsIdBody
  = PostAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountExternalAccountsId = "POST"
type instance RequestPath PostAccountExternalAccountsId = "/v1/account/external_accounts/{id}"

instance RequestBuilder PostAccountExternalAccountsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountExternalAccountsId{..} =
    [ "v1"
    , "account"
    , "external_accounts"
    , pathSimple postAccountExternalAccountsIdId
    ]
    where
      PostAccountExternalAccountsIdParams{..} = postAccountExternalAccountsIdParams
  endpointQuery PostAccountExternalAccountsId{..} =
    [
    ]
  endpointHeaders PostAccountExternalAccountsId{..} =
    [
    ]



{-
postAccountExternalAccountsId :: PostAccountExternalAccountsId
postAccountExternalAccountsId = PostAccountExternalAccountsId
-}
-- 
{- | <p>Retrieve a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/account/external_accounts/{id}
-}
-- TODO request options as enum
data GetAccountExternalAccountsId = GetAccountExternalAccountsId
  { getAccountExternalAccountsIdParams :: GetAccountExternalAccountsIdParams
  , getAccountExternalAccountsIdBody :: Maybe GetAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data GetAccountExternalAccountsIdParams = GetAccountExternalAccountsIdParams
  {  getAccountExternalAccountsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountExternalAccountsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data GetAccountExternalAccountsIdBody
  = GetAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountExternalAccountsId = "GET"
type instance RequestPath GetAccountExternalAccountsId = "/v1/account/external_accounts/{id}"

instance RequestBuilder GetAccountExternalAccountsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountExternalAccountsId{..} =
    [ "v1"
    , "account"
    , "external_accounts"
    , pathSimple getAccountExternalAccountsIdId
    ]
    where
      GetAccountExternalAccountsIdParams{..} = getAccountExternalAccountsIdParams
  endpointQuery GetAccountExternalAccountsId{..} =
    [ ("expand", queryDeepObjectExplode getAccountExternalAccountsIdExpand)
    ]
  endpointHeaders GetAccountExternalAccountsId{..} =
    [
    ]



{-
getAccountExternalAccountsId :: GetAccountExternalAccountsId
getAccountExternalAccountsId = GetAccountExternalAccountsId
-}
-- 
{- | <p>Delete a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/account/external_accounts/{id}
-}
-- TODO request options as enum
data DeleteAccountExternalAccountsId = DeleteAccountExternalAccountsId
  { deleteAccountExternalAccountsIdParams :: DeleteAccountExternalAccountsIdParams
  , deleteAccountExternalAccountsIdBody :: Maybe DeleteAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data DeleteAccountExternalAccountsIdParams = DeleteAccountExternalAccountsIdParams
  {  deleteAccountExternalAccountsIdId :: (Text)
  {- ^ The ID of the external account to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountExternalAccountsIdBody
  = DeleteAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountExternalAccountsId = "DELETE"
type instance RequestPath DeleteAccountExternalAccountsId = "/v1/account/external_accounts/{id}"

instance RequestBuilder DeleteAccountExternalAccountsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountExternalAccountsId{..} =
    [ "v1"
    , "account"
    , "external_accounts"
    , pathSimple deleteAccountExternalAccountsIdId
    ]
    where
      DeleteAccountExternalAccountsIdParams{..} = deleteAccountExternalAccountsIdParams
  endpointQuery DeleteAccountExternalAccountsId{..} =
    [
    ]
  endpointHeaders DeleteAccountExternalAccountsId{..} =
    [
    ]



{-
deleteAccountExternalAccountsId :: DeleteAccountExternalAccountsId
deleteAccountExternalAccountsId = DeleteAccountExternalAccountsId
-}
-- 
{- | <p>Returns a list of issuer fraud records.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuer_fraud_records
-}
-- TODO request options as enum
data GetIssuerFraudRecords = GetIssuerFraudRecords
  { getIssuerFraudRecordsParams :: GetIssuerFraudRecordsParams
  , getIssuerFraudRecordsBody :: Maybe GetIssuerFraudRecordsBody
  } deriving (Show, Eq, Generic)

data GetIssuerFraudRecordsParams = GetIssuerFraudRecordsParams
  {  getIssuerFraudRecordsCharge :: Maybe (Text)
  {- ^ Only return issuer fraud records for the charge specified by this charge ID. -}
  ,  getIssuerFraudRecordsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuerFraudRecordsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuerFraudRecordsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuerFraudRecordsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetIssuerFraudRecordsBody
  = GetIssuerFraudRecordsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuerFraudRecords = "GET"
type instance RequestPath GetIssuerFraudRecords = "/v1/issuer_fraud_records"

instance RequestBuilder GetIssuerFraudRecords where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuerFraudRecords{..} =
    [ "v1"
    , "issuer_fraud_records"
    ]
    where
      GetIssuerFraudRecordsParams{..} = getIssuerFraudRecordsParams
  endpointQuery GetIssuerFraudRecords{..} =
    [ ("charge", queryFormExplode getIssuerFraudRecordsCharge)
    , ("ending_before", queryFormExplode getIssuerFraudRecordsEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuerFraudRecordsExpand)
    , ("limit", queryFormExplode getIssuerFraudRecordsLimit)
    , ("starting_after", queryFormExplode getIssuerFraudRecordsStartingAfter)
    ]
    where
      GetIssuerFraudRecordsParams{..} = getIssuerFraudRecordsParams
  endpointHeaders GetIssuerFraudRecords{..} =
    [
    ]



{-
getIssuerFraudRecords :: GetIssuerFraudRecords
getIssuerFraudRecords = GetIssuerFraudRecords
-}
-- {-# DEPRECATED getIssuerFraudRecords, GetIssuerFraudRecords "This endpoint is deprecated by the API creator" #-}
{- | <p>Returns a list of scheduled query runs.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sigma/scheduled_query_runs
-}
-- TODO request options as enum
data GetSigmaScheduledQueryRuns = GetSigmaScheduledQueryRuns
  { getSigmaScheduledQueryRunsParams :: GetSigmaScheduledQueryRunsParams
  , getSigmaScheduledQueryRunsBody :: Maybe GetSigmaScheduledQueryRunsBody
  } deriving (Show, Eq, Generic)

data GetSigmaScheduledQueryRunsParams = GetSigmaScheduledQueryRunsParams
  {  getSigmaScheduledQueryRunsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSigmaScheduledQueryRunsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSigmaScheduledQueryRunsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSigmaScheduledQueryRunsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetSigmaScheduledQueryRunsBody
  = GetSigmaScheduledQueryRunsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSigmaScheduledQueryRuns = "GET"
type instance RequestPath GetSigmaScheduledQueryRuns = "/v1/sigma/scheduled_query_runs"

instance RequestBuilder GetSigmaScheduledQueryRuns where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSigmaScheduledQueryRuns{..} =
    [ "v1"
    , "sigma"
    , "scheduled_query_runs"
    ]
    where
      GetSigmaScheduledQueryRunsParams{..} = getSigmaScheduledQueryRunsParams
  endpointQuery GetSigmaScheduledQueryRuns{..} =
    [ ("ending_before", queryFormExplode getSigmaScheduledQueryRunsEndingBefore)
    , ("expand", queryDeepObjectExplode getSigmaScheduledQueryRunsExpand)
    , ("limit", queryFormExplode getSigmaScheduledQueryRunsLimit)
    , ("starting_after", queryFormExplode getSigmaScheduledQueryRunsStartingAfter)
    ]
    where
      GetSigmaScheduledQueryRunsParams{..} = getSigmaScheduledQueryRunsParams
  endpointHeaders GetSigmaScheduledQueryRuns{..} =
    [
    ]



{-
getSigmaScheduledQueryRuns :: GetSigmaScheduledQueryRuns
getSigmaScheduledQueryRuns = GetSigmaScheduledQueryRuns
-}
-- 
{- | <p>Updates the specified refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>This request only accepts <code>metadata</code> as an argument.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/refunds/{refund}
-}
-- TODO request options as enum
data PostRefundsRefund = PostRefundsRefund
  { postRefundsRefundParams :: PostRefundsRefundParams
  , postRefundsRefundBody :: Maybe PostRefundsRefundBody
  } deriving (Show, Eq, Generic)

data PostRefundsRefundParams = PostRefundsRefundParams
  {  postRefundsRefundRefund :: (Text)
  } deriving (Show, Eq, Generic)

data PostRefundsRefundBody
  = PostRefundsRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRefundsRefund = "POST"
type instance RequestPath PostRefundsRefund = "/v1/refunds/{refund}"

instance RequestBuilder PostRefundsRefund where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRefundsRefund{..} =
    [ "v1"
    , "refunds"
    , pathSimple postRefundsRefundRefund
    ]
    where
      PostRefundsRefundParams{..} = postRefundsRefundParams
  endpointQuery PostRefundsRefund{..} =
    [
    ]
  endpointHeaders PostRefundsRefund{..} =
    [
    ]



{-
postRefundsRefund :: PostRefundsRefund
postRefundsRefund = PostRefundsRefund
-}
-- 
{- | <p>Retrieves the details of an existing refund.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/refunds/{refund}
-}
-- TODO request options as enum
data GetRefundsRefund = GetRefundsRefund
  { getRefundsRefundParams :: GetRefundsRefundParams
  , getRefundsRefundBody :: Maybe GetRefundsRefundBody
  } deriving (Show, Eq, Generic)

data GetRefundsRefundParams = GetRefundsRefundParams
  {  getRefundsRefundExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRefundsRefundRefund :: (Text)
  {- ^ ID of refund to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetRefundsRefundBody
  = GetRefundsRefundBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRefundsRefund = "GET"
type instance RequestPath GetRefundsRefund = "/v1/refunds/{refund}"

instance RequestBuilder GetRefundsRefund where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRefundsRefund{..} =
    [ "v1"
    , "refunds"
    , pathSimple getRefundsRefundRefund
    ]
    where
      GetRefundsRefundParams{..} = getRefundsRefundParams
  endpointQuery GetRefundsRefund{..} =
    [ ("expand", queryDeepObjectExplode getRefundsRefundExpand)
    ]
  endpointHeaders GetRefundsRefund{..} =
    [
    ]



{-
getRefundsRefund :: GetRefundsRefund
getRefundsRefund = GetRefundsRefund
-}
-- 
{- | <p>Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/coupons/{coupon}
-}
-- TODO request options as enum
data PostCouponsCoupon = PostCouponsCoupon
  { postCouponsCouponParams :: PostCouponsCouponParams
  , postCouponsCouponBody :: Maybe PostCouponsCouponBody
  } deriving (Show, Eq, Generic)

data PostCouponsCouponParams = PostCouponsCouponParams
  {  postCouponsCouponCoupon :: (Text)
  {- ^ The identifier of the coupon to be updated. -}
  } deriving (Show, Eq, Generic)

data PostCouponsCouponBody
  = PostCouponsCouponBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCouponsCoupon = "POST"
type instance RequestPath PostCouponsCoupon = "/v1/coupons/{coupon}"

instance RequestBuilder PostCouponsCoupon where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCouponsCoupon{..} =
    [ "v1"
    , "coupons"
    , pathSimple postCouponsCouponCoupon
    ]
    where
      PostCouponsCouponParams{..} = postCouponsCouponParams
  endpointQuery PostCouponsCoupon{..} =
    [
    ]
  endpointHeaders PostCouponsCoupon{..} =
    [
    ]



{-
postCouponsCoupon :: PostCouponsCoupon
postCouponsCoupon = PostCouponsCoupon
-}
-- 
{- | <p>Retrieves the coupon with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/coupons/{coupon}
-}
-- TODO request options as enum
data GetCouponsCoupon = GetCouponsCoupon
  { getCouponsCouponParams :: GetCouponsCouponParams
  , getCouponsCouponBody :: Maybe GetCouponsCouponBody
  } deriving (Show, Eq, Generic)

data GetCouponsCouponParams = GetCouponsCouponParams
  {  getCouponsCouponCoupon :: (Text)
  {- ^ The ID of the desired coupon. -}
  ,  getCouponsCouponExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetCouponsCouponBody
  = GetCouponsCouponBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCouponsCoupon = "GET"
type instance RequestPath GetCouponsCoupon = "/v1/coupons/{coupon}"

instance RequestBuilder GetCouponsCoupon where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCouponsCoupon{..} =
    [ "v1"
    , "coupons"
    , pathSimple getCouponsCouponCoupon
    ]
    where
      GetCouponsCouponParams{..} = getCouponsCouponParams
  endpointQuery GetCouponsCoupon{..} =
    [ ("expand", queryDeepObjectExplode getCouponsCouponExpand)
    ]
  endpointHeaders GetCouponsCoupon{..} =
    [
    ]



{-
getCouponsCoupon :: GetCouponsCoupon
getCouponsCoupon = GetCouponsCoupon
-}
-- 
{- | <p>You can delete coupons via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/coupons/{coupon}
-}
-- TODO request options as enum
data DeleteCouponsCoupon = DeleteCouponsCoupon
  { deleteCouponsCouponParams :: DeleteCouponsCouponParams
  , deleteCouponsCouponBody :: Maybe DeleteCouponsCouponBody
  } deriving (Show, Eq, Generic)

data DeleteCouponsCouponParams = DeleteCouponsCouponParams
  {  deleteCouponsCouponCoupon :: (Text)
  {- ^ The identifier of the coupon to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteCouponsCouponBody
  = DeleteCouponsCouponBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCouponsCoupon = "DELETE"
type instance RequestPath DeleteCouponsCoupon = "/v1/coupons/{coupon}"

instance RequestBuilder DeleteCouponsCoupon where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCouponsCoupon{..} =
    [ "v1"
    , "coupons"
    , pathSimple deleteCouponsCouponCoupon
    ]
    where
      DeleteCouponsCouponParams{..} = deleteCouponsCouponParams
  endpointQuery DeleteCouponsCoupon{..} =
    [
    ]
  endpointHeaders DeleteCouponsCoupon{..} =
    [
    ]



{-
deleteCouponsCoupon :: DeleteCouponsCoupon
deleteCouponsCoupon = DeleteCouponsCoupon
-}
-- 
{- | <p>Retrieves the details of an existing file object. Supply the unique file ID from a file, and Stripe will return the corresponding file object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/files/{file}
-}
-- TODO request options as enum
data GetFilesFile = GetFilesFile
  { getFilesFileParams :: GetFilesFileParams
  , getFilesFileBody :: Maybe GetFilesFileBody
  } deriving (Show, Eq, Generic)

data GetFilesFileParams = GetFilesFileParams
  {  getFilesFileExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getFilesFileFile :: (Text)
  {- ^ The identifier of the file to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetFilesFileBody
  = GetFilesFileBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetFilesFile = "GET"
type instance RequestPath GetFilesFile = "/v1/files/{file}"

instance RequestBuilder GetFilesFile where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetFilesFile{..} =
    [ "v1"
    , "files"
    , pathSimple getFilesFileFile
    ]
    where
      GetFilesFileParams{..} = getFilesFileParams
  endpointQuery GetFilesFile{..} =
    [ ("expand", queryDeepObjectExplode getFilesFileExpand)
    ]
  endpointHeaders GetFilesFile{..} =
    [
    ]



{-
getFilesFile :: GetFilesFile
getFilesFile = GetFilesFile
-}
-- 
{- | <p>Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_methods
-}
-- TODO request options as enum
data PostPaymentMethods = PostPaymentMethods
  { postPaymentMethodsParams :: PostPaymentMethodsParams
  , postPaymentMethodsBody :: Maybe PostPaymentMethodsBody
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsParams = PostPaymentMethodsParams
  {
  } deriving (Show, Eq, Generic)

data PostPaymentMethodsBody
  = PostPaymentMethodsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentMethods = "POST"
type instance RequestPath PostPaymentMethods = "/v1/payment_methods"

instance RequestBuilder PostPaymentMethods where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentMethods{..} =
    [ "v1"
    , "payment_methods"
    ]
    where
      PostPaymentMethodsParams = postPaymentMethodsParams
  endpointQuery PostPaymentMethods{..} =
    [
    ]
  endpointHeaders PostPaymentMethods{..} =
    [
    ]



{-
postPaymentMethods :: PostPaymentMethods
postPaymentMethods = PostPaymentMethods
-}
-- 
{- | <p>Returns a list of PaymentMethods for a given Customer</p>

> -- Equivalent to the following API endpoint:
> GET /v1/payment_methods
-}
-- TODO request options as enum
data GetPaymentMethods = GetPaymentMethods
  { getPaymentMethodsParams :: GetPaymentMethodsParams
  , getPaymentMethodsBody :: Maybe GetPaymentMethodsBody
  } deriving (Show, Eq, Generic)

data GetPaymentMethodsParams = GetPaymentMethodsParams
  {  getPaymentMethodsCustomer :: (Text)
  {- ^ The ID of the customer whose PaymentMethods will be retrieved. -}
  ,  getPaymentMethodsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getPaymentMethodsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPaymentMethodsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getPaymentMethodsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getPaymentMethodsType :: (Type)
  {- ^ A required filter on the list, based on the object `type` field. -}
  } deriving (Show, Eq, Generic)

data GetPaymentMethodsBody
  = GetPaymentMethodsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPaymentMethods = "GET"
type instance RequestPath GetPaymentMethods = "/v1/payment_methods"

instance RequestBuilder GetPaymentMethods where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPaymentMethods{..} =
    [ "v1"
    , "payment_methods"
    ]
    where
      GetPaymentMethodsParams{..} = getPaymentMethodsParams
  endpointQuery GetPaymentMethods{..} =
    [ ("customer", queryFormExplode getPaymentMethodsCustomer)
    , ("ending_before", queryFormExplode getPaymentMethodsEndingBefore)
    , ("expand", queryDeepObjectExplode getPaymentMethodsExpand)
    , ("limit", queryFormExplode getPaymentMethodsLimit)
    , ("starting_after", queryFormExplode getPaymentMethodsStartingAfter)
    , ("type", queryFormExplode getPaymentMethodsType)
    ]
    where
      GetPaymentMethodsParams{..} = getPaymentMethodsParams
  endpointHeaders GetPaymentMethods{..} =
    [
    ]



{-
getPaymentMethods :: GetPaymentMethods
getPaymentMethods = GetPaymentMethods
-}
-- 
{- | <p>Returns a list of early fraud warnings.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/early_fraud_warnings
-}
-- TODO request options as enum
data GetRadarEarlyFraudWarnings = GetRadarEarlyFraudWarnings
  { getRadarEarlyFraudWarningsParams :: GetRadarEarlyFraudWarningsParams
  , getRadarEarlyFraudWarningsBody :: Maybe GetRadarEarlyFraudWarningsBody
  } deriving (Show, Eq, Generic)

data GetRadarEarlyFraudWarningsParams = GetRadarEarlyFraudWarningsParams
  {  getRadarEarlyFraudWarningsCharge :: Maybe (Text)
  {- ^ Only return early fraud warnings for the charge specified by this charge ID. -}
  ,  getRadarEarlyFraudWarningsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getRadarEarlyFraudWarningsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRadarEarlyFraudWarningsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getRadarEarlyFraudWarningsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetRadarEarlyFraudWarningsBody
  = GetRadarEarlyFraudWarningsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarEarlyFraudWarnings = "GET"
type instance RequestPath GetRadarEarlyFraudWarnings = "/v1/radar/early_fraud_warnings"

instance RequestBuilder GetRadarEarlyFraudWarnings where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarEarlyFraudWarnings{..} =
    [ "v1"
    , "radar"
    , "early_fraud_warnings"
    ]
    where
      GetRadarEarlyFraudWarningsParams{..} = getRadarEarlyFraudWarningsParams
  endpointQuery GetRadarEarlyFraudWarnings{..} =
    [ ("charge", queryFormExplode getRadarEarlyFraudWarningsCharge)
    , ("ending_before", queryFormExplode getRadarEarlyFraudWarningsEndingBefore)
    , ("expand", queryDeepObjectExplode getRadarEarlyFraudWarningsExpand)
    , ("limit", queryFormExplode getRadarEarlyFraudWarningsLimit)
    , ("starting_after", queryFormExplode getRadarEarlyFraudWarningsStartingAfter)
    ]
    where
      GetRadarEarlyFraudWarningsParams{..} = getRadarEarlyFraudWarningsParams
  endpointHeaders GetRadarEarlyFraudWarnings{..} =
    [
    ]



{-
getRadarEarlyFraudWarnings :: GetRadarEarlyFraudWarnings
getRadarEarlyFraudWarnings = GetRadarEarlyFraudWarnings
-}
-- 
{- | <p>Lists all Country Spec objects available in the API.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/country_specs
-}
-- TODO request options as enum
data GetCountrySpecs = GetCountrySpecs
  { getCountrySpecsParams :: GetCountrySpecsParams
  , getCountrySpecsBody :: Maybe GetCountrySpecsBody
  } deriving (Show, Eq, Generic)

data GetCountrySpecsParams = GetCountrySpecsParams
  {  getCountrySpecsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getCountrySpecsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCountrySpecsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getCountrySpecsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetCountrySpecsBody
  = GetCountrySpecsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCountrySpecs = "GET"
type instance RequestPath GetCountrySpecs = "/v1/country_specs"

instance RequestBuilder GetCountrySpecs where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCountrySpecs{..} =
    [ "v1"
    , "country_specs"
    ]
    where
      GetCountrySpecsParams{..} = getCountrySpecsParams
  endpointQuery GetCountrySpecs{..} =
    [ ("ending_before", queryFormExplode getCountrySpecsEndingBefore)
    , ("expand", queryDeepObjectExplode getCountrySpecsExpand)
    , ("limit", queryFormExplode getCountrySpecsLimit)
    , ("starting_after", queryFormExplode getCountrySpecsStartingAfter)
    ]
    where
      GetCountrySpecsParams{..} = getCountrySpecsParams
  endpointHeaders GetCountrySpecs{..} =
    [
    ]



{-
getCountrySpecs :: GetCountrySpecs
getCountrySpecs = GetCountrySpecs
-}
-- 
{- | <p>Pay an order by providing a <code>source</code> to create a payment.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/orders/{id}/pay
-}
-- TODO request options as enum
data PostOrdersIdPay = PostOrdersIdPay
  { postOrdersIdPayParams :: PostOrdersIdPayParams
  , postOrdersIdPayBody :: Maybe PostOrdersIdPayBody
  } deriving (Show, Eq, Generic)

data PostOrdersIdPayParams = PostOrdersIdPayParams
  {  postOrdersIdPayId :: (Text)
  } deriving (Show, Eq, Generic)

data PostOrdersIdPayBody
  = PostOrdersIdPayBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostOrdersIdPay = "POST"
type instance RequestPath PostOrdersIdPay = "/v1/orders/{id}/pay"

instance RequestBuilder PostOrdersIdPay where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostOrdersIdPay{..} =
    [ "v1"
    , "orders"
    , pathSimple postOrdersIdPayId
    , "pay"
    ]
    where
      PostOrdersIdPayParams{..} = postOrdersIdPayParams
  endpointQuery PostOrdersIdPay{..} =
    [
    ]
  endpointHeaders PostOrdersIdPay{..} =
    [
    ]



{-
postOrdersIdPay :: PostOrdersIdPay
postOrdersIdPay = PostOrdersIdPay
-}
-- 
{- | <p>Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is <code>not_started</code> or <code>active</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_schedules/{schedule}/cancel
-}
-- TODO request options as enum
data PostSubscriptionSchedulesScheduleCancel = PostSubscriptionSchedulesScheduleCancel
  { postSubscriptionSchedulesScheduleCancelParams :: PostSubscriptionSchedulesScheduleCancelParams
  , postSubscriptionSchedulesScheduleCancelBody :: Maybe PostSubscriptionSchedulesScheduleCancelBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleCancelParams = PostSubscriptionSchedulesScheduleCancelParams
  {  postSubscriptionSchedulesScheduleCancelSchedule :: (Text)
  {- ^ The identifier of the subscription schedule to be canceled. -}
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleCancelBody
  = PostSubscriptionSchedulesScheduleCancelBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionSchedulesScheduleCancel = "POST"
type instance RequestPath PostSubscriptionSchedulesScheduleCancel = "/v1/subscription_schedules/{schedule}/cancel"

instance RequestBuilder PostSubscriptionSchedulesScheduleCancel where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionSchedulesScheduleCancel{..} =
    [ "v1"
    , "subscription_schedules"
    , pathSimple postSubscriptionSchedulesScheduleCancelSchedule
    , "cancel"
    ]
    where
      PostSubscriptionSchedulesScheduleCancelParams{..} = postSubscriptionSchedulesScheduleCancelParams
  endpointQuery PostSubscriptionSchedulesScheduleCancel{..} =
    [
    ]
  endpointHeaders PostSubscriptionSchedulesScheduleCancel{..} =
    [
    ]



{-
postSubscriptionSchedulesScheduleCancel :: PostSubscriptionSchedulesScheduleCancel
postSubscriptionSchedulesScheduleCancel = PostSubscriptionSchedulesScheduleCancel
-}
-- 
{- | <p>Update a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/bank_accounts/{id}
-}
-- TODO request options as enum
data PostCustomersCustomerBankAccountsId = PostCustomersCustomerBankAccountsId
  { postCustomersCustomerBankAccountsIdParams :: PostCustomersCustomerBankAccountsIdParams
  , postCustomersCustomerBankAccountsIdBody :: Maybe PostCustomersCustomerBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsIdParams = PostCustomersCustomerBankAccountsIdParams
  {  postCustomersCustomerBankAccountsIdCustomer :: (Text)
  ,  postCustomersCustomerBankAccountsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBankAccountsIdBody
  = PostCustomersCustomerBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerBankAccountsId = "POST"
type instance RequestPath PostCustomersCustomerBankAccountsId = "/v1/customers/{customer}/bank_accounts/{id}"

instance RequestBuilder PostCustomersCustomerBankAccountsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerBankAccountsId{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerBankAccountsIdCustomer
    , "bank_accounts"
    , pathSimple postCustomersCustomerBankAccountsIdId
    ]
    where
      PostCustomersCustomerBankAccountsIdParams{..} = postCustomersCustomerBankAccountsIdParams
  endpointQuery PostCustomersCustomerBankAccountsId{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerBankAccountsId{..} =
    [
    ]



{-
postCustomersCustomerBankAccountsId :: PostCustomersCustomerBankAccountsId
postCustomersCustomerBankAccountsId = PostCustomersCustomerBankAccountsId
-}
-- 
{- | <p>By default, you can see the 10 most recent sources stored on a Customer directly on the object, but you can also retrieve details about a specific bank account stored on the Stripe account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/bank_accounts/{id}
-}
-- TODO request options as enum
data GetCustomersCustomerBankAccountsId = GetCustomersCustomerBankAccountsId
  { getCustomersCustomerBankAccountsIdParams :: GetCustomersCustomerBankAccountsIdParams
  , getCustomersCustomerBankAccountsIdBody :: Maybe GetCustomersCustomerBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBankAccountsIdParams = GetCustomersCustomerBankAccountsIdParams
  {  getCustomersCustomerBankAccountsIdCustomer :: (Text)
  ,  getCustomersCustomerBankAccountsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerBankAccountsIdId :: (Text)
  {- ^ ID of bank account to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBankAccountsIdBody
  = GetCustomersCustomerBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerBankAccountsId = "GET"
type instance RequestPath GetCustomersCustomerBankAccountsId = "/v1/customers/{customer}/bank_accounts/{id}"

instance RequestBuilder GetCustomersCustomerBankAccountsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerBankAccountsId{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerBankAccountsIdCustomer
    , "bank_accounts"
    , pathSimple getCustomersCustomerBankAccountsIdId
    ]
    where
      GetCustomersCustomerBankAccountsIdParams{..} = getCustomersCustomerBankAccountsIdParams
  endpointQuery GetCustomersCustomerBankAccountsId{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerBankAccountsIdExpand)
    ]
  endpointHeaders GetCustomersCustomerBankAccountsId{..} =
    [
    ]



{-
getCustomersCustomerBankAccountsId :: GetCustomersCustomerBankAccountsId
getCustomersCustomerBankAccountsId = GetCustomersCustomerBankAccountsId
-}
-- {-# DEPRECATED getCustomersCustomerBankAccountsId, GetCustomersCustomerBankAccountsId "This endpoint is deprecated by the API creator" #-}
{- | <p>Delete a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/bank_accounts/{id}
-}
-- TODO request options as enum
data DeleteCustomersCustomerBankAccountsId = DeleteCustomersCustomerBankAccountsId
  { deleteCustomersCustomerBankAccountsIdParams :: DeleteCustomersCustomerBankAccountsIdParams
  , deleteCustomersCustomerBankAccountsIdBody :: Maybe DeleteCustomersCustomerBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerBankAccountsIdParams = DeleteCustomersCustomerBankAccountsIdParams
  {  deleteCustomersCustomerBankAccountsIdCustomer :: (Text)
  ,  deleteCustomersCustomerBankAccountsIdId :: (Text)
  {- ^ The ID of the source to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerBankAccountsIdBody
  = DeleteCustomersCustomerBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerBankAccountsId = "DELETE"
type instance RequestPath DeleteCustomersCustomerBankAccountsId = "/v1/customers/{customer}/bank_accounts/{id}"

instance RequestBuilder DeleteCustomersCustomerBankAccountsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerBankAccountsId{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerBankAccountsIdCustomer
    , "bank_accounts"
    , pathSimple deleteCustomersCustomerBankAccountsIdId
    ]
    where
      DeleteCustomersCustomerBankAccountsIdParams{..} = deleteCustomersCustomerBankAccountsIdParams
  endpointQuery DeleteCustomersCustomerBankAccountsId{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerBankAccountsId{..} =
    [
    ]



{-
deleteCustomersCustomerBankAccountsId :: DeleteCustomersCustomerBankAccountsId
deleteCustomersCustomerBankAccountsId = DeleteCustomersCustomerBankAccountsId
-}
-- 
{- | <p>Updates the specified Issuing <code>Transaction</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/transactions/{transaction}
-}
-- TODO request options as enum
data PostIssuingTransactionsTransaction = PostIssuingTransactionsTransaction
  { postIssuingTransactionsTransactionParams :: PostIssuingTransactionsTransactionParams
  , postIssuingTransactionsTransactionBody :: Maybe PostIssuingTransactionsTransactionBody
  } deriving (Show, Eq, Generic)

data PostIssuingTransactionsTransactionParams = PostIssuingTransactionsTransactionParams
  {  postIssuingTransactionsTransactionTransaction :: (Text)
  {- ^ The identifier of the transaction to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingTransactionsTransactionBody
  = PostIssuingTransactionsTransactionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingTransactionsTransaction = "POST"
type instance RequestPath PostIssuingTransactionsTransaction = "/v1/issuing/transactions/{transaction}"

instance RequestBuilder PostIssuingTransactionsTransaction where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingTransactionsTransaction{..} =
    [ "v1"
    , "issuing"
    , "transactions"
    , pathSimple postIssuingTransactionsTransactionTransaction
    ]
    where
      PostIssuingTransactionsTransactionParams{..} = postIssuingTransactionsTransactionParams
  endpointQuery PostIssuingTransactionsTransaction{..} =
    [
    ]
  endpointHeaders PostIssuingTransactionsTransaction{..} =
    [
    ]



{-
postIssuingTransactionsTransaction :: PostIssuingTransactionsTransaction
postIssuingTransactionsTransaction = PostIssuingTransactionsTransaction
-}
-- 
{- | <p>Retrieves an Issuing <code>Transaction</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/transactions/{transaction}
-}
-- TODO request options as enum
data GetIssuingTransactionsTransaction = GetIssuingTransactionsTransaction
  { getIssuingTransactionsTransactionParams :: GetIssuingTransactionsTransactionParams
  , getIssuingTransactionsTransactionBody :: Maybe GetIssuingTransactionsTransactionBody
  } deriving (Show, Eq, Generic)

data GetIssuingTransactionsTransactionParams = GetIssuingTransactionsTransactionParams
  {  getIssuingTransactionsTransactionExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingTransactionsTransactionTransaction :: (Text)
  {- ^ The ID of the transaction to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetIssuingTransactionsTransactionBody
  = GetIssuingTransactionsTransactionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingTransactionsTransaction = "GET"
type instance RequestPath GetIssuingTransactionsTransaction = "/v1/issuing/transactions/{transaction}"

instance RequestBuilder GetIssuingTransactionsTransaction where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingTransactionsTransaction{..} =
    [ "v1"
    , "issuing"
    , "transactions"
    , pathSimple getIssuingTransactionsTransactionTransaction
    ]
    where
      GetIssuingTransactionsTransactionParams{..} = getIssuingTransactionsTransactionParams
  endpointQuery GetIssuingTransactionsTransaction{..} =
    [ ("expand", queryDeepObjectExplode getIssuingTransactionsTransactionExpand)
    ]
  endpointHeaders GetIssuingTransactionsTransaction{..} =
    [
    ]



{-
getIssuingTransactionsTransaction :: GetIssuingTransactionsTransaction
getIssuingTransactionsTransaction = GetIssuingTransactionsTransaction
-}
-- 
{- | <p>Retrieves the balance transaction with the given ID.</p>

<p>Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/balance/history/{id}
-}
-- TODO request options as enum
data GetBalanceHistoryId = GetBalanceHistoryId
  { getBalanceHistoryIdParams :: GetBalanceHistoryIdParams
  , getBalanceHistoryIdBody :: Maybe GetBalanceHistoryIdBody
  } deriving (Show, Eq, Generic)

data GetBalanceHistoryIdParams = GetBalanceHistoryIdParams
  {  getBalanceHistoryIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBalanceHistoryIdId :: (Text)
  {- ^ The ID of the desired balance transaction, as found on any API object that affects the balance (e.g., a charge or transfer). -}
  } deriving (Show, Eq, Generic)

data GetBalanceHistoryIdBody
  = GetBalanceHistoryIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBalanceHistoryId = "GET"
type instance RequestPath GetBalanceHistoryId = "/v1/balance/history/{id}"

instance RequestBuilder GetBalanceHistoryId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBalanceHistoryId{..} =
    [ "v1"
    , "balance"
    , "history"
    , pathSimple getBalanceHistoryIdId
    ]
    where
      GetBalanceHistoryIdParams{..} = getBalanceHistoryIdParams
  endpointQuery GetBalanceHistoryId{..} =
    [ ("expand", queryDeepObjectExplode getBalanceHistoryIdExpand)
    ]
  endpointHeaders GetBalanceHistoryId{..} =
    [
    ]



{-
getBalanceHistoryId :: GetBalanceHistoryId
getBalanceHistoryId = GetBalanceHistoryId
-}
-- 
{- | <p>Removes the currently applied discount on a subscription.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/subscriptions/{subscription_exposed_id}/discount
-}
-- TODO request options as enum
data DeleteSubscriptionsSubscriptionExposedIdDiscount = DeleteSubscriptionsSubscriptionExposedIdDiscount
  { deleteSubscriptionsSubscriptionExposedIdDiscountParams :: DeleteSubscriptionsSubscriptionExposedIdDiscountParams
  , deleteSubscriptionsSubscriptionExposedIdDiscountBody :: Maybe DeleteSubscriptionsSubscriptionExposedIdDiscountBody
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionsSubscriptionExposedIdDiscountParams = DeleteSubscriptionsSubscriptionExposedIdDiscountParams
  {  deleteSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionsSubscriptionExposedIdDiscountBody
  = DeleteSubscriptionsSubscriptionExposedIdDiscountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteSubscriptionsSubscriptionExposedIdDiscount = "DELETE"
type instance RequestPath DeleteSubscriptionsSubscriptionExposedIdDiscount = "/v1/subscriptions/{subscription_exposed_id}/discount"

instance RequestBuilder DeleteSubscriptionsSubscriptionExposedIdDiscount where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteSubscriptionsSubscriptionExposedIdDiscount{..} =
    [ "v1"
    , "subscriptions"
    , pathSimple deleteSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId
    , "discount"
    ]
    where
      DeleteSubscriptionsSubscriptionExposedIdDiscountParams{..} = deleteSubscriptionsSubscriptionExposedIdDiscountParams
  endpointQuery DeleteSubscriptionsSubscriptionExposedIdDiscount{..} =
    [
    ]
  endpointHeaders DeleteSubscriptionsSubscriptionExposedIdDiscount{..} =
    [
    ]



{-
deleteSubscriptionsSubscriptionExposedIdDiscount :: DeleteSubscriptionsSubscriptionExposedIdDiscount
deleteSubscriptionsSubscriptionExposedIdDiscount = DeleteSubscriptionsSubscriptionExposedIdDiscount
-}
-- 
{- | <p>Updates the specified Issuing <code>Dispute</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/disputes/{dispute}
-}
-- TODO request options as enum
data PostIssuingDisputesDispute = PostIssuingDisputesDispute
  { postIssuingDisputesDisputeParams :: PostIssuingDisputesDisputeParams
  , postIssuingDisputesDisputeBody :: Maybe PostIssuingDisputesDisputeBody
  } deriving (Show, Eq, Generic)

data PostIssuingDisputesDisputeParams = PostIssuingDisputesDisputeParams
  {  postIssuingDisputesDisputeDispute :: (Text)
  {- ^ The ID of the dispute to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingDisputesDisputeBody
  = PostIssuingDisputesDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingDisputesDispute = "POST"
type instance RequestPath PostIssuingDisputesDispute = "/v1/issuing/disputes/{dispute}"

instance RequestBuilder PostIssuingDisputesDispute where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingDisputesDispute{..} =
    [ "v1"
    , "issuing"
    , "disputes"
    , pathSimple postIssuingDisputesDisputeDispute
    ]
    where
      PostIssuingDisputesDisputeParams{..} = postIssuingDisputesDisputeParams
  endpointQuery PostIssuingDisputesDispute{..} =
    [
    ]
  endpointHeaders PostIssuingDisputesDispute{..} =
    [
    ]



{-
postIssuingDisputesDispute :: PostIssuingDisputesDispute
postIssuingDisputesDispute = PostIssuingDisputesDispute
-}
-- 
{- | <p>Retrieves an Issuing <code>Dispute</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/disputes/{dispute}
-}
-- TODO request options as enum
data GetIssuingDisputesDispute = GetIssuingDisputesDispute
  { getIssuingDisputesDisputeParams :: GetIssuingDisputesDisputeParams
  , getIssuingDisputesDisputeBody :: Maybe GetIssuingDisputesDisputeBody
  } deriving (Show, Eq, Generic)

data GetIssuingDisputesDisputeParams = GetIssuingDisputesDisputeParams
  {  getIssuingDisputesDisputeDispute :: (Text)
  {- ^ The ID of the dispute to retrieve. -}
  ,  getIssuingDisputesDisputeExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetIssuingDisputesDisputeBody
  = GetIssuingDisputesDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingDisputesDispute = "GET"
type instance RequestPath GetIssuingDisputesDispute = "/v1/issuing/disputes/{dispute}"

instance RequestBuilder GetIssuingDisputesDispute where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingDisputesDispute{..} =
    [ "v1"
    , "issuing"
    , "disputes"
    , pathSimple getIssuingDisputesDisputeDispute
    ]
    where
      GetIssuingDisputesDisputeParams{..} = getIssuingDisputesDisputeParams
  endpointQuery GetIssuingDisputesDispute{..} =
    [ ("expand", queryDeepObjectExplode getIssuingDisputesDisputeExpand)
    ]
  endpointHeaders GetIssuingDisputesDispute{..} =
    [
    ]



{-
getIssuingDisputesDispute :: GetIssuingDisputesDispute
getIssuingDisputesDispute = GetIssuingDisputesDispute
-}
-- 
{- | <p>Retrieves the exchange rates from the given currency to every supported currency.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/exchange_rates/{currency}
-}
-- TODO request options as enum
data GetExchangeRatesCurrency = GetExchangeRatesCurrency
  { getExchangeRatesCurrencyParams :: GetExchangeRatesCurrencyParams
  , getExchangeRatesCurrencyBody :: Maybe GetExchangeRatesCurrencyBody
  } deriving (Show, Eq, Generic)

data GetExchangeRatesCurrencyParams = GetExchangeRatesCurrencyParams
  {  getExchangeRatesCurrencyCurrency :: (Text)
  {- ^ Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). -}
  ,  getExchangeRatesCurrencyExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetExchangeRatesCurrencyBody
  = GetExchangeRatesCurrencyBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetExchangeRatesCurrency = "GET"
type instance RequestPath GetExchangeRatesCurrency = "/v1/exchange_rates/{currency}"

instance RequestBuilder GetExchangeRatesCurrency where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetExchangeRatesCurrency{..} =
    [ "v1"
    , "exchange_rates"
    , pathSimple getExchangeRatesCurrencyCurrency
    ]
    where
      GetExchangeRatesCurrencyParams{..} = getExchangeRatesCurrencyParams
  endpointQuery GetExchangeRatesCurrency{..} =
    [ ("expand", queryDeepObjectExplode getExchangeRatesCurrencyExpand)
    ]
  endpointHeaders GetExchangeRatesCurrency{..} =
    [
    ]



{-
getExchangeRatesCurrency :: GetExchangeRatesCurrency
getExchangeRatesCurrency = GetExchangeRatesCurrency
-}
-- 
{- | <p>Returns a list of application fees you’ve previously collected. The application fees are returned in sorted order, with the most recent fees appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/application_fees
-}
-- TODO request options as enum
data GetApplicationFees = GetApplicationFees
  { getApplicationFeesParams :: GetApplicationFeesParams
  , getApplicationFeesBody :: Maybe GetApplicationFeesBody
  } deriving (Show, Eq, Generic)

data GetApplicationFeesParams = GetApplicationFeesParams
  {  getApplicationFeesCharge :: Maybe (Text)
  {- ^ Only return application fees for the charge specified by this charge ID. -}
  ,  getApplicationFeesCreated :: Maybe (Either (Object) (Int))
  ,  getApplicationFeesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getApplicationFeesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getApplicationFeesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getApplicationFeesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetApplicationFeesBody
  = GetApplicationFeesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetApplicationFees = "GET"
type instance RequestPath GetApplicationFees = "/v1/application_fees"

instance RequestBuilder GetApplicationFees where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetApplicationFees{..} =
    [ "v1"
    , "application_fees"
    ]
    where
      GetApplicationFeesParams{..} = getApplicationFeesParams
  endpointQuery GetApplicationFees{..} =
    [ ("charge", queryFormExplode getApplicationFeesCharge)
    , ("created", queryDeepObjectExplode getApplicationFeesCreated)
    , ("ending_before", queryFormExplode getApplicationFeesEndingBefore)
    , ("expand", queryDeepObjectExplode getApplicationFeesExpand)
    , ("limit", queryFormExplode getApplicationFeesLimit)
    , ("starting_after", queryFormExplode getApplicationFeesStartingAfter)
    ]
    where
      GetApplicationFeesParams{..} = getApplicationFeesParams
  endpointHeaders GetApplicationFees{..} =
    [
    ]



{-
getApplicationFees :: GetApplicationFees
getApplicationFees = GetApplicationFees
-}
-- 
{- | <p>Return all or part of an order. The order must have a status of <code>paid</code> or <code>fulfilled</code> before it can be returned. Once all items have been returned, the order will become <code>canceled</code> or <code>returned</code> depending on which status the order started in.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/orders/{id}/returns
-}
-- TODO request options as enum
data PostOrdersIdReturns = PostOrdersIdReturns
  { postOrdersIdReturnsParams :: PostOrdersIdReturnsParams
  , postOrdersIdReturnsBody :: Maybe PostOrdersIdReturnsBody
  } deriving (Show, Eq, Generic)

data PostOrdersIdReturnsParams = PostOrdersIdReturnsParams
  {  postOrdersIdReturnsId :: (Text)
  } deriving (Show, Eq, Generic)

data PostOrdersIdReturnsBody
  = PostOrdersIdReturnsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostOrdersIdReturns = "POST"
type instance RequestPath PostOrdersIdReturns = "/v1/orders/{id}/returns"

instance RequestBuilder PostOrdersIdReturns where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostOrdersIdReturns{..} =
    [ "v1"
    , "orders"
    , pathSimple postOrdersIdReturnsId
    , "returns"
    ]
    where
      PostOrdersIdReturnsParams{..} = postOrdersIdReturnsParams
  endpointQuery PostOrdersIdReturns{..} =
    [
    ]
  endpointHeaders PostOrdersIdReturns{..} =
    [
    ]



{-
postOrdersIdReturns :: PostOrdersIdReturns
postOrdersIdReturns = PostOrdersIdReturns
-}
-- 
{- | <p>Creates a new <code>Recipient</code> object and verifies the recipient’s identity.
Also verifies the recipient’s bank account information or debit card, if either is provided.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/recipients
-}
-- TODO request options as enum
data PostRecipients = PostRecipients
  { postRecipientsParams :: PostRecipientsParams
  , postRecipientsBody :: PostRecipientsBody
  } deriving (Show, Eq, Generic)

data PostRecipientsParams = PostRecipientsParams
  {
  } deriving (Show, Eq, Generic)

data PostRecipientsBody
  = PostRecipientsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRecipients = "POST"
type instance RequestPath PostRecipients = "/v1/recipients"

instance RequestBuilder PostRecipients where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRecipients{..} =
    [ "v1"
    , "recipients"
    ]
    where
      PostRecipientsParams = postRecipientsParams
  endpointQuery PostRecipients{..} =
    [
    ]
  endpointHeaders PostRecipients{..} =
    [
    ]



{-
postRecipients :: PostRecipients
postRecipients = PostRecipients
-}
-- {-# DEPRECATED postRecipients, PostRecipients "This endpoint is deprecated by the API creator" #-}
{- | <p>Returns a list of your recipients. The recipients are returned sorted by creation date, with the most recently created recipients appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/recipients
-}
-- TODO request options as enum
data GetRecipients = GetRecipients
  { getRecipientsParams :: GetRecipientsParams
  , getRecipientsBody :: Maybe GetRecipientsBody
  } deriving (Show, Eq, Generic)

data GetRecipientsParams = GetRecipientsParams
  {  getRecipientsCreated :: Maybe (Either (Object) (Int))
  ,  getRecipientsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getRecipientsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRecipientsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getRecipientsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getRecipientsType :: Maybe (Type)
  ,  getRecipientsVerified :: Maybe (Bool)
  {- ^ Only return recipients that are verified or unverified. -}
  } deriving (Show, Eq, Generic)

data GetRecipientsBody
  = GetRecipientsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRecipients = "GET"
type instance RequestPath GetRecipients = "/v1/recipients"

instance RequestBuilder GetRecipients where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRecipients{..} =
    [ "v1"
    , "recipients"
    ]
    where
      GetRecipientsParams{..} = getRecipientsParams
  endpointQuery GetRecipients{..} =
    [ ("created", queryDeepObjectExplode getRecipientsCreated)
    , ("ending_before", queryFormExplode getRecipientsEndingBefore)
    , ("expand", queryDeepObjectExplode getRecipientsExpand)
    , ("limit", queryFormExplode getRecipientsLimit)
    , ("starting_after", queryFormExplode getRecipientsStartingAfter)
    , ("type", queryFormExplode getRecipientsType)
    , ("verified", queryFormExplode getRecipientsVerified)
    ]
    where
      GetRecipientsParams{..} = getRecipientsParams
  endpointHeaders GetRecipients{..} =
    [
    ]



{-
getRecipients :: GetRecipients
getRecipients = GetRecipients
-}
-- {-# DEPRECATED getRecipients, GetRecipients "This endpoint is deprecated by the API creator" #-}
{- | <p>Updates the specified Issuing <code>Cardholder</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/cardholders/{cardholder}
-}
-- TODO request options as enum
data PostIssuingCardholdersCardholder = PostIssuingCardholdersCardholder
  { postIssuingCardholdersCardholderParams :: PostIssuingCardholdersCardholderParams
  , postIssuingCardholdersCardholderBody :: Maybe PostIssuingCardholdersCardholderBody
  } deriving (Show, Eq, Generic)

data PostIssuingCardholdersCardholderParams = PostIssuingCardholdersCardholderParams
  {  postIssuingCardholdersCardholderCardholder :: (Text)
  {- ^ The ID of the cardholder to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingCardholdersCardholderBody
  = PostIssuingCardholdersCardholderBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingCardholdersCardholder = "POST"
type instance RequestPath PostIssuingCardholdersCardholder = "/v1/issuing/cardholders/{cardholder}"

instance RequestBuilder PostIssuingCardholdersCardholder where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingCardholdersCardholder{..} =
    [ "v1"
    , "issuing"
    , "cardholders"
    , pathSimple postIssuingCardholdersCardholderCardholder
    ]
    where
      PostIssuingCardholdersCardholderParams{..} = postIssuingCardholdersCardholderParams
  endpointQuery PostIssuingCardholdersCardholder{..} =
    [
    ]
  endpointHeaders PostIssuingCardholdersCardholder{..} =
    [
    ]



{-
postIssuingCardholdersCardholder :: PostIssuingCardholdersCardholder
postIssuingCardholdersCardholder = PostIssuingCardholdersCardholder
-}
-- 
{- | <p>Retrieves an Issuing <code>Cardholder</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cardholders/{cardholder}
-}
-- TODO request options as enum
data GetIssuingCardholdersCardholder = GetIssuingCardholdersCardholder
  { getIssuingCardholdersCardholderParams :: GetIssuingCardholdersCardholderParams
  , getIssuingCardholdersCardholderBody :: Maybe GetIssuingCardholdersCardholderBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardholdersCardholderParams = GetIssuingCardholdersCardholderParams
  {  getIssuingCardholdersCardholderCardholder :: (Text)
  {- ^ The identifier of the cardholder to be retrieved. -}
  ,  getIssuingCardholdersCardholderExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardholdersCardholderBody
  = GetIssuingCardholdersCardholderBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCardholdersCardholder = "GET"
type instance RequestPath GetIssuingCardholdersCardholder = "/v1/issuing/cardholders/{cardholder}"

instance RequestBuilder GetIssuingCardholdersCardholder where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCardholdersCardholder{..} =
    [ "v1"
    , "issuing"
    , "cardholders"
    , pathSimple getIssuingCardholdersCardholderCardholder
    ]
    where
      GetIssuingCardholdersCardholderParams{..} = getIssuingCardholdersCardholderParams
  endpointQuery GetIssuingCardholdersCardholder{..} =
    [ ("expand", queryDeepObjectExplode getIssuingCardholdersCardholderExpand)
    ]
  endpointHeaders GetIssuingCardholdersCardholder{..} =
    [
    ]



{-
getIssuingCardholdersCardholder :: GetIssuingCardholdersCardholder
getIssuingCardholdersCardholder = GetIssuingCardholdersCardholder
-}
-- 
{- | <p>Creates a new product object. To create a product for use with subscriptions, see <a href="#create_service_product">Subscriptions Products</a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/products
-}
-- TODO request options as enum
data PostProducts = PostProducts
  { postProductsParams :: PostProductsParams
  , postProductsBody :: PostProductsBody
  } deriving (Show, Eq, Generic)

data PostProductsParams = PostProductsParams
  {
  } deriving (Show, Eq, Generic)

data PostProductsBody
  = PostProductsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostProducts = "POST"
type instance RequestPath PostProducts = "/v1/products"

instance RequestBuilder PostProducts where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostProducts{..} =
    [ "v1"
    , "products"
    ]
    where
      PostProductsParams = postProductsParams
  endpointQuery PostProducts{..} =
    [
    ]
  endpointHeaders PostProducts{..} =
    [
    ]



{-
postProducts :: PostProducts
postProducts = PostProducts
-}
-- 
{- | <p>Returns a list of your products. The products are returned sorted by creation date, with the most recently created products appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/products
-}
-- TODO request options as enum
data GetProducts = GetProducts
  { getProductsParams :: GetProductsParams
  , getProductsBody :: Maybe GetProductsBody
  } deriving (Show, Eq, Generic)

data GetProductsParams = GetProductsParams
  {  getProductsActive :: Maybe (Bool)
  {- ^ Only return products that are active or inactive (e.g., pass `false` to list all inactive products). -}
  ,  getProductsCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return products that were created during the given date interval. -}
  ,  getProductsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getProductsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getProductsIds :: Maybe (Vector (Text))
  {- ^ Only return products with the given IDs. -}
  ,  getProductsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getProductsShippable :: Maybe (Bool)
  {- ^ Only return products that can be shipped (i.e., physical, not digital products). -}
  ,  getProductsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getProductsType :: Maybe (Type)
  {- ^ Only return products of this type. -}
  ,  getProductsUrl :: Maybe (Text)
  {- ^ Only return products with the given url. -}
  } deriving (Show, Eq, Generic)

data GetProductsBody
  = GetProductsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetProducts = "GET"
type instance RequestPath GetProducts = "/v1/products"

instance RequestBuilder GetProducts where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetProducts{..} =
    [ "v1"
    , "products"
    ]
    where
      GetProductsParams{..} = getProductsParams
  endpointQuery GetProducts{..} =
    [ ("active", queryFormExplode getProductsActive)
    , ("created", queryDeepObjectExplode getProductsCreated)
    , ("ending_before", queryFormExplode getProductsEndingBefore)
    , ("expand", queryDeepObjectExplode getProductsExpand)
    , ("ids", queryDeepObjectExplode getProductsIds)
    , ("limit", queryFormExplode getProductsLimit)
    , ("shippable", queryFormExplode getProductsShippable)
    , ("starting_after", queryFormExplode getProductsStartingAfter)
    , ("type", queryFormExplode getProductsType)
    , ("url", queryFormExplode getProductsUrl)
    ]
    where
      GetProductsParams{..} = getProductsParams
  endpointHeaders GetProducts{..} =
    [
    ]



{-
getProducts :: GetProducts
getProducts = GetProducts
-}
-- 
{- | <p>Invalidates all sessions for a light account, for a platform to use during platform logout.</p>

<p><strong>You may only log out <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

> -- Equivalent to the following API endpoint:
> PUT /v1/accounts/{account}/logout
-}
-- TODO request options as enum
data PutAccountsAccountLogout = PutAccountsAccountLogout
  { putAccountsAccountLogoutParams :: PutAccountsAccountLogoutParams
  , putAccountsAccountLogoutBody :: Maybe PutAccountsAccountLogoutBody
  } deriving (Show, Eq, Generic)

data PutAccountsAccountLogoutParams = PutAccountsAccountLogoutParams
  {  putAccountsAccountLogoutAccount :: (Text)
  {- ^ The identifier of the account to log out. -}
  } deriving (Show, Eq, Generic)

data PutAccountsAccountLogoutBody
  = PutAccountsAccountLogoutBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PutAccountsAccountLogout = "PUT"
type instance RequestPath PutAccountsAccountLogout = "/v1/accounts/{account}/logout"

instance RequestBuilder PutAccountsAccountLogout where
  endpointMethod _ = "PUT"
  -- TODO figure out allowReserved parameter option
  endpointPath PutAccountsAccountLogout{..} =
    [ "v1"
    , "accounts"
    , pathSimple putAccountsAccountLogoutAccount
    , "logout"
    ]
    where
      PutAccountsAccountLogoutParams{..} = putAccountsAccountLogoutParams
  endpointQuery PutAccountsAccountLogout{..} =
    [
    ]
  endpointHeaders PutAccountsAccountLogout{..} =
    [
    ]



{-
putAccountsAccountLogout :: PutAccountsAccountLogout
putAccountsAccountLogout = PutAccountsAccountLogout
-}
-- 
{- | <p>Retrieves the details of an event. Supply the unique identifier of the event, which you might have received in a webhook.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/events/{id}
-}
-- TODO request options as enum
data GetEventsId = GetEventsId
  { getEventsIdParams :: GetEventsIdParams
  , getEventsIdBody :: Maybe GetEventsIdBody
  } deriving (Show, Eq, Generic)

data GetEventsIdParams = GetEventsIdParams
  {  getEventsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getEventsIdId :: (Text)
  {- ^ The identifier of the event to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetEventsIdBody
  = GetEventsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetEventsId = "GET"
type instance RequestPath GetEventsId = "/v1/events/{id}"

instance RequestBuilder GetEventsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetEventsId{..} =
    [ "v1"
    , "events"
    , pathSimple getEventsIdId
    ]
    where
      GetEventsIdParams{..} = getEventsIdParams
  endpointQuery GetEventsId{..} =
    [ ("expand", queryDeepObjectExplode getEventsIdExpand)
    ]
  endpointHeaders GetEventsId{..} =
    [
    ]



{-
getEventsId :: GetEventsId
getEventsId = GetEventsId
-}
-- 
{- | <p>Updates the specified Issuing <code>Card</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/cards/{card}
-}
-- TODO request options as enum
data PostIssuingCardsCard = PostIssuingCardsCard
  { postIssuingCardsCardParams :: PostIssuingCardsCardParams
  , postIssuingCardsCardBody :: Maybe PostIssuingCardsCardBody
  } deriving (Show, Eq, Generic)

data PostIssuingCardsCardParams = PostIssuingCardsCardParams
  {  postIssuingCardsCardCard :: (Text)
  {- ^ The identifier of the issued card to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingCardsCardBody
  = PostIssuingCardsCardBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingCardsCard = "POST"
type instance RequestPath PostIssuingCardsCard = "/v1/issuing/cards/{card}"

instance RequestBuilder PostIssuingCardsCard where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingCardsCard{..} =
    [ "v1"
    , "issuing"
    , "cards"
    , pathSimple postIssuingCardsCardCard
    ]
    where
      PostIssuingCardsCardParams{..} = postIssuingCardsCardParams
  endpointQuery PostIssuingCardsCard{..} =
    [
    ]
  endpointHeaders PostIssuingCardsCard{..} =
    [
    ]



{-
postIssuingCardsCard :: PostIssuingCardsCard
postIssuingCardsCard = PostIssuingCardsCard
-}
-- 
{- | <p>Retrieves an Issuing <code>Card</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/cards/{card}
-}
-- TODO request options as enum
data GetIssuingCardsCard = GetIssuingCardsCard
  { getIssuingCardsCardParams :: GetIssuingCardsCardParams
  , getIssuingCardsCardBody :: Maybe GetIssuingCardsCardBody
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardParams = GetIssuingCardsCardParams
  {  getIssuingCardsCardCard :: (Text)
  {- ^ The identifier of the card to be retrieved. -}
  ,  getIssuingCardsCardExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetIssuingCardsCardBody
  = GetIssuingCardsCardBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingCardsCard = "GET"
type instance RequestPath GetIssuingCardsCard = "/v1/issuing/cards/{card}"

instance RequestBuilder GetIssuingCardsCard where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingCardsCard{..} =
    [ "v1"
    , "issuing"
    , "cards"
    , pathSimple getIssuingCardsCardCard
    ]
    where
      GetIssuingCardsCardParams{..} = getIssuingCardsCardParams
  endpointQuery GetIssuingCardsCard{..} =
    [ ("expand", queryDeepObjectExplode getIssuingCardsCardExpand)
    ]
  endpointHeaders GetIssuingCardsCard{..} =
    [
    ]



{-
getIssuingCardsCard :: GetIssuingCardsCard
getIssuingCardsCard = GetIssuingCardsCard
-}
-- 
{- | <p>Updates an existing Account Capability.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/capabilities/{capability}
-}
-- TODO request options as enum
data PostAccountsAccountCapabilitiesCapability = PostAccountsAccountCapabilitiesCapability
  { postAccountsAccountCapabilitiesCapabilityParams :: PostAccountsAccountCapabilitiesCapabilityParams
  , postAccountsAccountCapabilitiesCapabilityBody :: Maybe PostAccountsAccountCapabilitiesCapabilityBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountCapabilitiesCapabilityParams = PostAccountsAccountCapabilitiesCapabilityParams
  {  postAccountsAccountCapabilitiesCapabilityAccount :: (Text)
  ,  postAccountsAccountCapabilitiesCapabilityCapability :: (Text)
  {- ^ The ID of an account capability to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountCapabilitiesCapabilityBody
  = PostAccountsAccountCapabilitiesCapabilityBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountCapabilitiesCapability = "POST"
type instance RequestPath PostAccountsAccountCapabilitiesCapability = "/v1/accounts/{account}/capabilities/{capability}"

instance RequestBuilder PostAccountsAccountCapabilitiesCapability where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountCapabilitiesCapability{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountCapabilitiesCapabilityAccount
    , "capabilities"
    , pathSimple postAccountsAccountCapabilitiesCapabilityCapability
    ]
    where
      PostAccountsAccountCapabilitiesCapabilityParams{..} = postAccountsAccountCapabilitiesCapabilityParams
  endpointQuery PostAccountsAccountCapabilitiesCapability{..} =
    [
    ]
  endpointHeaders PostAccountsAccountCapabilitiesCapability{..} =
    [
    ]



{-
postAccountsAccountCapabilitiesCapability :: PostAccountsAccountCapabilitiesCapability
postAccountsAccountCapabilitiesCapability = PostAccountsAccountCapabilitiesCapability
-}
-- 
{- | <p>Retrieves information about the specified Account Capability.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/capabilities/{capability}
-}
-- TODO request options as enum
data GetAccountsAccountCapabilitiesCapability = GetAccountsAccountCapabilitiesCapability
  { getAccountsAccountCapabilitiesCapabilityParams :: GetAccountsAccountCapabilitiesCapabilityParams
  , getAccountsAccountCapabilitiesCapabilityBody :: Maybe GetAccountsAccountCapabilitiesCapabilityBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountCapabilitiesCapabilityParams = GetAccountsAccountCapabilitiesCapabilityParams
  {  getAccountsAccountCapabilitiesCapabilityAccount :: (Text)
  ,  getAccountsAccountCapabilitiesCapabilityCapability :: (Text)
  {- ^ The ID of an account capability to retrieve. -}
  ,  getAccountsAccountCapabilitiesCapabilityExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountCapabilitiesCapabilityBody
  = GetAccountsAccountCapabilitiesCapabilityBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountCapabilitiesCapability = "GET"
type instance RequestPath GetAccountsAccountCapabilitiesCapability = "/v1/accounts/{account}/capabilities/{capability}"

instance RequestBuilder GetAccountsAccountCapabilitiesCapability where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountCapabilitiesCapability{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountCapabilitiesCapabilityAccount
    , "capabilities"
    , pathSimple getAccountsAccountCapabilitiesCapabilityCapability
    ]
    where
      GetAccountsAccountCapabilitiesCapabilityParams{..} = getAccountsAccountCapabilitiesCapabilityParams
  endpointQuery GetAccountsAccountCapabilitiesCapability{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountCapabilitiesCapabilityExpand)
    ]
  endpointHeaders GetAccountsAccountCapabilitiesCapability{..} =
    [
    ]



{-
getAccountsAccountCapabilitiesCapability :: GetAccountsAccountCapabilitiesCapability
getAccountsAccountCapabilitiesCapability = GetAccountsAccountCapabilitiesCapability
-}
-- 
{- | <p>Stripe automatically finalizes drafts before sending and attempting payment on invoices. However, if you’d like to finalize a draft invoice manually, you can do so using this method.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}/finalize
-}
-- TODO request options as enum
data PostInvoicesInvoiceFinalize = PostInvoicesInvoiceFinalize
  { postInvoicesInvoiceFinalizeParams :: PostInvoicesInvoiceFinalizeParams
  , postInvoicesInvoiceFinalizeBody :: Maybe PostInvoicesInvoiceFinalizeBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceFinalizeParams = PostInvoicesInvoiceFinalizeParams
  {  postInvoicesInvoiceFinalizeInvoice :: (Text)
  {- ^ The invoice to be finalized, it must have `status=draft`. -}
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceFinalizeBody
  = PostInvoicesInvoiceFinalizeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoiceFinalize = "POST"
type instance RequestPath PostInvoicesInvoiceFinalize = "/v1/invoices/{invoice}/finalize"

instance RequestBuilder PostInvoicesInvoiceFinalize where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoiceFinalize{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoiceFinalizeInvoice
    , "finalize"
    ]
    where
      PostInvoicesInvoiceFinalizeParams{..} = postInvoicesInvoiceFinalizeParams
  endpointQuery PostInvoicesInvoiceFinalize{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoiceFinalize{..} =
    [
    ]



{-
postInvoicesInvoiceFinalize :: PostInvoicesInvoiceFinalize
postInvoicesInvoiceFinalize = PostInvoicesInvoiceFinalize
-}
-- 
{- | <p>Updates a <code>ValueList</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Note that <code>item_type</code> is immutable.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/radar/value_lists/{value_list}
-}
-- TODO request options as enum
data PostRadarValueListsValueList = PostRadarValueListsValueList
  { postRadarValueListsValueListParams :: PostRadarValueListsValueListParams
  , postRadarValueListsValueListBody :: Maybe PostRadarValueListsValueListBody
  } deriving (Show, Eq, Generic)

data PostRadarValueListsValueListParams = PostRadarValueListsValueListParams
  {  postRadarValueListsValueListValueList :: (Text)
  {- ^ The identifier of the value list to be updated. -}
  } deriving (Show, Eq, Generic)

data PostRadarValueListsValueListBody
  = PostRadarValueListsValueListBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRadarValueListsValueList = "POST"
type instance RequestPath PostRadarValueListsValueList = "/v1/radar/value_lists/{value_list}"

instance RequestBuilder PostRadarValueListsValueList where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRadarValueListsValueList{..} =
    [ "v1"
    , "radar"
    , "value_lists"
    , pathSimple postRadarValueListsValueListValueList
    ]
    where
      PostRadarValueListsValueListParams{..} = postRadarValueListsValueListParams
  endpointQuery PostRadarValueListsValueList{..} =
    [
    ]
  endpointHeaders PostRadarValueListsValueList{..} =
    [
    ]



{-
postRadarValueListsValueList :: PostRadarValueListsValueList
postRadarValueListsValueList = PostRadarValueListsValueList
-}
-- 
{- | <p>Retrieves a <code>ValueList</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/radar/value_lists/{value_list}
-}
-- TODO request options as enum
data GetRadarValueListsValueList = GetRadarValueListsValueList
  { getRadarValueListsValueListParams :: GetRadarValueListsValueListParams
  , getRadarValueListsValueListBody :: Maybe GetRadarValueListsValueListBody
  } deriving (Show, Eq, Generic)

data GetRadarValueListsValueListParams = GetRadarValueListsValueListParams
  {  getRadarValueListsValueListExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRadarValueListsValueListValueList :: (Text)
  {- ^ The identifier of the value list to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetRadarValueListsValueListBody
  = GetRadarValueListsValueListBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRadarValueListsValueList = "GET"
type instance RequestPath GetRadarValueListsValueList = "/v1/radar/value_lists/{value_list}"

instance RequestBuilder GetRadarValueListsValueList where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRadarValueListsValueList{..} =
    [ "v1"
    , "radar"
    , "value_lists"
    , pathSimple getRadarValueListsValueListValueList
    ]
    where
      GetRadarValueListsValueListParams{..} = getRadarValueListsValueListParams
  endpointQuery GetRadarValueListsValueList{..} =
    [ ("expand", queryDeepObjectExplode getRadarValueListsValueListExpand)
    ]
  endpointHeaders GetRadarValueListsValueList{..} =
    [
    ]



{-
getRadarValueListsValueList :: GetRadarValueListsValueList
getRadarValueListsValueList = GetRadarValueListsValueList
-}
-- 
{- | <p>Deletes a <code>ValueList</code> object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/radar/value_lists/{value_list}
-}
-- TODO request options as enum
data DeleteRadarValueListsValueList = DeleteRadarValueListsValueList
  { deleteRadarValueListsValueListParams :: DeleteRadarValueListsValueListParams
  , deleteRadarValueListsValueListBody :: Maybe DeleteRadarValueListsValueListBody
  } deriving (Show, Eq, Generic)

data DeleteRadarValueListsValueListParams = DeleteRadarValueListsValueListParams
  {  deleteRadarValueListsValueListValueList :: (Text)
  {- ^ The identifier of the value list to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteRadarValueListsValueListBody
  = DeleteRadarValueListsValueListBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteRadarValueListsValueList = "DELETE"
type instance RequestPath DeleteRadarValueListsValueList = "/v1/radar/value_lists/{value_list}"

instance RequestBuilder DeleteRadarValueListsValueList where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteRadarValueListsValueList{..} =
    [ "v1"
    , "radar"
    , "value_lists"
    , pathSimple deleteRadarValueListsValueListValueList
    ]
    where
      DeleteRadarValueListsValueListParams{..} = deleteRadarValueListsValueListParams
  endpointQuery DeleteRadarValueListsValueList{..} =
    [
    ]
  endpointHeaders DeleteRadarValueListsValueList{..} =
    [
    ]



{-
deleteRadarValueListsValueList :: DeleteRadarValueListsValueList
deleteRadarValueListsValueList = DeleteRadarValueListsValueList
-}
-- 
{- | <p>You can create plans using the API, or in the Stripe <a href="https://dashboard.stripe.com/subscriptions/products">Dashboard</a>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/plans
-}
-- TODO request options as enum
data PostPlans = PostPlans
  { postPlansParams :: PostPlansParams
  , postPlansBody :: PostPlansBody
  } deriving (Show, Eq, Generic)

data PostPlansParams = PostPlansParams
  {
  } deriving (Show, Eq, Generic)

data PostPlansBody
  = PostPlansBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPlans = "POST"
type instance RequestPath PostPlans = "/v1/plans"

instance RequestBuilder PostPlans where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPlans{..} =
    [ "v1"
    , "plans"
    ]
    where
      PostPlansParams = postPlansParams
  endpointQuery PostPlans{..} =
    [
    ]
  endpointHeaders PostPlans{..} =
    [
    ]



{-
postPlans :: PostPlans
postPlans = PostPlans
-}
-- 
{- | <p>Returns a list of your plans.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/plans
-}
-- TODO request options as enum
data GetPlans = GetPlans
  { getPlansParams :: GetPlansParams
  , getPlansBody :: Maybe GetPlansBody
  } deriving (Show, Eq, Generic)

data GetPlansParams = GetPlansParams
  {  getPlansActive :: Maybe (Bool)
  {- ^ Only return plans that are active or inactive (e.g., pass `false` to list all inactive products). -}
  ,  getPlansCreated :: Maybe (Either (Object) (Int))
  {- ^ A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. -}
  ,  getPlansEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getPlansExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getPlansLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getPlansProduct :: Maybe (Text)
  {- ^ Only return plans for the given product. -}
  ,  getPlansStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetPlansBody
  = GetPlansBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetPlans = "GET"
type instance RequestPath GetPlans = "/v1/plans"

instance RequestBuilder GetPlans where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetPlans{..} =
    [ "v1"
    , "plans"
    ]
    where
      GetPlansParams{..} = getPlansParams
  endpointQuery GetPlans{..} =
    [ ("active", queryFormExplode getPlansActive)
    , ("created", queryDeepObjectExplode getPlansCreated)
    , ("ending_before", queryFormExplode getPlansEndingBefore)
    , ("expand", queryDeepObjectExplode getPlansExpand)
    , ("limit", queryFormExplode getPlansLimit)
    , ("product", queryFormExplode getPlansProduct)
    , ("starting_after", queryFormExplode getPlansStartingAfter)
    ]
    where
      GetPlansParams{..} = getPlansParams
  endpointHeaders GetPlans{..} =
    [
    ]



{-
getPlans :: GetPlans
getPlans = GetPlans
-}
-- 
{- | 

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount
-}
-- TODO request options as enum
data GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
  { getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams :: GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  , getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody :: Maybe GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams = GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  {  getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountCustomer :: (Text)
  ,  getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  = GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = "GET"
type instance RequestPath GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount"

instance RequestBuilder GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountCustomer
    , "subscriptions"
    , pathSimple getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId
    , "discount"
    ]
    where
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams{..} = getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  endpointQuery GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountExpand)
    ]
  endpointHeaders GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [
    ]



{-
getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount :: GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
-}
-- 
{- | <p>Removes the currently applied discount on a customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount
-}
-- TODO request options as enum
data DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
  { deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams :: DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  , deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody :: Maybe DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  {  deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountCustomer :: (Text)
  ,  deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = "DELETE"
type instance RequestPath DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount"

instance RequestBuilder DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountCustomer
    , "subscriptions"
    , pathSimple deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountSubscriptionExposedId
    , "discount"
    ]
    where
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams{..} = deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams
  endpointQuery DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount{..} =
    [
    ]



{-
deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount :: DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount
-}
-- 
{- | <p>Updates the specified source by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

<p>This request accepts the <code>metadata</code> and <code>owner</code> as arguments. It is also possible to update type specific information for selected payment methods. Please refer to our <a href="/docs/sources">payment method guides</a> for more detail.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/sources/{source}
-}
-- TODO request options as enum
data PostSourcesSource = PostSourcesSource
  { postSourcesSourceParams :: PostSourcesSourceParams
  , postSourcesSourceBody :: Maybe PostSourcesSourceBody
  } deriving (Show, Eq, Generic)

data PostSourcesSourceParams = PostSourcesSourceParams
  {  postSourcesSourceSource :: (Text)
  } deriving (Show, Eq, Generic)

data PostSourcesSourceBody
  = PostSourcesSourceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSourcesSource = "POST"
type instance RequestPath PostSourcesSource = "/v1/sources/{source}"

instance RequestBuilder PostSourcesSource where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSourcesSource{..} =
    [ "v1"
    , "sources"
    , pathSimple postSourcesSourceSource
    ]
    where
      PostSourcesSourceParams{..} = postSourcesSourceParams
  endpointQuery PostSourcesSource{..} =
    [
    ]
  endpointHeaders PostSourcesSource{..} =
    [
    ]



{-
postSourcesSource :: PostSourcesSource
postSourcesSource = PostSourcesSource
-}
-- 
{- | <p>Retrieves an existing source object. Supply the unique source ID from a source creation request and Stripe will return the corresponding up-to-date source object information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sources/{source}
-}
-- TODO request options as enum
data GetSourcesSource = GetSourcesSource
  { getSourcesSourceParams :: GetSourcesSourceParams
  , getSourcesSourceBody :: Maybe GetSourcesSourceBody
  } deriving (Show, Eq, Generic)

data GetSourcesSourceParams = GetSourcesSourceParams
  {  getSourcesSourceClientSecret :: Maybe (Text)
  {- ^ The client secret of the source. Required if a publishable key is used to retrieve the source. -}
  ,  getSourcesSourceExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSourcesSourceSource :: (Text)
  {- ^ The identifier of the source to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetSourcesSourceBody
  = GetSourcesSourceBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSourcesSource = "GET"
type instance RequestPath GetSourcesSource = "/v1/sources/{source}"

instance RequestBuilder GetSourcesSource where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSourcesSource{..} =
    [ "v1"
    , "sources"
    , pathSimple getSourcesSourceSource
    ]
    where
      GetSourcesSourceParams{..} = getSourcesSourceParams
  endpointQuery GetSourcesSource{..} =
    [ ("client_secret", queryFormExplode getSourcesSourceClientSecret)
    , ("expand", queryDeepObjectExplode getSourcesSourceExpand)
    ]
    where
      GetSourcesSourceParams{..} = getSourcesSourceParams
  endpointHeaders GetSourcesSource{..} =
    [
    ]



{-
getSourcesSource :: GetSourcesSource
getSourcesSource = GetSourcesSource
-}
-- 
{- | <p>Creates a single-use login link for an Express account to access their Stripe dashboard.</p>

<p><strong>You may only create login links for <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/account/login_links
-}
-- TODO request options as enum
data PostAccountLoginLinks = PostAccountLoginLinks
  { postAccountLoginLinksParams :: PostAccountLoginLinksParams
  , postAccountLoginLinksBody :: PostAccountLoginLinksBody
  } deriving (Show, Eq, Generic)

data PostAccountLoginLinksParams = PostAccountLoginLinksParams
  {
  } deriving (Show, Eq, Generic)

data PostAccountLoginLinksBody
  = PostAccountLoginLinksBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountLoginLinks = "POST"
type instance RequestPath PostAccountLoginLinks = "/v1/account/login_links"

instance RequestBuilder PostAccountLoginLinks where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountLoginLinks{..} =
    [ "v1"
    , "account"
    , "login_links"
    ]
    where
      PostAccountLoginLinksParams = postAccountLoginLinksParams
  endpointQuery PostAccountLoginLinks{..} =
    [
    ]
  endpointHeaders PostAccountLoginLinks{..} =
    [
    ]



{-
postAccountLoginLinks :: PostAccountLoginLinks
postAccountLoginLinks = PostAccountLoginLinks
-}
-- 
{- | <p>Initiate 3D Secure authentication.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/3d_secure
-}
-- TODO request options as enum
data Post3dSecure = Post3dSecure
  { post3dSecureParams :: Post3dSecureParams
  , post3dSecureBody :: Post3dSecureBody
  } deriving (Show, Eq, Generic)

data Post3dSecureParams = Post3dSecureParams
  {
  } deriving (Show, Eq, Generic)

data Post3dSecureBody
  = Post3dSecureBody
  deriving (Show, Eq, Generic)

type instance RequestMethod Post3dSecure = "POST"
type instance RequestPath Post3dSecure = "/v1/3d_secure"

instance RequestBuilder Post3dSecure where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath Post3dSecure{..} =
    [ "v1"
    , "3d_secure"
    ]
    where
      Post3dSecureParams = post3dSecureParams
  endpointQuery Post3dSecure{..} =
    [
    ]
  endpointHeaders Post3dSecure{..} =
    [
    ]



{-
post3dSecure :: Post3dSecure
post3dSecure = Post3dSecure
-}
-- 
{- | <p>When retrieving an invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoices/{invoice}/lines
-}
-- TODO request options as enum
data GetInvoicesInvoiceLines = GetInvoicesInvoiceLines
  { getInvoicesInvoiceLinesParams :: GetInvoicesInvoiceLinesParams
  , getInvoicesInvoiceLinesBody :: Maybe GetInvoicesInvoiceLinesBody
  } deriving (Show, Eq, Generic)

data GetInvoicesInvoiceLinesParams = GetInvoicesInvoiceLinesParams
  {  getInvoicesInvoiceLinesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getInvoicesInvoiceLinesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoicesInvoiceLinesInvoice :: (Text)
  {- ^ The ID of the invoice containing the lines to be retrieved. -}
  ,  getInvoicesInvoiceLinesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getInvoicesInvoiceLinesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetInvoicesInvoiceLinesBody
  = GetInvoicesInvoiceLinesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoicesInvoiceLines = "GET"
type instance RequestPath GetInvoicesInvoiceLines = "/v1/invoices/{invoice}/lines"

instance RequestBuilder GetInvoicesInvoiceLines where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoicesInvoiceLines{..} =
    [ "v1"
    , "invoices"
    , pathSimple getInvoicesInvoiceLinesInvoice
    , "lines"
    ]
    where
      GetInvoicesInvoiceLinesParams{..} = getInvoicesInvoiceLinesParams
  endpointQuery GetInvoicesInvoiceLines{..} =
    [ ("ending_before", queryFormExplode getInvoicesInvoiceLinesEndingBefore)
    , ("expand", queryDeepObjectExplode getInvoicesInvoiceLinesExpand)
    , ("limit", queryFormExplode getInvoicesInvoiceLinesLimit)
    , ("starting_after", queryFormExplode getInvoicesInvoiceLinesStartingAfter)
    ]
    where
      GetInvoicesInvoiceLinesParams{..} = getInvoicesInvoiceLinesParams
  endpointHeaders GetInvoicesInvoiceLines{..} =
    [
    ]



{-
getInvoicesInvoiceLines :: GetInvoicesInvoiceLines
getInvoicesInvoiceLines = GetInvoicesInvoiceLines
-}
-- 
{- | <p>Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is <code>not_started</code> or <code>active</code>. If the subscription schedule is currently associated with a subscription, releasing it will remove its <code>subscription</code> property and set the subscription’s ID to the <code>released_subscription</code> property.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscription_schedules/{schedule}/release
-}
-- TODO request options as enum
data PostSubscriptionSchedulesScheduleRelease = PostSubscriptionSchedulesScheduleRelease
  { postSubscriptionSchedulesScheduleReleaseParams :: PostSubscriptionSchedulesScheduleReleaseParams
  , postSubscriptionSchedulesScheduleReleaseBody :: Maybe PostSubscriptionSchedulesScheduleReleaseBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleReleaseParams = PostSubscriptionSchedulesScheduleReleaseParams
  {  postSubscriptionSchedulesScheduleReleaseSchedule :: (Text)
  {- ^ The identifier of the subscription schedule to be released. -}
  } deriving (Show, Eq, Generic)

data PostSubscriptionSchedulesScheduleReleaseBody
  = PostSubscriptionSchedulesScheduleReleaseBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionSchedulesScheduleRelease = "POST"
type instance RequestPath PostSubscriptionSchedulesScheduleRelease = "/v1/subscription_schedules/{schedule}/release"

instance RequestBuilder PostSubscriptionSchedulesScheduleRelease where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionSchedulesScheduleRelease{..} =
    [ "v1"
    , "subscription_schedules"
    , pathSimple postSubscriptionSchedulesScheduleReleaseSchedule
    , "release"
    ]
    where
      PostSubscriptionSchedulesScheduleReleaseParams{..} = postSubscriptionSchedulesScheduleReleaseParams
  endpointQuery PostSubscriptionSchedulesScheduleRelease{..} =
    [
    ]
  endpointHeaders PostSubscriptionSchedulesScheduleRelease{..} =
    [
    ]



{-
postSubscriptionSchedulesScheduleRelease :: PostSubscriptionSchedulesScheduleRelease
postSubscriptionSchedulesScheduleRelease = PostSubscriptionSchedulesScheduleRelease
-}
-- 
{- | <p>Retrieves the balance transaction with the given ID.</p>

<p>Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/balance_transactions/{id}
-}
-- TODO request options as enum
data GetBalanceTransactionsId = GetBalanceTransactionsId
  { getBalanceTransactionsIdParams :: GetBalanceTransactionsIdParams
  , getBalanceTransactionsIdBody :: Maybe GetBalanceTransactionsIdBody
  } deriving (Show, Eq, Generic)

data GetBalanceTransactionsIdParams = GetBalanceTransactionsIdParams
  {  getBalanceTransactionsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBalanceTransactionsIdId :: (Text)
  {- ^ The ID of the desired balance transaction, as found on any API object that affects the balance (e.g., a charge or transfer). -}
  } deriving (Show, Eq, Generic)

data GetBalanceTransactionsIdBody
  = GetBalanceTransactionsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBalanceTransactionsId = "GET"
type instance RequestPath GetBalanceTransactionsId = "/v1/balance_transactions/{id}"

instance RequestBuilder GetBalanceTransactionsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBalanceTransactionsId{..} =
    [ "v1"
    , "balance_transactions"
    , pathSimple getBalanceTransactionsIdId
    ]
    where
      GetBalanceTransactionsIdParams{..} = getBalanceTransactionsIdParams
  endpointQuery GetBalanceTransactionsId{..} =
    [ ("expand", queryDeepObjectExplode getBalanceTransactionsIdExpand)
    ]
  endpointHeaders GetBalanceTransactionsId{..} =
    [
    ]



{-
getBalanceTransactionsId :: GetBalanceTransactionsId
getBalanceTransactionsId = GetBalanceTransactionsId
-}
-- 
{- | <p>Resend an event. This only works in testmode</p>

> -- Equivalent to the following API endpoint:
> POST /v1/events/{id}/retry
-}
-- TODO request options as enum
data PostEventsIdRetry = PostEventsIdRetry
  { postEventsIdRetryParams :: PostEventsIdRetryParams
  , postEventsIdRetryBody :: Maybe PostEventsIdRetryBody
  } deriving (Show, Eq, Generic)

data PostEventsIdRetryParams = PostEventsIdRetryParams
  {  postEventsIdRetryId :: (Text)
  } deriving (Show, Eq, Generic)

data PostEventsIdRetryBody
  = PostEventsIdRetryBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostEventsIdRetry = "POST"
type instance RequestPath PostEventsIdRetry = "/v1/events/{id}/retry"

instance RequestBuilder PostEventsIdRetry where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostEventsIdRetry{..} =
    [ "v1"
    , "events"
    , pathSimple postEventsIdRetryId
    , "retry"
    ]
    where
      PostEventsIdRetryParams{..} = postEventsIdRetryParams
  endpointQuery PostEventsIdRetry{..} =
    [
    ]
  endpointHeaders PostEventsIdRetry{..} =
    [
    ]



{-
postEventsIdRetry :: PostEventsIdRetry
postEventsIdRetry = PostEventsIdRetry
-}
-- 
{- | <p>Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>
<p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/external_accounts/{id}
-}
-- TODO request options as enum
data PostAccountsAccountExternalAccountsId = PostAccountsAccountExternalAccountsId
  { postAccountsAccountExternalAccountsIdParams :: PostAccountsAccountExternalAccountsIdParams
  , postAccountsAccountExternalAccountsIdBody :: Maybe PostAccountsAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountExternalAccountsIdParams = PostAccountsAccountExternalAccountsIdParams
  {  postAccountsAccountExternalAccountsIdAccount :: (Text)
  ,  postAccountsAccountExternalAccountsIdId :: (Text)
  {- ^ The ID of the external account to update -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountExternalAccountsIdBody
  = PostAccountsAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountExternalAccountsId = "POST"
type instance RequestPath PostAccountsAccountExternalAccountsId = "/v1/accounts/{account}/external_accounts/{id}"

instance RequestBuilder PostAccountsAccountExternalAccountsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountExternalAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountExternalAccountsIdAccount
    , "external_accounts"
    , pathSimple postAccountsAccountExternalAccountsIdId
    ]
    where
      PostAccountsAccountExternalAccountsIdParams{..} = postAccountsAccountExternalAccountsIdParams
  endpointQuery PostAccountsAccountExternalAccountsId{..} =
    [
    ]
  endpointHeaders PostAccountsAccountExternalAccountsId{..} =
    [
    ]



{-
postAccountsAccountExternalAccountsId :: PostAccountsAccountExternalAccountsId
postAccountsAccountExternalAccountsId = PostAccountsAccountExternalAccountsId
-}
-- 
{- | <p>Retrieve a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/external_accounts/{id}
-}
-- TODO request options as enum
data GetAccountsAccountExternalAccountsId = GetAccountsAccountExternalAccountsId
  { getAccountsAccountExternalAccountsIdParams :: GetAccountsAccountExternalAccountsIdParams
  , getAccountsAccountExternalAccountsIdBody :: Maybe GetAccountsAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountExternalAccountsIdParams = GetAccountsAccountExternalAccountsIdParams
  {  getAccountsAccountExternalAccountsIdAccount :: (Text)
  ,  getAccountsAccountExternalAccountsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountExternalAccountsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data GetAccountsAccountExternalAccountsIdBody
  = GetAccountsAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountExternalAccountsId = "GET"
type instance RequestPath GetAccountsAccountExternalAccountsId = "/v1/accounts/{account}/external_accounts/{id}"

instance RequestBuilder GetAccountsAccountExternalAccountsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountExternalAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountExternalAccountsIdAccount
    , "external_accounts"
    , pathSimple getAccountsAccountExternalAccountsIdId
    ]
    where
      GetAccountsAccountExternalAccountsIdParams{..} = getAccountsAccountExternalAccountsIdParams
  endpointQuery GetAccountsAccountExternalAccountsId{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountExternalAccountsIdExpand)
    ]
  endpointHeaders GetAccountsAccountExternalAccountsId{..} =
    [
    ]



{-
getAccountsAccountExternalAccountsId :: GetAccountsAccountExternalAccountsId
getAccountsAccountExternalAccountsId = GetAccountsAccountExternalAccountsId
-}
-- 
{- | <p>Delete a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/accounts/{account}/external_accounts/{id}
-}
-- TODO request options as enum
data DeleteAccountsAccountExternalAccountsId = DeleteAccountsAccountExternalAccountsId
  { deleteAccountsAccountExternalAccountsIdParams :: DeleteAccountsAccountExternalAccountsIdParams
  , deleteAccountsAccountExternalAccountsIdBody :: Maybe DeleteAccountsAccountExternalAccountsIdBody
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountExternalAccountsIdParams = DeleteAccountsAccountExternalAccountsIdParams
  {  deleteAccountsAccountExternalAccountsIdAccount :: (Text)
  ,  deleteAccountsAccountExternalAccountsIdId :: (Text)
  {- ^ The ID of the external account to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountExternalAccountsIdBody
  = DeleteAccountsAccountExternalAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountsAccountExternalAccountsId = "DELETE"
type instance RequestPath DeleteAccountsAccountExternalAccountsId = "/v1/accounts/{account}/external_accounts/{id}"

instance RequestBuilder DeleteAccountsAccountExternalAccountsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountsAccountExternalAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple deleteAccountsAccountExternalAccountsIdAccount
    , "external_accounts"
    , pathSimple deleteAccountsAccountExternalAccountsIdId
    ]
    where
      DeleteAccountsAccountExternalAccountsIdParams{..} = deleteAccountsAccountExternalAccountsIdParams
  endpointQuery DeleteAccountsAccountExternalAccountsId{..} =
    [
    ]
  endpointHeaders DeleteAccountsAccountExternalAccountsId{..} =
    [
    ]



{-
deleteAccountsAccountExternalAccountsId :: DeleteAccountsAccountExternalAccountsId
deleteAccountsAccountExternalAccountsId = DeleteAccountsAccountExternalAccountsId
-}
-- 
{- | <p>Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}/mark_uncollectible
-}
-- TODO request options as enum
data PostInvoicesInvoiceMarkUncollectible = PostInvoicesInvoiceMarkUncollectible
  { postInvoicesInvoiceMarkUncollectibleParams :: PostInvoicesInvoiceMarkUncollectibleParams
  , postInvoicesInvoiceMarkUncollectibleBody :: Maybe PostInvoicesInvoiceMarkUncollectibleBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceMarkUncollectibleParams = PostInvoicesInvoiceMarkUncollectibleParams
  {  postInvoicesInvoiceMarkUncollectibleInvoice :: (Text)
  {- ^ The identifier of the invoice to be marked as uncollectible. The invoice must be `open`. -}
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceMarkUncollectibleBody
  = PostInvoicesInvoiceMarkUncollectibleBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoiceMarkUncollectible = "POST"
type instance RequestPath PostInvoicesInvoiceMarkUncollectible = "/v1/invoices/{invoice}/mark_uncollectible"

instance RequestBuilder PostInvoicesInvoiceMarkUncollectible where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoiceMarkUncollectible{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoiceMarkUncollectibleInvoice
    , "mark_uncollectible"
    ]
    where
      PostInvoicesInvoiceMarkUncollectibleParams{..} = postInvoicesInvoiceMarkUncollectibleParams
  endpointQuery PostInvoicesInvoiceMarkUncollectible{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoiceMarkUncollectible{..} =
    [
    ]



{-
postInvoicesInvoiceMarkUncollectible :: PostInvoicesInvoiceMarkUncollectible
postInvoicesInvoiceMarkUncollectible = PostInvoicesInvoiceMarkUncollectible
-}
-- 
{- | <p>List source transactions for a given source.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sources/{source}/source_transactions
-}
-- TODO request options as enum
data GetSourcesSourceSourceTransactions = GetSourcesSourceSourceTransactions
  { getSourcesSourceSourceTransactionsParams :: GetSourcesSourceSourceTransactionsParams
  , getSourcesSourceSourceTransactionsBody :: Maybe GetSourcesSourceSourceTransactionsBody
  } deriving (Show, Eq, Generic)

data GetSourcesSourceSourceTransactionsParams = GetSourcesSourceSourceTransactionsParams
  {  getSourcesSourceSourceTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSourcesSourceSourceTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSourcesSourceSourceTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSourcesSourceSourceTransactionsSource :: (Text)
  {- ^ The ID of the source whose source transactions will be retrieved. -}
  ,  getSourcesSourceSourceTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetSourcesSourceSourceTransactionsBody
  = GetSourcesSourceSourceTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSourcesSourceSourceTransactions = "GET"
type instance RequestPath GetSourcesSourceSourceTransactions = "/v1/sources/{source}/source_transactions"

instance RequestBuilder GetSourcesSourceSourceTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSourcesSourceSourceTransactions{..} =
    [ "v1"
    , "sources"
    , pathSimple getSourcesSourceSourceTransactionsSource
    , "source_transactions"
    ]
    where
      GetSourcesSourceSourceTransactionsParams{..} = getSourcesSourceSourceTransactionsParams
  endpointQuery GetSourcesSourceSourceTransactions{..} =
    [ ("ending_before", queryFormExplode getSourcesSourceSourceTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getSourcesSourceSourceTransactionsExpand)
    , ("limit", queryFormExplode getSourcesSourceSourceTransactionsLimit)
    , ("starting_after", queryFormExplode getSourcesSourceSourceTransactionsStartingAfter)
    ]
    where
      GetSourcesSourceSourceTransactionsParams{..} = getSourcesSourceSourceTransactionsParams
  endpointHeaders GetSourcesSourceSourceTransactions{..} =
    [
    ]



{-
getSourcesSourceSourceTransactions :: GetSourcesSourceSourceTransactions
getSourcesSourceSourceTransactions = GetSourcesSourceSourceTransactions
-}
-- 
{- | <p>Creates an item to be added to a draft invoice. If no invoice is specified, the item will be on the next invoice created for the customer specified.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoiceitems
-}
-- TODO request options as enum
data PostInvoiceitems = PostInvoiceitems
  { postInvoiceitemsParams :: PostInvoiceitemsParams
  , postInvoiceitemsBody :: PostInvoiceitemsBody
  } deriving (Show, Eq, Generic)

data PostInvoiceitemsParams = PostInvoiceitemsParams
  {
  } deriving (Show, Eq, Generic)

data PostInvoiceitemsBody
  = PostInvoiceitemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoiceitems = "POST"
type instance RequestPath PostInvoiceitems = "/v1/invoiceitems"

instance RequestBuilder PostInvoiceitems where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoiceitems{..} =
    [ "v1"
    , "invoiceitems"
    ]
    where
      PostInvoiceitemsParams = postInvoiceitemsParams
  endpointQuery PostInvoiceitems{..} =
    [
    ]
  endpointHeaders PostInvoiceitems{..} =
    [
    ]



{-
postInvoiceitems :: PostInvoiceitems
postInvoiceitems = PostInvoiceitems
-}
-- 
{- | <p>Returns a list of your invoice items. Invoice items are returned sorted by creation date, with the most recently created invoice items appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoiceitems
-}
-- TODO request options as enum
data GetInvoiceitems = GetInvoiceitems
  { getInvoiceitemsParams :: GetInvoiceitemsParams
  , getInvoiceitemsBody :: Maybe GetInvoiceitemsBody
  } deriving (Show, Eq, Generic)

data GetInvoiceitemsParams = GetInvoiceitemsParams
  {  getInvoiceitemsCreated :: Maybe (Either (Object) (Int))
  ,  getInvoiceitemsCustomer :: Maybe (Text)
  {- ^ The identifier of the customer whose invoice items to return. If none is provided, all invoice items will be returned. -}
  ,  getInvoiceitemsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getInvoiceitemsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoiceitemsInvoice :: Maybe (Text)
  {- ^ Only return invoice items belonging to this invoice. If none is provided, all invoice items will be returned. If specifying an invoice, no customer identifier is needed. -}
  ,  getInvoiceitemsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getInvoiceitemsPending :: Maybe (Bool)
  {- ^ Set to `true` to only show pending invoice items, which are not yet attached to any invoices. Set to `false` to only show invoice items already attached to invoices. If unspecified, no filter is applied. -}
  ,  getInvoiceitemsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetInvoiceitemsBody
  = GetInvoiceitemsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoiceitems = "GET"
type instance RequestPath GetInvoiceitems = "/v1/invoiceitems"

instance RequestBuilder GetInvoiceitems where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoiceitems{..} =
    [ "v1"
    , "invoiceitems"
    ]
    where
      GetInvoiceitemsParams{..} = getInvoiceitemsParams
  endpointQuery GetInvoiceitems{..} =
    [ ("created", queryDeepObjectExplode getInvoiceitemsCreated)
    , ("customer", queryFormExplode getInvoiceitemsCustomer)
    , ("ending_before", queryFormExplode getInvoiceitemsEndingBefore)
    , ("expand", queryDeepObjectExplode getInvoiceitemsExpand)
    , ("invoice", queryFormExplode getInvoiceitemsInvoice)
    , ("limit", queryFormExplode getInvoiceitemsLimit)
    , ("pending", queryFormExplode getInvoiceitemsPending)
    , ("starting_after", queryFormExplode getInvoiceitemsStartingAfter)
    ]
    where
      GetInvoiceitemsParams{..} = getInvoiceitemsParams
  endpointHeaders GetInvoiceitems{..} =
    [
    ]



{-
getInvoiceitems :: GetInvoiceitems
getInvoiceitems = GetInvoiceitems
-}
-- 
{- | <p>Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/authorizations
-}
-- TODO request options as enum
data GetIssuingAuthorizations = GetIssuingAuthorizations
  { getIssuingAuthorizationsParams :: GetIssuingAuthorizationsParams
  , getIssuingAuthorizationsBody :: Maybe GetIssuingAuthorizationsBody
  } deriving (Show, Eq, Generic)

data GetIssuingAuthorizationsParams = GetIssuingAuthorizationsParams
  {  getIssuingAuthorizationsCard :: Maybe (Text)
  {- ^ Only return issuing transactions that belong to the given card. -}
  ,  getIssuingAuthorizationsCardholder :: Maybe (Text)
  {- ^ Only return authorizations belonging to the given cardholder. -}
  ,  getIssuingAuthorizationsCreated :: Maybe (Either (Object) (Int))
  {- ^ Only return authorizations that were created during the given date interval. -}
  ,  getIssuingAuthorizationsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getIssuingAuthorizationsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getIssuingAuthorizationsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getIssuingAuthorizationsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getIssuingAuthorizationsStatus :: Maybe (Status)
  {- ^ Only return authorizations with the given status. One of `pending`, `closed`, or `reversed`. -}
  } deriving (Show, Eq, Generic)

data GetIssuingAuthorizationsBody
  = GetIssuingAuthorizationsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingAuthorizations = "GET"
type instance RequestPath GetIssuingAuthorizations = "/v1/issuing/authorizations"

instance RequestBuilder GetIssuingAuthorizations where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingAuthorizations{..} =
    [ "v1"
    , "issuing"
    , "authorizations"
    ]
    where
      GetIssuingAuthorizationsParams{..} = getIssuingAuthorizationsParams
  endpointQuery GetIssuingAuthorizations{..} =
    [ ("card", queryFormExplode getIssuingAuthorizationsCard)
    , ("cardholder", queryFormExplode getIssuingAuthorizationsCardholder)
    , ("created", queryDeepObjectExplode getIssuingAuthorizationsCreated)
    , ("ending_before", queryFormExplode getIssuingAuthorizationsEndingBefore)
    , ("expand", queryDeepObjectExplode getIssuingAuthorizationsExpand)
    , ("limit", queryFormExplode getIssuingAuthorizationsLimit)
    , ("starting_after", queryFormExplode getIssuingAuthorizationsStartingAfter)
    , ("status", queryFormExplode getIssuingAuthorizationsStatus)
    ]
    where
      GetIssuingAuthorizationsParams{..} = getIssuingAuthorizationsParams
  endpointHeaders GetIssuingAuthorizations{..} =
    [
    ]



{-
getIssuingAuthorizations :: GetIssuingAuthorizations
getIssuingAuthorizations = GetIssuingAuthorizations
-}
-- 
{- | <p>Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to <a href="#delete_invoice">deletion</a>, however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/invoices/{invoice}/void
-}
-- TODO request options as enum
data PostInvoicesInvoiceVoid = PostInvoicesInvoiceVoid
  { postInvoicesInvoiceVoidParams :: PostInvoicesInvoiceVoidParams
  , postInvoicesInvoiceVoidBody :: Maybe PostInvoicesInvoiceVoidBody
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceVoidParams = PostInvoicesInvoiceVoidParams
  {  postInvoicesInvoiceVoidInvoice :: (Text)
  {- ^ ID of invoice to void. It must be finalized. -}
  } deriving (Show, Eq, Generic)

data PostInvoicesInvoiceVoidBody
  = PostInvoicesInvoiceVoidBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostInvoicesInvoiceVoid = "POST"
type instance RequestPath PostInvoicesInvoiceVoid = "/v1/invoices/{invoice}/void"

instance RequestBuilder PostInvoicesInvoiceVoid where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostInvoicesInvoiceVoid{..} =
    [ "v1"
    , "invoices"
    , pathSimple postInvoicesInvoiceVoidInvoice
    , "void"
    ]
    where
      PostInvoicesInvoiceVoidParams{..} = postInvoicesInvoiceVoidParams
  endpointQuery PostInvoicesInvoiceVoid{..} =
    [
    ]
  endpointHeaders PostInvoicesInvoiceVoid{..} =
    [
    ]



{-
postInvoicesInvoiceVoid :: PostInvoicesInvoiceVoid
postInvoicesInvoiceVoid = PostInvoicesInvoiceVoid
-}
-- 
{- | <p>Creates a new object and begin running the report. (Requires a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

> -- Equivalent to the following API endpoint:
> POST /v1/reporting/report_runs
-}
-- TODO request options as enum
data PostReportingReportRuns = PostReportingReportRuns
  { postReportingReportRunsParams :: PostReportingReportRunsParams
  , postReportingReportRunsBody :: PostReportingReportRunsBody
  } deriving (Show, Eq, Generic)

data PostReportingReportRunsParams = PostReportingReportRunsParams
  {
  } deriving (Show, Eq, Generic)

data PostReportingReportRunsBody
  = PostReportingReportRunsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostReportingReportRuns = "POST"
type instance RequestPath PostReportingReportRuns = "/v1/reporting/report_runs"

instance RequestBuilder PostReportingReportRuns where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostReportingReportRuns{..} =
    [ "v1"
    , "reporting"
    , "report_runs"
    ]
    where
      PostReportingReportRunsParams = postReportingReportRunsParams
  endpointQuery PostReportingReportRuns{..} =
    [
    ]
  endpointHeaders PostReportingReportRuns{..} =
    [
    ]



{-
postReportingReportRuns :: PostReportingReportRuns
postReportingReportRuns = PostReportingReportRuns
-}
-- 
{- | <p>Returns a list of Report Runs, with the most recent appearing first. (Requires a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

> -- Equivalent to the following API endpoint:
> GET /v1/reporting/report_runs
-}
-- TODO request options as enum
data GetReportingReportRuns = GetReportingReportRuns
  { getReportingReportRunsParams :: GetReportingReportRunsParams
  , getReportingReportRunsBody :: Maybe GetReportingReportRunsBody
  } deriving (Show, Eq, Generic)

data GetReportingReportRunsParams = GetReportingReportRunsParams
  {  getReportingReportRunsCreated :: Maybe (Either (Object) (Int))
  ,  getReportingReportRunsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getReportingReportRunsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getReportingReportRunsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getReportingReportRunsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetReportingReportRunsBody
  = GetReportingReportRunsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetReportingReportRuns = "GET"
type instance RequestPath GetReportingReportRuns = "/v1/reporting/report_runs"

instance RequestBuilder GetReportingReportRuns where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetReportingReportRuns{..} =
    [ "v1"
    , "reporting"
    , "report_runs"
    ]
    where
      GetReportingReportRunsParams{..} = getReportingReportRunsParams
  endpointQuery GetReportingReportRuns{..} =
    [ ("created", queryDeepObjectExplode getReportingReportRunsCreated)
    , ("ending_before", queryFormExplode getReportingReportRunsEndingBefore)
    , ("expand", queryDeepObjectExplode getReportingReportRunsExpand)
    , ("limit", queryFormExplode getReportingReportRunsLimit)
    , ("starting_after", queryFormExplode getReportingReportRunsStartingAfter)
    ]
    where
      GetReportingReportRunsParams{..} = getReportingReportRunsParams
  endpointHeaders GetReportingReportRuns{..} =
    [
    ]



{-
getReportingReportRuns :: GetReportingReportRuns
getReportingReportRuns = GetReportingReportRuns
-}
-- 
{- | <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data PostCustomersCustomerSubscriptionsSubscriptionExposedId = PostCustomersCustomerSubscriptionsSubscriptionExposedId
  { postCustomersCustomerSubscriptionsSubscriptionExposedIdParams :: PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  , postCustomersCustomerSubscriptionsSubscriptionExposedIdBody :: Maybe PostCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams = PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  {  postCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer :: (Text)
  {- ^ The identifier of the customer to subscribe. -}
  ,  postCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  {- ^ The identifier of the subscription to update. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  = PostCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerSubscriptionsSubscriptionExposedId = "POST"
type instance RequestPath PostCustomersCustomerSubscriptionsSubscriptionExposedId = "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}"

instance RequestBuilder PostCustomersCustomerSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer
    , "subscriptions"
    , pathSimple postCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams{..} = postCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  endpointQuery PostCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
postCustomersCustomerSubscriptionsSubscriptionExposedId :: PostCustomersCustomerSubscriptionsSubscriptionExposedId
postCustomersCustomerSubscriptionsSubscriptionExposedId = PostCustomersCustomerSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Retrieves the subscription with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data GetCustomersCustomerSubscriptionsSubscriptionExposedId = GetCustomersCustomerSubscriptionsSubscriptionExposedId
  { getCustomersCustomerSubscriptionsSubscriptionExposedIdParams :: GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  , getCustomersCustomerSubscriptionsSubscriptionExposedIdBody :: Maybe GetCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams = GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  {  getCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer :: (Text)
  ,  getCustomersCustomerSubscriptionsSubscriptionExposedIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  {- ^ ID of subscription to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  = GetCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerSubscriptionsSubscriptionExposedId = "GET"
type instance RequestPath GetCustomersCustomerSubscriptionsSubscriptionExposedId = "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}"

instance RequestBuilder GetCustomersCustomerSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer
    , "subscriptions"
    , pathSimple getCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams{..} = getCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  endpointQuery GetCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerSubscriptionsSubscriptionExposedIdExpand)
    ]
  endpointHeaders GetCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
getCustomersCustomerSubscriptionsSubscriptionExposedId :: GetCustomersCustomerSubscriptionsSubscriptionExposedId
getCustomersCustomerSubscriptionsSubscriptionExposedId = GetCustomersCustomerSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Cancels a customer’s subscription. If you set the <code>at_period_end</code> parameter to <code>true</code>, the subscription will remain active until the end of the period, at which point it will be canceled and not renewed. Otherwise, with the default <code>false</code> value, the subscription is terminated immediately. In either case, the customer will not be charged again for the subscription.</p>

<p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>

<p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data DeleteCustomersCustomerSubscriptionsSubscriptionExposedId = DeleteCustomersCustomerSubscriptionsSubscriptionExposedId
  { deleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams :: DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  , deleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody :: Maybe DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  {  deleteCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer :: (Text)
  ,  deleteCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  = DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerSubscriptionsSubscriptionExposedId = "DELETE"
type instance RequestPath DeleteCustomersCustomerSubscriptionsSubscriptionExposedId = "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}"

instance RequestBuilder DeleteCustomersCustomerSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerSubscriptionsSubscriptionExposedIdCustomer
    , "subscriptions"
    , pathSimple deleteCustomersCustomerSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams{..} = deleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams
  endpointQuery DeleteCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
deleteCustomersCustomerSubscriptionsSubscriptionExposedId :: DeleteCustomersCustomerSubscriptionsSubscriptionExposedId
deleteCustomersCustomerSubscriptionsSubscriptionExposedId = DeleteCustomersCustomerSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>
<p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/bank_accounts/{id}
-}
-- TODO request options as enum
data PostAccountsAccountBankAccountsId = PostAccountsAccountBankAccountsId
  { postAccountsAccountBankAccountsIdParams :: PostAccountsAccountBankAccountsIdParams
  , postAccountsAccountBankAccountsIdBody :: Maybe PostAccountsAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountBankAccountsIdParams = PostAccountsAccountBankAccountsIdParams
  {  postAccountsAccountBankAccountsIdAccount :: (Text)
  ,  postAccountsAccountBankAccountsIdId :: (Text)
  {- ^ The ID of the external account to update -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountBankAccountsIdBody
  = PostAccountsAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountBankAccountsId = "POST"
type instance RequestPath PostAccountsAccountBankAccountsId = "/v1/accounts/{account}/bank_accounts/{id}"

instance RequestBuilder PostAccountsAccountBankAccountsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountBankAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountBankAccountsIdAccount
    , "bank_accounts"
    , pathSimple postAccountsAccountBankAccountsIdId
    ]
    where
      PostAccountsAccountBankAccountsIdParams{..} = postAccountsAccountBankAccountsIdParams
  endpointQuery PostAccountsAccountBankAccountsId{..} =
    [
    ]
  endpointHeaders PostAccountsAccountBankAccountsId{..} =
    [
    ]



{-
postAccountsAccountBankAccountsId :: PostAccountsAccountBankAccountsId
postAccountsAccountBankAccountsId = PostAccountsAccountBankAccountsId
-}
-- 
{- | <p>Retrieve a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/bank_accounts/{id}
-}
-- TODO request options as enum
data GetAccountsAccountBankAccountsId = GetAccountsAccountBankAccountsId
  { getAccountsAccountBankAccountsIdParams :: GetAccountsAccountBankAccountsIdParams
  , getAccountsAccountBankAccountsIdBody :: Maybe GetAccountsAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountBankAccountsIdParams = GetAccountsAccountBankAccountsIdParams
  {  getAccountsAccountBankAccountsIdAccount :: (Text)
  ,  getAccountsAccountBankAccountsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountBankAccountsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data GetAccountsAccountBankAccountsIdBody
  = GetAccountsAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountBankAccountsId = "GET"
type instance RequestPath GetAccountsAccountBankAccountsId = "/v1/accounts/{account}/bank_accounts/{id}"

instance RequestBuilder GetAccountsAccountBankAccountsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountBankAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountBankAccountsIdAccount
    , "bank_accounts"
    , pathSimple getAccountsAccountBankAccountsIdId
    ]
    where
      GetAccountsAccountBankAccountsIdParams{..} = getAccountsAccountBankAccountsIdParams
  endpointQuery GetAccountsAccountBankAccountsId{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountBankAccountsIdExpand)
    ]
  endpointHeaders GetAccountsAccountBankAccountsId{..} =
    [
    ]



{-
getAccountsAccountBankAccountsId :: GetAccountsAccountBankAccountsId
getAccountsAccountBankAccountsId = GetAccountsAccountBankAccountsId
-}
-- 
{- | <p>Delete a specified external account for a given account.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/accounts/{account}/bank_accounts/{id}
-}
-- TODO request options as enum
data DeleteAccountsAccountBankAccountsId = DeleteAccountsAccountBankAccountsId
  { deleteAccountsAccountBankAccountsIdParams :: DeleteAccountsAccountBankAccountsIdParams
  , deleteAccountsAccountBankAccountsIdBody :: Maybe DeleteAccountsAccountBankAccountsIdBody
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountBankAccountsIdParams = DeleteAccountsAccountBankAccountsIdParams
  {  deleteAccountsAccountBankAccountsIdAccount :: (Text)
  ,  deleteAccountsAccountBankAccountsIdId :: (Text)
  {- ^ The ID of the external account to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountBankAccountsIdBody
  = DeleteAccountsAccountBankAccountsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountsAccountBankAccountsId = "DELETE"
type instance RequestPath DeleteAccountsAccountBankAccountsId = "/v1/accounts/{account}/bank_accounts/{id}"

instance RequestBuilder DeleteAccountsAccountBankAccountsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountsAccountBankAccountsId{..} =
    [ "v1"
    , "accounts"
    , pathSimple deleteAccountsAccountBankAccountsIdAccount
    , "bank_accounts"
    , pathSimple deleteAccountsAccountBankAccountsIdId
    ]
    where
      DeleteAccountsAccountBankAccountsIdParams{..} = deleteAccountsAccountBankAccountsIdParams
  endpointQuery DeleteAccountsAccountBankAccountsId{..} =
    [
    ]
  endpointHeaders DeleteAccountsAccountBankAccountsId{..} =
    [
    ]



{-
deleteAccountsAccountBankAccountsId :: DeleteAccountsAccountBankAccountsId
deleteAccountsAccountBankAccountsId = DeleteAccountsAccountBankAccountsId
-}
-- 
{- | <p>List bitcoin transacitons for a given receiver.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/bitcoin/receivers/{receiver}/transactions
-}
-- TODO request options as enum
data GetBitcoinReceiversReceiverTransactions = GetBitcoinReceiversReceiverTransactions
  { getBitcoinReceiversReceiverTransactionsParams :: GetBitcoinReceiversReceiverTransactionsParams
  , getBitcoinReceiversReceiverTransactionsBody :: Maybe GetBitcoinReceiversReceiverTransactionsBody
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversReceiverTransactionsParams = GetBitcoinReceiversReceiverTransactionsParams
  {  getBitcoinReceiversReceiverTransactionsCustomer :: Maybe (Text)
  {- ^ Only return transactions for the customer specified by this customer ID. -}
  ,  getBitcoinReceiversReceiverTransactionsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getBitcoinReceiversReceiverTransactionsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBitcoinReceiversReceiverTransactionsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getBitcoinReceiversReceiverTransactionsReceiver :: (Text)
  {- ^ Only return transactions for the receiver specified by this receiver ID. -}
  ,  getBitcoinReceiversReceiverTransactionsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversReceiverTransactionsBody
  = GetBitcoinReceiversReceiverTransactionsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBitcoinReceiversReceiverTransactions = "GET"
type instance RequestPath GetBitcoinReceiversReceiverTransactions = "/v1/bitcoin/receivers/{receiver}/transactions"

instance RequestBuilder GetBitcoinReceiversReceiverTransactions where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBitcoinReceiversReceiverTransactions{..} =
    [ "v1"
    , "bitcoin"
    , "receivers"
    , pathSimple getBitcoinReceiversReceiverTransactionsReceiver
    , "transactions"
    ]
    where
      GetBitcoinReceiversReceiverTransactionsParams{..} = getBitcoinReceiversReceiverTransactionsParams
  endpointQuery GetBitcoinReceiversReceiverTransactions{..} =
    [ ("customer", queryFormExplode getBitcoinReceiversReceiverTransactionsCustomer)
    , ("ending_before", queryFormExplode getBitcoinReceiversReceiverTransactionsEndingBefore)
    , ("expand", queryDeepObjectExplode getBitcoinReceiversReceiverTransactionsExpand)
    , ("limit", queryFormExplode getBitcoinReceiversReceiverTransactionsLimit)
    , ("starting_after", queryFormExplode getBitcoinReceiversReceiverTransactionsStartingAfter)
    ]
    where
      GetBitcoinReceiversReceiverTransactionsParams{..} = getBitcoinReceiversReceiverTransactionsParams
  endpointHeaders GetBitcoinReceiversReceiverTransactions{..} =
    [
    ]



{-
getBitcoinReceiversReceiverTransactions :: GetBitcoinReceiversReceiverTransactions
getBitcoinReceiversReceiverTransactions = GetBitcoinReceiversReceiverTransactions
-}
-- {-# DEPRECATED getBitcoinReceiversReceiverTransactions, GetBitcoinReceiversReceiverTransactions "This endpoint is deprecated by the API creator" #-}
{- | <p>Updates the specified Issuing <code>Authorization</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/issuing/authorizations/{authorization}
-}
-- TODO request options as enum
data PostIssuingAuthorizationsAuthorization = PostIssuingAuthorizationsAuthorization
  { postIssuingAuthorizationsAuthorizationParams :: PostIssuingAuthorizationsAuthorizationParams
  , postIssuingAuthorizationsAuthorizationBody :: Maybe PostIssuingAuthorizationsAuthorizationBody
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationParams = PostIssuingAuthorizationsAuthorizationParams
  {  postIssuingAuthorizationsAuthorizationAuthorization :: (Text)
  {- ^ The identifier of the authorization to update. -}
  } deriving (Show, Eq, Generic)

data PostIssuingAuthorizationsAuthorizationBody
  = PostIssuingAuthorizationsAuthorizationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostIssuingAuthorizationsAuthorization = "POST"
type instance RequestPath PostIssuingAuthorizationsAuthorization = "/v1/issuing/authorizations/{authorization}"

instance RequestBuilder PostIssuingAuthorizationsAuthorization where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostIssuingAuthorizationsAuthorization{..} =
    [ "v1"
    , "issuing"
    , "authorizations"
    , pathSimple postIssuingAuthorizationsAuthorizationAuthorization
    ]
    where
      PostIssuingAuthorizationsAuthorizationParams{..} = postIssuingAuthorizationsAuthorizationParams
  endpointQuery PostIssuingAuthorizationsAuthorization{..} =
    [
    ]
  endpointHeaders PostIssuingAuthorizationsAuthorization{..} =
    [
    ]



{-
postIssuingAuthorizationsAuthorization :: PostIssuingAuthorizationsAuthorization
postIssuingAuthorizationsAuthorization = PostIssuingAuthorizationsAuthorization
-}
-- 
{- | <p>Retrieves an Issuing <code>Authorization</code> object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/issuing/authorizations/{authorization}
-}
-- TODO request options as enum
data GetIssuingAuthorizationsAuthorization = GetIssuingAuthorizationsAuthorization
  { getIssuingAuthorizationsAuthorizationParams :: GetIssuingAuthorizationsAuthorizationParams
  , getIssuingAuthorizationsAuthorizationBody :: Maybe GetIssuingAuthorizationsAuthorizationBody
  } deriving (Show, Eq, Generic)

data GetIssuingAuthorizationsAuthorizationParams = GetIssuingAuthorizationsAuthorizationParams
  {  getIssuingAuthorizationsAuthorizationAuthorization :: (Text)
  {- ^ The ID of the authorization to retrieve. -}
  ,  getIssuingAuthorizationsAuthorizationExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetIssuingAuthorizationsAuthorizationBody
  = GetIssuingAuthorizationsAuthorizationBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetIssuingAuthorizationsAuthorization = "GET"
type instance RequestPath GetIssuingAuthorizationsAuthorization = "/v1/issuing/authorizations/{authorization}"

instance RequestBuilder GetIssuingAuthorizationsAuthorization where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetIssuingAuthorizationsAuthorization{..} =
    [ "v1"
    , "issuing"
    , "authorizations"
    , pathSimple getIssuingAuthorizationsAuthorizationAuthorization
    ]
    where
      GetIssuingAuthorizationsAuthorizationParams{..} = getIssuingAuthorizationsAuthorizationParams
  endpointQuery GetIssuingAuthorizationsAuthorization{..} =
    [ ("expand", queryDeepObjectExplode getIssuingAuthorizationsAuthorizationExpand)
    ]
  endpointHeaders GetIssuingAuthorizationsAuthorization{..} =
    [
    ]



{-
getIssuingAuthorizationsAuthorization :: GetIssuingAuthorizationsAuthorization
getIssuingAuthorizationsAuthorization = GetIssuingAuthorizationsAuthorization
-}
-- 
{- | <p>Retrieves the Bitcoin receiver with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/bitcoin/receivers/{id}
-}
-- TODO request options as enum
data GetBitcoinReceiversId = GetBitcoinReceiversId
  { getBitcoinReceiversIdParams :: GetBitcoinReceiversIdParams
  , getBitcoinReceiversIdBody :: Maybe GetBitcoinReceiversIdBody
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversIdParams = GetBitcoinReceiversIdParams
  {  getBitcoinReceiversIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBitcoinReceiversIdId :: (Text)
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversIdBody
  = GetBitcoinReceiversIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBitcoinReceiversId = "GET"
type instance RequestPath GetBitcoinReceiversId = "/v1/bitcoin/receivers/{id}"

instance RequestBuilder GetBitcoinReceiversId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBitcoinReceiversId{..} =
    [ "v1"
    , "bitcoin"
    , "receivers"
    , pathSimple getBitcoinReceiversIdId
    ]
    where
      GetBitcoinReceiversIdParams{..} = getBitcoinReceiversIdParams
  endpointQuery GetBitcoinReceiversId{..} =
    [ ("expand", queryDeepObjectExplode getBitcoinReceiversIdExpand)
    ]
  endpointHeaders GetBitcoinReceiversId{..} =
    [
    ]



{-
getBitcoinReceiversId :: GetBitcoinReceiversId
getBitcoinReceiversId = GetBitcoinReceiversId
-}
-- {-# DEPRECATED getBitcoinReceiversId, GetBitcoinReceiversId "This endpoint is deprecated by the API creator" #-}
{- | <p>Creates a new SKU associated with a product.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/skus
-}
-- TODO request options as enum
data PostSkus = PostSkus
  { postSkusParams :: PostSkusParams
  , postSkusBody :: PostSkusBody
  } deriving (Show, Eq, Generic)

data PostSkusParams = PostSkusParams
  {
  } deriving (Show, Eq, Generic)

data PostSkusBody
  = PostSkusBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSkus = "POST"
type instance RequestPath PostSkus = "/v1/skus"

instance RequestBuilder PostSkus where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSkus{..} =
    [ "v1"
    , "skus"
    ]
    where
      PostSkusParams = postSkusParams
  endpointQuery PostSkus{..} =
    [
    ]
  endpointHeaders PostSkus{..} =
    [
    ]



{-
postSkus :: PostSkus
postSkus = PostSkus
-}
-- 
{- | <p>Returns a list of your SKUs. The SKUs are returned sorted by creation date, with the most recently created SKUs appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/skus
-}
-- TODO request options as enum
data GetSkus = GetSkus
  { getSkusParams :: GetSkusParams
  , getSkusBody :: Maybe GetSkusBody
  } deriving (Show, Eq, Generic)

data GetSkusParams = GetSkusParams
  {  getSkusActive :: Maybe (Bool)
  {- ^ Only return SKUs that are active or inactive (e.g., pass `false` to list all inactive products). -}
  ,  getSkusAttributes :: Maybe (Object)
  {- ^ Only return SKUs that have the specified key-value pairs in this partially constructed dictionary. Can be specified only if `product` is also supplied. For instance, if the associated product has attributes `["color", "size"]`, passing in `attributes[color]=red` returns all the SKUs for this product that have `color` set to `red`. -}
  ,  getSkusEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getSkusExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSkusIds :: Maybe (Vector (Text))
  {- ^ Only return SKUs with the given IDs. -}
  ,  getSkusInStock :: Maybe (Bool)
  {- ^ Only return SKUs that are either in stock or out of stock (e.g., pass `false` to list all SKUs that are out of stock). If no value is provided, all SKUs are returned. -}
  ,  getSkusLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getSkusProduct :: Maybe (Text)
  {- ^ The ID of the product whose SKUs will be retrieved. Must be a product with type `good`. -}
  ,  getSkusStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetSkusBody
  = GetSkusBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSkus = "GET"
type instance RequestPath GetSkus = "/v1/skus"

instance RequestBuilder GetSkus where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSkus{..} =
    [ "v1"
    , "skus"
    ]
    where
      GetSkusParams{..} = getSkusParams
  endpointQuery GetSkus{..} =
    [ ("active", queryFormExplode getSkusActive)
    , ("attributes", queryDeepObjectExplode getSkusAttributes)
    , ("ending_before", queryFormExplode getSkusEndingBefore)
    , ("expand", queryDeepObjectExplode getSkusExpand)
    , ("ids", queryDeepObjectExplode getSkusIds)
    , ("in_stock", queryFormExplode getSkusInStock)
    , ("limit", queryFormExplode getSkusLimit)
    , ("product", queryFormExplode getSkusProduct)
    , ("starting_after", queryFormExplode getSkusStartingAfter)
    ]
    where
      GetSkusParams{..} = getSkusParams
  endpointHeaders GetSkus{..} =
    [
    ]



{-
getSkus :: GetSkus
getSkus = GetSkus
-}
-- 
{- | <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data PostSubscriptionsSubscriptionExposedId = PostSubscriptionsSubscriptionExposedId
  { postSubscriptionsSubscriptionExposedIdParams :: PostSubscriptionsSubscriptionExposedIdParams
  , postSubscriptionsSubscriptionExposedIdBody :: Maybe PostSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data PostSubscriptionsSubscriptionExposedIdParams = PostSubscriptionsSubscriptionExposedIdParams
  {  postSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data PostSubscriptionsSubscriptionExposedIdBody
  = PostSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostSubscriptionsSubscriptionExposedId = "POST"
type instance RequestPath PostSubscriptionsSubscriptionExposedId = "/v1/subscriptions/{subscription_exposed_id}"

instance RequestBuilder PostSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "subscriptions"
    , pathSimple postSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      PostSubscriptionsSubscriptionExposedIdParams{..} = postSubscriptionsSubscriptionExposedIdParams
  endpointQuery PostSubscriptionsSubscriptionExposedId{..} =
    [
    ]
  endpointHeaders PostSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
postSubscriptionsSubscriptionExposedId :: PostSubscriptionsSubscriptionExposedId
postSubscriptionsSubscriptionExposedId = PostSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Retrieves the subscription with the given ID.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data GetSubscriptionsSubscriptionExposedId = GetSubscriptionsSubscriptionExposedId
  { getSubscriptionsSubscriptionExposedIdParams :: GetSubscriptionsSubscriptionExposedIdParams
  , getSubscriptionsSubscriptionExposedIdBody :: Maybe GetSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data GetSubscriptionsSubscriptionExposedIdParams = GetSubscriptionsSubscriptionExposedIdParams
  {  getSubscriptionsSubscriptionExposedIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data GetSubscriptionsSubscriptionExposedIdBody
  = GetSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSubscriptionsSubscriptionExposedId = "GET"
type instance RequestPath GetSubscriptionsSubscriptionExposedId = "/v1/subscriptions/{subscription_exposed_id}"

instance RequestBuilder GetSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "subscriptions"
    , pathSimple getSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      GetSubscriptionsSubscriptionExposedIdParams{..} = getSubscriptionsSubscriptionExposedIdParams
  endpointQuery GetSubscriptionsSubscriptionExposedId{..} =
    [ ("expand", queryDeepObjectExplode getSubscriptionsSubscriptionExposedIdExpand)
    ]
  endpointHeaders GetSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
getSubscriptionsSubscriptionExposedId :: GetSubscriptionsSubscriptionExposedId
getSubscriptionsSubscriptionExposedId = GetSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.</p>

<p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>

<p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/subscriptions/{subscription_exposed_id}
-}
-- TODO request options as enum
data DeleteSubscriptionsSubscriptionExposedId = DeleteSubscriptionsSubscriptionExposedId
  { deleteSubscriptionsSubscriptionExposedIdParams :: DeleteSubscriptionsSubscriptionExposedIdParams
  , deleteSubscriptionsSubscriptionExposedIdBody :: Maybe DeleteSubscriptionsSubscriptionExposedIdBody
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionsSubscriptionExposedIdParams = DeleteSubscriptionsSubscriptionExposedIdParams
  {  deleteSubscriptionsSubscriptionExposedIdSubscriptionExposedId :: (Text)
  } deriving (Show, Eq, Generic)

data DeleteSubscriptionsSubscriptionExposedIdBody
  = DeleteSubscriptionsSubscriptionExposedIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteSubscriptionsSubscriptionExposedId = "DELETE"
type instance RequestPath DeleteSubscriptionsSubscriptionExposedId = "/v1/subscriptions/{subscription_exposed_id}"

instance RequestBuilder DeleteSubscriptionsSubscriptionExposedId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteSubscriptionsSubscriptionExposedId{..} =
    [ "v1"
    , "subscriptions"
    , pathSimple deleteSubscriptionsSubscriptionExposedIdSubscriptionExposedId
    ]
    where
      DeleteSubscriptionsSubscriptionExposedIdParams{..} = deleteSubscriptionsSubscriptionExposedIdParams
  endpointQuery DeleteSubscriptionsSubscriptionExposedId{..} =
    [
    ]
  endpointHeaders DeleteSubscriptionsSubscriptionExposedId{..} =
    [
    ]



{-
deleteSubscriptionsSubscriptionExposedId :: DeleteSubscriptionsSubscriptionExposedId
deleteSubscriptionsSubscriptionExposedId = DeleteSubscriptionsSubscriptionExposedId
-}
-- 
{- | <p>Most customer balance transaction fields are immutable, but you may update its <code>description</code> and <code>metadata</code>.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/balance_transactions/{transaction}
-}
-- TODO request options as enum
data PostCustomersCustomerBalanceTransactionsTransaction = PostCustomersCustomerBalanceTransactionsTransaction
  { postCustomersCustomerBalanceTransactionsTransactionParams :: PostCustomersCustomerBalanceTransactionsTransactionParams
  , postCustomersCustomerBalanceTransactionsTransactionBody :: Maybe PostCustomersCustomerBalanceTransactionsTransactionBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBalanceTransactionsTransactionParams = PostCustomersCustomerBalanceTransactionsTransactionParams
  {  postCustomersCustomerBalanceTransactionsTransactionCustomer :: (Text)
  {- ^ The customer the transaction belongs to. -}
  ,  postCustomersCustomerBalanceTransactionsTransactionTransaction :: (Text)
  {- ^ The transaction to update. -}
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerBalanceTransactionsTransactionBody
  = PostCustomersCustomerBalanceTransactionsTransactionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerBalanceTransactionsTransaction = "POST"
type instance RequestPath PostCustomersCustomerBalanceTransactionsTransaction = "/v1/customers/{customer}/balance_transactions/{transaction}"

instance RequestBuilder PostCustomersCustomerBalanceTransactionsTransaction where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerBalanceTransactionsTransaction{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerBalanceTransactionsTransactionCustomer
    , "balance_transactions"
    , pathSimple postCustomersCustomerBalanceTransactionsTransactionTransaction
    ]
    where
      PostCustomersCustomerBalanceTransactionsTransactionParams{..} = postCustomersCustomerBalanceTransactionsTransactionParams
  endpointQuery PostCustomersCustomerBalanceTransactionsTransaction{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerBalanceTransactionsTransaction{..} =
    [
    ]



{-
postCustomersCustomerBalanceTransactionsTransaction :: PostCustomersCustomerBalanceTransactionsTransaction
postCustomersCustomerBalanceTransactionsTransaction = PostCustomersCustomerBalanceTransactionsTransaction
-}
-- 
{- | <p>Retrieves a specific transaction that updated the customer’s <a href="/docs/api/customers/object#customer_object-balance"><code>balance</code></a>.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/balance_transactions/{transaction}
-}
-- TODO request options as enum
data GetCustomersCustomerBalanceTransactionsTransaction = GetCustomersCustomerBalanceTransactionsTransaction
  { getCustomersCustomerBalanceTransactionsTransactionParams :: GetCustomersCustomerBalanceTransactionsTransactionParams
  , getCustomersCustomerBalanceTransactionsTransactionBody :: Maybe GetCustomersCustomerBalanceTransactionsTransactionBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBalanceTransactionsTransactionParams = GetCustomersCustomerBalanceTransactionsTransactionParams
  {  getCustomersCustomerBalanceTransactionsTransactionCustomer :: (Text)
  {- ^ The customer the transaction belongs to. -}
  ,  getCustomersCustomerBalanceTransactionsTransactionExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerBalanceTransactionsTransactionTransaction :: (Text)
  {- ^ The transaction to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerBalanceTransactionsTransactionBody
  = GetCustomersCustomerBalanceTransactionsTransactionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerBalanceTransactionsTransaction = "GET"
type instance RequestPath GetCustomersCustomerBalanceTransactionsTransaction = "/v1/customers/{customer}/balance_transactions/{transaction}"

instance RequestBuilder GetCustomersCustomerBalanceTransactionsTransaction where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerBalanceTransactionsTransaction{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerBalanceTransactionsTransactionCustomer
    , "balance_transactions"
    , pathSimple getCustomersCustomerBalanceTransactionsTransactionTransaction
    ]
    where
      GetCustomersCustomerBalanceTransactionsTransactionParams{..} = getCustomersCustomerBalanceTransactionsTransactionParams
  endpointQuery GetCustomersCustomerBalanceTransactionsTransaction{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerBalanceTransactionsTransactionExpand)
    ]
  endpointHeaders GetCustomersCustomerBalanceTransactionsTransaction{..} =
    [
    ]



{-
getCustomersCustomerBalanceTransactionsTransaction :: GetCustomersCustomerBalanceTransactionsTransaction
getCustomersCustomerBalanceTransactionsTransaction = GetCustomersCustomerBalanceTransactionsTransaction
-}
-- 
{- | <p>To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection token from Stripe, proxied through your server. On your backend, add an endpoint that creates and returns a connection token.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/terminal/connection_tokens
-}
-- TODO request options as enum
data PostTerminalConnectionTokens = PostTerminalConnectionTokens
  { postTerminalConnectionTokensParams :: PostTerminalConnectionTokensParams
  , postTerminalConnectionTokensBody :: Maybe PostTerminalConnectionTokensBody
  } deriving (Show, Eq, Generic)

data PostTerminalConnectionTokensParams = PostTerminalConnectionTokensParams
  {
  } deriving (Show, Eq, Generic)

data PostTerminalConnectionTokensBody
  = PostTerminalConnectionTokensBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostTerminalConnectionTokens = "POST"
type instance RequestPath PostTerminalConnectionTokens = "/v1/terminal/connection_tokens"

instance RequestBuilder PostTerminalConnectionTokens where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostTerminalConnectionTokens{..} =
    [ "v1"
    , "terminal"
    , "connection_tokens"
    ]
    where
      PostTerminalConnectionTokensParams = postTerminalConnectionTokensParams
  endpointQuery PostTerminalConnectionTokens{..} =
    [
    ]
  endpointHeaders PostTerminalConnectionTokens{..} =
    [
    ]



{-
postTerminalConnectionTokens :: PostTerminalConnectionTokens
postTerminalConnectionTokens = PostTerminalConnectionTokens
-}
-- 
{- | 

> -- Equivalent to the following API endpoint:
> POST /v1/charges/{charge}/dispute
-}
-- TODO request options as enum
data PostChargesChargeDispute = PostChargesChargeDispute
  { postChargesChargeDisputeParams :: PostChargesChargeDisputeParams
  , postChargesChargeDisputeBody :: Maybe PostChargesChargeDisputeBody
  } deriving (Show, Eq, Generic)

data PostChargesChargeDisputeParams = PostChargesChargeDisputeParams
  {  postChargesChargeDisputeCharge :: (Text)
  } deriving (Show, Eq, Generic)

data PostChargesChargeDisputeBody
  = PostChargesChargeDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostChargesChargeDispute = "POST"
type instance RequestPath PostChargesChargeDispute = "/v1/charges/{charge}/dispute"

instance RequestBuilder PostChargesChargeDispute where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostChargesChargeDispute{..} =
    [ "v1"
    , "charges"
    , pathSimple postChargesChargeDisputeCharge
    , "dispute"
    ]
    where
      PostChargesChargeDisputeParams{..} = postChargesChargeDisputeParams
  endpointQuery PostChargesChargeDispute{..} =
    [
    ]
  endpointHeaders PostChargesChargeDispute{..} =
    [
    ]



{-
postChargesChargeDispute :: PostChargesChargeDispute
postChargesChargeDispute = PostChargesChargeDispute
-}
-- 
{- | <p>Retrieve a dispute for a specified charge.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/charges/{charge}/dispute
-}
-- TODO request options as enum
data GetChargesChargeDispute = GetChargesChargeDispute
  { getChargesChargeDisputeParams :: GetChargesChargeDisputeParams
  , getChargesChargeDisputeBody :: Maybe GetChargesChargeDisputeBody
  } deriving (Show, Eq, Generic)

data GetChargesChargeDisputeParams = GetChargesChargeDisputeParams
  {  getChargesChargeDisputeCharge :: (Text)
  ,  getChargesChargeDisputeExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  } deriving (Show, Eq, Generic)

data GetChargesChargeDisputeBody
  = GetChargesChargeDisputeBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetChargesChargeDispute = "GET"
type instance RequestPath GetChargesChargeDispute = "/v1/charges/{charge}/dispute"

instance RequestBuilder GetChargesChargeDispute where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetChargesChargeDispute{..} =
    [ "v1"
    , "charges"
    , pathSimple getChargesChargeDisputeCharge
    , "dispute"
    ]
    where
      GetChargesChargeDisputeParams{..} = getChargesChargeDisputeParams
  endpointQuery GetChargesChargeDispute{..} =
    [ ("expand", queryDeepObjectExplode getChargesChargeDisputeExpand)
    ]
  endpointHeaders GetChargesChargeDispute{..} =
    [
    ]



{-
getChargesChargeDispute :: GetChargesChargeDispute
getChargesChargeDispute = GetChargesChargeDispute
-}
-- 
{- | <p>Returns a list of your receivers. Receivers are returned sorted by creation date, with the most recently created receivers appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/bitcoin/receivers
-}
-- TODO request options as enum
data GetBitcoinReceivers = GetBitcoinReceivers
  { getBitcoinReceiversParams :: GetBitcoinReceiversParams
  , getBitcoinReceiversBody :: Maybe GetBitcoinReceiversBody
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversParams = GetBitcoinReceiversParams
  {  getBitcoinReceiversActive :: Maybe (Bool)
  {- ^ Filter for active receivers. -}
  ,  getBitcoinReceiversEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getBitcoinReceiversExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getBitcoinReceiversFilled :: Maybe (Bool)
  {- ^ Filter for filled receivers. -}
  ,  getBitcoinReceiversLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getBitcoinReceiversStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getBitcoinReceiversUncapturedFunds :: Maybe (Bool)
  {- ^ Filter for receivers with uncaptured funds. -}
  } deriving (Show, Eq, Generic)

data GetBitcoinReceiversBody
  = GetBitcoinReceiversBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetBitcoinReceivers = "GET"
type instance RequestPath GetBitcoinReceivers = "/v1/bitcoin/receivers"

instance RequestBuilder GetBitcoinReceivers where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetBitcoinReceivers{..} =
    [ "v1"
    , "bitcoin"
    , "receivers"
    ]
    where
      GetBitcoinReceiversParams{..} = getBitcoinReceiversParams
  endpointQuery GetBitcoinReceivers{..} =
    [ ("active", queryFormExplode getBitcoinReceiversActive)
    , ("ending_before", queryFormExplode getBitcoinReceiversEndingBefore)
    , ("expand", queryDeepObjectExplode getBitcoinReceiversExpand)
    , ("filled", queryFormExplode getBitcoinReceiversFilled)
    , ("limit", queryFormExplode getBitcoinReceiversLimit)
    , ("starting_after", queryFormExplode getBitcoinReceiversStartingAfter)
    , ("uncaptured_funds", queryFormExplode getBitcoinReceiversUncapturedFunds)
    ]
    where
      GetBitcoinReceiversParams{..} = getBitcoinReceiversParams
  endpointHeaders GetBitcoinReceivers{..} =
    [
    ]



{-
getBitcoinReceivers :: GetBitcoinReceivers
getBitcoinReceivers = GetBitcoinReceivers
-}
-- {-# DEPRECATED getBitcoinReceivers, GetBitcoinReceivers "This endpoint is deprecated by the API creator" #-}
{- | <p>Retrieves the details of an existing order return. Supply the unique order ID from either an order return creation request or the order return list, and Stripe will return the corresponding order information.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/order_returns/{id}
-}
-- TODO request options as enum
data GetOrderReturnsId = GetOrderReturnsId
  { getOrderReturnsIdParams :: GetOrderReturnsIdParams
  , getOrderReturnsIdBody :: Maybe GetOrderReturnsIdBody
  } deriving (Show, Eq, Generic)

data GetOrderReturnsIdParams = GetOrderReturnsIdParams
  {  getOrderReturnsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getOrderReturnsIdId :: (Text)
  {- ^ The identifier of the order return to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetOrderReturnsIdBody
  = GetOrderReturnsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetOrderReturnsId = "GET"
type instance RequestPath GetOrderReturnsId = "/v1/order_returns/{id}"

instance RequestBuilder GetOrderReturnsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetOrderReturnsId{..} =
    [ "v1"
    , "order_returns"
    , pathSimple getOrderReturnsIdId
    ]
    where
      GetOrderReturnsIdParams{..} = getOrderReturnsIdParams
  endpointQuery GetOrderReturnsId{..} =
    [ ("expand", queryDeepObjectExplode getOrderReturnsIdExpand)
    ]
  endpointHeaders GetOrderReturnsId{..} =
    [
    ]



{-
getOrderReturnsId :: GetOrderReturnsId
getOrderReturnsId = GetOrderReturnsId
-}
-- 
{- | <p>Retrieves the details of an scheduled query run.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/sigma/scheduled_query_runs/{scheduled_query_run}
-}
-- TODO request options as enum
data GetSigmaScheduledQueryRunsScheduledQueryRun = GetSigmaScheduledQueryRunsScheduledQueryRun
  { getSigmaScheduledQueryRunsScheduledQueryRunParams :: GetSigmaScheduledQueryRunsScheduledQueryRunParams
  , getSigmaScheduledQueryRunsScheduledQueryRunBody :: Maybe GetSigmaScheduledQueryRunsScheduledQueryRunBody
  } deriving (Show, Eq, Generic)

data GetSigmaScheduledQueryRunsScheduledQueryRunParams = GetSigmaScheduledQueryRunsScheduledQueryRunParams
  {  getSigmaScheduledQueryRunsScheduledQueryRunExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getSigmaScheduledQueryRunsScheduledQueryRunScheduledQueryRun :: (Text)
  {- ^ Unique identifier for the object. -}
  } deriving (Show, Eq, Generic)

data GetSigmaScheduledQueryRunsScheduledQueryRunBody
  = GetSigmaScheduledQueryRunsScheduledQueryRunBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetSigmaScheduledQueryRunsScheduledQueryRun = "GET"
type instance RequestPath GetSigmaScheduledQueryRunsScheduledQueryRun = "/v1/sigma/scheduled_query_runs/{scheduled_query_run}"

instance RequestBuilder GetSigmaScheduledQueryRunsScheduledQueryRun where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetSigmaScheduledQueryRunsScheduledQueryRun{..} =
    [ "v1"
    , "sigma"
    , "scheduled_query_runs"
    , pathSimple getSigmaScheduledQueryRunsScheduledQueryRunScheduledQueryRun
    ]
    where
      GetSigmaScheduledQueryRunsScheduledQueryRunParams{..} = getSigmaScheduledQueryRunsScheduledQueryRunParams
  endpointQuery GetSigmaScheduledQueryRunsScheduledQueryRun{..} =
    [ ("expand", queryDeepObjectExplode getSigmaScheduledQueryRunsScheduledQueryRunExpand)
    ]
  endpointHeaders GetSigmaScheduledQueryRunsScheduledQueryRun{..} =
    [
    ]



{-
getSigmaScheduledQueryRunsScheduledQueryRun :: GetSigmaScheduledQueryRunsScheduledQueryRun
getSigmaScheduledQueryRunsScheduledQueryRun = GetSigmaScheduledQueryRunsScheduledQueryRun
-}
-- 
{- | <p>Updates an existing person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/persons/{person}
-}
-- TODO request options as enum
data PostAccountsAccountPersonsPerson = PostAccountsAccountPersonsPerson
  { postAccountsAccountPersonsPersonParams :: PostAccountsAccountPersonsPersonParams
  , postAccountsAccountPersonsPersonBody :: Maybe PostAccountsAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPersonsPersonParams = PostAccountsAccountPersonsPersonParams
  {  postAccountsAccountPersonsPersonAccount :: (Text)
  {- ^ The account that the person is associated with. -}
  ,  postAccountsAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of a person to update. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPersonsPersonBody
  = PostAccountsAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountPersonsPerson = "POST"
type instance RequestPath PostAccountsAccountPersonsPerson = "/v1/accounts/{account}/persons/{person}"

instance RequestBuilder PostAccountsAccountPersonsPerson where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountPersonsPerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountPersonsPersonAccount
    , "persons"
    , pathSimple postAccountsAccountPersonsPersonPerson
    ]
    where
      PostAccountsAccountPersonsPersonParams{..} = postAccountsAccountPersonsPersonParams
  endpointQuery PostAccountsAccountPersonsPerson{..} =
    [
    ]
  endpointHeaders PostAccountsAccountPersonsPerson{..} =
    [
    ]



{-
postAccountsAccountPersonsPerson :: PostAccountsAccountPersonsPerson
postAccountsAccountPersonsPerson = PostAccountsAccountPersonsPerson
-}
-- 
{- | <p>Retrieves an existing person.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/persons/{person}
-}
-- TODO request options as enum
data GetAccountsAccountPersonsPerson = GetAccountsAccountPersonsPerson
  { getAccountsAccountPersonsPersonParams :: GetAccountsAccountPersonsPersonParams
  , getAccountsAccountPersonsPersonBody :: Maybe GetAccountsAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPersonsPersonParams = GetAccountsAccountPersonsPersonParams
  {  getAccountsAccountPersonsPersonAccount :: (Text)
  ,  getAccountsAccountPersonsPersonExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of a person to retrieve. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPersonsPersonBody
  = GetAccountsAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountPersonsPerson = "GET"
type instance RequestPath GetAccountsAccountPersonsPerson = "/v1/accounts/{account}/persons/{person}"

instance RequestBuilder GetAccountsAccountPersonsPerson where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountPersonsPerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountPersonsPersonAccount
    , "persons"
    , pathSimple getAccountsAccountPersonsPersonPerson
    ]
    where
      GetAccountsAccountPersonsPersonParams{..} = getAccountsAccountPersonsPersonParams
  endpointQuery GetAccountsAccountPersonsPerson{..} =
    [ ("expand", queryDeepObjectExplode getAccountsAccountPersonsPersonExpand)
    ]
  endpointHeaders GetAccountsAccountPersonsPerson{..} =
    [
    ]



{-
getAccountsAccountPersonsPerson :: GetAccountsAccountPersonsPerson
getAccountsAccountPersonsPerson = GetAccountsAccountPersonsPerson
-}
-- 
{- | <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/accounts/{account}/persons/{person}
-}
-- TODO request options as enum
data DeleteAccountsAccountPersonsPerson = DeleteAccountsAccountPersonsPerson
  { deleteAccountsAccountPersonsPersonParams :: DeleteAccountsAccountPersonsPersonParams
  , deleteAccountsAccountPersonsPersonBody :: Maybe DeleteAccountsAccountPersonsPersonBody
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountPersonsPersonParams = DeleteAccountsAccountPersonsPersonParams
  {  deleteAccountsAccountPersonsPersonAccount :: (Text)
  ,  deleteAccountsAccountPersonsPersonPerson :: (Text)
  {- ^ The ID of the person to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteAccountsAccountPersonsPersonBody
  = DeleteAccountsAccountPersonsPersonBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteAccountsAccountPersonsPerson = "DELETE"
type instance RequestPath DeleteAccountsAccountPersonsPerson = "/v1/accounts/{account}/persons/{person}"

instance RequestBuilder DeleteAccountsAccountPersonsPerson where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteAccountsAccountPersonsPerson{..} =
    [ "v1"
    , "accounts"
    , pathSimple deleteAccountsAccountPersonsPersonAccount
    , "persons"
    , pathSimple deleteAccountsAccountPersonsPersonPerson
    ]
    where
      DeleteAccountsAccountPersonsPersonParams{..} = deleteAccountsAccountPersonsPersonParams
  endpointQuery DeleteAccountsAccountPersonsPerson{..} =
    [
    ]
  endpointHeaders DeleteAccountsAccountPersonsPerson{..} =
    [
    ]



{-
deleteAccountsAccountPersonsPerson :: DeleteAccountsAccountPersonsPerson
deleteAccountsAccountPersonsPerson = DeleteAccountsAccountPersonsPerson
-}
-- 
{- | <p>With <a href="/docs/connect">Connect</a>, you may flag accounts as suspicious.</p>

<p>Test-mode Custom and Express accounts can be rejected at any time. Accounts created using live-mode keys may only be rejected once all balances are zero.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/reject
-}
-- TODO request options as enum
data PostAccountsAccountReject = PostAccountsAccountReject
  { postAccountsAccountRejectParams :: PostAccountsAccountRejectParams
  , postAccountsAccountRejectBody :: PostAccountsAccountRejectBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountRejectParams = PostAccountsAccountRejectParams
  {  postAccountsAccountRejectAccount :: (Text)
  {- ^ The identifier of the account to reject -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountRejectBody
  = PostAccountsAccountRejectBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountReject = "POST"
type instance RequestPath PostAccountsAccountReject = "/v1/accounts/{account}/reject"

instance RequestBuilder PostAccountsAccountReject where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountReject{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountRejectAccount
    , "reject"
    ]
    where
      PostAccountsAccountRejectParams{..} = postAccountsAccountRejectParams
  endpointQuery PostAccountsAccountReject{..} =
    [
    ]
  endpointHeaders PostAccountsAccountReject{..} =
    [
    ]



{-
postAccountsAccountReject :: PostAccountsAccountReject
postAccountsAccountReject = PostAccountsAccountReject
-}
-- 
{- | <p>Creates a new order object.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/orders
-}
-- TODO request options as enum
data PostOrders = PostOrders
  { postOrdersParams :: PostOrdersParams
  , postOrdersBody :: PostOrdersBody
  } deriving (Show, Eq, Generic)

data PostOrdersParams = PostOrdersParams
  {
  } deriving (Show, Eq, Generic)

data PostOrdersBody
  = PostOrdersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostOrders = "POST"
type instance RequestPath PostOrders = "/v1/orders"

instance RequestBuilder PostOrders where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostOrders{..} =
    [ "v1"
    , "orders"
    ]
    where
      PostOrdersParams = postOrdersParams
  endpointQuery PostOrders{..} =
    [
    ]
  endpointHeaders PostOrders{..} =
    [
    ]



{-
postOrders :: PostOrders
postOrders = PostOrders
-}
-- 
{- | <p>Returns a list of your orders. The orders are returned sorted by creation date, with the most recently created orders appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/orders
-}
-- TODO request options as enum
data GetOrders = GetOrders
  { getOrdersParams :: GetOrdersParams
  , getOrdersBody :: Maybe GetOrdersBody
  } deriving (Show, Eq, Generic)

data GetOrdersParams = GetOrdersParams
  {  getOrdersCreated :: Maybe (Either (Object) (Int))
  {- ^ Date this order was created. -}
  ,  getOrdersCustomer :: Maybe (Text)
  {- ^ Only return orders for the given customer. -}
  ,  getOrdersEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getOrdersExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getOrdersIds :: Maybe (Vector (Text))
  {- ^ Only return orders with the given IDs. -}
  ,  getOrdersLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getOrdersStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getOrdersStatus :: Maybe (Text)
  {- ^ Only return orders that have the given status. One of `created`, `paid`, `fulfilled`, or `refunded`. -}
  ,  getOrdersStatusTransitions :: Maybe (Object)
  {- ^ Filter orders based on when they were paid, fulfilled, canceled, or returned. -}
  ,  getOrdersUpstreamIds :: Maybe (Vector (Text))
  {- ^ Only return orders with the given upstream order IDs. -}
  } deriving (Show, Eq, Generic)

data GetOrdersBody
  = GetOrdersBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetOrders = "GET"
type instance RequestPath GetOrders = "/v1/orders"

instance RequestBuilder GetOrders where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetOrders{..} =
    [ "v1"
    , "orders"
    ]
    where
      GetOrdersParams{..} = getOrdersParams
  endpointQuery GetOrders{..} =
    [ ("created", queryDeepObjectExplode getOrdersCreated)
    , ("customer", queryFormExplode getOrdersCustomer)
    , ("ending_before", queryFormExplode getOrdersEndingBefore)
    , ("expand", queryDeepObjectExplode getOrdersExpand)
    , ("ids", queryDeepObjectExplode getOrdersIds)
    , ("limit", queryFormExplode getOrdersLimit)
    , ("starting_after", queryFormExplode getOrdersStartingAfter)
    , ("status", queryFormExplode getOrdersStatus)
    , ("status_transitions", queryDeepObjectExplode getOrdersStatusTransitions)
    , ("upstream_ids", queryDeepObjectExplode getOrdersUpstreamIds)
    ]
    where
      GetOrdersParams{..} = getOrdersParams
  endpointHeaders GetOrders{..} =
    [
    ]



{-
getOrders :: GetOrders
getOrders = GetOrders
-}
-- 
{- | <p>When retrieving an upcoming invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoices/upcoming/lines
-}
-- TODO request options as enum
data GetInvoicesUpcomingLines = GetInvoicesUpcomingLines
  { getInvoicesUpcomingLinesParams :: GetInvoicesUpcomingLinesParams
  , getInvoicesUpcomingLinesBody :: Maybe GetInvoicesUpcomingLinesBody
  } deriving (Show, Eq, Generic)

data GetInvoicesUpcomingLinesParams = GetInvoicesUpcomingLinesParams
  {  getInvoicesUpcomingLinesCoupon :: Maybe (Text)
  {- ^ The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the invoice returned will preview updating or creating a subscription with that coupon. Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice from among the customer's subscriptions. The invoice can be previewed without a coupon by passing this value as an empty string. -}
  ,  getInvoicesUpcomingLinesCustomer :: Maybe (Text)
  {- ^ The identifier of the customer whose upcoming invoice you'd like to retrieve. -}
  ,  getInvoicesUpcomingLinesEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getInvoicesUpcomingLinesExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoicesUpcomingLinesInvoiceItems :: Maybe (Vector (Object))
  {- ^ List of invoice items to add or update in the upcoming invoice preview. -}
  ,  getInvoicesUpcomingLinesLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getInvoicesUpcomingLinesSchedule :: Maybe (Text)
  {- ^ The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. -}
  ,  getInvoicesUpcomingLinesStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  ,  getInvoicesUpcomingLinesSubscription :: Maybe (Text)
  {- ^ The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. -}
  ,  getInvoicesUpcomingLinesSubscriptionBillingCycleAnchor :: Maybe (Either (SubscriptionBillingCycleAnchor) (POSIXTime))
  {- ^ For new subscriptions, a future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices. For existing subscriptions, the value can only be set to `now` or `unchanged`. -}
  ,  getInvoicesUpcomingLinesSubscriptionCancelAt :: Maybe (Either (POSIXTime) (SubscriptionCancelAt))
  {- ^ Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if within the current period if `prorate=true` -}
  ,  getInvoicesUpcomingLinesSubscriptionCancelAtPeriodEnd :: Maybe (Bool)
  {- ^ Boolean indicating whether this subscription should cancel at the end of the current period. -}
  ,  getInvoicesUpcomingLinesSubscriptionCancelNow :: Maybe (Bool)
  {- ^ This simulates the subscription being canceled or expired immediately. -}
  ,  getInvoicesUpcomingLinesSubscriptionDefaultTaxRates :: Maybe (Either (Vector (Text)) (SubscriptionDefaultTaxRates))
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with these default tax rates. The default tax rates will apply to any line item that does not have `tax_rates` set. -}
  ,  getInvoicesUpcomingLinesSubscriptionItems :: Maybe (Vector (Object))
  {- ^ List of subscription items, each with an attached plan. -}
  ,  getInvoicesUpcomingLinesSubscriptionProrate :: Maybe (Bool)
  {- ^ If previewing an update to a subscription, this decides whether the preview will show the result of applying prorations or not. If set, one of `subscription_items` or `subscription`, and one of `subscription_items` or `subscription_trial_end` are required. -}
  ,  getInvoicesUpcomingLinesSubscriptionProrationDate :: Maybe (POSIXTime)
  {- ^ If previewing an update to a subscription, and doing proration, `subscription_proration_date` forces the proration to be calculated as though the update was done at the specified time. The time given must be within the current subscription period, and cannot be before the subscription was on its current plan. If set, `subscription`, and one of `subscription_items`, or `subscription_trial_end` are required. Also, `subscription_proration` cannot be set to false. -}
  ,  getInvoicesUpcomingLinesSubscriptionStartDate :: Maybe (POSIXTime)
  {- ^ Date a subscription is intended to start (can be future or past) -}
  ,  getInvoicesUpcomingLinesSubscriptionTaxPercent :: Maybe (Scientific)
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with that tax percent. If set, one of `subscription_items` or `subscription` is required. This field has been deprecated and will be removed in a future API version, for further information view the [migration docs](https://stripe.com/docs/billing/migration/taxes) for `tax_rates`. -}
  ,  getInvoicesUpcomingLinesSubscriptionTrialEnd :: Maybe (Either (SubscriptionTrialEnd) (POSIXTime))
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with that trial end. If set, one of `subscription_items` or `subscription` is required. -}
  ,  getInvoicesUpcomingLinesSubscriptionTrialFromPlan :: Maybe (Bool)
  {- ^ Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `subscription_trial_end` is not allowed. -}
  } deriving (Show, Eq, Generic)

data GetInvoicesUpcomingLinesBody
  = GetInvoicesUpcomingLinesBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoicesUpcomingLines = "GET"
type instance RequestPath GetInvoicesUpcomingLines = "/v1/invoices/upcoming/lines"

instance RequestBuilder GetInvoicesUpcomingLines where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoicesUpcomingLines{..} =
    [ "v1"
    , "invoices"
    , "upcoming"
    , "lines"
    ]
    where
      GetInvoicesUpcomingLinesParams{..} = getInvoicesUpcomingLinesParams
  endpointQuery GetInvoicesUpcomingLines{..} =
    [ ("coupon", queryFormExplode getInvoicesUpcomingLinesCoupon)
    , ("customer", queryFormExplode getInvoicesUpcomingLinesCustomer)
    , ("ending_before", queryFormExplode getInvoicesUpcomingLinesEndingBefore)
    , ("expand", queryDeepObjectExplode getInvoicesUpcomingLinesExpand)
    , ("invoice_items", queryDeepObjectExplode getInvoicesUpcomingLinesInvoiceItems)
    , ("limit", queryFormExplode getInvoicesUpcomingLinesLimit)
    , ("schedule", queryFormExplode getInvoicesUpcomingLinesSchedule)
    , ("starting_after", queryFormExplode getInvoicesUpcomingLinesStartingAfter)
    , ("subscription", queryFormExplode getInvoicesUpcomingLinesSubscription)
    , ("subscription_billing_cycle_anchor", queryDeepObjectExplode getInvoicesUpcomingLinesSubscriptionBillingCycleAnchor)
    , ("subscription_cancel_at", queryDeepObjectExplode getInvoicesUpcomingLinesSubscriptionCancelAt)
    , ("subscription_cancel_at_period_end", queryFormExplode getInvoicesUpcomingLinesSubscriptionCancelAtPeriodEnd)
    , ("subscription_cancel_now", queryFormExplode getInvoicesUpcomingLinesSubscriptionCancelNow)
    , ("subscription_default_tax_rates", queryDeepObjectExplode getInvoicesUpcomingLinesSubscriptionDefaultTaxRates)
    , ("subscription_items", queryDeepObjectExplode getInvoicesUpcomingLinesSubscriptionItems)
    , ("subscription_prorate", queryFormExplode getInvoicesUpcomingLinesSubscriptionProrate)
    , ("subscription_proration_date", queryFormExplode getInvoicesUpcomingLinesSubscriptionProrationDate)
    , ("subscription_start_date", queryFormExplode getInvoicesUpcomingLinesSubscriptionStartDate)
    , ("subscription_tax_percent", queryFormExplode getInvoicesUpcomingLinesSubscriptionTaxPercent)
    , ("subscription_trial_end", queryDeepObjectExplode getInvoicesUpcomingLinesSubscriptionTrialEnd)
    , ("subscription_trial_from_plan", queryFormExplode getInvoicesUpcomingLinesSubscriptionTrialFromPlan)
    ]
    where
      GetInvoicesUpcomingLinesParams{..} = getInvoicesUpcomingLinesParams
  endpointHeaders GetInvoicesUpcomingLines{..} =
    [
    ]



{-
getInvoicesUpcomingLines :: GetInvoicesUpcomingLines
getInvoicesUpcomingLines = GetInvoicesUpcomingLines
-}
-- 
{- | <p>At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discount that is applicable to the customer.</p>

<p>Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.</p>

<p>You can preview the effects of updating a subscription, including a preview of what proration will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass a <code>proration_date</code> parameter when doing the actual subscription update. The value passed in should be the same as the <code>subscription_proration_date</code> returned on the upcoming invoice resource. The recommended way to get only the prorations being previewed is to consider only proration line items where <code>period[start]</code> is equal to the <code>subscription_proration_date</code> on the upcoming invoice resource.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/invoices/upcoming
-}
-- TODO request options as enum
data GetInvoicesUpcoming = GetInvoicesUpcoming
  { getInvoicesUpcomingParams :: GetInvoicesUpcomingParams
  , getInvoicesUpcomingBody :: Maybe GetInvoicesUpcomingBody
  } deriving (Show, Eq, Generic)

data GetInvoicesUpcomingParams = GetInvoicesUpcomingParams
  {  getInvoicesUpcomingCoupon :: Maybe (Text)
  {- ^ The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the invoice returned will preview updating or creating a subscription with that coupon. Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice from among the customer's subscriptions. The invoice can be previewed without a coupon by passing this value as an empty string. -}
  ,  getInvoicesUpcomingCustomer :: Maybe (Text)
  {- ^ The identifier of the customer whose upcoming invoice you'd like to retrieve. -}
  ,  getInvoicesUpcomingExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getInvoicesUpcomingInvoiceItems :: Maybe (Vector (Object))
  {- ^ List of invoice items to add or update in the upcoming invoice preview. -}
  ,  getInvoicesUpcomingSchedule :: Maybe (Text)
  {- ^ The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. -}
  ,  getInvoicesUpcomingSubscription :: Maybe (Text)
  {- ^ The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. -}
  ,  getInvoicesUpcomingSubscriptionBillingCycleAnchor :: Maybe (Either (SubscriptionBillingCycleAnchor) (POSIXTime))
  {- ^ For new subscriptions, a future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices. For existing subscriptions, the value can only be set to `now` or `unchanged`. -}
  ,  getInvoicesUpcomingSubscriptionCancelAt :: Maybe (Either (POSIXTime) (SubscriptionCancelAt))
  {- ^ Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if within the current period if `prorate=true` -}
  ,  getInvoicesUpcomingSubscriptionCancelAtPeriodEnd :: Maybe (Bool)
  {- ^ Boolean indicating whether this subscription should cancel at the end of the current period. -}
  ,  getInvoicesUpcomingSubscriptionCancelNow :: Maybe (Bool)
  {- ^ This simulates the subscription being canceled or expired immediately. -}
  ,  getInvoicesUpcomingSubscriptionDefaultTaxRates :: Maybe (Either (Vector (Text)) (SubscriptionDefaultTaxRates))
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with these default tax rates. The default tax rates will apply to any line item that does not have `tax_rates` set. -}
  ,  getInvoicesUpcomingSubscriptionItems :: Maybe (Vector (Object))
  {- ^ List of subscription items, each with an attached plan. -}
  ,  getInvoicesUpcomingSubscriptionProrate :: Maybe (Bool)
  {- ^ If previewing an update to a subscription, this decides whether the preview will show the result of applying prorations or not. If set, one of `subscription_items` or `subscription`, and one of `subscription_items` or `subscription_trial_end` are required. -}
  ,  getInvoicesUpcomingSubscriptionProrationDate :: Maybe (POSIXTime)
  {- ^ If previewing an update to a subscription, and doing proration, `subscription_proration_date` forces the proration to be calculated as though the update was done at the specified time. The time given must be within the current subscription period, and cannot be before the subscription was on its current plan. If set, `subscription`, and one of `subscription_items`, or `subscription_trial_end` are required. Also, `subscription_proration` cannot be set to false. -}
  ,  getInvoicesUpcomingSubscriptionStartDate :: Maybe (POSIXTime)
  {- ^ Date a subscription is intended to start (can be future or past) -}
  ,  getInvoicesUpcomingSubscriptionTaxPercent :: Maybe (Scientific)
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with that tax percent. If set, one of `subscription_items` or `subscription` is required. This field has been deprecated and will be removed in a future API version, for further information view the [migration docs](https://stripe.com/docs/billing/migration/taxes) for `tax_rates`. -}
  ,  getInvoicesUpcomingSubscriptionTrialEnd :: Maybe (Either (SubscriptionTrialEnd) (POSIXTime))
  {- ^ If provided, the invoice returned will preview updating or creating a subscription with that trial end. If set, one of `subscription_items` or `subscription` is required. -}
  ,  getInvoicesUpcomingSubscriptionTrialFromPlan :: Maybe (Bool)
  {- ^ Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `subscription_trial_end` is not allowed. -}
  } deriving (Show, Eq, Generic)

data GetInvoicesUpcomingBody
  = GetInvoicesUpcomingBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetInvoicesUpcoming = "GET"
type instance RequestPath GetInvoicesUpcoming = "/v1/invoices/upcoming"

instance RequestBuilder GetInvoicesUpcoming where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetInvoicesUpcoming{..} =
    [ "v1"
    , "invoices"
    , "upcoming"
    ]
    where
      GetInvoicesUpcomingParams{..} = getInvoicesUpcomingParams
  endpointQuery GetInvoicesUpcoming{..} =
    [ ("coupon", queryFormExplode getInvoicesUpcomingCoupon)
    , ("customer", queryFormExplode getInvoicesUpcomingCustomer)
    , ("expand", queryDeepObjectExplode getInvoicesUpcomingExpand)
    , ("invoice_items", queryDeepObjectExplode getInvoicesUpcomingInvoiceItems)
    , ("schedule", queryFormExplode getInvoicesUpcomingSchedule)
    , ("subscription", queryFormExplode getInvoicesUpcomingSubscription)
    , ("subscription_billing_cycle_anchor", queryDeepObjectExplode getInvoicesUpcomingSubscriptionBillingCycleAnchor)
    , ("subscription_cancel_at", queryDeepObjectExplode getInvoicesUpcomingSubscriptionCancelAt)
    , ("subscription_cancel_at_period_end", queryFormExplode getInvoicesUpcomingSubscriptionCancelAtPeriodEnd)
    , ("subscription_cancel_now", queryFormExplode getInvoicesUpcomingSubscriptionCancelNow)
    , ("subscription_default_tax_rates", queryDeepObjectExplode getInvoicesUpcomingSubscriptionDefaultTaxRates)
    , ("subscription_items", queryDeepObjectExplode getInvoicesUpcomingSubscriptionItems)
    , ("subscription_prorate", queryFormExplode getInvoicesUpcomingSubscriptionProrate)
    , ("subscription_proration_date", queryFormExplode getInvoicesUpcomingSubscriptionProrationDate)
    , ("subscription_start_date", queryFormExplode getInvoicesUpcomingSubscriptionStartDate)
    , ("subscription_tax_percent", queryFormExplode getInvoicesUpcomingSubscriptionTaxPercent)
    , ("subscription_trial_end", queryDeepObjectExplode getInvoicesUpcomingSubscriptionTrialEnd)
    , ("subscription_trial_from_plan", queryFormExplode getInvoicesUpcomingSubscriptionTrialFromPlan)
    ]
    where
      GetInvoicesUpcomingParams{..} = getInvoicesUpcomingParams
  endpointHeaders GetInvoicesUpcoming{..} =
    [
    ]



{-
getInvoicesUpcoming :: GetInvoicesUpcoming
getInvoicesUpcoming = GetInvoicesUpcoming
-}
-- 
{- | <p>Capture the funds of an existing uncaptured PaymentIntent when its status is <code>requires_capture</code>.</p>

<p>Uncaptured PaymentIntents will be canceled exactly seven days after they are created.</p>

<p>Read the <a href="/docs/payments/payment-intents/creating-payment-intents#separate-auth-capture">expanded documentation</a> to learn more about separate authorization and capture.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/payment_intents/{intent}/capture
-}
-- TODO request options as enum
data PostPaymentIntentsIntentCapture = PostPaymentIntentsIntentCapture
  { postPaymentIntentsIntentCaptureParams :: PostPaymentIntentsIntentCaptureParams
  , postPaymentIntentsIntentCaptureBody :: Maybe PostPaymentIntentsIntentCaptureBody
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentCaptureParams = PostPaymentIntentsIntentCaptureParams
  {  postPaymentIntentsIntentCaptureIntent :: (Text)
  {- ^ ID of the PaymentIntent to retrieve. -}
  } deriving (Show, Eq, Generic)

data PostPaymentIntentsIntentCaptureBody
  = PostPaymentIntentsIntentCaptureBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostPaymentIntentsIntentCapture = "POST"
type instance RequestPath PostPaymentIntentsIntentCapture = "/v1/payment_intents/{intent}/capture"

instance RequestBuilder PostPaymentIntentsIntentCapture where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostPaymentIntentsIntentCapture{..} =
    [ "v1"
    , "payment_intents"
    , pathSimple postPaymentIntentsIntentCaptureIntent
    , "capture"
    ]
    where
      PostPaymentIntentsIntentCaptureParams{..} = postPaymentIntentsIntentCaptureParams
  endpointQuery PostPaymentIntentsIntentCapture{..} =
    [
    ]
  endpointHeaders PostPaymentIntentsIntentCapture{..} =
    [
    ]



{-
postPaymentIntentsIntentCapture :: PostPaymentIntentsIntentCapture
postPaymentIntentsIntentCapture = PostPaymentIntentsIntentCapture
-}
-- 
{- | <p>Create a refund.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/refunds
-}
-- TODO request options as enum
data PostRefunds = PostRefunds
  { postRefundsParams :: PostRefundsParams
  , postRefundsBody :: Maybe PostRefundsBody
  } deriving (Show, Eq, Generic)

data PostRefundsParams = PostRefundsParams
  {
  } deriving (Show, Eq, Generic)

data PostRefundsBody
  = PostRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostRefunds = "POST"
type instance RequestPath PostRefunds = "/v1/refunds"

instance RequestBuilder PostRefunds where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostRefunds{..} =
    [ "v1"
    , "refunds"
    ]
    where
      PostRefundsParams = postRefundsParams
  endpointQuery PostRefunds{..} =
    [
    ]
  endpointHeaders PostRefunds{..} =
    [
    ]



{-
postRefunds :: PostRefunds
postRefunds = PostRefunds
-}
-- 
{- | <p>Returns a list of all refunds you’ve previously created. The refunds are returned in sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent refunds are always available by default on the charge object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/refunds
-}
-- TODO request options as enum
data GetRefunds = GetRefunds
  { getRefundsParams :: GetRefundsParams
  , getRefundsBody :: Maybe GetRefundsBody
  } deriving (Show, Eq, Generic)

data GetRefundsParams = GetRefundsParams
  {  getRefundsCharge :: Maybe (Text)
  {- ^ Only return refunds for the charge specified by this charge ID. -}
  ,  getRefundsCreated :: Maybe (Either (Object) (Int))
  ,  getRefundsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getRefundsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getRefundsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getRefundsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetRefundsBody
  = GetRefundsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetRefunds = "GET"
type instance RequestPath GetRefunds = "/v1/refunds"

instance RequestBuilder GetRefunds where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetRefunds{..} =
    [ "v1"
    , "refunds"
    ]
    where
      GetRefundsParams{..} = getRefundsParams
  endpointQuery GetRefunds{..} =
    [ ("charge", queryFormExplode getRefundsCharge)
    , ("created", queryDeepObjectExplode getRefundsCreated)
    , ("ending_before", queryFormExplode getRefundsEndingBefore)
    , ("expand", queryDeepObjectExplode getRefundsExpand)
    , ("limit", queryFormExplode getRefundsLimit)
    , ("starting_after", queryFormExplode getRefundsStartingAfter)
    ]
    where
      GetRefundsParams{..} = getRefundsParams
  endpointHeaders GetRefunds{..} =
    [
    ]



{-
getRefunds :: GetRefunds
getRefunds = GetRefunds
-}
-- 
{- | <p>Retrieves a Session object.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/checkout/sessions/{session}
-}
-- TODO request options as enum
data GetCheckoutSessionsSession = GetCheckoutSessionsSession
  { getCheckoutSessionsSessionParams :: GetCheckoutSessionsSessionParams
  , getCheckoutSessionsSessionBody :: Maybe GetCheckoutSessionsSessionBody
  } deriving (Show, Eq, Generic)

data GetCheckoutSessionsSessionParams = GetCheckoutSessionsSessionParams
  {  getCheckoutSessionsSessionExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCheckoutSessionsSessionSession :: (Text)
  {- ^ The ID of the Checkout Session. -}
  } deriving (Show, Eq, Generic)

data GetCheckoutSessionsSessionBody
  = GetCheckoutSessionsSessionBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCheckoutSessionsSession = "GET"
type instance RequestPath GetCheckoutSessionsSession = "/v1/checkout/sessions/{session}"

instance RequestBuilder GetCheckoutSessionsSession where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCheckoutSessionsSession{..} =
    [ "v1"
    , "checkout"
    , "sessions"
    , pathSimple getCheckoutSessionsSessionSession
    ]
    where
      GetCheckoutSessionsSessionParams{..} = getCheckoutSessionsSessionParams
  endpointQuery GetCheckoutSessionsSession{..} =
    [ ("expand", queryDeepObjectExplode getCheckoutSessionsSessionExpand)
    ]
  endpointHeaders GetCheckoutSessionsSession{..} =
    [
    ]



{-
getCheckoutSessionsSession :: GetCheckoutSessionsSession
getCheckoutSessionsSession = GetCheckoutSessionsSession
-}
-- 
{- | <p>Creates a new person.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/accounts/{account}/persons
-}
-- TODO request options as enum
data PostAccountsAccountPersons = PostAccountsAccountPersons
  { postAccountsAccountPersonsParams :: PostAccountsAccountPersonsParams
  , postAccountsAccountPersonsBody :: Maybe PostAccountsAccountPersonsBody
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPersonsParams = PostAccountsAccountPersonsParams
  {  postAccountsAccountPersonsAccount :: (Text)
  {- ^ The account that the person is associated with. -}
  } deriving (Show, Eq, Generic)

data PostAccountsAccountPersonsBody
  = PostAccountsAccountPersonsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostAccountsAccountPersons = "POST"
type instance RequestPath PostAccountsAccountPersons = "/v1/accounts/{account}/persons"

instance RequestBuilder PostAccountsAccountPersons where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostAccountsAccountPersons{..} =
    [ "v1"
    , "accounts"
    , pathSimple postAccountsAccountPersonsAccount
    , "persons"
    ]
    where
      PostAccountsAccountPersonsParams{..} = postAccountsAccountPersonsParams
  endpointQuery PostAccountsAccountPersons{..} =
    [
    ]
  endpointHeaders PostAccountsAccountPersons{..} =
    [
    ]



{-
postAccountsAccountPersons :: PostAccountsAccountPersons
postAccountsAccountPersons = PostAccountsAccountPersons
-}
-- 
{- | <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/accounts/{account}/persons
-}
-- TODO request options as enum
data GetAccountsAccountPersons = GetAccountsAccountPersons
  { getAccountsAccountPersonsParams :: GetAccountsAccountPersonsParams
  , getAccountsAccountPersonsBody :: Maybe GetAccountsAccountPersonsBody
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPersonsParams = GetAccountsAccountPersonsParams
  {  getAccountsAccountPersonsAccount :: (Text)
  ,  getAccountsAccountPersonsEndingBefore :: Maybe (Text)
  {- ^ A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. -}
  ,  getAccountsAccountPersonsExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getAccountsAccountPersonsLimit :: Maybe (Int)
  {- ^ A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. -}
  ,  getAccountsAccountPersonsRelationship :: Maybe (Object)
  {- ^ Filters on the list of people returned based on the person's relationship to the account's company. -}
  ,  getAccountsAccountPersonsStartingAfter :: Maybe (Text)
  {- ^ A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. -}
  } deriving (Show, Eq, Generic)

data GetAccountsAccountPersonsBody
  = GetAccountsAccountPersonsBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetAccountsAccountPersons = "GET"
type instance RequestPath GetAccountsAccountPersons = "/v1/accounts/{account}/persons"

instance RequestBuilder GetAccountsAccountPersons where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetAccountsAccountPersons{..} =
    [ "v1"
    , "accounts"
    , pathSimple getAccountsAccountPersonsAccount
    , "persons"
    ]
    where
      GetAccountsAccountPersonsParams{..} = getAccountsAccountPersonsParams
  endpointQuery GetAccountsAccountPersons{..} =
    [ ("ending_before", queryFormExplode getAccountsAccountPersonsEndingBefore)
    , ("expand", queryDeepObjectExplode getAccountsAccountPersonsExpand)
    , ("limit", queryFormExplode getAccountsAccountPersonsLimit)
    , ("relationship", queryDeepObjectExplode getAccountsAccountPersonsRelationship)
    , ("starting_after", queryFormExplode getAccountsAccountPersonsStartingAfter)
    ]
    where
      GetAccountsAccountPersonsParams{..} = getAccountsAccountPersonsParams
  endpointHeaders GetAccountsAccountPersons{..} =
    [
    ]



{-
getAccountsAccountPersons :: GetAccountsAccountPersons
getAccountsAccountPersons = GetAccountsAccountPersons
-}
-- 
{- | <p>Update a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> POST /v1/customers/{customer}/cards/{id}
-}
-- TODO request options as enum
data PostCustomersCustomerCardsId = PostCustomersCustomerCardsId
  { postCustomersCustomerCardsIdParams :: PostCustomersCustomerCardsIdParams
  , postCustomersCustomerCardsIdBody :: Maybe PostCustomersCustomerCardsIdBody
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerCardsIdParams = PostCustomersCustomerCardsIdParams
  {  postCustomersCustomerCardsIdCustomer :: (Text)
  ,  postCustomersCustomerCardsIdId :: (Text)
  } deriving (Show, Eq, Generic)

data PostCustomersCustomerCardsIdBody
  = PostCustomersCustomerCardsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod PostCustomersCustomerCardsId = "POST"
type instance RequestPath PostCustomersCustomerCardsId = "/v1/customers/{customer}/cards/{id}"

instance RequestBuilder PostCustomersCustomerCardsId where
  endpointMethod _ = "POST"
  -- TODO figure out allowReserved parameter option
  endpointPath PostCustomersCustomerCardsId{..} =
    [ "v1"
    , "customers"
    , pathSimple postCustomersCustomerCardsIdCustomer
    , "cards"
    , pathSimple postCustomersCustomerCardsIdId
    ]
    where
      PostCustomersCustomerCardsIdParams{..} = postCustomersCustomerCardsIdParams
  endpointQuery PostCustomersCustomerCardsId{..} =
    [
    ]
  endpointHeaders PostCustomersCustomerCardsId{..} =
    [
    ]



{-
postCustomersCustomerCardsId :: PostCustomersCustomerCardsId
postCustomersCustomerCardsId = PostCustomersCustomerCardsId
-}
-- 
{- | <p>You can always see the 10 most recent cards directly on a customer; this method lets you retrieve details about a specific card stored on the customer.</p>

> -- Equivalent to the following API endpoint:
> GET /v1/customers/{customer}/cards/{id}
-}
-- TODO request options as enum
data GetCustomersCustomerCardsId = GetCustomersCustomerCardsId
  { getCustomersCustomerCardsIdParams :: GetCustomersCustomerCardsIdParams
  , getCustomersCustomerCardsIdBody :: Maybe GetCustomersCustomerCardsIdBody
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerCardsIdParams = GetCustomersCustomerCardsIdParams
  {  getCustomersCustomerCardsIdCustomer :: (Text)
  ,  getCustomersCustomerCardsIdExpand :: Maybe (Vector (Text))
  {- ^ Specifies which fields in the response should be expanded. -}
  ,  getCustomersCustomerCardsIdId :: (Text)
  {- ^ The ID of the card to be retrieved. -}
  } deriving (Show, Eq, Generic)

data GetCustomersCustomerCardsIdBody
  = GetCustomersCustomerCardsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod GetCustomersCustomerCardsId = "GET"
type instance RequestPath GetCustomersCustomerCardsId = "/v1/customers/{customer}/cards/{id}"

instance RequestBuilder GetCustomersCustomerCardsId where
  endpointMethod _ = "GET"
  -- TODO figure out allowReserved parameter option
  endpointPath GetCustomersCustomerCardsId{..} =
    [ "v1"
    , "customers"
    , pathSimple getCustomersCustomerCardsIdCustomer
    , "cards"
    , pathSimple getCustomersCustomerCardsIdId
    ]
    where
      GetCustomersCustomerCardsIdParams{..} = getCustomersCustomerCardsIdParams
  endpointQuery GetCustomersCustomerCardsId{..} =
    [ ("expand", queryDeepObjectExplode getCustomersCustomerCardsIdExpand)
    ]
  endpointHeaders GetCustomersCustomerCardsId{..} =
    [
    ]



{-
getCustomersCustomerCardsId :: GetCustomersCustomerCardsId
getCustomersCustomerCardsId = GetCustomersCustomerCardsId
-}
-- {-# DEPRECATED getCustomersCustomerCardsId, GetCustomersCustomerCardsId "This endpoint is deprecated by the API creator" #-}
{- | <p>Delete a specified source for a given customer.</p>

> -- Equivalent to the following API endpoint:
> DELETE /v1/customers/{customer}/cards/{id}
-}
-- TODO request options as enum
data DeleteCustomersCustomerCardsId = DeleteCustomersCustomerCardsId
  { deleteCustomersCustomerCardsIdParams :: DeleteCustomersCustomerCardsIdParams
  , deleteCustomersCustomerCardsIdBody :: Maybe DeleteCustomersCustomerCardsIdBody
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerCardsIdParams = DeleteCustomersCustomerCardsIdParams
  {  deleteCustomersCustomerCardsIdCustomer :: (Text)
  ,  deleteCustomersCustomerCardsIdId :: (Text)
  {- ^ The ID of the source to be deleted. -}
  } deriving (Show, Eq, Generic)

data DeleteCustomersCustomerCardsIdBody
  = DeleteCustomersCustomerCardsIdBody
  deriving (Show, Eq, Generic)

type instance RequestMethod DeleteCustomersCustomerCardsId = "DELETE"
type instance RequestPath DeleteCustomersCustomerCardsId = "/v1/customers/{customer}/cards/{id}"

instance RequestBuilder DeleteCustomersCustomerCardsId where
  endpointMethod _ = "DELETE"
  -- TODO figure out allowReserved parameter option
  endpointPath DeleteCustomersCustomerCardsId{..} =
    [ "v1"
    , "customers"
    , pathSimple deleteCustomersCustomerCardsIdCustomer
    , "cards"
    , pathSimple deleteCustomersCustomerCardsIdId
    ]
    where
      DeleteCustomersCustomerCardsIdParams{..} = deleteCustomersCustomerCardsIdParams
  endpointQuery DeleteCustomersCustomerCardsId{..} =
    [
    ]
  endpointHeaders DeleteCustomersCustomerCardsId{..} =
    [
    ]



{-
deleteCustomersCustomerCardsId :: DeleteCustomersCustomerCardsId
deleteCustomersCustomerCardsId = DeleteCustomersCustomerCardsId
-}
-- 
