#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56112 "Defendants All"
{
    CardPageID = "Case Defendants All Card";
    PageType = List;
    SourceTable = "Case Defendants All";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                }
                field(Contacts;Contacts)
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

