#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69828 "Insurance Lines"
{
    PageType = ListPart;
    SourceTable = "Insurance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Insurance Code";"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Name";"Insurance Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Type Of Insurance";"Type Of Insurance")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Number";"Policy Number")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Commencement";"Date of Commencement")
                {
                    ApplicationArea = Basic;
                }
                field("Sum Assuared";"Sum Assuared")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Deduction";"Monthly Deduction")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action(Beneficiaries)
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    Promoted = true;
                    RunObject = Page "Insurance Beneficiaries";
                    RunPageLink = "Document No"=field("Document No."),
                                  "Insurance Code"=field("Insurance Code");
                }
            }
        }
    }
}

