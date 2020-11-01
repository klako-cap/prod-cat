using my.domain from '../db/schema';

annotate domain.Products with @fiori.draft.enabled;

// For product elements
annotate domain.Products with {
    ID @UI.HiddenFilter;
	  supplier @( title: '{i18n>Supplier}', ValueList.entity:'Suppliers') ;
    price @( Measures.ISOCurrency: currency_code );
    retail @( Measures.ISOCurrency: currency_code );
    margin @( Measures.ISOCurrency: currency_code );
}
// For product details
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