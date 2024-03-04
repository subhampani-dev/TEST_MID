using { Cengage as Tables} from '../db/schema';

service srv @(path : '/MID_srv'){
    @requires: 'authenticated-user'
    entity TB_PRODUCT_MID as projection on Tables.Business_Partner;
    @requires:'Admin'
    @restrict: [{ grant :'READ'}]
    entity TB_Contract as projection on Tables.Provider_Contracts;
}