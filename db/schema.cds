using {managed, Currency} from '@sap/cds/common';
using {my.common.Address} from './common';

namespace my.domain; 

@assert.unique: {index2: [number]}
entity Products : managed {
  key ID             : UUID                             @title : 'ID';
      number         : String @assert.format:'[A-Z]\d+' @title : '{i18n>productNo}';
      name           : localized String(100) @mandatory @title : '{i18n>productName}';
      stock          : Integer                          @title : '{i18n>stock}';
      price          : Decimal(9, 2)                    @title : '{i18n>price}';
      retail         : Decimal(9, 2)                    @title : '{i18n>retail}';
      virtual margin : Decimal(9, 2)                    @title : '{i18n>margin}';
      currency       : Currency;
      supplier       : Association to Suppliers;
}

@assert.unique: {index2: [number]}
entity Suppliers : managed, Address {
  key ID       : UUID;
      number   : String      @title : '{i18n>supplierNo}';
      name     : String(100) @title : '{i18n>supplierName}';
      priority : Integer     @title : '{i18n>priority}';
      products : Association to many Products on products.supplier = $self;
}

@assert.unique: {index2: [orderNo]}
entity Orders : managed {
  key ID       : UUID;
      orderNo  : String @title : '{i18n>orderNumber}';
      currency : Currency;
      Items    : Composition of many OrderItems on Items.parent = $self;
}

entity OrderItems {
  key ID      : UUID;
      parent  : Association to Orders;
      product : Association to Products;
      amount  : Integer @title : '{i18n>orderAmount}';
}

