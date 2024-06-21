#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95023 "Risk Management Roles"
{
    CardPageID = "Risk Management Role";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Management Role";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To";"Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To";"Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Def Responsibilities";"No. of Def Responsibilities")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

