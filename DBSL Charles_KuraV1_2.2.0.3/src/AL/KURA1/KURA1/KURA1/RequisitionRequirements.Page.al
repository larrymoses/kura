#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69632 "Requisition Requirements"
{
    PageType = List;
    SourceTable = "Recruitment Req Requirement";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Mandatory,Added Advantage,Affirmative Action,PWD';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

