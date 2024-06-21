#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50009 "pageextension50009" extends "Vendor Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Card"(Page 26)".

    layout
    {
        moveafter("NAME"; "VAT Registration No.")
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN';
            trigger OnBeforeValidate()
            var
                vendor1: Record Vendor;
            begin

                IF vendor1.GET(REC."VAT Registration No.") then
                    Error('Vat Registration Number Already Exists!');

            end;
        }
      
        modify(Priority)
        {
            Editable = false;
        }
        addafter(Blocked)
        {
            field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Balance Due (LCY)")
        {
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Responsibility Center")
        {
            field("Supplier Category"; Rec."Supplier Category")
            {
                ApplicationArea = Basic;
            }
            field("Vendor Type"; Rec."Vendor Type") { ApplicationArea = basic; }
            field("Special Category"; Rec."Special Category")
            {
                ApplicationArea = Basic;
            }
            field(Registered; Rec.Registered)
            {
                ApplicationArea = Basic;
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                Editable = true;
            }
            field(Trainer; Rec.Trainer)
            {
                applicationarea = basic;
            }
        }
        addafter("Country/Region Code")
        {
            field("Residential Status";Rec."Residential Status")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Address & Contact")
        {
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
            }
            group("Business Details")
            {
                Caption = 'Business Details';
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Registration/Incorporation No."; Rec."Registration/Incorporation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reg/Incorporation Date"; Rec."Reg/Incorporation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Operations Start Date"; Rec."Operations Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tax PIN No."; Rec."Tax PIN No.")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                }
                field("Current Vendor Class"; Rec."Current Vendor Class")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Capital LCY"; Rec."Issued Capital LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Type"; Rec."Dealer Type")
                {
                    ApplicationArea = Basic;
                }
                field("Max Value of Business"; Rec."Max Value of Business")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Line Tel No"; Rec."Fixed Line Tel No")
                {
                    ApplicationArea = Basic;
                }
                field("Building/House No"; Rec."Building/House No")
                {
                    ApplicationArea = Basic;
                }
                field(Floor; Rec.Floor)
                {
                    ApplicationArea = Basic;
                }
                field("Plot No"; Rec."Plot No")
                {
                    ApplicationArea = Basic;
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = Basic;
                }
                field("Authorized Signatory Name"; Rec."Authorized Signatory Name")
                {
                    ApplicationArea = Basic;
                }
                field("Signatory Designation"; Rec."Signatory Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Customer No"; Rec."Advance Customer No")
                {
                    ApplicationArea = Basic;
                }
            }
        }

    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 98)".
        addafter("Item References")
        {
            action("Vendor Prequalification")
            {
                  // AccessByPermission = TableData "Vendor Prequalification Entry" = R;
                     ApplicationArea = Suite, ItemReferences;
                    Caption = 'Prequalification';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Vendor Prequalification Entry";
                    RunPageLink ="Vendor No." = FIELD("No.");
                
            }
            action("Vendor Registration")
            {
                 //  AccessByPermission = TableData "Vendor Prequalification Entry" = R;
                     ApplicationArea = Suite, ItemReferences;
                    Caption = 'Registration';
                    Image = Registered;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Vendor Registration Entries";
                    RunPageLink ="Vendor No." = FIELD("No.");
                
            }
        }
        addafter(Documents)
        {
            action("Create Advance Payment Customer")
            {
                ApplicationArea = Basic;
                Image = CreateMovement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if Rec."Advance Customer No" = '' then begin
                        ObjCust.Init;
                        ObjCust."No." := '';
                        ObjCust."Funding Class" := ObjCust."funding class"::Trade;
                        ObjCust.Name := Rec.Name;
                        ObjCust.Validate(Name);
                        ObjCust."Customer Posting Group" := 'CONTRACTOR';
                        ObjCust.Validate("Customer Posting Group");
                        ObjCust.Insert(true);
                        Rec."Advance Customer No" := ObjCust."No.";
                        Rec.Modify;
                        Message('Customer No %1 created successfully', ObjCust."No.");
                    end
                    else
                        Error('Advance customer account already exists');
                end;
            }
        }
        addafter("Vendor - Balance to Date")
        {
            action("Vendor Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Statement';
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Vendor.SetRange("No.", Rec."No.");
                    Report.Run(57022, true, false, Vendor);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    var
        Vendor: Record Vendor;
        ObjCust: Record Customer;
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

