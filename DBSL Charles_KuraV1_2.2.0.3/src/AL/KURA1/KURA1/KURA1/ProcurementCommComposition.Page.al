#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75112 "Procurement Comm Composition"
{
    PageType = ListPart;
    SourceTable = "Procurement Comm Composition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type";"Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Role;Role)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No. of Members";"Minimum No. of Members")
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
                action(Members)
                {
                    ApplicationArea = Basic;
                    Caption = 'Members';
                    RunObject = Page "IFS Tender Committee Member";
                    RunPageLink = Role=field(Role),
                                  "Committee Type"=field("Committee Type");
                }
            }
        }
    }
}

