#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70011 "Procurement Financial Ceilings"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Financial ceilings";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Method of Procurement";"Method of Procurement")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Ceiling";"Minimum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Ceiling";"Maximum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Description";"Procument Description")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Class";"Procurement Class")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective date";"Effective date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Effective Date';
                }
            }
        }
    }

    actions
    {
    }
}

