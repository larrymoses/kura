#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72296 "Contract Advance Payment Certs"
{
    ApplicationArea = Basic;
    CardPageID = "Advance Payment Certificate";
    PageType = List;
    SourceTable = "Measurement &  Payment Header";
    SourceTableView = where("Document Type" = filter("Contractor Payment Request"),
                            "Payment Certificate Type" = filter("Advance Payment"), Status = FILTER(<> Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
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

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Advance Payment Request' + ' ' + Rec."Project ID";
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
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
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; Rec."Reversed By")
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
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
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
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore
