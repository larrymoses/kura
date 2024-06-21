#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95039 "RMP Line Risk Ownerships"
{
    CardPageID = "RMP Line Risk Ownership";
    PageType = List;
    SourceTable = "RMP Line Risk Ownership";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Project ID";"Project ID")
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

