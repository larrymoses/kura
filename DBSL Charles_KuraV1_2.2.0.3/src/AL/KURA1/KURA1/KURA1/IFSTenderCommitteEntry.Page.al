#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75307 "IFS Tender Committe Entry"
{
    PageType = List;
    SourceTable = "IFS Tender Committe Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Tender Opening Date";"Tender Opening Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Tender Opeing Time";"Tender Opeing Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

