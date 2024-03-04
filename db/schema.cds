namespace Cengage;
using {
  managed,
  cuid
} from '@sap/cds/common';

entity Business_Partner : managed{
  key bp_identifier : String(60);  // Business Partner Identification Number
  bp_id  : String(10);            // Business Partner 
  sold_to_party : String(81);     // Business Partner Full Name
  email_id : String(241);         // Business Partner Email ID
  prod_cont_items    : Composition of Many Provider_Contracts on prod_cont_items.parent = $self; 
  student   : Composition of  Many Provider_Contracts on  student.student = bp_id and student.parent = $self;
  shiptoparty   : Composition of  Many Provider_Contracts on  shiptoparty.shipToParty = bp_id and shiptoparty.parent = $self;
  soldtoparty   : Composition of  Many Provider_Contracts on  soldtoparty.soldToParty = bp_id and soldtoparty.parent = $self;
  billtoparty   : Composition of  Many Provider_Contracts on  billtoparty.billToParty = bp_id and billtoparty.parent = $self;
  payerparty   : Composition of  Many Provider_Contracts on  payerparty.payerParty = bp_id and payerparty.parent = $self; 
  // prod_cont_items    : Composition of Many Provider_Contracts on prod_cont_items.parent = $self;  
    //Navigation to Provider Contract through Business Partner Identification Number
//   prod_cont_items : Composition of Many Provider_Contracts on prod_cont_items.bp_id = bp_id;
}

entity Provider_Contracts : managed{    
    key provider_cont_id : String(20);              //Subscription contract external ID
    parent  :  Association to Business_Partner;
    key cont_items : String(6);                     // Subscription Contract Items
    product : String(40);
    site_id : String(70);                           // Site ID of a Product to which contract is associated to
    document_number : String(10);                   // Subscription Contract 
    soldToParty : String(10);                       // Partner function Sold to Party
    shipToParty : String(10);                       // Partner function Ship to Party
    billToParty : String(10);                       // Partner function bill to Party
    payerParty : String(10);                        // Partner function payer Party          
    student : String(10);                           // Partner function Student
    enrollment_code : String(10);                   // Product enrollment code to which contrcat tagged to e.g. Patner pay etc.
    service_desc : String(50);                      // Short text of subscription contract    
    cont_account : String(12);                      // Contract Account to which subscription contract tagged too.      
    validFrom : Timestamp;                          // Subscription contract Valid from date and time
    validTo : Timestamp;                            // Subscription contract Valid Till date and time
    tech_active : String(1);                        // Active Status of Subscription contract
    product_type : String(50);                      // Product Type of Product to which Subscription contract is associated to
    enrollment_id : String(50);                     // Technical resource ID of Subscription contract and its always unique for each contract
    net_value : Decimal(38,2);                      // Net value Recurring for Billing Period of a contract
    duration : String(50);                          // Subscription contract Validity period
}

