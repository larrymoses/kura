
Page 72772 "Interim Payment Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Interim Payment Request";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Measurement &  Payment Header";
    SourceTableView = where("Document Type" = filter("Contractor Payment Request"),
                             Status = filter(Open | "Pending Approval"),
                             Posted = const(false),
                             "Payment Certificate Type" = filter("Interim Payment"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Start Chainage"; Rec."Section Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Section End Chainage"; Rec."Section End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Total  Section Length (KMs)"; Rec."Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Sum"; Rec."Total Contract Sum")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Payment Request";
    end;
     trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Global Dimension 1 Code",UserSetup."Region Code");
        end;
    end;
    var
    UserSetup: Record "User Setup";
}



