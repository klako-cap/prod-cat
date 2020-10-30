using my.domain from '../db/schema';

annotate domain.Products with @fiori.draft.enabled;
// annotate domain.Suppliers with @cds.odata.Valuelist; //does not seem to work

annotate domain.Suppliers {
   ID @Common.ValueList : {
     $Type          : 'Common.ValueListType',
     CollectionPath : 'Suppliers',
     SearchSupported: true
   }
}

// For product elements
annotate domain.Products with {
    ID @UI.HiddenFilter;
	supplier @title: '{i18n>Supplier}';
    price @( Measures.ISOCurrency: currency_code );
    retail @( Measures.ISOCurrency: currency_code );
    margin @( Measures.ISOCurrency: currency_code );
}
// For oroduct details
annotate domain.Products with @(
	UI: {
  	  HeaderInfo: {
  		TypeName: '{i18n>Product}',
  		TypeNamePlural: '{i18n>Products}',
  		Title: {Value: name},
		Description: {Value: name}
  	  },
	}
);