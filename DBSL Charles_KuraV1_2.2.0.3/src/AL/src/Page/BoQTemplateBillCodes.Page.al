#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72186 "BoQ Template Bill Codes"
{
    CardPageID = "BoQ Template Bill Code";
    PageType = List;
    SourceTable = "BoQ Template Bill Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Job Task No"; Rec."Default Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Bill Activities"; Rec."No. of Bill Activities")
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

