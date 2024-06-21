#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56050 "Copyright Works Card"
{
    Caption = 'Copyright Works Card';
    PageType = Card;
    SourceTable = "Service Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the item.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains a description of this item.';
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Company Reg No"; "Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("ID. No."; "ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; "P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field("Captured by"; "Captured by")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Customer)
            {
                Caption = 'Customer';
                Editable = false;
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        CalcFields(Name, "Name 2", Address, "Address 2", "Post Code",
                          City, Contact, "Phone No.", County, "Country/Region Code");
                        CustomerNoOnAfterValidate;
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the customer who owns this item.';
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address of the customer who owns this item.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2(County)';
                    DrillDown = false;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the customer address.';
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the person you regularly contact when you do business with the customer who owns this item.';
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the customer phone number.';
                }
                field("Location of Service Item"; "Location of Service Item")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code of the location of this item.';
                }
            }
            group("Agent Details")
            {
                Caption = 'Agent Details';
                Editable = false;
                field("Agent First Name"; "Agent First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Surname"; "Agent Surname")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Middle Name"; "Agent Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Address"; "Agent Address")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Address 2"; "Agent Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Agent City"; "Agent City")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Contact"; "Agent Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Phone No."; "Agent Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agent ID. No."; "Agent ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agent P.I.N"; "Agent P.I.N")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Authorship Details")
            {
                Caption = 'Authorship Details';
                Editable = false;
                field("Author First Name"; "Author First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Agent Surname"; "Author Agent Surname")
                {
                    ApplicationArea = Basic;
                }
                field("Author Middle Name"; "Author Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Address"; "Author Address")
                {
                    ApplicationArea = Basic;
                }
                field("Author Address 2"; "Author Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Author City"; "Author City")
                {
                    ApplicationArea = Basic;
                }
                field("Author Contact"; "Author Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Author Phone No."; "Author Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author ID. No."; "Author ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author P.I.N"; "Author P.I.N")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Copyright Work Details")
            {
                Caption = 'Copyright Work Details';
                Editable = false;
                field("Copyright Title"; "Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work Category"; "Copyright Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work SubCategory"; "Copyright Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Category Description"; "Copyright Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright SubCategory Desc"; "Copyright SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; "Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field(Language; Language)
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work Abstract"; "Copyright Work Abstract")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Production Details")
            {
                Caption = 'Production Details';
                Editable = false;
                field("Prod/Pub Name"; "Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub ID No/Company Reg No"; "Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub P.I.N"; "Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/License Date"; "Assignment/License Date")
                {
                    ApplicationArea = Basic;
                }
                field("1st Country of Production"; "1st Country of Production")
                {
                    ApplicationArea = Basic;
                }
                field(ISBN; ISBN)
                {
                    ApplicationArea = Basic;
                }
                field("Production Category"; "Production Category")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Phone No."; "Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Email"; "Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                Editable = false;
                field("Payement Reference No"; "Payemnt Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No"; "Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Amount"; "Receipt Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the ship-to code for the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        UpdateShipToCode;
                    end;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the name at the address.';
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address where this service item is located.';
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains an additional line of the address.';
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field("Ship-to City"; "Ship-to City")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the address.';
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of a contact person for the address.';
                }
                field("Ship-to Phone No."; "Ship-to Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the telephone number for the address.';
                }
            }
            group(Contract)
            {
                Caption = 'Contract';
                field("Default Contract Cost"; "Default Contract Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract cost of a service item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Value"; "Default Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract value of an item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Discount %"; "Default Contract Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a default contract discount percentage for an item, if this item will be part of a service contract.';
                }
                field("Service Contracts"; "Service Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that this service item is associated with one or more service contracts/quotes.';
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number of the vendor for this item.';

                    trigger OnValidate()
                    begin
                        CalcFields("Vendor Name");
                    end;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the vendor name for this item.';
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number assigned to this service item by its vendor.';
                }
                field("Vendor Item Name"; "Vendor Item Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the name assigned to this item by the vendor.';
                }
            }
            group(Detail)
            {
                Caption = 'Detail';
                field("Sales Unit Cost"; "Sales Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit cost of this item when it was sold.';
                }
                field("Sales Unit Price"; "Sales Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit price of this item when it was sold.';
                }
                field("Sales Date"; "Sales Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was sold.';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the code of the unit of measure used when this item was sold.';
                }
                field("Installation Date"; "Installation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was installed at the customer''s site.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Customer No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Service Item")
            {
                Caption = '&Service Item';
                Image = ServiceItem;
                separator(Action123)
                {
                }
                action("&Components")
                {
                    ApplicationArea = Basic;
                    Caption = '&Components';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = const(true),
                                  "Parent Service Item No." = field("No.");
                    RunPageView = sorting(Active, "Parent Service Item No.", "Line No.");
                }
                action("&Dimensions")
                {
                    ApplicationArea = Basic;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    // RunObject = Page "Default Dimensions";
                    // RunPageLink = "Table ID"=const(5940),
                    //               "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action39)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Statistics';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Service Item Statistics";
                        RunPageLink = "No." = field("No.");
                        ShortCutKey = 'F7';
                    }
                    action("Tr&endscape")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Tr&endscape';
                        Image = Trendscape;
                        RunObject = Page "Service Item Trendscape";
                        RunPageLink = "No." = field("No.");
                    }
                }
                group(Troubleshooting)
                {
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting Setup';
                        Image = Troubleshoot;
                        RunObject = Page "Troubleshooting Setup";
                        RunPageLink = Type = const("Service Item"),
                                      "No." = field("No.");
                    }
                    action("<Page Troubleshooting>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting';
                        Image = Troubleshoot;

                        trigger OnAction()
                        var
                            TroubleshootingHeader: Record "Troubleshooting Header";
                        begin
                            TroubleshootingHeader.ShowForServItem(Rec);
                        end;
                    }
                    separator(Action128)
                    {
                        Caption = '';
                    }
                }
                action("Resource Skills")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Skills';
                    Image = ResourceSkills;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const("Service Item"),
                                  "No." = field("No.");
                }
                action("S&killed Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&killed Resources';
                    Image = ResourceSkills;

                    trigger OnAction()
                    begin
                        Clear(SkilledResourceList);
                        SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item", "No.", Description);
                        SkilledResourceList.RunModal;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = const("Service Item"),
                                  "Table Subtype" = const(0),
                                  "No." = field("No.");
                }
                separator(Action131)
                {
                    Caption = '';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                group("S&ervice Orders")
                {
                    Caption = 'S&ervice Orders';
                    Image = "Order";
                    action("&Item Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Service Item Lines";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                    action("&Service Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Service Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                }
                group("Service Shi&pments")
                {
                    Caption = 'Service Shi&pments';
                    Image = Shipment;
                    action(Action117)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Posted Shpt. Item Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                    action(Action113)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Posted Serv. Shpt. Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Serv. Contr. List (Serv. Item)";
                    RunPageLink = "Service Item No." = field("No.");
                    RunPageView = sorting("Service Item No.", "Contract Status");
                }
                separator(Action126)
                {
                    Caption = '';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Service Item Lo&g")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Item Lo&g';
                    Image = Log;
                    RunObject = Page "Service Item Log";
                    RunPageLink = "Service Item No." = field("No.");
                }
                action("Service Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Ledger E&ntries';
                    Image = ServiceLedger;
                    RunObject = Page "Service Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No."),
                                  "Service Order No." = field("Service Order Filter"),
                                  "Service Contract No." = field("Contract Filter"),
                                  "Posting Date" = field("Date Filter");
                    RunPageView = sorting("Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", Type, "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
                action("&Warranty Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = '&Warranty Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page "Warranty Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No.");
                    RunPageView = sorting("Service Item No. (Serviced)", "Posting Date", "Document No.");
                }
                separator(Action127)
                {
                    Caption = '';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = NewItem;
                action("New Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Item';
                    Image = NewItem;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Item Card";
                    RunPageMode = Create;
                }
            }
        }
        area(reporting)
        {
            action("Service Line Item Label")
            {
                ApplicationArea = Basic;
                Caption = 'Service Line Item Label';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Service Item Line Labels";
            }
            action("Copyright Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."No.", "No.");
                    if Rec.FindSet then
                        Report.Run(56231, true, true, Rec);
                end;
            }
            action("Email Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    //code to send email
                    // SMTPMailSet.Get;
                    // objCustomer.Reset;
                    // objCustomer.Get("Customer No.");
                    // Notification1.CreateMessage('Kenya Copyright Board ',SMTPMailSet."Email Sender Address",objCustomer."E-Mail",'Copyright Works',
                    //                 'Dear '+ objCustomer.Name + ',<BR><BR>'+
                    //                 ' Your copyright work ' +UpperCase("Copyright Title") + ' has been successfully processed.<BR>'+
                    // Text0023+'<BR>'+'<BR>',true);

                    // Notification1.AddBodyline(
                    // '<BR><BR>Kind Regards,'+
                    // '<BR><BR>For any Information, Please Contact'+'<BR>Copyright Registration and Enforcement Department<BR>'+
                    // CompInfo.Name+'<BR>'+
                    // CompInfo.Address+'<BR>'+
                    // CompInfo."Address 2"+'<BR>'+
                    // CompInfo."Phone No."+'<BR>'+
                    // CompInfo.City);
                    // FileDirectory:= 'K:/DOCS/';
                    // FileName:='Certificate_'+"Copyright Title"+'.pdf';
                    // Report.SaveAsPdf(56231,FileDirectory+FileName,Rec);
                    // Notification1.AddAttachment(FileDirectory+FileName,FileName);
                    // Notification1.Send;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateShipToCode;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if "Item No." = '' then
            if GetFilter("Item No.") <> '' then
                if GetRangeMin("Item No.") = GetRangemax("Item No.") then
                    "Item No." := GetRangeMin("Item No.");

        if "Customer No." = '' then
            if GetFilter("Customer No.") <> '' then
                if GetRangeMin("Customer No.") = GetRangemax("Customer No.") then
                    "Customer No." := GetRangeMin("Customer No.");
    end;

    var
        ResourceSkill: Record "Resource Skill";
        SkilledResourceList: Page "Skilled Resource List";
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        Notification1: Codeunit Mail;
        objCustomer: Record Customer;
        CompInfo: Record "Company Information";
        Text0023: label 'Please find attached, your copyright work certificate.';

    local procedure UpdateShipToCode()
    begin
        if "Ship-to Code" = '' then begin
            "Ship-to Name" := Name;
            "Ship-to Address" := Address;
            "Ship-to Address 2" := "Address 2";
            "Ship-to Post Code" := "Post Code";
            "Ship-to City" := City;
            "Ship-to Phone No." := "Phone No.";
            "Ship-to Contact" := Contact;
        end else
            CalcFields(
              "Ship-to Name", "Ship-to Name 2", "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City",
              "Ship-to County", "Ship-to Country/Region Code", "Ship-to Contact", "Ship-to Phone No.");
    end;

    local procedure CustomerNoOnAfterValidate()
    begin
        if "Customer No." <> xRec."Customer No." then
            UpdateShipToCode;
    end;
}

