using AdminService from '../../srv/admin-service';

annotate AdminService.Products with @odata.draft.enabled;

// Products List Report Page
annotate AdminService.Products with @(
  Common.SemanticKey: [number],
  UI: {   
      Identification: [{Value:number}],
      SelectionFields: [ number, name, supplier_ID ],
      LineItem: [
        {Value: number}, {Value: name},
        {Value: stock},  {Value: retail},
        {Value: price},  {Value: margin},
        {Value: supplier.name, Label: '{i18n>Supplier}'}
      ],
  }
);
//	Products Object Page
annotate AdminService.Products with @(
  UI: {
    Facets: [
	    {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
	    {$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}',   Target: '@UI.FieldGroup#Admin'},
	],
	FieldGroup#Details: {
	  Data: [
      {Value: number}, {Value: name}, {Value: supplier_ID, Label: '{i18n>supplierID}'}, {Value: supplier.name, Label: '{i18n>Supplier}'},
	    {Value: price},  {Value: retail}, {Value: margin}, {Value: stock}
	  ]
	},
	FieldGroup#Admin: {
    Data: [
	    {Value: createdBy},  {Value: createdAt},
		  {Value: modifiedBy}, {Value: modifiedAt}
	  ]
    }
});

annotate AdminService.Suppliers with {
  name @Core.Computed: true;
}