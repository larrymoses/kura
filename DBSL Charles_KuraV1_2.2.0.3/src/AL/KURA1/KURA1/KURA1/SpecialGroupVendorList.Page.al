#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75017 "Special Group Vendor List"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Special Group Vendor';
    CardPageID = "Vendor Page";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,New Document,Vendor,Navigate';
    QueryCategory = 'Vendor List';
    RefreshOnActivate = true;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Group" = const(Special),
                            Blocked = const(" "));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    //                 }
                    //                 field(Name; Name)
                    //                 {
                    //                     ApplicationArea = All;
                    //                     ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
                    //                 }
                    //                 field("Responsibility Center"; "Responsibility Center")
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                    //                 }
                    //                 field("Location Code"; "Location Code")
                    //                 {
                    //                     ApplicationArea = Location;
                    //                     ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
                    //                 }
                    //                 field("Post Code"; "Post Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the postal code.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Country/Region Code"; "Country/Region Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the country/region of the address.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Phone No."; "Phone No.")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the vendor''s telephone number.';
                    //                 }
                    //                 field("Fax No."; "Fax No.")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the vendor''s fax number.';
                    //                     Visible = false;
                    //                 }
                    //                 field("IC Partner Code"; "IC Partner Code")
                    //                 {
                    //                     ApplicationArea = Intercompany;
                    //                     ToolTip = 'Specifies the vendor''s intercompany partner code.';
                    //                     Visible = false;
                    //                 }
                    //                 field(Contact; Contact)
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';
                    //                 }
                    //                 field("Purchaser Code"; "Purchaser Code")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Vendor Posting Group"; "Vendor Posting Group")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                    //                     Visible = false;
                    //                 }
                    //                 field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Payment Terms Code"; "Payment Terms Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Fin. Charge Terms Code"; "Fin. Charge Terms Code")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     ToolTip = 'Specifies the code for the involved finance charges in case of late payment.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Currency Code"; "Currency Code")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Language Code"; "Language Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Search Name"; "Search Name")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                    //                 }
                    //                 field(Blocked; Blocked)
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a vendor that is declared insolvent or an item that is placed in quarantine.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Privacy Blocked"; "Privacy Blocked")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Last Date Modified"; "Last Date Modified")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies when the vendor card was last modified.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Application Method"; "Application Method")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies how to apply payments to entries for this vendor.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Location Code2"; "Location Code")
                    //                 {
                    //                     ApplicationArea = Location;
                    //                     ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Shipment Method Code"; "Shipment Method Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                    //                     Visible = false;
                    //                 }
                    //                 field("Lead Time Calculation"; "Lead Time Calculation")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Base Calendar Code"; "Base Calendar Code")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies a customizable calendar for delivery planning that holds the vendor''s working days and holidays.';
                    //                     Visible = false;
                    //                 }
                    //                 field("Balance (LCY)"; "Balance (LCY)")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the total value of your completed purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all completed purchase invoices and credit memos.';

                    //                     trigger OnDrillDown()
                    //                     begin
                    //                         OpenVendorLedgerEntries(false);
                    //                     end;
                    //                 }
                    //                 field("Balance Due (LCY)"; "Balance Due (LCY)")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the total value of your unpaid purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all open purchase invoices and credit memos.';

                    //                     trigger OnDrillDown()
                    //                     begin
                    //                         OpenVendorLedgerEntries(true);
                    //                     end;
                    //                 }
                    //                 field("Payments (LCY)"; "Payments (LCY)")
                    //                 {
                    //                     ApplicationArea = Basic, Suite;
                    //                     ToolTip = 'Specifies the sum of payments paid to the vendor.';
                    //                 }
                    //             }
                    //         }
                    //         area(factboxes)
                    //         {
                    //             part("Power BI Report FactBox"; "Power BI Report FactBox")
                    //             {
                    //                 ApplicationArea = Basic, Suite;
                    //                 Caption = 'Power BI Reports';
                    //                 Visible = PowerBIVisible;
                    //             }

                    //             part(VendorDetailsFactBox;"Vendor Details FactBox")
                    //             {
                    //                 ApplicationArea = Basic,Sui = e;
                    //                 SubPageLink = "No."=field( = No."),
                    //                               "Currency Filter"=field("Currency Filter"),
                    //                               "Date Filter"=field("Date Filter"),
                    //                                "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                               "Global Dimension 2 Filter"=field("Global Dimension 2 Filter");
                    //                 Visible = false;
                    //             } = 
                    //             part(VendorStatisticsFactBox;" = endor Statistics FactBox")
                    //             {
                    //                 ApplicationArea = Basic,Suite;
                    //                 SubPageLink = "No."=field("No."),
                    //                               "Currenc y Filter"=field("Currency Filter"),
                    //                               "Date Filter"=field("Date Filter"),
                    //                               "Global Di mension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                               "Glob = l Dimension 2 Filter"=field("Global Dimension 2 Filter");
                    //             } = 
                    //             part(VendorHistBuyFromFactBox;" = endor Hist. Buy-from FactBox")
                    //             { = 
                    //                 ApplicationArea = Basic,Suite; = 
                    //                 SubPageLink = "No."=field("No."),
                    //                               "Currency Filter"=field("Currency Filter"),
                    //                               "Date Filte r"=field("Date Filter"),
                    //                               "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                               "Global Di mension 2 Filter"=field("Global Dimension 2 Filter");
                    //             } = 
                    //             part(VendorHistPayToFactBox;"Vendor = Hist. Pay-to FactBox")
                    //             { = 
                    //                 ApplicationArea = All; = 
                    //                 SubPageLink = "No."=field("No."), = 
                    //                               "Currency Filter"=field("Currency Filter"),
                    //                               "Date Filter "=field("Date Filter"),
                    //                               "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                               "Global Di mension 2 Filter"=field("Global Dimension 2 Filter");
                    //                 Visible = false; = 
                    //             } = 
                    //             systempart(Control1900383207;Li = ks)
                    //             { = 
                    //                 ApplicationArea = RecordLinks; = 
                    //             }
                    //             systempart(Control1905767507 ;Notes)
                    //             {
                    //                 ApplicationArea = Notes;
                    //             } = 
                    //         } = 
                    //     } = 
                    //  = 
                    //     actions = 
                    //     {
                    //         area(navigation)
                    //         { 
                    //             group("Ven&dor")
                    //             {
                    //                 Caption = 'Ven&dor';
                    //                 Image = Vendor; 
                    //                 group(Dimensions)
                    //                 {
                    //                     Caption = 'Dimensions';
                    //                     Image = Dimensions;
                    //                     action(DimensionsSingle)
                    //                     {
                    //                         ApplicationArea = Dimensions;
                    //                         Caption = 'Dimensions-Single';
                    //                         Image = Dimensions;
                    //                         Promoted = true;
                    //                         PromotedCategory = Category5;
                    //                         RunObject = Page "Default Dimensions";
                    //                         RunPageLink = "Table ID"=const(23),
                    //                                       "No."=field("No.");
                    //                         ShortCutKey = 'Shift+Ctrl+D';
                    //                         ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    //                     }
                    //                     action(DimensionsMultiple)
                    //                     {
                    //                         AccessByPermission = TableData Dimension=R;
                    //                         ApplicationArea = Dimensions;
                    //                         Caption = 'Dimensions-&Multiple';
                    //                         Image = DimensionSets;
                    //                         Promoted = true;
                    //                         PromotedCategory = Category5;
                    //                         ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
                    //  = 
                    //                         trigger OnAction() = 
                    //                         var
                    //                             Vend: Record Vendor;
                    //                             DefaultDimMultiple: Page "Default Dimensions-Multiple";
                    //                         begin
                    //                             CurrPage.SetSelectionFilter(Vend);
                    //                             DefaultDimMultiple.SetMultiRecord(Ve = d,FieldNo("No."));
                    //                             DefaultDimMultiple.RunModal;
                    //                         end;
                    //                     }
                    //                 }
                    //                 action("Bank Accounts")
                    //                 {
                    //                     ApplicationArea = Basic,Suite;
                    //                     Caption = 'Bank Accounts';
                    //                     Image = BankAccount;
                    //                     RunObject = Page "Vendor Bank Account List";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     ToolTip = 'Open the list of the vendor''s bank accounts';
                    //                 }
                    //                 action("C&ontact") 
                    //                 {
                    //                     AccessByPermission = TableData Contact=R;
                    //                     ApplicationArea = Basic,Suite;
                    //                     Caption = 'C&ontact';
                    //                     Image = ContactPerson;
                    //                     Promoted = true;
                    //                     PromotedCategory = Categ ory6;
                    //                     ToolTip = 'View or edit detailed information about the contact person at the vendor.';

                    //                     trigger OnAction()
                    //                     begin = 
                    //                         ShowContact;
                    //                     end;
                    //                 }
                    //                 separator(Action55)
                    //                 { = 
                    //                 } 
                    //                 action(OrderAddresses)
                    //                 {
                    //                     ApplicationArea = Basic,Suite;
                    //                     Caption = 'Order &Addresses';
                    //                     Image = Addresses;
                    //                     RunObject = Page "Order Address List";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     ToolTip = 'View or edit alternate addresses for the vendor.';
                    //                 }
                    //                 action("Co&mments")
                    //                 {
                    //                     ApplicationArea = Comments;
                    //                     Caption = 'Co&mments';
                    //                     Image = ViewComments;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category5;
                    //                     RunObject = Page "Commen t Sheet";
                    //                     RunPageLink = "Table Name"=const(Vendor),
                    //                                   "No."=field("No.");
                    //                     ToolTip = 'View or add comments for the record.';
                    //                 } = 

                    //                 action(ApprovalEntries)
                    //                 {
                    //                     AccessByPermission = TableData "Approval Entry"=R;
                    //                     ApplicationArea = Suite;
                    //                     Caption = 'Approvals';
                    //                     Image = Approvals;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category5;
                    //                     ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';
                    //  = 
                    //                     // trigger OnAction = )
                    //                     // begin
                    //                     //     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    //                     // end;
                    //                 }
                    //             } 
                    //             group("&Purchases")
                    //             {
                    //                 Caption = '&Purchases';
                    //                 Image = Purchasing;
                    //                 action(Items)
                    //                 { = 
                    //                     ApplicationArea = Planning; = 
                    //                     Caption = 'Items'; 
                    //                     Image = Item;
                    //                     RunObject = Page "Vendor Item Catalog";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     RunPageView = sorting("Vendor No.");
                    //                     ToolTip = 'Open the list of items that you trad =  in.';
                    //                 }
                    //                 action("Invoice &Discounts")
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Invoice &Discounts';
                    //                     Image = CalculateInvoiceDiscount;
                    //                     RunObject = Page "Vend. Invoice Discounts";
                    //                     RunPageLink = Code=field("Invoice Disc. Code");
                    //                     ToolTip = 'Set up different discounts that are applied to invoices for the vendor. An invoice discount is automatically granted to the vendor when the total on a sales invoice exceeds a certain amount.';
                    //                 }
                    //                 action(Prices)
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Prices';
                    //                     Image = Price;
                    //                     RunObject = Page "Purchase Prices";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     RunPageView = sorting("Vendor No.");
                    //                     ToolTip = 'View or set up different prices for items that you buy from the vendor. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                    //                 }
                    //                 action("Line Discounts")
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Line Discounts' = 
                    //                     Image = LineDiscount;
                    //                     RunObject = Page "Purchase Line Discounts";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     RunPageView = sorting("Vendor No.");
                    //                     ToolTip = 'View or set up different discounts for items that you buy from the vendor. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                    //                 }
                    //                 action("Prepa&yment Percentages")
                    //                 {
                    //                     ApplicationArea = Prepayments;
                    //                     Caption = 'Prepa&y = ent Percentages';
                    //                     Image = PrepaymentPercentages;
                    //                     RunObject = Page "Purchase Prepmt. Percentages";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     RunPageView = sorting("Vendor No.");
                    //                     ToolTip = 'View or edit the percentages of the price that can be paid as a prepayment. ';
                    //                 }
                    //                 action("Recurring Purchase Lines")
                    //                 {
                    //                     ApplicationArea = Suite; = 
                    //                     Caption = 'Recurring Purchase Lines';
                    //                     Image = CodesList;
                    //                     RunObject = Page "Standard Vendor Purchase Codes";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     ToolTip = 'View or edit recurring purchase lines for the vendor.';
                    //                 }
                    //                 action("Mapping Text to Account")
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Mapping Text to = Account';
                    //                     Image = MapAccounts;
                    //                     RunObject = Page "Text-to-Account Mapping Wksh.";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     ToolTip = 'Page mapping text to account';
                    //                 }
                    //             }
                    //             group(Documents)
                    //             {
                    //                 Caption = 'Documents';
                    //                 Image = Administration; = 
                    //                 action(Quotes)
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     Caption = 'Quotes';
                    //                     Image = Quote;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category6;
                    //                     RunObject = Page "Purchase Quotes";
                    //                     RunPageLink = "Buy-from Vendor No."=field("No.");
                    //                     RunPageView = sorting("Doc = ment Type","Buy-from Vendor No.");
                    //                     ToolTip = 'View a list of ongoing sales quotes.';
                    //                 }
                    //                 action(Orders)
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Orders';
                    //                     Image = Document;
                    //                     Promoted = true;
                    //                     PromotedCategory = Categor = 6;
                    //                     RunObject = Page "Purchase Order List";
                    //                     RunPageLink = "Buy-from Vendor No."=field("No.");
                    //                     RunPageView = sorting("Document Type","Buy-from Vendor No.");
                    //                     ToolTip = 'View a list of ongoing purchase orders for the vendor.';
                    //                 }
                    //                 action("Return Orders")
                    //                 {
                    //                     ApplicationArea = PurchReturnOrder;
                    //                     Caption = 'Return Orders';
                    //                     Image = ReturnOrder;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category6;
                    //                     RunObject = Page "Purchase Return Order List";
                    //                     RunPageLink = "Buy-from Vendor No."=field("No.");
                    //                     RunPageView = sorting("Document Type","Buy-from Vendor No.");
                    //                     ToolTip = 'Open the list of ongoing = return orders.';
                    //                 } 
                    //                 action("Blanket Orders")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     Caption = 'Blanket Orders';
                    //                     Image = BlanketOrder;
                    //                     RunObject = Page "Blanket Purchase Orders";
                    //                     RunPageLink = "Buy-from Vendor No."=field("No.");
                    //                     RunPageView = sorting("Document Type","Buy-from Vendor No.");
                    //                     ToolTip = 'Open the list of ongoing blanket orders.';
                    //                 }
                    //             } = 
                    //             group(History) 
                    //             {
                    //                 Caption = 'History';
                    //                 Image = History;
                    //                 action("Ledger E&ntries")
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Ledger E&ntries';
                    //                     Image = VendorLedger;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category5;
                    //                     PromotedIsBig = true; = 
                    //                     RunObject = Page "Vendor Ledger Entrie s";
                    //                     RunPageLink = "Vendor No."=field("No.");
                    //                     RunPageView = sorting("Vendor No.")
                    //                                   order(descending);
                    //                     ShortCutKey = 'Ctrl+F7';
                    //                     ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    //                 }
                    //                 action(Statistics)
                    //                 {
                    //                     ApplicationArea = Suite; = 
                    //                     Caption = 'Statistics'; 
                    //                     Image = Statistics;
                    //                     Promoted = true;
                    //                     PromotedCategory = Category5;
                    //                     PromotedIsBig = true;
                    //                     RunObject = Page "Vendor Statistics";
                    //                     RunPageLink = "No."=field("No."),
                    //                                   "Date Filter"=field("Date Filter"),
                    //                                   "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                                   "Global Dimension 2 Filter"=field("Global Dimension 2 Filter");
                    //                     ShortCutKey = 'F7';
                    //                     ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                    //                 }
                    //                 action(Purchases)
                    //                 {
                    //                     ApplicationArea = Advanced;
                    //                     Caption = 'Purchases';
                    //                     Image = Purchase; = 
                    //                     RunObject = Page "Vendor Purchases";
                    //                     RunPageLink = "No."=field("No."),
                    //                                   "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                                   "Global Dimension 2 Filter"=field("Global Dimension 2 Filter");
                    //                     ToolTip = 'Shows a summary of vendor ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.';
                    //                 }
                    //                 action("Entry Statistics")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     Caption = 'Entry Statistics';
                    //                     Image = EntryStatistics;
                    //                     RunObject = Page "Vendor Entry Statistics";
                    //                     RunPageLink = "No."=field("No."),
                    //                                   "Date Filter"=field("Date Filter"),
                    //                                   "Glob = l Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                                   "Global Dimen = ion 2 Filter"=field("Global Dimension 2 Filter");
                    //                     ToolTip = 'View entry statistics for the  = ecord.';
                    //                 } = 
                    //                 action("Statistics by C&urrencies")
                    //                 {
                    //                     ApplicationArea = Suite;
                    //                     Caption = 'Statistics by C&urrencies';
                    //                     Image = Currencies;
                    //                     RunObject = Page "Vend. Stats. by Curr. Lines";
                    //                     RunPageLink = "Vendor Filter"=field("No."),
                    //                                   "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                    //                                   "Global Dimension 2 Filter"=field("Global Dimension 2 Filter"),
                    //                                   "Date = Filter"=field("Date Filter");
                    //                     ToolTip = 'View statistics for vendors th = t use multiple currencies.';
                    //                 } = 
                    //                 action("Item &Tracking Entries")
                    //                 {
                    //                     ApplicationArea = ItemTracking;
                    //                     Caption = 'Item &Tracking Entries';
                    //                     Image = ItemTrackingLedger;
                    //                     ToolTip = 'View serial or lot numbers that are assigned to items.';

                    //                     trigger OnAction()
                    //                     var = 
                    //                         ItemTrackingDocMgt: Cod = unit "Item Tracking Doc. Management";
                    //                     begin = 
                    //                       //  ItemTrackingDocMgt.ShowItemTracking = orMasterData(2,"No.",'','','','','');
                    //                     end;
                    //                 }
                    //             }
                    //         }
                    //         area(creation)
                    //         {


                    //             = 
                    //         } = 
                    //     } = 
                    //  = 


                    //     trigger OnInit()
                    //     begin
                    //         SetVendorNoVisibilityOnFactBoxes;
                    //         CurrPage."Power BI Report FactBox".Page.InitFactBox(CurrPage.ObjectId(false),CurrPage.Caption,PowerBIVisible);
                    //     end;

                    //     trigger OnOpenPage()
                    //     var
                    //        // SocialListeningSetup: Record "Social Listening Setup";
                    //     begin
                    //         SetFilter("Date Filter",'..%1',WorkDate);
                    //         with SocialListeningSetup do "No.", '', '', '', '', 
                    //           SocialListeningSetupVisible := Get and "Show on Customers" and "Accept License Agreement" and ("Solution ID" <> '');
                    //         ResyncVisible := ReadSoftOCRMasterDataSync.IsSyncEnabled;
                    //     end;

                    //     var
                    //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //         ReadSoftOCRMasterDataSync: Codeunit "ReadSoft OCR Master Data Sync";
                    //         WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    //         [InDataSet]
                    //         SocialListeningSetupVisible: Boolean;
                    //         [InDataSet]
                    //         SocialListeningVisible: Boolean;
                    //         OpenApprovalEntriesExist: Boolean; = 
                    //         CanCancelApprovalForRecord: Boolean;
                    //         PowerBIVisible: Boolean;
                    //         ResyncVisible: Boolean;
                    //         CanRequestApprovalForFlow: Boolean;
                    //         CanCancelApprovalForFlow: Boolean;

                    //     procedure GetSelectionFilter(): Text
                    //     var
                    //         Vend: Record Vendor;
                    //         SelectionFilterManagement: Codeunit Selecti = nFilterManagement;
                    //     begin
                    //         CurrPage.SetSelectionFilter(Vend);
                    //         exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
                    //     end;

                    //     procedure SetSelection(var Vend: Rec ord Vendor)
                    //     begin
                    //         CurrPage.SetSelectionFilter(Vend);
                    //     end;

                    //     local procedure SetVendorNoVisibilityOnFactBoxes()
                    //     begin = 
                    //         // CurrPage.VendorDetailsFactBox.Page.SetVendorNoVisibility(false);
                    //         // CurrPage.VendorHistBuyFromFactBox.Page.SetVendorNoVisibility(false);
                    //         // CurrPage.VendorHistPayToFactBox.Page.SetVendorNoVisibility(false);
                    //         // CurrPage.VendorStatisticsFactBox.Page.SetVendorNoVisibility(false);
                    //     end;
                    // }

                    //  =   =  =        =  =   =  =                   SocialListeningSetupVisible,  CanRequestApprovalForFlow,  false,    '..%1',   
                }
            }
        }
    }
}