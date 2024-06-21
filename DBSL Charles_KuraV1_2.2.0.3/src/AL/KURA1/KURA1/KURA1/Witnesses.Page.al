#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56054 "Witnesses"
{
    PageType = List;
    SourceTable = Witnesses;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No";"Case No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Witnessness Name";"Witnessness Name")
                {
                    ApplicationArea = Basic;
                }
                field("Witnessness Address";"Witnessness Address")
                {
                    ApplicationArea = Basic;
                }
                field("Witnessness Phone";"Witnessness Phone")
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

