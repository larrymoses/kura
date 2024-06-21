#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72709 "Comm Plan Line Correspondences"
{
    Caption = 'Communication Plan Line Correspondences';
    PageType = ListPart;
    SourceTable = "Communication Plan Line";
    SourceTableView = where(Category = filter(Correspondence));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; "Line No")
                {
                    ApplicationArea = Basic;
                }
                field("category"; Category)
                {
                    ///// DataClassification = ToBeClassified;
                    ApplicationArea = basic;
                }
                field("Communication Type"; "Communication Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Target Stakeholders"; "No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                }
                field("Default Initiator Code"; "Default Initiator Code")
                {
                    ApplicationArea = Basic;
                }
                field("Initiator Designation"; "Initiator Designation")
                {
                    ApplicationArea = Basic;
                }
                field("No of Correspondences"; "No of Correspondences")
                {
                    ApplicationArea = Basic;
                    Caption = 'No of Correspondences';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Category := Category::Correspondence;
    end;
}

